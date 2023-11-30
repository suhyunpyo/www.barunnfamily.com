/// <reference path="../jquery-1.10.2.js" />
/// <reference path="../common.js" />
/// <reference path="../json2.js" />
/// <reference path="../bootstrap.js" />
/// <reference path="../jquery.validate.js" />
/// <reference path="../jquery.bhands.fileuploader.js" />

var m_formVilidate = undefined;

$(document).ready(function () {

    //#region Form Validate

    $(document).on("click", ".orderCodeCheckBtn", function () {
        requestCheckOrderCode($(".orderCodeInput").val(), true);
    });

    $(document).on("keyup", ".orderCodeInput", function () {
        requestCheckOrderCode($(this).val(), false);
    });

    m_formVilidate = $("#input-form").validate(
    {
        debug: true,
        rules:
        {
            "orderCodeInput":
            {
                minlength: 3,
                required: true
            }
        },
        errorClass: "validate-warning",
        validClass: "validate-success",
        errorPlacement: onValidGroupErrorPlaceMent,
        highlight: onValidGroupValidateHighlight,
        success: onValidGroupValidateSuccess
    });
    //#endregion

    //#region 하단 주문 정보 제어 관련
    $(document).on("click", ".addOrderBtn", function () {

        m_formVilidate.form();
        if (m_formVilidate.numberOfInvalids() > 0) {
            alert("Check Form!");
            return;
        }

        if (confirm("새로운 주문을 생성하시겠습니까?") == false) return;
        requestInsertOrder();
    });

    $(document).on("click", ".modifyOrderBtn", function () {

        m_formVilidate.form();
        if (m_formVilidate.numberOfInvalids() > 0) {
            alert("Check Form!");
            return;
        }

        if (confirm("주문 정보를 변경하시겠습니까?") == false) return;
        requestUpdateOrder();
    });

    $(document).on("click", ".removeOrderBtn", function () {
        if (confirm("주문 정보를 삭제하시겠습니까?") == false) return;

        if (confirm("주문 정보를 삭제하면, 관련된 각종 정보도 함께 삭제되며, 진행중인 주문건의 경우 오류가 발생 할 수 있습니다. 그래도 진행하시겠습니까?") == false) return;

        requestDeleteOrder();
    });

    //#endregion

    //#region Cart List 관련

    //Cart 수정 Button
    $(document).on("click", ".modifyCartBtn", function () {
        var seq = $(this).attr("seq");
        var quantity = $(".cartQuantityInput[seq='" + seq + "']").val();
        var requestShippingDate = $(".cartRequestDateInput[seq='" + seq + "']").val();

        if (isNullOrZero(quantity)) {
            alert("수량 정보를 정확하게 입력하여 주십시요.");
            return;
        }

        if (confirm("해당 Cart 정보를 수정하시겠습니까?") == false) return;

        requestUpdateCart($(this).attr("seq"), quantity, requestShippingDate, true);
    });

    //Cart 삭제 Button
    $(document).on("click", ".cart-list-group-item .removeCartBtn", function () {
        if (confirm("해당 Cart 정보를 삭제하시겠습니까?") == false) return;
        requestDeleteCart($(this).attr("seq"));
    });

    $(document).on("click", ".showAddCartItemModalBtn", function () {
        showAddCartItemModal($(this).attr("seq"), $(this).attr("quantity"));
    });


    //Cart Item 수정 Button
    $(document).on("click", ".modifyCartItemBtn", function () {
        var seq = $(this).attr("seq");

        var quantity = $(".cartItemQuantityInput[seq='" + seq + "']").val();

        if (isNullOrZero(quantity)) {
            alert("수량 정보를 정확하게 입력하여 주십시요.");
            return;
        }

        if (confirm("해당 Cart Item 정보를 수정하시겠습니까?") == false) return;
        requestUpdateCartItem(seq, quantity);
    });

    //Cart Item 삭제 Button
    $(document).on("click", ".removeCartItemBtn", function () {
        var seq = $(this).attr("seq");
        if (confirm("해당 Cart Item 요소를 삭제하시겠습니까?") == false) {
            return;
        }
        requestDeleteCartItem(seq);
    });


    //Cart Item Print 추가 Button
    $(document).on("click", ".addCartItemPrintBtn", function () {
        var cartItemSeq = $(this).attr("seq");
        var uploadPDFFileSeq = $(".addCartItemPrintPDFFileUploadSeq[seq='" + cartItemSeq + "']").val();
        var uploadJPGFileSeq = $(".addCartItemPrintJPGFileUploadSeq[seq='" + cartItemSeq + "']").val();
        var quantity = $(".addCartItemPrintQuantityInput[seq='" + cartItemSeq + "']").val();

        if (isNullOrEmpty(uploadPDFFileSeq)) {
            alert("인쇄 파일을 업로드 하십시요.");
            return;
        }

        if (isNullOrEmpty(uploadJPGFileSeq)) {
            alert("썸네일 파일을 업로드 하십시요.");
            return;
        }

        if (isNullOrEmpty(quantity) || quantity < 1) {
            alert("인쇄 요소 수량을 정확하게 입력하십시요.");
            return;
        }

        requestInsertCartItemPrint(cartItemSeq, uploadPDFFileSeq, uploadJPGFileSeq, quantity);
    });

    //Cart Item Print 정보 수정 Button
    $(document).on("click", ".modifyCartItemPrintBtn", function () {
        var seq = $(this).attr("seq");
        var quantity = $(".cartItemPrintQuantityInput[seq='" + seq + "']").val();
        var exportQuantity = $(".cartItemPrintExportQuantityInput[seq='" + seq + "']").val();

        if (isNullOrZero(quantity) || isNullOrZero(exportQuantity)) {
            alert("인쇄 요소 수량을 정확하게 입력하십시요.");
            return;
        }
        requestUpdateCartItemPrint(seq, quantity);
    });

    //Cart Item Print 정보 삭제 Button
    $(document).on("click", ".removeCartItemPrintBtn", function () {
        if (confirm("인쇄 요소를 삭제하시겠습니까?") == false) {
            return;
        }
        var seq = $(this).attr("seq");
        requestDeleteCartItemPrint(seq);
    });

    //#endregion

    //#region 카트 추가 Modal 관련

    //Show Modal Btn
    $(document).on("click", ".showAddCartModalBtn", function () {
        showAddCartModal();
    });

    //제품 검색 Input.onKeyupEvent
    $(document).on("keyup", "#addCartSearchCodeInput", function () {
        if (isNullOrEmpty($(this).val())) return;
        $("#addCartSearchResultListContain").html(createProgressBarTag("90%"));
        if (isNullOrEmpty($(".addTargetSeq").val())) {
            requestAddCartSearchCodeList();
        } else {
            requestAddCartItemSearchCodeList();
        }
    });

    //제품 검색 Btn.onClickEvent
    $(document).on("click", "#addCartSearchCodeBtn", function () {
        if (isNullOrEmpty($("#addCartSearchCodeInput").val())) return;
        $("#addCartSearchResultListContain").html(createProgressBarTag("90%"));
        if (isNullOrEmpty($(".addTargetSeq").val())) {
            requestAddCartSearchCodeList();
        } else {
            requestAddCartItemSearchCodeList();

        }
    });

    //제품 검색 카테고리 Select.onChangeEvent
    $(document).on("change", "#addCartTypeSelect", function () {
        $("#addCartSearchCodeInput").val("");
        $("#addCartSearchResultListContain").html(createProgressBarTag("90%"));
    });

    //검색된 제품 리스트에서 Cart 추가 Button
    $(document).on("click", ".addCartBtn", function () {
        var quantity = $(".addCartQuantityInput").val();
        if (isNullOrZero(quantity) || quantity < 0) {
            alert("올바른 수량을 입력하십시요.");
            return;
        }

        requestInsertCart($(this).attr("seq"), $("#addCartTypeSelect").val(), quantity);
    });

    //검색된 제품 리스트에서 Cart Item 추가 Button
    $(document).on("click", ".addCartItemBtn", function () {
        var quantity = $(".addCartQuantityInput").val();
        if (isNullOrZero(quantity) || quantity < 0) {
            alert("올바른 수량을 입력하십시요.");
            return;
        }

        requestInsertCartItem($(".addTargetSeq").val(), $(this).attr("seq"), quantity);
    });

    //#endregion

    if (isNullOrEmpty($("#seq").val())) {
        switchToWrite();
    } else {
        switchToDetail();
        requestOrderDetail();
    }
});


