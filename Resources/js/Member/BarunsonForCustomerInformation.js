var Information = {

    init: function () {
        window.name = "Parent_window";

        window.parent.postMessage({ message: 'AuthFlag|Y' }, "*");

        Information.enableAllElement();
        $(".Auth_on").hide();
        $(".Auth_off").show();

        this.events();
    },

    events: function () {
        if (window.screen.width <= 320) {
            $("#wrapPostCode").css("min-width", "200px").css("max-width", "280px").css("width", "280px");
            $("#txtAddress").css("min-width", "200px").css("max-width", "280px").css("width", "280px");
            $("#txtAddressDetail").css("min-width", "200px").css("max-width", "280px").css("width", "280px");
        }

        $(".datepicker").datepicker({
            inline: true,
            showOtherMonths: true,
            autoclose: true,
            dateFormat: "yy-mm-dd"
        }).datepicker('widget').wrap('<div class="ll-skin-melon"/>');

        $(".btnCalendarIcon").click(function () {
            var visible = $(".datepicker").datepicker("widget").is(":visible");
            $(".datepicker").datepicker(visible ? "hide" : "show");
        });


        $("#selEMailFooter").on('change', function () {
            var sEMailFooter = $(this).val();
            $("#txtEMailFooter").val(sEMailFooter);

            if (sEMailFooter == "") {
                $("#txtEMailFooter").removeAttr("readonly");
            } else {
                $("#txtEMailFooter").attr("readonly", "readonly");
            }

        });

        $("#txtID").focusout(function () {
            var AvaliableID = Information.CheckAvailableUserID(false);
            var notiMessage = (AvaliableID == false ? "이미 사용중인 아이디 입니다." : "");
            if ($.trim($("#txtID").val()) == "")
                notiMessage = "";

            $(this).parent().find(".noti").text(notiMessage);
        });

        // Password Confirm
        $("#txtPasswordConfirm").focusin(function () {
            $("#txtPasswordConfirm").parent().find(".noti").text("");
        });

        $("#txtPasswordConfirm").focusout(function () {
            var txtPassword = $("#txtPassword").val();
            var txtPasswordConfirm = $("#txtPasswordConfirm").val();

            if (txtPassword != txtPasswordConfirm) {
                $("#txtPasswordConfirm").parent().find(".noti").text("동일하지 않습니다");
            } else {
                $("#txtPasswordConfirm").parent().find(".noti").text("");
            }
        });

        $(".thirdparty-parent").on('change', function () {
            var _checked = $(this).prop('checked');
            if (_checked) {
                $('.agreement-thirdparty').prop('checked', true);
                $('.agreement-thirdparty').trigger('change');

                $('.thirdparty-child').prop('checked', true);
                $('.thirdparty-child').parent().addClass("ez-checked");
            } else {
                $('.agreement-thirdparty').prop('checked', false);
                $('.agreement-thirdparty').trigger('change');

                $('.thirdparty-child').prop('checked', false);
                $('.thirdparty-child').parent().removeClass("ez-checked");
            }
        });

        $('.thirdparty-child').on('change', function () {
            var _checked = $(this).prop('checked');
            if (_checked) {

                $('.agreement-thirdparty').prop('checked', true);
                $('.agreement-thirdparty').trigger('change');

                $('.thirdparty-child').prop('checked', true);
                $('.thirdparty-child').parent().addClass("ez-checked");

                $('.thirdparty-parent').prop('checked', true);
                $('.thirdparty-parent').parent().addClass("ez-checked");
            } else {

                $('.thirdparty-parent').prop('checked', false);
                $('.thirdparty-parent').parent().removeClass("ez-checked");

                $('.thirdparty-child').prop('checked', false);
                $('.thirdparty-child').parent().removeClass("ez-checked");

                $('.agreement-thirdparty').prop('checked', false);
                $('.agreement-thirdparty').trigger('change');

            }
        });

        // 삼성
        $('.agreement-samsung_main').on('click', function () {
            $('.agreement-samsung').prop('checked', $(this).prop('checked'));
            $('.agreement-samsung').trigger('change');
        });

        $(".agreement-samsung").click(function () {
            var total = $(".agreement-samsung").length;
            var checked = $(".agreement-samsung:checked").length;


            if (total != checked) $(".agreement-samsung_main").prop("checked", false);
            else $(".agreement-samsung_main").prop("checked", true);
            $('.agreement-samsung_main').trigger('change');
        });

        $('.SamSungChoiceYear').click(function () {
            if ($(this).prop('checked')) {
                //chkeckbox 전체를 checked 해제후 click한 요소만 true 지정
                $('.SamSungChoiceYear').prop('checked', false);
                $(this).prop('checked', true);
                $('.SamSungChoiceYear').trigger('change');
            }
        });

        //엘지전자
        $('.agreement-lg').on('click', function () {
            $('.agreement-lg').prop('checked', $(this).prop('checked'));
            $('.agreement-lg').trigger('change');
        });
        //쿠쿠
        $('.agreement-cuc').on('click', function () {
            $('.agreement-cuc').prop('checked', $(this).prop('checked'));
            $('.agreement-cuc').trigger('change');
        });
        //까사미아
        $('.agreement-casa').on('click', function () {
            $('.agreement-casa').prop('checked', $(this).prop('checked'));
            $('.agreement-casa').trigger('change');
        });
        //KT
        $('.agreement-kt').on('click', function () {
            $('.agreement-kt').prop('checked', $(this).prop('checked'));
            $('.agreement-kt').trigger('change');
        });

        //현대백화점
        $('.agreement-Hyundai').on('click', function () {
            $('.agreement-Hyundai').prop('checked', $(this).prop('checked'));
            $('.agreement-Hyundai').trigger('change');
        });


        $('.agreement-thirdparty').on('click', function () {
            $(".thirdparty-parent").click(); // 제3자 체크 

            $('.agreement-thirdparty').prop('checked', $(this).prop('checked'));
            $('.agreement-thirdparty').trigger('change');
        });



    },

    CheckAvailableUserID: function (pAsync) {
        var result = false;
        $.ajaxSetup({ async: pAsync });
        $.getJSON("/Service/Member/CheckAvailableUser.ashx"
            , { USERID: $("#txtID").val(), AUTHCODE: $("#hidDupInfo").val(), OUTPUT: "json" }
            , function (data) {
                result = data.Avaliable;
            }
        );
        return result;
    },

    CheckUserID: function (value) {
        var result = /^[A-Za-z0-9]+[A-Za-z0-9_.\-]{3,15}$/;
        var returnValue = result.test(value);

        return returnValue;
    },

    // 영문자로 시작하는 6 ~ 16자의 영문 + 숫자 조합
    PasswordCheck: function (value) {
        var result = /^[A-Za-z][A-Za-z0-9_.!@#$%^&*]{5,15}$/;
        var returnValue = result.test(value);

        if (returnValue) {
            result = /[0-9]/;
            returnValue = result.test(value);
        }

        return returnValue;
    },

    isRunningSubmit: false,
    ValidationCheck: function () {

        if (Information.isRunningSubmit) {
            return false;
        }

        Information.isRunningSubmit = true;

        var samsungFlg = true;
        var isValidation = true;
        var errorMessage = "";
        var lgFlg = true; //엘지전자 추가
       
        if ($("#rdoSolar").prop("checked") == false && $("#rdoLunar").prop("checked") == false) {
            errorMessage = "양력 또는 음력을 선택해 주세요.";
            isValidation = false;
        }

        if (isValidation && $.trim($("#txtID").val()) == "") {
            $("#txtID").focus();
            errorMessage = "사용하실 아이디를 입력해주세요.";
            isValidation = false;
        }

        if (isValidation && Information.CheckAvailableUserID(false) == false) {
            errorMessage = "이미 사용중인 아이디 입니다.";
            isValidation = false;
        }

        if (Information.CheckUserID($("#txtID").val()) == false) {
            errorMessage = "아이디는 영문자로 시작하는 6~16자의 영문 또는 숫자의 조합이여야 합니다.";
            isValidation = false;
        }

        if ($("#hidDupInfo").val() == "") {
            errorMessage = "휴대폰인증부터 진행하셔야 합니다.";
            isValidation = false;
        }

        var txtPassword = $("#txtPassword").val();
        if (isValidation && $.trim(txtPassword) == "") {
            $("#txtPassword").focus();
            errorMessage = "비밀번호를 입력해주세요";
            isValidation = false;
        }
        if (isValidation && Information.PasswordCheck(txtPassword) == false) {
            $("#txtPassword").focus();
            errorMessage = "비밀번호는 영문자로 시작하는 6~16자의 영문, 숫자, _.!@#$%^&*의 특수문자의 조합이여야 합니다.";
            isValidation = false;
        }

        var txtPasswordConfirm = $("#txtPasswordConfirm").val();
        if (isValidation && $.trim(txtPasswordConfirm) == "") {
            $("#txtPasswordConfirm").focus();
            $("#txtPasswordConfirm").parent().find(".noti").text("비밀번호를 입력해주세요");
            isValidation = false;
        } else {
            $("#txtPasswordConfirm").parent().find(".noti").text("");
        }

        if (isValidation && txtPassword != txtPasswordConfirm) {
            $("#txtPasswordConfirm").focus();
            $("#txtPasswordConfirm").parent().find(".noti").text("동일하지 않습니다");
            errorMessage = "입력하신 비밀번호와 일치하지 않습니다.";
            isValidation = false;
        } else {
            $("#txtPasswordConfirm").parent().find(".noti").text("");
        }


        var txtZipCode = $("#txtZipCode1").val() + $("#txtZipCode2").val() + $("#txtZipCode3").val() + $("#txtZipCode4").val() + $("#txtZipCode5").val();
        if (isValidation && $.trim(txtZipCode) == "") {
            $("#txtZipCode").focus();
            errorMessage = "우편번호 및 주소를 입력해 주세요";
            isValidation = false;
        }

        var txtAddressDetail = $("#txtAddressDetail").val();
        if (isValidation && $.trim(txtAddressDetail) == "") {
            $("#txtAddressDetail").focus();
            errorMessage = "상세 주소를 입력해 주세요";
            isValidation = false;
        }

        var txtPhone1 = $("#txtPhone1").val();
        var txtPhone2 = $("#txtPhone2").val();
        var txtPhone3 = $("#txtPhone3").val();


        var txtHPhone1 = $("#txtHPhone1").val();
        var txtHPhone2 = $("#txtHPhone2").val();
        var txtHPhone3 = $("#txtHPhone3").val();
        if (isValidation && (
            ($.isNumeric(txtHPhone1) == false || $.trim(txtHPhone1) == "")
            || ($.isNumeric(txtHPhone2) == false || $.trim(txtHPhone2) == "")
            || ($.isNumeric(txtHPhone3) == false || $.trim(txtHPhone3) == "")
        )) {
            $("#txtHPhone1").focus();
            errorMessage = "휴대폰 번호를 입력해 주세요";
            isValidation = false;
        }

        var txtEMailHeader = $("#txtEMailHeader").val();
        if (isValidation && ($.trim(txtEMailHeader) == "")) {
            $("#txtEMailHeader").focus();
            errorMessage = "이메일 주소를 입력해 주세요";
            isValidation = false;
        }

        var emailRegExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
        var emailStr = $("#txtEMailHeader").val() + '@' + $("#txtEMailFooter").val();

        if (isValidation && (emailStr.match(emailRegExp) == null) && emailStr.split('@').length > 2) {
            $("#txtEMailHeader").focus();
            errorMessage = "'" + emailStr + "'이메일 주소가 잘못되었습니다.";
            isValidation = false;
        }

        var txtEMailFooter = $("#txtEMailFooter").val();
        if (isValidation && ($.trim(txtEMailFooter) == "")) {
            $("#txtEMailFooter").focus();
            errorMessage = "이메일 주소를 입력해 주세요";
            isValidation = false;
        }

        if ($("#dlWeddingDayField").css('display') != 'none' && $("#dlWeddingHallField").is(':visible') && $("#dlWeddingDayField").is(':visible')) {
            if ($('#txtWeddingDay').length > 0) {
                var txtWeddingDay = $("#txtWeddingDay").val();
                if (isValidation && $.trim(txtWeddingDay) == "") {
                    $("#txtWeddingDay").focus();
                    errorMessage = "예식일을 입력해 주세요";
                    isValidation = false;
                }
            }
        }

        if ($("#dlWeddingHallField").css('display') != 'none' && $("#dlWeddingHallField").is(':visible') && $("#dlWeddingDayField").is(':visible')) {
            if (isValidation && $("[name*=rdoWeddingHall]:checked").length <= 0) {
                errorMessage = "예식장을 선택해 주세요";
                isValidation = false;
            }
        }

        // 20191129 - 추가
        if (isValidation && $("#chkAgeAgreement").is(":checked") == false) {
            errorMessage = "만14세 이상 고객 가입에 동의하여 주십시오.";
            $("[name=chkAgeAgreement]").focus();
            isValidation = false;
        }

        if (isValidation && $("#chkEssentialAgreement").is(":checked") == false) {
            errorMessage = "회원이용약관에 동의하여 주십시오.";
            $("[name=chkEssentialAgreement]").focus();
            isValidation = false;
        }

        if (isValidation && $("#chkEssentialAgreementPurpose").is(":checked") == false) {
            errorMessage = "개인정보 수집이용에 동의하여 주십시오.";
            $("#chkEssentialAgreementPurpose").focus();
            isValidation = false;
        }


        // 선택 약관 (삼성 전자, 통신서비스, 엘지전자 추가) 에 동의하지 않은 고객이 가입완료 버튼 눌렀을 때 팝업창 출력
        // 바른손만
        //alert($(".thirdparty-child").is(":checked"));
        //alert($(".agreement-lg").is(":checked"));
        //alert($(".agreement-casa").is(":checked"));
        //alert($(".agreement-kt").is(":checked"));
        //alert($("#hidsamsungFlg").val());


        if ($('#hidSelectSiteCode').val() == "SB") {
           
            if (isValidation && ($(".thirdparty-child").is(":checked") == false || $(".agreement-lg").is(":checked") == false || $(".agreement-casa").is(":checked") == false || ($(".agreement-kt").length > 0 && $(".agreement-kt").is(":checked") == false)) && $("#hidsamsungFlg").val() == "N") {

            //if (isValidation && ($(".agreement-samsung").is(":checked") == false || $(".thirdparty-child").is(":checked") == false || $(".agreement-lg").is(":checked") == false || $(".agreement-casa").is(":checked") == false || $(".agreement-kt").is(":checked") == false) && $("#hidsamsungFlg").val() == "N") {
                if (confirm("모든 약관에 전체 동의 하시면 할인쿠폰을 드립니다.\n동의하시겠습니까?")) {
                    //$('.agreement-samsung').click(); // 삼성전자 
                    //$('.thirdparty-parent').click(); // 제 3자 동의 두개
                    //$('.agreement-lg').click(); // 엘지전자 
                    // 삼성전자
                    //$('.agreement-samsung').prop('checked', true);
                    //$('.agreement-samsung_main').prop('checked', true);
                    //$('.agreement-samsung').trigger('change');
                    //$('.agreement-samsung_main').trigger('change');
                    // 제3자 마케팅 활용동의
                    $('.agreement-thirdparty').prop('checked', true);
                    $('.agreement-thirdparty').trigger('change');
                    $('.thirdparty-child').prop('checked', true);
                    $('.thirdparty-child').parent().addClass("ez-checked");
                    $('.thirdparty-parent').prop('checked', true);
                    $('.thirdparty-parent').parent().addClass("ez-checked");
                    //엘쥐
                    $('.agreement-lg').prop('checked', true);
                    $('.agreement-lg').trigger('change');
                    //KT
                    $('.agreement-kt').prop('checked', true);
                    $('.agreement-kt').trigger('change');
                    //까사미아
                    $('.agreement-casa').prop('checked', true);
                    $('.agreement-casa').trigger('change');


                    isValidation = false;
                }
                else {
                    isValidation = false;
                }
                $("#hidsamsungFlg").val("Y");
                $("#hidlgFlg").val("Y"); //엘지전자 추가
            }
        }


        Information.isRunningSubmit = false;
        if (isValidation == false) {
            if (errorMessage != "") {
                alert(errorMessage);
            }
            event.preventDefault();
            return false;
        }


        return isValidation;
    },


    disableAllElement: function () {
        $(".btn").each(function () {
            $(this).prop("disabled", true);
        });
        $(":input:not(:hidden)").each(function () {
            $(this).prop("disabled", true);
        });
        $("select").each(function () {
            $(this).prop("disabled", true);
        });

        $('.information_wrap').on('click', function (e) {
            e.preventDefault();
            alert("휴대폰 인증후 사용하세요.");
            $("#btnCPCLIENT").trigger('click');
            return false;
        });
    },

    enableAllElement: function () {
        $(".btn").each(function () {
            $(this).prop("disabled", false);
        });
        $(":input:not(:hidden)").each(function () {
            $(this).prop("disabled", false);
        });
        $("select").each(function () {
            $(this).prop("disabled", false);
        });
    }
};

$(document).ready(function () {
    Information.init();
});