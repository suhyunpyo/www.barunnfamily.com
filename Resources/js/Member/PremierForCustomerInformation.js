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
            dateFormat: "yy-mm-dd",
            showOn: "both",
            buttonImage: "/resources/img_inc/icon_calender_premierpaper.png"
        }).datepicker('widget').wrap('<div class="ll-skin-melon"/>');


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

            //$(".LoadingImage").hide();
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

        var isValidation = true;
        var errorMessage = "";

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
            $("#txtZipCode1").focus();
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

        // 20191129 - 추가(필수 사항)
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


        var LGSelectChk = "Y"; //LG부분약관동의여부 

        if (isValidation && ($("#chkChoiceAgreementForLGMembership").is(":checked") == false || $("#chkChoiceAgreementForLGChoicePersonalData").is(":checked") == false)) {
                LGSelectChk = "N";
            
        }
           
        var CasamiaSelectChk = "Y"; //까사미아부분약관동의여부

        if (isValidation && ($("#chkChoiceAgreementForCasamiaMembership").is(":checked") == false || $("#chkChoiceAgreementForCasamiaMembership2").is(":checked") == false ||
            $("#chkChoiceAgreementForCasamiaMembership3").is(":checked") == false || $("#chkChoiceAgreementForCasamiaMembership4").is(":checked") == false)) {
                CasamiaSelectChk = "N";
            
        }

        var AgreementForThirdPartySelectChk = "Y";  //제3자 마케팅 동의


        if (isValidation && ($("#chkChoiceAgreementForThirdPartyShinhan").is(":checked") == false || $("#chkChoiceAgreementForThirdPartyTelecom").is(":checked") == false)) {
            AgreementForThirdPartySelectChk = "N";
        }

		var AgreementForThirdParty = "Y";  //개인정보 처리 위탁 동의

        if (isValidation && $("#chkChoiceAgreementForThirdParty").is(":checked") == false) {
            AgreementForThirdParty = "N";
        }

        if ((LGSelectChk == "N" || CasamiaSelectChk == "N" || AgreementForThirdPartySelectChk == "N" || AgreementForThirdParty == "N") && $("#confirm_chk").val() == "N") {
            //모든 선택약관에서 부분 동의 체크가 하나라도 없을 경우

            var result = confirm("마케팅 수신에 동의하지 않는 경우\n청첩장 관련 할인쿠폰 발급 및 프로모션 참여 등이 제한 될 수 있습니다\n마케팅 수신에 동의하시겠습니까 ? ");

            if (result) {
                //약관 전체 동의 체크 
                $("#checkbox_big1_all").trigger("click");
                
                isValidation = false;
                }
            else {
                isValidation = false;
            }
            $("#confirm_chk").val("Y");
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


(function ($) {
    $.fn.ezMark = function (options) {
        options = options || {};
        var defaultOpt = {
            checkboxCls: options.checkboxCls || 'ez-checkbox', radioCls: options.radioCls || 'ez-radio', checkedCls: options.checkedCls || 'ez-checked', selectedCls: options.selectedCls || 'ez-selected', hideCls: 'ez-hide'
        };
        return this.each(function () {
            var $this = $(this); var wrapTag = $this.attr('type') == 'checkbox' ? '<div class="' + defaultOpt.checkboxCls + '">' : '<div class="' + defaultOpt.radioCls + '">';


            if ($this.attr('type') == 'checkbox') {

                $this.addClass(defaultOpt.hideCls).wrap(wrapTag).change(function () {

                    if ($(this).is(':checked')) {
                      
                        var id = $this.attr('id').toLowerCase()
                        var Lgchkyn = id.indexOf("chkchoiceagreementforlg");
                        if (Lgchkyn > -1) {

                        }


                        //$(this).parent().addClass(defaultOpt.checkedCls);
                    }
                    else {
                        //alert("ff"); console.log("bb:" + $this.attr('id')); $(this).parent().removeClass(defaultOpt.checkedCls);
                    }
                });
                if ($this.is(':checked')) { $this.parent().addClass(defaultOpt.checkedCls); }
            }
            else if ($this.attr('type') == 'radio') {

                $this.addClass(defaultOpt.hideCls).wrap(wrapTag).change(function () {
                    $('input[name="' + $(this).attr('name') + '"]').each(function () {
                        if ($(this).is(':checked')) {
                         //   console.log("ㅋㅋ:" + $(this).parent().html())
                            $(this).parent().addClass(defaultOpt.selectedCls);
                        } else {
                          //  console.log("oo:" + $(this).parent().html())
                           	$(this).parent().removeClass(defaultOpt.selectedCls);
                        }
                    });
                }); if ($this.is(':checked')) {
                //    console.log("pp:" + $(this).parent().html())
                    	$this.parent().addClass(defaultOpt.selectedCls);
                }
            }
        });
    }
})(jQuery);

/*checkbox, radio정의*/
$(function () {
    //기본 ezmark실행
    $('input[type=radio]').ezMark();
    $('input[type=checkbox]').ezMark();
    //전체체크버튼이 아닌 것
    var $not_check_allbutton = $(".check_all_area input:checkbox:not('.check_all')")
    /*all 버튼을 클릭시*/
    $(".check_all").change(function () {
        //alert("1")
        var $check_all_area = $(this).closest(".check_all_area").find("input:checkbox").not('.not-chk');
        var $check_allbutton = $(this).closest(".check_all_area").find("input:checkbox.check_all");
        $check_all_area.prop('checked', $(this).prop("checked"));
        if ($check_allbutton.is(':checked')) {
           // alert("2")
            $check_all_area.parent('.ez-checkbox').addClass('ez-checked');
            if ($('#FooterButtonArea').length > 0) {
                $("html, body").animate({
                    scrollTop: $('#FooterButtonArea').offset().top
                }, 500);
            }


        } else {
           // alert("3")
            $check_all_area.removeAttr('checked');
            $check_all_area.parent('.ez-checkbox').removeClass('ez-checked');
        }
    })
    /*all 버튼외의 버튼이 클릭시*/
    $(".ez-checkbox input:checkbox:not('.check_all')").click(function () {
       
        //제3자 마케팅 활용동의, 이용약관동의클릭, 만14세, 개인정보 수집 동의, 개인정보 처리 위탁,   금융, 통신( LG , 까사미아 제외)
        if ($(this).attr("id") == "chkAgeAgreement" || $(this).attr("id") == "chkEssentialAgreement" || $(this).attr("id") == "chkEssentialAgreementPurpose" ||
            $(this).attr("id") == "chkChoiceAgreementForThirdPartyTelecomALL" || $(this).attr("id") == "chkChoiceAgreementForThirdPartyShinhan" || $(this).attr("id") == "chkChoiceAgreementForThirdPartyTelecom" ||
            $(this).attr("id") == "chkChoiceAgreementForThirdParty") {

            var isChecked = $(this).is(':checked');
            if (isChecked) {
                $(this).parent().addClass("ez-checked");
            } else {
                $(this).parent().removeClass("ez-checked");
            }

            if ($(this).attr("id") == "chkChoiceAgreementForThirdPartyTelecomALL") {
                // 제 3자 마케팅 활용동의에 체크가 되어 있을시 라이프 통신 개인정보처리위탁 모두 체크
                $("#chkChoiceAgreementForThirdPartyShinhan").prop('checked', isChecked); //라이프
                $("#chkChoiceAgreementForThirdPartyTelecom").prop('checked', isChecked);//통신
                $("#chkChoiceAgreementForThirdParty").prop('checked', isChecked); //개인정보처리위탁

                if (isChecked) {
                    $("#chkChoiceAgreementForThirdPartyShinhan").parent().addClass("ez-checked"); //라이프
                    $("#chkChoiceAgreementForThirdPartyTelecom").parent().addClass("ez-checked");//통신
                    $("#chkChoiceAgreementForThirdParty").parent().addClass("ez-checked");//개인정보처리위탁
                } else {
                    $("#chkChoiceAgreementForThirdPartyShinhan").parent().removeClass("ez-checked"); //라이프
                    $("#chkChoiceAgreementForThirdPartyTelecom").parent().removeClass("ez-checked");//통신
                    $("#chkChoiceAgreementForThirdParty").parent().removeClass("ez-checked");//개인정보처리위탁
                }
            } else if ($(this).attr("id") == "chkChoiceAgreementForThirdPartyShinhan" ||
                        $(this).attr("id") == "chkChoiceAgreementForThirdPartyTelecom") {

                //라이프 또는 통신 한쪽만 선택해도 3자 동의로 처리
                var checkThirdParty = $("#chkChoiceAgreementForThirdPartyShinhan").is(':checked') || $("#chkChoiceAgreementForThirdPartyTelecom").is(':checked');
                $("#chkChoiceAgreementForThirdParty").prop('checked', checkThirdParty); //개인정보처리위탁 자동
                $("#chkChoiceAgreementForThirdPartyTelecomALL").prop('checked', checkThirdParty); //3동의

                if (checkThirdParty == true) {
                    $("#chkChoiceAgreementForThirdPartyTelecomALL").parent().addClass("ez-checked");
                    $("#chkChoiceAgreementForThirdParty").parent().addClass("ez-checked");
                } else {
                    $("#chkChoiceAgreementForThirdPartyTelecomALL").parent().removeClass("ez-checked");
                    $("#chkChoiceAgreementForThirdParty").parent().removeClass("ez-checked");
                }
            }
            ALL_Check();
          
        }
        else { // LG , 까사미아 
           
            var b = "";
            
            if ($(this).is(':checked')) {

                $(this).parent().addClass("ez-checked");

                if ($(this).attr("id") == "chkChoiceAgreementForLGMembershipALL") { //LG 전체 클릭

                    b = $("#chkChoiceAgreementForLGMembership").is(':checked');

                    if (b == false) { // LG전자 멤버십 회원 이용약관

                        $("#chkChoiceAgreementForLGMembership").prop('checked', true).parent().addClass("ez-checked");
                    }

                    b = $("#chkChoiceAgreementForLGChoicePersonalData").is(':checked');

                    if (b == false) { //  LG전자 멤버십 개인정보 처리방침

                        $("#chkChoiceAgreementForLGChoicePersonalData").prop('checked', true).parent().addClass("ez-checked");
                    }


                }
                else if ($(this).attr("id") == "chkChoiceAgreementForLGMembership" ||
                    $(this).attr("id") == "chkChoiceAgreementForLGChoicePersonalData")
                {
                    LG_AllChk();
                  
                }
                else if ($(this).attr("id") == "chkChoiceAgreementForCasamiaMembershipALL") { //까사미아 멤버십 전체 이용약관 동의 클릭

                    b = $("#chkChoiceAgreementForCasamiaMembership").is(':checked');
                   
                    if (b == false) { //  까사미아 서비스 이용약관

                        $("#chkChoiceAgreementForCasamiaMembership").prop('checked', true).parent().addClass("ez-checked");
                    }

                    b = $("#chkChoiceAgreementForCasamiaMembership2").is(':checked');
                  
                    if (b == false) { //  까사미아 위치정보서비스 활용동의

                        $("#chkChoiceAgreementForCasamiaMembership2").prop('checked', true).parent().addClass("ez-checked");
                    }

                    b = $("#chkChoiceAgreementForCasamiaMembership3").is(':checked');
                   
                    if (b == false) { //  까사미아 개인정보 처리방침(선택)

                        $("#chkChoiceAgreementForCasamiaMembership3").prop('checked', true).parent().addClass("ez-checked");
                    }

                    b = $("#chkChoiceAgreementForCasamiaMembership4").is(':checked');
                   
                    if (b == false) { //까사미아 영상정보처리기기 운영 관리 방침

                        $("#chkChoiceAgreementForCasamiaMembership4").prop('checked', true).parent().addClass("ez-checked");
                    }

                }

                else if ($(this).attr("id") == "chkChoiceAgreementForCasamiaMembership" ||
                    $(this).attr("id") == "chkChoiceAgreementForCasamiaMembership2" || 
                    $(this).attr("id") == "chkChoiceAgreementForCasamiaMembership3" ||
                    $(this).attr("id") == "chkChoiceAgreementForCasamiaMembership4") { //까사미아 각 약관 클릭
                    // alert($("#chkChoiceAgreementForCasamiaMembership4").is(':checked'))
                    Casamia_AllChk();

                }
            }
            else {

                $(this).parent().removeClass("ez-checked");

            
                if ($(this).attr("id") == "chkChoiceAgreementForLGMembershipALL") { //LG 전체 언체크

                    $("#chkChoiceAgreementForLGMembership").prop('checked', false).parent().removeClass("ez-checked");

                    $("#chkChoiceAgreementForLGChoicePersonalData").prop('checked', false).parent().removeClass("ez-checked");

                }
                else if ($(this).attr("id") == "chkChoiceAgreementForLGMembership" ||
                    $(this).attr("id") == "chkChoiceAgreementForLGChoicePersonalData")
                {
                    LG_AllChk();
                  
                }
                else if ($(this).attr("id") == "chkChoiceAgreementForCasamiaMembershipALL") { //까사미아 멤버십 전체 이용약관 동의 언체크

                        
                    $("#chkChoiceAgreementForCasamiaMembership").prop('checked', false).parent().removeClass("ez-checked");
                       
                    $("#chkChoiceAgreementForCasamiaMembership2").prop('checked', false).parent().removeClass("ez-checked");
                       
                    $("#chkChoiceAgreementForCasamiaMembership3").prop('checked', false).parent().removeClass("ez-checked");
                        
                    $("#chkChoiceAgreementForCasamiaMembership4").prop('checked', false).parent().removeClass("ez-checked");
                        

                }

                else if ($(this).attr("id") == "chkChoiceAgreementForCasamiaMembership" ||
                    $(this).attr("id") == "chkChoiceAgreementForCasamiaMembership2" || 
                    $(this).attr("id") == "chkChoiceAgreementForCasamiaMembership3" ||
                    $(this).attr("id") == "chkChoiceAgreementForCasamiaMembership4") { //까사미아 각 약관 클릭
                    // alert($("#chkChoiceAgreementForCasamiaMembership4").is(':checked'))
                    Casamia_AllChk();

                }

            }

            ALL_Check();
            
        }

    });


    function Casamia_AllChk() {

        //세부 약관들의 전체 클릭여부 체크 해서 
        //모두 체크가 되면 ALL쪽도 체크 
        //아니면 ALL쪽 해제 
        if ($("#chkChoiceAgreementForCasamiaMembership").is(':checked') && $("#chkChoiceAgreementForCasamiaMembership2").is(':checked') &&
            $("#chkChoiceAgreementForCasamiaMembership3").is(':checked') && $("#chkChoiceAgreementForCasamiaMembership4").is(':checked')) {

            $("#chkChoiceAgreementForCasamiaMembershipALL").prop('checked', true).parent().addClass("ez-checked");
            
        }
        else {
            $("#chkChoiceAgreementForCasamiaMembershipALL").prop('checked', false).parent().removeClass("ez-checked");
        }
    }


    function LG_AllChk() {

        //세부 약관들의 전체 클릭여부 체크 해서 
        //모두 체크가 되면 ALL쪽도 체크 
        //아니면 ALL쪽 해제 
       
        if ($("#chkChoiceAgreementForLGMembership").is(':checked') && $("#chkChoiceAgreementForLGChoicePersonalData").is(':checked')) {

            $("#chkChoiceAgreementForLGMembershipALL").prop('checked', true).parent().addClass("ez-checked");

        }
        else {
            $("#chkChoiceAgreementForLGMembershipALL").prop('checked', false).parent().removeClass("ez-checked");
        }
    }

    function ALL_Check() {
        //alert("all 호출")
        if ($("#chkAgeAgreement").is(':checked') && //만 14세 이상
            $("#chkEssentialAgreement").is(':checked') && //이용약관 동의
            $("#chkEssentialAgreementPurpose").is(':checked') && //개인정보 수집 이용 동의
            $("#chkChoiceAgreementForLGMembershipALL").is(':checked') && //LG전자 멤버십 전체 이용 약관 동의
            $("#chkChoiceAgreementForCasamiaMembershipALL").is(':checked') && // 까사미아 멤버십 전체 이용약관 동의
            $("#chkChoiceAgreementForThirdPartyTelecomALL").is(':checked') && // 제3자 마케팅 활용동의
            $("#chkChoiceAgreementForThirdPartyShinhan").is(':checked') && //라이프 
            $("#chkChoiceAgreementForThirdPartyTelecom").is(':checked') && //통신
            $("#chkChoiceAgreementForThirdParty").is(':checked')) { // 개인정보 처리 위탁

            $("#checkbox_big1_all").prop('checked', true).parent().addClass("ez-checked");

        }
        else {
            $("#checkbox_big1_all").prop('checked', false).parent().removeClass("ez-checked");
        }

    }

});