//Write 모드로 구성한다.
function switchToWrite() {
    $(".orderSeqCol").hide();
    $(".regCol").hide();
    $(".modifyOrderBtn").hide();
    $(".removeOrderBtn").hide();
    $("#orderStatusTypeSelect").prop("disabled", true);
    $(".cartPanel").hide();
    $(".orderPriceCol").hide();
    $(".xml-file-path-col").hide();
    $(".xml-url-col").hide();
}

//Detail 모드로 구성한다.
function switchToDetail() {
    $(".orderSeqCol").show();
    $(".regCol").show();
    $(".orderCodeInput").prop("readonly", true);
    $(".orderCodeCheckBtn").prop("disabled", true);
    $(".addOrderBtn").hide();
    $(".modifyOrderBtn").show();
    $(".removeOrderBtn").show();
    $(".cartPanel").show();
    $(".orderPriceCol").show();

    $(".xml-file-path-col").hide();
    $(".xml-url-col").hide();
}

//#region Order Request 처리 관련


function requestOrderDetail() {
    var paramData = JSON.stringify({
        "pOrderSeq": $("#seq").val()
    });

    $.ajax({
        type: "POST",
        xhrFields: { withCredentials: true },
        url: "OrderDetail.aspx/RequestOrderDetail",
        contentType: "application/json; charset=utf-8",
        data: paramData,
        crossDomain: false,
        dataType: "json",
        success: function (result) {
            var resultData = JSON.parse(result.d);
            if (resultData.RESULT == true) {
                var jsonData = JSON.parse(resultData.VALUE);
                $(".orderSeqInput").val(jsonData.ORDER_SEQ);
                $(".regDateInput").val(jsonData.REG_DATE);
                $(".orderCodeInput").val(jsonData.ORDER_CODE);
                $(".requestStatusTypeSelect").val(jsonData.REQUEST_STATUS_TYPE_CODE);
                $(".orderStatusTypeSelect").val(jsonData.ORDER_STATUS_TYPE_CODE);
                $(".memoTxt").val(jsonData.MEMO);
                $(".orderPriceInput").val(jsonData.PRICE.toFixed(3));

                if (isNullOrEmpty(jsonData.XML_DATA_PATH) == false) {
                    $(".xml-file-path-col").show();
                    $(".xmlFilePathInput").val(jsonData.XML_DATA_PATH);
                    $(".xmlFileDownloadBtn").attr("href", jsonData.XML_DATA_PATH);
                }

                if (isNullOrEmpty(jsonData.XML_URL) == false) {
                    $(".xml-url-col").show();
                    $(".xmlUrlInput").val(jsonData.XML_URL);
                    $(".xmlURLOpenBtn").attr("href", jsonData.XML_URL);
                }


                $("#cartListContain").html(createCartList(jsonData));

                //#region Control 활성화
                $(".dateinput").datepicker({
                    inline: true,
                    dateFormat: "yy-mm-dd",    /* 날짜 포맷 */
                    showAnim: 'slideDown'
                });

                $(".addCartItemPrintPDFFileUploadBtn, .addCartItemPrintJPGFileUploadBtn").each(function () {
                    var accept = $(this).hasClass("addCartItemPrintPDFFileUploadBtn") ? ".pdf" : ".jpg";
                    var key = $(this).hasClass("addCartItemPrintPDFFileUploadBtn") ? "PDF" : "JPG";
                    var attr = $(this).attr("seq");

                    
                    $(this).ajaxUploadPrompt({
                        url: $("#uploadHandleURL").val(),
                        multiple: false,
                        crossDomain: true,
                        key: key,
                        seq: attr,
                        accept: accept,
                        //파일 전송이 시작될때 Callback
                        beforeSend: function () {
                            //                            setState("progress");
                        },
                        //Error가 발생될때의 Callback
                        error: function (error) {
                            //                            setState("error");
                            alert("Upload Error!!");
                        },
                        onprogress: function (e) {
                            //                            if (e.lengthComputable) {
                            //                                setProgress(e.loaded, e.total);
                            //                            }
                        },
                        success: function (data) {
                            var jsonData = JSON.parse(data);
                            var uploadFileSeq = -1;
                            var uploadFileName = "";
                            var traceValue = "";

                            for (var index = 0; index < jsonData.FILE_RESULT_LIST.length; index++) {
                                var cData = jsonData.FILE_RESULT_LIST[index];
                                traceValue += cData.SUCCESS + "|" + cData.ERROR_MESSAGE + "|" + cData.ORG_FILE_NAME + "|" + cData.UPLOAD_FILE_PATH + "<br>";
                                uploadFileSeq = cData.UPLOAD_FILE_SEQ;
                                uploadFileName = cData.ORG_FILE_NAME;
                            }

                            $(".addCartItemPrint" + this.key + "FileInput[seq='" + this.seq + "']").val(uploadFileName);
                            $(".addCartItemPrint" + this.key + "FileUploadSeq[seq='" + this.seq + "']").val(uploadFileSeq);
                        }
                    });

                });
                //#endregion

                updateLayout();
            } else {
                alert("주문 상세 정보 불러오기 실패!");
            }
        },
        error: function (a, b, c) {
            alert("Error:" + a.status + a.statusText + b + c);
        }
    });
}



