/// <reference path="jquery-1.10.2.js" />
/// <reference path="common.js" />
/// <reference path="json2.js" />
/// <reference path="bootstrap.js" />
/// <reference path="jquery.validate.js" />

$(document).ready(function () {
    $("#startDate").datepicker({
        inline: true,
        dateFormat: "yy-mm-dd",    /* 날짜 포맷 */
        showAnim: 'slideDown'
    });

    $("#endDate").datepicker({
        inline: true,
        dateFormat: "yy-mm-dd",    /* 날짜 포맷 */
        showAnim: 'slideDown'
    });

    $(".date-yymmdd-input").datepicker({
        inline: true,
        dateFormat: "yy-mm-dd",    /* 날짜 포맷 */
        showAnim: 'slideDown'
    });

    $(document).on("click", ".img-thumbnail", function () {
        window.open("/Product/PopupImage.aspx?imgurl=" + $(this).attr("src"), "", "width=1000");
    });

    $(document).on("change load", ".whole-numeric", function () {
        var value = parseInt($(this).val());
        value = (isNaN(value) || value < 0) ? 0 : value;
        $(this).val(value);
    });

    //#region list page content menu


    var contentSelectorList = new Array();
    contentSelectorList.push({ type: "change", target: "#pageSizeSelect" });
    contentSelectorList.push({ type: "change", target: "#dateKindSelect" });
    contentSelectorList.push({ type: "change", target: "#startDate" });
    contentSelectorList.push({ type: "change", target: "#endDate" });
    contentSelectorList.push({ type: "change", target: "#requestStatusSelect" });
    contentSelectorList.push({ type: "change", target: "#orderStatusSelect" });
    contentSelectorList.push({ type: "change", target: "#productTypeSelect" });
    contentSelectorList.push({ type: "change", target: "#contentTypeSelect" });
    contentSelectorList.push({ type: "change", target: "#existPrintSelect" });
    contentSelectorList.push({ type: "change", target: "#erpStatusSelect" });
    contentSelectorList.push({ type: "click", target: "#searchBtn" });
    contentSelectorList.push({ type: "keyup", target: "#searchValue" });

    for (var prod in contentSelectorList) {
        var selector = contentSelectorList[prod];
        $(document).on(selector.type, selector.target, function ($e) {
            if ($e.type == "keyup" && $e.keyCode != 13) return;
            goToPage(1);
        });
    }
    //#endregion
});

//#region List 의 Page 를 구성한다.
function initPager($currentPage, $pageRowSize, $totalItems) {
    $("#pageContainer").pagination({
        items: $totalItems,
        itemsOnPage: $pageRowSize,
        displayedPages: 20,
        currentPage: $currentPage,
        cssStyle: 'light-theme',
        onPageClick: onPageClickListener
    });
}

function onPageClickListener($page, $event) {
    goToPage($page);
}

//#endregion

//#region 배송 추적 관련 

//DHL 배송 추적 팝업창을 생성한다.
function openPopupDHLTracking($value) {
    $value = String($value).replace("\n", ",").replace(",", "%0D%0A");
    if (trim($value).length < 1) {
        alert('Enter the DHL Number into the field , please.');
        return false;
    }
    window.open("http://www.dhl.com/content/g0/en/express/tracking.shtml?brand=DHL&AWB=" + $value, "_blank");
}

//EMS 배송 추적 팝업창을 생성한다.
function openPopupEMSTracking($value) {
    if (trim($value).length < 1) {
        alert("Enter the EMS Number into the field , please.");
        return false;
    }

    if (checkPostCode($value) == false) {
        alert("The Frist letter must be commenced a letter E or G or U");
        return false;
    }

    if (checkPostCodeCountry($value) == false) {
        alert("Check EMS Number, please.");
        return false;
    }

    if (String($value).length != 13) {
        alert("Please enter a thirteen-digit number for the item number");
        return false;
    }

    window.open("http://trace.epost.go.kr/xtts/servlet/kpl.tts.common.svl.SttSVL?target_command=kpl.tts.tt.epost.cmd.RetrieveEmsTraceEngCmd&JspURI=%2Fxtts%2Ftt%2Fepost%2Fems%2FEmsSearchResultEng.jsp&POST_CODE=" + $value + "&ems_gubun=E&x=24&y=11", "_blank");
}

//UPS 배송 추적 팝업창을 생성한다.
function openPopupUPSTracking($value) {
    window.open("http://wwwapps.ups.com/WebTracking/track?track=yes&trackNums=" + $value, "_blank");
}


function checkPostCode($value) {
    var result = false;
    var subStr = $value.substring(0, 1).toUpperCase();

    switch (subStr) {
        case "E":
        case "G":
        case "U":
            result = true;
            break;
    }
    return result;
}