//주문 코드 중복 검사를 시행한다.
function requestCheckOrderCode($orderCode, $toDoAlert) {
    if (isNullOrEmpty($toDoAlert)) $toDoAlert = false;

    var paramData = JSON.stringify({
        "pOrderCode": $orderCode
    });

    $.ajax({
        type: "POST",
        xhrFields: { withCredentials: true },
        url: "OrderDetail.aspx/RequestCheckOrderCode",
        contentType: "application/json; charset=utf-8",
        data: paramData,
        crossDomain: false,
        dataType: "json",
        success: function (result) {
            var resultData = JSON.parse(result.d);
            if (resultData.RESULT == true) {
                $("#orderCodeChecked").val(resultData.VALUE);
                var alertMsg = (resultData.VALUE != "true") ? "중복된 주문 코드가 있습니다. 확인해주십시요." : "중복된 주문 코드가 없습니다.";

                if (resultData.VALUE != "true") {
                    showValidGroupErrorMessage("중복된 주문 코드가 있습니다.", $(".orderCodeInput"));
                }

                if ($toDoAlert == true) alert(alertMsg);

            } else {
                $("#orderCodeChecked").val("false");
                alert("주문 코드 체크 실패!");
            }
        },
        error: function (a, b, c) {
            alert("Error:" + a.status + a.statusText + b + c);
        }
    });
}

//새로운 주문을 Insert 요청한다.
function requestInsertOrder() {
    var paramData = JSON.stringify({
        "pOrderCode": $(".orderCodeInput").val(),
        "pRequestStatusTypeCode": $(".requestStatusTypeSelect").val(),
        "pOrderStatusTypeCode": $(".orderStatusTypeSelect").val(),
        "pMemo": $(".memoTxt").val()
    });

    $.ajax({
        type: "POST",
        xhrFields: { withCredentials: true },
        url: "OrderDetail.aspx/RequestInsertOrder",
        contentType: "application/json; charset=utf-8",
        data: paramData,
        crossDomain: false,
        dataType: "json",
        success: function (result) {
            var resultData = JSON.parse(result.d);
            if (resultData.RESULT == true) {
                alert("새로운 주문이 생성되었습니다.");
                location.href = "OrderDetail.aspx?seq=" + resultData.VALUE;
            } else {
                alert("새로운 주문이 생성 실패!");
            }
        },
        error: function (a, b, c) {
            alert("Error:" + a.status + a.statusText + b + c);
        }
    });


}


//주문 내용 수정을 요청한다.
function requestUpdateOrder() {
    var paramData = JSON.stringify({
        "pOrderSeq": $("#seq").val(),
        "pRequestStatusTypeCode": $(".requestStatusTypeSelect").val(),
        "pOrderStatusTypeCode": $(".orderStatusTypeSelect").val(),
        "pMemo": $(".memoTxt").val()
    });

    $.ajax({
        type: "POST",
        xhrFields: { withCredentials: true },
        url: "OrderDetail.aspx/RequestUpdateOrder",
        contentType: "application/json; charset=utf-8",
        data: paramData,
        crossDomain: false,
        dataType: "json",
        success: function (result) {
            var resultData = JSON.parse(result.d);
            if (resultData.RESULT == true) {
                alert("주문 정보가 수정되었습니다.");
            } else {
                alert("주문 수정 실패!");
            }
        },
        error: function (a, b, c) {
            alert("Error:" + a.status + a.statusText + b + c);
        }
    });
}


//주문 삭제를 요청한다.
function requestDeleteOrder() {
    //TODO : 구현 필요
    var paramData = JSON.stringify({
        "pOrderSeq": $("#seq").val()
    });

    $.ajax({
        type: "POST",
        xhrFields: { withCredentials: true },
        url: "OrderDetail.aspx/RequestDeleteOrder",
        contentType: "application/json; charset=utf-8",
        data: paramData,
        crossDomain: false,
        dataType: "json",
        success: function (result) {
            var resultData = JSON.parse(result.d);
            if (resultData.RESULT == true) {
                alert("주문 정보가 삭제되었습니다.");
                goToList();
            } else {
                alert("주문 삭제 실패!");
            }
        },
        error: function (a, b, c) {
            alert("Error:" + a.status + a.statusText + b + c);
        }
    });
}


//#endregion

//#region Cart Request 관련 처리

//Cart 요소를 추가한다.
function requestInsertCart($seq, $type, $quantity) {

    var paramData = JSON.stringify({
        "pOrderSeq": $("#seq").val(),
        "pSeq": $seq,
        "pCartTypeCode": $type,
        "pQuantity": $quantity
    });

    $.ajax({
        type: "POST",
        xhrFields: { withCredentials: true },
        url: "OrderDetail.aspx/RequestInsertCart",
        contentType: "application/json; charset=utf-8",
        data: paramData,
        crossDomain: false,
        dataType: "json",
        success: function (result) {
            var resultData = JSON.parse(result.d);
            if (resultData.RESULT == true) {
                alert("카트에 추가되었습니다.");
                hideAddCartModal();
                requestOrderDetail();
            } else {
                alert("카트 추가 요청 실패!");
            }
        },
        error: function (a, b, c) {
            alert("Error:" + a.status + a.statusText + b + c);
        }
    });

}


//Cart 요소를 삭제한다.
function requestDeleteCart($cartSeq) {

    var paramData = JSON.stringify({
        "pCartSeq": $cartSeq
    });

    $.ajax({
        type: "POST",
        xhrFields: { withCredentials: true },
        url: "OrderDetail.aspx/RequestDeleteCart",
        contentType: "application/json; charset=utf-8",
        data: paramData,
        crossDomain: false,
        dataType: "json",
        success: function (result) {
            var resultData = JSON.parse(result.d);
            if (resultData.RESULT == true) {
                alert("카트가 삭제되었습니다.");
                hideAddCartModal();
                requestOrderDetail();
            } else {
                alert("카트 삭제 요청 실패!");
            }
        },
        error: function (a, b, c) {
            alert("Error:" + a.status + a.statusText + b + c);
        }
    });
}


//Cart 요소의 정보를 수정한다.
function requestUpdateCart($cartSeq, $quantity, $requestShippingDate, $itemQuantityUpdate) {
    var paramData = JSON.stringify({
        "pCartSeq": $cartSeq,
        "pQuantity": $quantity,
        "pRequestShippingDate": $requestShippingDate,
        "pItemQuantityUpdate": $itemQuantityUpdate
    });

    $.ajax({
        type: "POST",
        xhrFields: { withCredentials: true },
        url: "OrderDetail.aspx/RequestUpdateCart",
        contentType: "application/json; charset=utf-8",
        data: paramData,
        crossDomain: false,
        dataType: "json",
        success: function (result) {
            var resultData = JSON.parse(result.d);
            if (resultData.RESULT == true) {
                alert("카트 정보가 수정 되었습니다.");
                hideAddCartModal();
                requestOrderDetail();
            } else {
                alert("카트 수정 요청 실패!");
            }
        },
        error: function (a, b, c) {
            alert("Error:" + a.status + a.statusText + b + c);
        }
    });
}


//#endregion

//#region Cart Item Request 관련

//Cart Item 요소를 추가한다.
function requestInsertCartItem($cartSeq, $prodSeq, $quantity) {
    var paramData = JSON.stringify({
        "pCartSeq": $cartSeq,
        "pProdSeq": $prodSeq,
        "pQuantity": $quantity
    });

    $.ajax({
        type: "POST",
        xhrFields: { withCredentials: true },
        url: "OrderDetail.aspx/RequestInsertCartItem",
        contentType: "application/json; charset=utf-8",
        data: paramData,
        crossDomain: false,
        dataType: "json",
        success: function (result) {
            var resultData = JSON.parse(result.d);
            if (resultData.RESULT == true) {
                alert("카트 아이템 요소가 추가 되었습니다.");
                hideAddCartModal();
                requestOrderDetail();
            } else {
                alert("카트 아이템 요소 추가 요청 실패!");
            }
        },
        error: function (a, b, c) {
            alert("Error:" + a.status + a.statusText + b + c);
        }
    });
}

//Cart Item 요소를 수정한다.
function requestUpdateCartItem($cartItemSeq, $quantity) {
    var paramData = JSON.stringify({
        "pCartItemSeq": $cartItemSeq,
        "pQuantity": $quantity
    });

    $.ajax({
        type: "POST",
        xhrFields: { withCredentials: true },
        url: "OrderDetail.aspx/RequestUpdateCartItem",
        contentType: "application/json; charset=utf-8",
        data: paramData,
        crossDomain: false,
        dataType: "json",
        success: function (result) {
            var resultData = JSON.parse(result.d);
            if (resultData.RESULT == true) {
                alert("카트 아이템 요소가 수정 되었습니다.");
                hideAddCartModal();
                requestOrderDetail();
            } else {
                alert("카트 아이템 요소 수정 요청 실패!");
            }
        },
        error: function (a, b, c) {
            alert("Error:" + a.status + a.statusText + b + c);
        }
    });
}

//Cart Item 을 삭제한다.
function requestDeleteCartItem($cartItemSeq) {

    var paramData = JSON.stringify({
        "pCartItemSeq": $cartItemSeq
    });

    $.ajax({
        type: "POST",
        xhrFields: { withCredentials: true },
        url: "OrderDetail.aspx/RequestDeleteCartItem",
        contentType: "application/json; charset=utf-8",
        data: paramData,
        crossDomain: false,
        dataType: "json",
        success: function (result) {
            var resultData = JSON.parse(result.d);
            if (resultData.RESULT == true) {
                alert("카트 아이템 요소가 삭제 되었습니다.");
                hideAddCartModal();
                requestOrderDetail();
            } else {
                alert("카트 아이템 요소 삭제 요청 실패!");
            }
        },
        error: function (a, b, c) {
            alert("Error:" + a.status + a.statusText + b + c);
        }
    });
}

//#endregion


//#region Cart Item Print Request 관련

//Cart Item Print 를 추가한다.
function requestInsertCartItemPrint($cartItemSeq, $uploadPDFFileSeq, $uploadJPGFileSeq, $quantity) {
    var paramData = JSON.stringify({
        "pCartItemSeq": $cartItemSeq,
        "pPDFUploadFileSeq": $uploadPDFFileSeq,
        "pJPGUploadFileSeq": $uploadJPGFileSeq,
        "pQuantity": $quantity
    });

    $.ajax({
        type: "POST",
        xhrFields: { withCredentials: true },
        url: "OrderDetail.aspx/RequestInsertCartItemPrint",
        contentType: "application/json; charset=utf-8",
        data: paramData,
        crossDomain: false,
        dataType: "json",
        success: function (result) {
            var resultData = JSON.parse(result.d);
            if (resultData.RESULT == true) {
                alert("인쇄 요소가 추가 되었습니다.");
                hideAddCartModal();
                requestOrderDetail();
            } else {
                alert("인쇄 요소 추가 요청 실패!");
            }
        },
        error: function (a, b, c) {
            alert("Error:" + a.status + a.statusText + b + c);
        }
    });
}

//Cart Item Print 정보를 수정한다.
function requestUpdateCartItemPrint($cartItemPrintSeq, $quantity) {
    var paramData = JSON.stringify({
        "pCartItemPrintSeq": $cartItemPrintSeq,
        "pQuantity": $quantity
    });

    $.ajax({
        type: "POST",
        xhrFields: { withCredentials: true },
        url: "OrderDetail.aspx/RequestUpdateCartItemPrint",
        contentType: "application/json; charset=utf-8",
        data: paramData,
        crossDomain: false,
        dataType: "json",
        success: function (result) {
            var resultData = JSON.parse(result.d);
            if (resultData.RESULT == true) {
                alert("인쇄 요소 정보가 수정 되었습니다.");
                hideAddCartModal();
                requestOrderDetail();
            } else {
                alert("인쇄 요소 수정 요청 실패!");
            }
        },
        error: function (a, b, c) {
            alert("Error:" + a.status + a.statusText + b + c);
        }
    });
}

//Cart Item Print 정보를 삭제한다.
function requestDeleteCartItemPrint($cartItemPrintSeq) {
    var paramData = JSON.stringify({
        "pCartItemPrintSeq": $cartItemPrintSeq
    });

    $.ajax({
        type: "POST",
        xhrFields: { withCredentials: true },
        url: "OrderDetail.aspx/RequestDeleteCartItemPrint",
        contentType: "application/json; charset=utf-8",
        data: paramData,
        crossDomain: false,
        dataType: "json",
        success: function (result) {
            var resultData = JSON.parse(result.d);
            if (resultData.RESULT == true) {
                alert("인쇄 요소 정보가 삭제 되었습니다.");
                hideAddCartModal();
                requestOrderDetail();
            } else {
                alert("인쇄 요소 삭제 요청 실패!");
            }
        },
        error: function (a, b, c) {
            alert("Error:" + a.status + a.statusText + b + c);
        }
    });
}

//#endregion


//#region 검색 및 하위 요소 추가 관련


//Add Cart Item을 위한 제품 검색을 시행한다.
function requestAddCartItemSearchCodeList() {
    requestSearchCodeList($("#addCartSearchCodeInput").val(), false, createAddCartItemList);
}