function checkPostCodeCountry($value) {
    var charNum = 0;
    var country = '';
    country = $value.substring($value.length - 2, $value.length).toUpperCase();
    for (var i = 0; i < country.length; i++) {
        if (country.charCodeAt(i) >= 65 && country.charCodeAt(i) <= 90) {
            ++charNum;
        }
    }
    if (charNum == 2) return true;
    return false;
}


//#endregion

//전달되는 변수가 'null' or 'undefined' or '공백' 인지를 반환한다.
function isNullOrEmpty($value) {
    return ($value == undefined || $value == null || $value == "");
}

//전달되는 변수가 'null' or 'undefined' or '공백' or 'Trim에 대해서도 공백' 인지를 반환한다.
function isNullOrWhitespace($value) {
    return ($value == undefined || $value == null || $value == "" || $value.trim() == "");
}

//전달되는 변수가 'null' or 'undefiled' or '0' 인지를 반환한다.
function isNullOrZero($value) {
    return (isNullOrEmpty($value) || parseInt($value) == 0);
}

//공백을 제거한다.
function trim($value) {
    var strLen = $value.length;
    var str = '';

    for (var i = 0; i < strLen; i++) {
        if ($value.charAt(i) != ' ') {
            str += $value.charAt(i);
        }
    }
    if (str.length == 0) {
        return false;
    }
    return true;
}

function isNullEmpty($value) {
    return $value == undefined || $value == "";
}

function substring($value, $maxlength, $add) {
    return ((String($value).length > $maxlength) ? String($value).substr(0, $maxlength) + $add : $value);
}

function toShortDate($date) {
    var date = new Date($date);
    return date.toLocaleDateString();
}

function onCommonErrorPlaceMent($label, $element) {
    $element.closest(".form-group").find(".alert").html($label);
}

function onCommonValidateHighlight($element) {
    $($element).closest(".form-group").removeClass('has-success').addClass('has-warning');
    $($element).closest(".form-group").find(".alert").removeClass('alert-success').addClass('alert-danger');
    $($element).closest(".form-group").find(".alert").css("display", "");
}

function onCommonValidateSuccess($element) {
    $($element).closest(".form-group").removeClass('has-warning').addClass('has-success');
    $($element).closest(".form-group").find(".alert").removeClass('alert-danger').addClass('alert-success');
    $($element).closest(".form-group").find(".alert").css("display", "");
    $($element).closest(".form-group").find(".alert").html("success");
}


//소수점 3번째 자리까지 표시하는 price 규격으로 변환한다.
function toPrice($value) {
    var result = 0;
    result = parseFloat($value);
    result = isNaN(result) ? 0 : result;
    result = (Math.round(result * 1000) / 1000);
    return result;
}

//bytes 값을 기준으로, 파일 사이즈 형식으로 반환한다.
function toFileSize(bytes) {
    var thresh = 1024;
    if (bytes < thresh) return bytes + ' B';
    var units = ['KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'];
    var u = -1;
    do {
        bytes /= thresh;
        ++u;
    } while (bytes >= thresh);
    return bytes.toFixed(1) + ' ' + units[u];
};


function createRandomString($length) {
    var result = "";
    var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    for (var i = 0; i < $length; i++) {
        result += possible.charAt(Math.floor(Math.random() * possible.length));
    }
    return result;
}

//해당 path에서 파일 이름을 반환한다.
function getFilename($path) {
    return $path.replace(/^.*[\\\/]/, '')
}

//해당 Path 에서 파일 확장자를 반환한다.
function getFileExt($path) {
    return (/[.]/.exec($path)) ? /[^.]+$/.exec($path) : undefined;
}

//해당 Path에서 파일확장자를 제거한 파일 이름을 반환한다.
function getFilenameWithoutExt($path) {

    var fileName = getFilename($path);
    return fileName.substring(0, fileName.lastIndexOf('.'));
}

//YYYY-MM-DD 형태의 String 으로 변환한다.
function toDateString($date) {
    $dateStr = $date;
    $date = new Date($date);
    var result;
    if (isNaN($date)) {
        var dateStr = $dateStr; 
        var a = dateStr.split("T");
        var d = a[0].split("-");
        var t = a[1].split(":");
        $date = new Date(d[0], (d[1] - 1), d[2], t[0], t[1], t[2]);
        result = $date.getYear() + "-" + pad($date.getMonth() + 1) + "-" + pad($date.getDate());
    }else{
        result = ($date.getYear() + 1900) + "-" + pad($date.getMonth() + 1) + "-" + pad($date.getDate());
    }
    return result;
}