//Add Cart를 위한, 제품 검색을 시행한다.
function requestAddCartSearchCodeList() {
    requestSearchCodeList($("#addCartSearchCodeInput").val(), $("#addCartTypeSelect").val() != "201003", createAddCartList);
}

//검색한다.
function requestSearchCodeList($searchCode, $isSetGroup, $factoryFunction) {
    var paramData = JSON.stringify({
        "pCode": $searchCode,
        "isSetGroup": $isSetGroup
    });

    $.ajax({
        type: "POST",
        xhrFields: { withCredentials: true },
        url: "OrderDetail.aspx/RequestAddCartSearchCode",
        contentType: "application/json; charset=utf-8",
        data: paramData,
        crossDomain: false,
        dataType: "json",
        success: function (result) {
            var resultData = JSON.parse(result.d);
            if (resultData.RESULT == true) {
                $factoryFunction.call(this, resultData.VALUE);
            } else {
                alert("제품 검색 리스트 요청 실패!");
            }
        },
        error: function (a, b, c) {
            alert("Error:" + a.status + a.statusText + b + c);
        }
    });

}

//#endregion

//#region Tag Factory

//Cart List 에 대한 Tag를 생성한다.
function createCartList(jsonData) {
    var tag = "";
    if (jsonData.CART_INFO_LIST.length) {
        tag += "<ul class='list-group cart-list-group'>";
        for (var index = 0; index < jsonData.CART_INFO_LIST.length; index++) {
            var cartData = jsonData.CART_INFO_LIST[index];
            tag += "<li class='list-group-item  cart-list-group-item' seq='" + cartData.CART_SEQ + "'>";
            tag += (cartData.CART_TYPE_CODE == "201003") ? createTagPartCartTag(cartData) : createTagSetGroupCartTag(cartData);
            tag += "</li>";
        }
        tag += "</ul>";
    }
    return tag;
}

//#region [Set Group or Retail Cart] Row 에 대한 Tag를 생성한다.
function createTagSetGroupCartTag($data) {
    var result = "";

    var isSetGroup = ($data.CART_TYPE_CODE == "201001");
    var panelClass = (isSetGroup) ? "panel-default" : "panel-warning"
    result += "<span class='label label-primary'>CART</span>";
    result += "<span class='label label-default'>TYPE</span>" + $data.CART_TYPE_NAME;
    result += "<span class='label label-default'>CART SEQ</span>" + $data.CART_SEQ;
    result += "<div class='panel cart-panel " + panelClass + "' >";
    result += " <div class='panel-heading'>";
    result += "     <span class='label label-default'>CART CODE</span>" + $data.CART_CODE;
    result += "     <span class='label label-default'>SET GROUP CODE</span>" + $data.PROD_CODE;
    result += "     <span class='label label-default'>REG DATE</span>" + $data.REG_DATE;

    result += "     <div class='row cart-row inner-row'>";
    result += "         <div class='col-xs-3'>";
    result += "             <div class='input-group input-group-sm'>";
    result += "                 <span class='input-group-addon'>Quantity</span>";
    result += "                 <input type='text' class='form-control cartQuantityInput whole-numeric' value='" + $data.QUANTITY + "' seq='" + $data.CART_SEQ + "'/>";
    result += "                 <span class='input-group-addon'><small>EA</small></span>";
    result += "             </div>";
    result += "         </div>";
    result += "         <div class='col-xs-3'>";
    result += "             <div class='input-group input-group-sm'>";
    result += "                 <span class='input-group-addon'>배송요청일자<small>Request Shipping Date</small></span>";
    result += "                 <input type='text' class='form-control cartRequestDateInput dateinput' value='" + toDateString($data.REQUEST_SHIPPING_DATE) + "' seq='" + $data.CART_SEQ + "' readonly/>";
    result += "             </div>";
    result += "         </div>";
    result += "         <div class='col-xs-3'>";
    result += "             <div class='input-group input-group-sm'>";
    result += "                 <span class='input-group-addon'>가격 <small>Price</small> $</span>";
    result += "                 <input type='text' class='form-control cartPriceInput' value='" + $data.PRICE.toFixed(3) + "' seq='" + $data.CART_SEQ + "' readonly/>";
    result += "                 <span class='input-group-addon'>(<small>" + $data.QUANTITY + "ea</small> * <small>$" + $data.PRICE_UNIT.toFixed(3) + "</small>)</span>";
    result += "             </div>";
    result += "         </div>";
    result += "         <div class='col-xs-12'>";
    result += "             <div class='btn-group btn-group-xs'>";
    result += "                 <button class='btn btn-default btn-xs modifyCartBtn' seq='" + $data.CART_SEQ + "' type='button' order-modify-permision='true'><span class='glyphicon glyphicon-ok'><span>수정</button>";
    result += "                 <button class='btn btn-danger btn-xs removeCartBtn' seq='" + $data.CART_SEQ + "' type='button' order-modify-permision='true'><span class='glyphicon glyphicon-remove'><span>삭제</button>";
    result += "                 <button type='button' class='btn btn-default showAddCartItemModalBtn' seq='" + $data.CART_SEQ + "'' quantity='" + $data.QUANTITY + "' order-modify-permision='true'><span class='glyphicon glyphicon-plus'><span>세트구성요소추가(CART-ITEM)</button>";
    result += "             </div>";
    result += "         </div>";
    result += "     </div>";
    result += " </div>";

    //#region Cart Item 구성
    if ($data.CART_ITEM_INFO_LIST.length) {
        result += " <h6><span class='label label-success collapse-label' data-toggle='collapse' href = '#cartItemCollapse_" + $data.CART_SEQ + "'><span class='glyphicon glyphicon-th-list'></span> CART ITEM LIST(" + $data.CART_ITEM_INFO_LIST.length + ")</span></h6>";
        result += " <div class='panel-body collapse in' id='cartItemCollapse_" + $data.CART_SEQ + "'>";
        result += "     <ul class='list-group cart-item-list-group'>";
        for (var index = 0; index < $data.CART_ITEM_INFO_LIST.length; index++) {
            var cartItemData = $data.CART_ITEM_INFO_LIST[index];
            result += createTagCartItemTag(cartItemData, isSetGroup);
        }
        result += "     </ul>";
        result += " </div>";
    }
    //#endregion Cart Item 구성
    result += "</div>";
    return result;
}

function createTagCartItemTag(cartItemData, $isSetGroup) {
    var result = "";
    var isPrintElement = false;
    switch (cartItemData.PROD_TYPE_CODE) {
        case "101002":
        case "101003":
        case "101004":
            isPrintElement = true;
            break;
    }

    result += "<li class='list-group-item  cart-item-list-group-item' seq='" + cartItemData.CART_ITEM_SEQ + "'>";
    result += " <span class='label label-success'>CART ITEM</span>";
    result += " <span class='label label-default'>CART ITEM SEQ</span>" + cartItemData.CART_ITEM_SEQ;
    result += " <span class='label label-default'>TYPE</span>" + cartItemData.TYPE_DTL_NAME;
    result += " <span class='label label-default'>CODE</span>" + cartItemData.PROD_CODE;
    result += " <span class='label label-default'>REG DATE</span>" + cartItemData.REG_DATE;

    result += " <div class='row cart-item-row inner-row'>";
    result += "     <div class='col-xs-3'>";
    result += "         <div class='input-group input-group-sm'>";
    result += "             <span class='input-group-addon'>주문수량<small>Quantity</small></span>";
    result += "             <input type='text' class='form-control cartItemQuantityInput whole-numeric' value='" + cartItemData.QUANTITY + "' seq='" + cartItemData.CART_ITEM_SEQ + "' readonly/>";
    result += "             <span class='input-group-addon'><small>EA</small></span>";
    result += "         </div>";

    //Cart Item 수량과 Print 수량이 맞지 않는 경우
    result += "     </div>";
    result += "     <div class='col-xs-3'>";
    result += "         <div class='input-group input-group-sm'>";
    result += "             <span class='input-group-addon'>실제 분출 수량<small>Export Quantity</small></span>";
    result += "             <input type='text' class='form-control cartItemExportQuantityInput whole-numeric' value='" + cartItemData.EXPORT_QUANTITY + "' readonly/>";
    result += "             <span class='input-group-addon'><small>EA</small></span>";
    result += "         </div>";
    result += "     </div>";
    result += " </div>";

    result += " <div class='btn-group btn-group-xs'>";
    result += "     <button type='button' class='btn btn-default modifyCartItemBtn' seq='" + cartItemData.CART_ITEM_SEQ + "' order-modify-permision='true'><span class='glyphicon glyphicon-ok'><span>수정</button>";
    result += "     <button type='button' class='btn btn-danger removeCartItemBtn' seq='" + cartItemData.CART_ITEM_SEQ + "' order-modify-permision='true'><span class='glyphicon glyphicon-remove'><span>삭제</button>";
    if ($isSetGroup && isPrintElement) {
        result += "     <button type='button' class='btn btn-default showAddCartItemPrintFormBtn' seq='" + cartItemData.CART_ITEM_SEQ + "' data-toggle='collapse' data-target='#addCartItemPrintCollapse_" + cartItemData.CART_ITEM_SEQ + "' order-modify-permision='true'><span class='glyphicon glyphicon-plus'><span>인쇄요소추가</button>";
    }
    result += " </div>";




    //Cart Item Print List
    if (cartItemData.CART_ITEM_PRINT_LIST.length) {
        result += "<br/><br/><span class='label label-warning collapse-label' data-toggle='collapse' href = '#cartItemPrintCollapse_" + cartItemData.CART_ITEM_SEQ + "'><span class='glyphicon glyphicon-th-list'></span> CART ITEM PRINT LIST(" + cartItemData.CART_ITEM_PRINT_LIST.length + ")</span>";

        var totalPrintQuantity = getTotalQuantityPrintData(cartItemData);
        if (totalPrintQuantity != -1 && totalPrintQuantity != cartItemData.QUANTITY) result += "<div class='alert alert-danger' style='margin-left:20px;'>인쇄 수량과 주문수량이 맞지 않습니다. 확인하십시요.&nbsp;&nbsp;&nbsp; <b>주문 수량 : " + cartItemData.QUANTITY + "ea  &nbsp;&nbsp;&nbsp;&nbsp; 인쇄 요청 수량 : " + totalPrintQuantity + "ea</b></div>";

        result += "<div class='panel'>";
        result += " <div class='panel-body collapse in' id='cartItemPrintCollapse_" + cartItemData.CART_ITEM_SEQ + "'>";
        result += "     <ul class='list-group cart-item-print-list-group'>";
        for (var printIndex = 0; printIndex < cartItemData.CART_ITEM_PRINT_LIST.length; printIndex++) {
            result += createTagCartItemPrintTag(cartItemData.CART_ITEM_PRINT_LIST[printIndex]);
        }
        result += "     </ul>";
        result += " </div>";
        result += "</div>";
    }

    //#region Set Group 일 경우 인쇄 요소에 대한 정보 및 Insert Form 제공
    if ($isSetGroup && isPrintElement) result += createTagCartItemPrintInsertFormTag(cartItemData);
    //#endregion

    result += "</li>";
    return result;
}

//인쇄 요소들의 총 수량을 반환한다.
function getTotalQuantityPrintData($cartItemData) {
    var result = -1;
    if ($cartItemData.CART_ITEM_PRINT_LIST.length) {
        result = 0;
        for (var printIndex = 0; printIndex < $cartItemData.CART_ITEM_PRINT_LIST.length; printIndex++) {
            var printData = $cartItemData.CART_ITEM_PRINT_LIST[printIndex];
            result += printData.QUANTITY;
        }
    }
    return result;
}