function toTimeString($date) {
    $dateStr = $date;
    $date = new Date($date);
    var result;

    if (isNaN($date)) {
        var dateStr = $dateStr;
        var a = dateStr.split("T");
        var d = a[0].split("-");
        var t = a[1].split(":");
        $date = new Date(d[0], (d[1] - 1), d[2], t[0], t[1], t[2]);
        result = pad($date.getHours()) + ":" + pad($date.getMinutes()) + ":" + pad($date.getMilliseconds());
    } else {
        result = pad($date.getHours()) + ":" + pad($date.getMinutes()) + ":" + pad($date.getMilliseconds());
    }

    return result;
}

//숫자를 요청하는 자리수에 맞추어 반환한다.
//ex) pad(5,2) => "05"
function pad(n, width, z) {
    width = isNullOrEmpty(width) ? 2 : width;
    z = z || '0';
    n = n + '';
    return n.length >= width ? n : new Array(width - n.length + 1).join(z) + n;
}

//Datetime 의 MinValue 에 해당하는 Date String 인지를 반환한다.
function isMinValueTypeDatetimeString($value) {
    return $value.indexOf("0001") == 0
}

String.prototype.replaceAll = function (str1, str2, ignore) {
    return this.replace(new RegExp(str1.replace(/([\/\,\!\\\^\$\{\}\[\]\(\)\.\*\+\?\|\<\>\-\&])/g, "\\$&"), (ignore ? "gi" : "g")), (typeof (str2) == "string") ? str2.replace(/\$/g, "$$$$") : str2);
}

function escapeHtml(unsafe) {
    return unsafe
         .replace(/&/g, "&amp;")
         .replace(/</g, "&lt;")
         .replace(/>/g, "&gt;")
         .replace(/"/g, "&quot;")
         .replace(/'/g, "&#039;");
}

function onValidGroupErrorPlaceMent($label, $element) {
    $element.closest(".valid-group").find(".valid-message").html("").append($label);
}

function onValidGroupValidateHighlight($element) {
    $($element).closest(".valid-group").removeClass('validate-success').addClass('validate-warning');
    $($element).closest(".valid-group").find(".valid-message").show();
}

function onValidGroupValidateSuccess($element) {
    $($element).closest(".valid-group").removeClass('validate-warning').addClass('validate-success');
    $($element).closest(".valid-group").find(".valid-message").hide();
}

function showValidGroupErrorMessage($msg, $element) {
    $element.closest(".valid-group").find(".valid-message").html("").append("<span>" + $msg + "</span>");
    $element.closest(".valid-group").removeClass('validate-success').addClass('validate-warning');
    $($element).closest(".valid-group").find(".valid-message").removeClass('validate-success').addClass('validate-warning');
    $($element).closest(".valid-group").find(".valid-message").show();
}

function updateValidGroupToSuccess($element) {
    $($element).closest(".valid-group").removeClass('validate-warning').addClass('validate-success');
    $($element).closest(".valid-group").find(".valid-message").hide();
}

//Progress Bar UI Tag 를 생성한다.
function createProgressBarTag($containerWidth) {
    if (isNullOrEmpty($containerWidth)) $containerWidth = "100%";
    var result = "";
    result += "<div class='progress progress-striped active' style='width:" + $containerWidth + "'>";
    result += " <div class='progress-bar progress-bar-info' role='progressbar' aria-valuenow='90' aria-valuemin='0' aria-valuemax='100' style='width: 90%;'>&nbsp;</div>";
    result += "</div>";
    return result;
}


//특정 Select Box를 Source로 선정하고, Select Box를 복사하여 반환한다.
//attrList 는 Array Type으로 Array Element Value의 형식은 {name,value} 형식으로 전달된다.
function copySelectBoxTag($source, $value, $addClass, $attrList, $ignoreEmptyValue) 
{
    $ignoreEmptyValue = isNullOrEmpty($ignoreEmptyValue) ? true : $ignoreEmptyValue;

    var result = "";
    var tempDiv = $("<div/>").appendTo("body");
    var tempSelect = $("<select>").addClass($addClass).appendTo(tempDiv);

    for(var key in $attrList)
    {
        $(tempSelect).attr($attrList[key].name, $attrList[key].value);
    }

    $("option", $($source)).each(function () 
    {
        if (isNullOrEmpty($(this).val()) && $ignoreEmptyValue) return;
        $(tempSelect).append($("<option value='" + $(this).val() + "'>" + $(this).text() + "</option>"));
    });

    $(tempSelect).val($value);
    result = tempDiv.html();
    $(tempDiv).remove();
    return result;

}