function createTagCartItemPrintTag(printData) {
    var result = "";
    result += "<li class='list-group-item cart-item-print-list-group-item'>";
    result += " <span class='label label-warning'>CART ITEM PRINT</span>";
    result += " <span class='label label-default'>CART ITEM PRINT SEQ</span>" + printData.CART_ITEM_PRINT_SEQ;
    result += " <div class='row cart-item-print-row'>";
    result += "     <div class='col-xs-3'>";
    result += "         <div class='input-group input-group-sm'>";
    result += "             <span class='input-group-addon'>수량<small>(Quantity)</small></span>";
    result += "             <input type='text' class='form-control cartItemPrintQuantityInput whole-numeric' value='" + printData.QUANTITY + "' seq='" + printData.CART_ITEM_PRINT_SEQ + "'/>";
    result += "             <span class='input-group-addon'><small>EA</small></span>";
    result += "         </div>";
    result += "     </div>";
    result += "     <div class='col-xs-3'>";
    result += "         <div class='input-group input-group-sm'>";
    result += "             <span class='input-group-addon'>실제분출수량<small>(Export Quantity)</small></span>";
    result += "             <input type='text' class='form-control cartItemPrintExportQuantityInput whole-numeric' value='" + printData.EXPORT_QUANTITY + "' seq='" + printData.CART_ITEM_PRINT_SEQ + "' readonly/>";
    result += "             <span class='input-group-addon'><small>EA</small></span>";
    result += "         </div>";
    result += "     </div>";
    result += "     <div class='col-xs-3'>";
    if (isNullOrEmpty(printData.PDF_PATH)) {
        result += "         <div class='label label-danger'>인쇄파일(PDF)이 존재하지 않음</div>";
    }
    else {
        result += "         <div class='input-group input-group-sm'>";
        result += "             <span class='input-group-addon'>인쇄파일(PDF)</span>";
        result += "             <input type='text' class='form-control' value='" + printData.PDF_PATH + "' readonly/>";
        result += "             <div class='input-group-btn'>";
        result += "                 <a class='btn uploadFileDownloadBtn btn-primary' href='" + printData.PDF_PATH + "' target='_blank'><span class='glyphicon glyphicon-print'><span> 파일보기</a>";
        result += "             </div>";
        result += "         </div>";
    }

    result += "     <button type='button' class='btn btn-primary btn-xs cartItemPrintPDFUploadBtn' seq='" + printData.CART_ITEM_PRINT_SEQ + "'><span class='glyphicon glyphicon-upload'></span>PDF교체</button>";

    result += "     </div>";
    result += "     <div class='col-xs-3'>";

    if (isNullOrEmpty(printData.JPG_PATH)) {
        result += "         <div class='label label-danger'>이미지 파일(JPG)이 존재하지 않음</div>";
    } else {
        result += "         <div class='input-group input-group-sm'>";
        result += "             <span class='input-group-addon'>이미지 파일(JPG)</span>";
        result += "             <input type='text' class='form-control' value='" + printData.JPG_PATH + "' readonly/>";
        result += "             <div class='input-group-btn'>";
        result += "                 <a class='btn uploadFileDownloadBtn btn-primary' href='" + printData.JPG_PATH + "' target='_blank'><span class='glyphicon glyphicon-picture'><span> 파일보기</a>";
        result += "             </div>";
        result += "         </div>";
    }
    result += "     </div>";
    result += " </div>";
    result += " <div class='btn-group btn-group-xs'>";
    result += "     <button class='btn btn-default modifyCartItemPrintBtn' seq='" + printData.CART_ITEM_PRINT_SEQ + "'><span class='glyphicon glyphicon-ok'><span>수정</button>";
    result += "     <button type='button' class='btn btn-danger removeCartItemPrintBtn' seq='" + printData.CART_ITEM_PRINT_SEQ + "'><span class='glyphicon glyphicon-remove'><span>삭제</button>";
    result += " </div>";
    result += "</li>";
    return result;
}

function createTagCartItemPrintInsertFormTag(cartItemData) {
    var result = "";
    result += "<div class='collapse' id='addCartItemPrintCollapse_" + cartItemData.CART_ITEM_SEQ + "'>"
    result += " <div class='panel panel-default addCartItemPrintPanel' seq='" + cartItemData.CART_ITEM_SEQ + "'>";
    result += "     <div class='panel-body'>";
    result += "         <div class='row'>";
    result += "             <div class='col-xs-7'>";
    result += "                 <div class='label label-warning'>인쇄 요소 추가</div>";
    result += "                 <input type='hidden' class='addCartItemPrintPDFFileUploadSeq' seq='" + cartItemData.CART_ITEM_SEQ + "'/>";
    result += "                 <input type='hidden' class='addCartItemPrintJPGFileUploadSeq' seq='" + cartItemData.CART_ITEM_SEQ + "'/>";
    result += "             </div>";
    result += "             <div class='col-xs-6'>";
    result += "                 <div class='input-group input-group-sm'>";
    result += "                     <span class='input-group-addon'>인쇄파일(*.PDF)</span>";
    result += "                     <input type='text' class='form-control addCartItemPrintPDFFileInput' seq='" + cartItemData.CART_ITEM_SEQ + "' readonly/>";
    result += "                     <div class='input-group-btn'><button class='btn btn-primary addCartItemPrintPDFFileUploadBtn' type='button' seq='" + cartItemData.CART_ITEM_SEQ + "'><span class='glyphicon glyphicon-upload'></span>업로드</button></div>";
    result += "                 </div>";
    result += "             </div>";
    result += "             <div class='col-xs-6'>";
    result += "                 <div class='input-group input-group-sm'>";
    result += "                     <span class='input-group-addon'>썸네일파일(*.JPG)</span>";
    result += "                     <input type='text' class='form-control addCartItemPrintJPGFileInput' seq='" + cartItemData.CART_ITEM_SEQ + "' readonly/>";
    result += "                     <div class='input-group-btn'><button class='btn btn-primary addCartItemPrintJPGFileUploadBtn' type='button' seq='" + cartItemData.CART_ITEM_SEQ + "'><span class='glyphicon glyphicon-upload'></span>업로드</button></div>";
    result += "                 </div>";
    result += "             </div>";
    result += "             <div class='col-xs-3'>";
    result += "                 <div class='input-group input-group-sm'>";
    result += "                     <span class='input-group-addon'>인쇄요소수량<small>Quantity</small></span>";
    result += "                     <input type='text' class='form-control addCartItemPrintQuantityInput whole-numeric' seq='" + cartItemData.CART_ITEM_SEQ + "' value='0'/>";
    result += "                     <span class='input-group-addon'><small>EA</small></span>";
    result += "                 </div>";
    result += "             </div>";
    result += "             <div class='col-xs-12'>";
    result += "                 <button class='btn btn-default btn-sm addCartItemPrintBtn' seq='" + cartItemData.CART_ITEM_SEQ + "'><span class='glyphicon glyphicon-plus'></span>인쇄요소추가</button>";
    result += "             </div>";
    result += "         </div>";
    result += "     </div>";
    result += " </div>";
    result += "</div>";
    return result;
}

//Add Cart를 위한 검색 결과에 대한 화면을 생성한다.
function createAddCartList($data) {
    var cartType = $("#addCartTypeSelect").val();

    //#region Tag Factory
    var tag = "";
    tag += "<table class='table table-striped table-hover table-bordered'>";
    tag += "    <thead>";
    tag += "        <tr>";
    tag += "            <td><small>SEQ</small></td>";
    tag += "            <td><small>Type</small></td>";
    tag += "            <td><small>Code</small></td>";
    tag += "            <td>-</td>";
    tag += "        </tr>";
    tag += "    </thead>";
    tag += "    <tbody>";

    var jsonData = JSON.parse($data);
    for (var index = 0; index < jsonData.length; index++) {
        var cData = jsonData[index];
        var seqValue = undefined;
        var typeValue = undefined;
        var codeValue = undefined;

        switch (cartType) {
            case "201003":
                //Part Cart
                seqValue = cData.PROD_SEQ;
                codeValue = cData.PROD_CODE;
                typeValue = cData.TYPE_DTL_NAME;
                break;
            default:
                //Set(or Retail) Cart
                seqValue = cData.PROD_SET_GROUP_SEQ;
                codeValue = cData.PROD_SET_GROUP_CODE;
                typeValue = cData.SET_GROUP_TYPE_DTL_NAME;
                break;
        }

        tag += "        <tr>";
        tag += "            <td>" + seqValue + "</td>";
        tag += "            <td>" + typeValue + "</td>";
        tag += "            <td>" + codeValue + "</td>";
        tag += "            <td>";
        tag += "                <button class='btn btn-primary btn-xs addCartBtn' seq='" + seqValue + "'><span class='glyphicon glyphicon-plus'></span> 카트 추가 </button>";
        tag += "            </td>";
        tag += "        </tr>";
    }

    tag += "    </tbody>";
    tag += "</table>";
    //#endregion

    $("#addCartSearchResultListContain").html(tag);
}

//Add Cart Item을 위한 검색 결과에 대한 화면을 생성한다.
function createAddCartItemList($data) {

    //#region Tag Factory
    var tag = "";
    tag += "<table class='table table-striped table-hover table-bordered'>";
    tag += "    <thead>";
    tag += "        <tr>";
    tag += "            <td><small>SEQ</small></td>";
    tag += "            <td><small>Type</small></td>";
    tag += "            <td><small>Code</small></td>";
    tag += "            <td>-</td>";
    tag += "        </tr>";
    tag += "    </thead>";
    tag += "    <tbody>";

    var jsonData = JSON.parse($data);
    for (var index = 0; index < jsonData.length; index++) {
        var cData = jsonData[index];
        var seqValue = undefined;
        var typeValue = undefined;
        var codeValue = undefined;
        seqValue = cData.PROD_SEQ;
        codeValue = cData.PROD_CODE;
        typeValue = cData.TYPE_DTL_NAME;

        tag += "        <tr>";
        tag += "            <td>" + seqValue + "</td>";
        tag += "            <td>" + typeValue + "</td>";
        tag += "            <td>" + codeValue + "</td>";
        tag += "            <td>";
        tag += "                <button class='btn btn-primary btn-xs addCartItemBtn' seq='" + seqValue + "'><span class='glyphicon glyphicon-plus'></span> 카트아이템추가</button>";
        tag += "            </td>";
        tag += "        </tr>";
    }

    tag += "    </tbody>";
    tag += "</table>";
    //#endregion

    $("#addCartSearchResultListContain").html(tag);
}


//#endregion

//단품 Cart Row에대한 Tag를 생성한다.
function createTagPartCartTag($data) {
    var result = "";
    result += "<span class='label label-primary'>CART</span>";
    result += "<span class='label label-default'>type</span>" + $data.CART_TYPE_NAME;
    result += "<div class='panel panel-default'>";
    result += " <div class='panel-heading'>";
    result += "     <span class='label label-default'>CART CODE</span>" + $data.CART_CODE;
    result += "     <span class='label label-default'>PROD CODE</span>" + $data.PROD_CODE;
    result += "     <div class='row cart-row inner-row'>";
    result += "         <div class='col-xs-3'>";
    result += "             <div class='input-group input-group-sm'>";
    result += "                 <span class='input-group-addon'>주문수량<small>Quantity</small></span>";
    result += "                 <input type='text' class='form-control cartQuantityInput whole-numeric' value='" + $data.QUANTITY + "' seq='" + $data.CART_SEQ + "'/>";
    result += "                 <span class='input-group-addon'><small>EA</small></span>";
    result += "             </div>";
    result += "         </div>";
    result += "         <div class='col-xs-3'>";
    result += "             <div class='input-group input-group-sm'>";
    result += "                 <span class='input-group-addon'>배송요청일자<small>Request Shipping Date</small></span>";
    result += "                 <input type='text' class='form-control cartRequestDateInput dateinput' value='" + $data.REQUEST_SHIPPING_DATE + "' seq='" + $data.CART_SEQ + "' readonly/>";
    result += "             </div>";
    result += "         </div>";
    result += "         <div class='col-xs-3'>";
    result += "             <div class='input-group input-group-sm'>";
    result += "                 <span class='input-group-addon'>가격 <small>Price</small> $</span>";
    result += "                 <input type='text' class='form-control cartPriceInput' value='" + $data.PRICE.toFixed(3) + "' seq='" + $data.CART_SEQ + "' readonly/>";
    result += "                 <span class='input-group-addon'>(<small>" + $data.QUANTITY + "ea</small> * <small>$" + $data.PRICE_UNIT.toFixed(3) + "</small>)</span>";
    result += "             </div>";
    result += "         </div>";
    result += "         <div class='col-xs-12'>";
    result += "             <div class='btn-group btn-group-sm'>";
    result += "                 <button class='btn btn-default btn-xs modifyCartBtn' seq='" + $data.CART_SEQ + "' type='button' order-modify-permision='true'><span class='glyphicon glyphicon-ok'><span>수정</button>";
    result += "                 <button class='btn btn-danger btn-xs removeCartBtn' seq='" + $data.CART_SEQ + "' type='button' order-modify-permision='true'><span class='glyphicon glyphicon-remove'><span>삭제</button>";
    result += "             </div>";
    result += "         </div>";
    result += "     </div>";
    result += " </div>";
    result += "</div>";

    return result;
}

//#endregion

//리스트 페이지로 이동한다.
function goToList() {
    location.href = "OrderList.aspx";
}

//Add Cart를 위한 Modal 을 활성화 한다.
function showAddCartModal() {
    $(".addCartModalTitle").html("Cart 추가");
    $("#addCartModal").appendTo("body").modal("show");
    $("#addCartSearchCodeInput").val("");
    $("#addCartSearchResultListContain").html(createProgressBarTag("90%"));
    $("#addCartTypeSelect").val("201001");
    $(".addCartQuantityInput").val("100");

    $(".addCartTypeSelectRow").show();
    $(".addSearchCodeRow").show();
    $(".addQuantityRow").show();
    $(".addCartQuantityInput").prop("readonly", false);
    $(".addTargetSeq").val("");
}

//Add Cart Item을 위한 Modal을 활성화한다.
function showAddCartItemModal($cartSeq, $quantity) {
    $(".addCartModalTitle").html("세트 구성요소(Cart Item)추가");
    $("#addCartModal").appendTo("body").modal("show");
    $("#addCartSearchCodeInput").val("");
    $("#addCartSearchResultListContain").html(createProgressBarTag("90%"));
    $("#addCartTypeSelect").val("201003");
    $(".addCartQuantityInput").val($quantity);

    $(".addCartTypeSelectRow").hide();
    $(".addSearchCodeRow").show();
    $(".addQuantityRow").show();
    $(".addCartQuantityInput").prop("readonly", true);

    $(".addTargetSeq").val($cartSeq);
}

//Add Cart 를 위한 Modal를 비활성화 한다.
function hideAddCartModal() {
    $("#addCartModal").modal("hide");
    $(".addTargetSeq").val("");
}

function updateLayout() {
    //#region 주문 처리 권한
    if ($("#userPermissionInfoContain .permission_info_element[typeCode='701002']").val() == "N") {
        $("[order-modify-permision=\"true\"]").hide();
    }
    //#endregion
}
