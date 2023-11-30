<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Site.Master" AutoEventWireup="true" CodeBehind="SignInForTermsAgreement.aspx.cs" Inherits="BarunnIntergrationService.Member.SignInForTermsAgreement" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <style>
        /* 약관동의 페이지만 적용 */
        .cont_a {background-color:#fff;}
        .term_s .term_b .txt_a {background-color:#fff; font-size:12px; height:158px;}
        .term_s .term_b > h2 {font-size: 16px;}
        .term_s .term_b > h2 strong {font-size:1em; color: #2e96ff;}
        .term_s .term_b > h2 span {font-size:1em; color:#777;}
        .term_s .term_b.off:first-child {border:none !important;}
        .term_s .term_b .detail {font-size:1em; color:#333;}
        .term_s .term_b {padding: 5px;}
        .samsung_s {margin:20px 0px;}

        .input_b .ez-checkbox {background-image: url(/resources/img_inc/set_check_new.png);}

        @media screen and (max-width: 850px){
        .term_s .term_b {margin: 0 20px; width: inherit !important;}
        .term_s .term_b .txt_a {clear:both;}
    }
    </style>


    <script type="text/javascript">
        $(document).ready(function () {
            /*
            $("[name=chkChoiceAgreementForThirdParty]").click(function () {
                if ($("[name=chkChoiceAgreementForThirdParty]").is(":checked") == false) {
                    $("[name=chkChoiceAgreementForThirdPartyInsurance1]").prop("checked", false);
                    $("[name=chkChoiceAgreementForThirdPartyInsurance1]").parent().removeClass("ez-checked");
                    $("[name=chkChoiceAgreementForThirdPartyTelecom]").prop("checked", false);
                    $("[name=chkChoiceAgreementForThirdPartyTelecom]").parent().removeClass("ez-checked");
                    //$("[name=chkChoiceAgreementForThirdPartyDrink]").prop("checked", false);
                    //$("[name=chkChoiceAgreementForThirdPartyDrink]").parent().removeClass("ez-checked");

                } else {
                    $("[name=chkChoiceAgreementForThirdPartyInsurance1]").prop("checked", true);
                    $("[name=chkChoiceAgreementForThirdPartyInsurance1]").parent().addClass("ez-checked");
                    $("[name=chkChoiceAgreementForThirdPartyTelecom]").prop("checked", true);
                    $("[name=chkChoiceAgreementForThirdPartyTelecom]").parent().addClass("ez-checked");
                    //$("[name=chkChoiceAgreementForThirdPartyDrink]").prop("checked", true);
                    //$("[name=chkChoiceAgreementForThirdPartyDrink]").parent().addClass("ez-checked");
                }
            })

            $("[name=chkChoiceAgreementForThirdPartyInsurance1]").click(function () {
                if ($("[name=chkChoiceAgreementForThirdPartyInsurance1]").is(":checked") == false) {

                    if ($("[name=chkChoiceAgreementForThirdPartyTelecom]").is(":checked") == true ) {
                        $("[name=chkChoiceAgreementForThirdPartyInsurance1]").prop("checked", false);
                        $("[name=chkChoiceAgreementForThirdPartyInsurance1]").parent().removeClass("ez-checked");
                    } else {
                        $("[name=chkChoiceAgreementForThirdParty]").prop("checked", false);
                        $("[name=chkChoiceAgreementForThirdParty]").parent().removeClass("ez-checked");
                    }

                } else {
                    $("[name=chkChoiceAgreementForThirdParty]").prop("checked", true);
                    $("[name=chkChoiceAgreementForThirdParty]").parent().addClass("ez-checked");
                }
            })

            $("[name=chkChoiceAgreementForThirdPartyTelecom]").click(function () {
                if ($("[name=chkChoiceAgreementForThirdPartyTelecom]").is(":checked") == false) {
                    if ($("[name=chkChoiceAgreementForThirdPartyInsurance1]").is(":checked") == true ) {
                        $("[name=chkChoiceAgreementForThirdPartyTelecom]").prop("checked", false);
                        $("[name=chkChoiceAgreementForThirdPartyTelecom]").parent().removeClass("ez-checked");
                    } else {
                        $("[name=chkChoiceAgreementForThirdParty]").prop("checked", false);
                        $("[name=chkChoiceAgreementForThirdParty]").parent().removeClass("ez-checked");
                    }
                } else {
                    $("[name=chkChoiceAgreementForThirdParty]").prop("checked", true);
                    $("[name=chkChoiceAgreementForThirdParty]").parent().addClass("ez-checked");
                }
            })
            */
            
            $(".thirdparty-parent").on('change', function () {
                var _checked = $(this).prop('checked');
                if (_checked) {
                    $('.thirdparty-child').prop('checked', true);
                    $('.thirdparty-child').parent().addClass("ez-checked");
                } else {
                    $('.thirdparty-child').prop('checked', false);
                    $('.thirdparty-child').parent().removeClass("ez-checked");
                }
            });

            $('.thirdparty-child').on('change', function () {
                var _checked = $(this).prop('checked');
                if (_checked) {
                    $('.thirdparty-parent').prop('checked', true);
                    $('.thirdparty-parent').parent().addClass("ez-checked");
                } else {
                    if ($('.thirdparty-child:checked').length < 1) {
                        $('.thirdparty-parent').prop('checked', false);
                        $('.thirdparty-parent').parent().removeClass("ez-checked");
                    }
                }
            });

            //$("[name=chkChoiceAgreementForThirdPartyDrink]").click(function () {
            //    if ($("[name=chkChoiceAgreementForThirdPartyDrink]").is(":checked") == false) {
            //        if ($("[name=chkChoiceAgreementForThirdPartyInsurance1]").is(":checked") == true || $("[name=chkChoiceAgreementForThirdPartyTelecom]").is(":checked") == true) {
            //            $("[name=chkChoiceAgreementForThirdPartyDrink]").prop("checked", false);
            //            $("[name=chkChoiceAgreementForThirdPartyDrink]").parent().removeClass("ez-checked");
            //        } else {
            //            $("[name=chkChoiceAgreementForThirdParty]").prop("checked", false);
            //            $("[name=chkChoiceAgreementForThirdParty]").parent().removeClass("ez-checked");
            //        }
            //    } else {
            //        $("[name=chkChoiceAgreementForThirdParty]").prop("checked", true);
            //        $("[name=chkChoiceAgreementForThirdParty]").parent().addClass("ez-checked");
            //    }
            //})


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
            /*
            $("[name=chkChoiceAgreementForSamSungMembershipAll]").click(function () {
                
                var isChecked = $(this).is(":checked");

                if (isChecked) {
                    $("[name=chkChoiceAgreementForSamSungMembership]:not(:checked)").prop("checked", isChecked).parent().addClass("ez-checked");
                    $("[name=chkChoiceAgreementForSamSungPersonalData]:not(:checked)").prop("checked", isChecked).parent().addClass("ez-checked");
                    $("[name=chkChoiceAgreementForSamSungChoicePersonalData]:not(:checked)").prop("checked", isChecked).parent().addClass("ez-checked");
                    $("[name=chkChoiceAgreementForSamSungThirdParty]:not(:checked)").prop("checked", isChecked).parent().addClass("ez-checked");
                } else {
                    $("[name=chkChoiceAgreementForSamSungMembership]:checked").prop("checked", isChecked).parent().removeClass("ez-checked");
                    $("[name=chkChoiceAgreementForSamSungPersonalData]:checked").prop("checked", isChecked).parent().removeClass("ez-checked");
                    $("[name=chkChoiceAgreementForSamSungChoicePersonalData]:checked").prop("checked", isChecked).parent().removeClass("ez-checked");
                    $("[name=chkChoiceAgreementForSamSungThirdParty]:checked").prop("checked", isChecked).parent().removeClass("ez-checked");
                }

            })

            $("[name=chkChoiceAgreementForSamSungMembership], [name=chkChoiceAgreementForSamSungPersonalData], [name=chkChoiceAgreementForSamSungChoicePersonalData], [name=chkChoiceAgreementForSamSungThirdParty]").click(function () {

                var isChecked = $(this).is(":checked");

                if (isChecked) {
                    $("[name=chkChoiceAgreementForSamSungMembership]:not(:checked)").prop("checked", isChecked).parent().addClass("ez-checked");
                    $("[name=chkChoiceAgreementForSamSungPersonalData]:not(:checked)").prop("checked", isChecked).parent().addClass("ez-checked");
                    $("[name=chkChoiceAgreementForSamSungChoicePersonalData]:not(:checked)").prop("checked", isChecked).parent().addClass("ez-checked");
                    $("[name=chkChoiceAgreementForSamSungThirdParty]:not(:checked)").prop("checked", isChecked).parent().addClass("ez-checked");
                    $("[name=chkChoiceAgreementForSamSungMembershipAll]:not(:checked)").prop("checked", isChecked).parent().addClass("ez-checked");
                } else {
                    $("[name=chkChoiceAgreementForSamSungMembership]:checked").prop("checked", isChecked).parent().removeClass("ez-checked");
                    $("[name=chkChoiceAgreementForSamSungPersonalData]:checked").prop("checked", isChecked).parent().removeClass("ez-checked");
                    $("[name=chkChoiceAgreementForSamSungChoicePersonalData]:checked").prop("checked", isChecked).parent().removeClass("ez-checked");
                    $("[name=chkChoiceAgreementForSamSungThirdParty]:checked").prop("checked", isChecked).parent().removeClass("ez-checked");
                    $("[name=chkChoiceAgreementForSamSungMembershipAll]:checked").prop("checked", isChecked).parent().removeClass("ez-checked");
                }

            })
            */
            $("[name=chkChoiceAgreementForLGMembershipALL]").click(function () {
                
                var isChecked = $(this).is(":checked");

                if (isChecked) {
                    $("[name=chkChoiceAgreementForLGMembershipALL]:not(:checked)").prop("checked", isChecked).parent().addClass("ez-checked");
                    $("[name=chkChoiceAgreementForLGMembership]:not(:checked)").prop("checked", isChecked).parent().addClass("ez-checked");
                    $("[name=chkChoiceAgreementForLGChoicePersonalData]:not(:checked)").prop("checked", isChecked).parent().addClass("ez-checked");
                } else {
                    $("[name=chkChoiceAgreementForLGMembershipALL]:checked").prop("checked", isChecked).parent().removeClass("ez-checked");
                    $("[name=chkChoiceAgreementForLGMembership]:checked").prop("checked", isChecked).parent().removeClass("ez-checked");
                    $("[name=chkChoiceAgreementForLGChoicePersonalData]:checked").prop("checked", isChecked).parent().removeClass("ez-checked");
                }

            })

            $("[name=chkChoiceAgreementForLGMembership], [name=chkChoiceAgreementForLGChoicePersonalData]").click(function () {

                var isChecked = $(this).is(":checked");

                if (isChecked) {
                    $("[name=chkChoiceAgreementForLGMembership]:not(:checked)").prop("checked", isChecked).parent().addClass("ez-checked");
                    $("[name=chkChoiceAgreementForLGChoicePersonalData]:not(:checked)").prop("checked", isChecked).parent().addClass("ez-checked");
                    $("[name=chkChoiceAgreementForLGMembershipALL]:not(:checked)").prop("checked", isChecked).parent().addClass("ez-checked");
                } else {
                    $("[name=chkChoiceAgreementForLGMembership]:checked").prop("checked", isChecked).parent().removeClass("ez-checked");
                    $("[name=chkChoiceAgreementForLGChoicePersonalData]:checked").prop("checked", isChecked).parent().removeClass("ez-checked");
                    $("[name=chkChoiceAgreementForLGMembershipALL]:checked").prop("checked", isChecked).parent().removeClass("ez-checked");
                }

            })



            $("[name=chkChoiceAgreementForMyomeeMembership], [name=chkChoiceAgreementForMyomeeMarketing]").click(function () {

                var isChecked = $(this).is(":checked");

                if (isChecked) {
                    $("[name=chkChoiceAgreementForMyomeeMembership]:not(:checked)").prop("checked", isChecked).parent().addClass("ez-checked");
                    $("[name=chkChoiceAgreementForMyomeeMarketing]:not(:checked)").prop("checked", isChecked).parent().addClass("ez-checked");
                } else {
                    $("[name=chkChoiceAgreementForMyomeeMembership]:checked").prop("checked", isChecked).parent().removeClass("ez-checked");
                    $("[name=chkChoiceAgreementForMyomeeMarketing]:checked").prop("checked", isChecked).parent().removeClass("ez-checked");
                }

            })


                    //까사미아
            $('.agreement-casa').on('click', function () {
                $('.agreement-casa').prop('checked', $(this).prop('checked'));
                $('.agreement-casa').trigger('change');
            });

            // KT
            $('.agreement-kt').on('click', function () {
                $('.agreement-kt').prop('checked', $(this).prop('checked'));
                $('.agreement-kt').trigger('change');
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

        $('.agreement-thirdparty').on('click', function () {
            $(".thirdparty-parent").click(); // 제3자 체크 

            $('.agreement-thirdparty').prop('checked', $(this).prop('checked'));
            $('.agreement-thirdparty').trigger('change');
        });


            //$(".ThirdParty").click(function () {
                
            //    if ($(".ThirdParty:not(:checked)").length == $(".ThirdParty").length) {
            //        $("[name=chkChoiceAgreementForThirdParty]").prop("checked", false);
            //        $("[name=chkChoiceAgreementForThirdParty]").parent().removeClass("ez-checked");
            //    }

            //    if ($(".ThirdParty:checked").length > 0) {
            //        $("[name=chkChoiceAgreementForThirdParty]").prop("checked", true);
            //        $("[name=chkChoiceAgreementForThirdParty]").parent().addClass("ez-checked");
            //    }

            //    if ($(this).hasClass("Insurance")) {
            //        var isChecked = $(this).is(":checked");
            //        $(".Insurance").prop("checked", isChecked);

            //        if (isChecked) {
            //            $(".Insurance").parent().addClass("ez-checked");
            //        } else {
            //            $(".Insurance").parent().removeClass("ez-checked");
            //        }
            //    }

            //})

            $(".btnNextStep").click(function () {

                // 20191129 - 추가
                if ($("#chkAgeAgreement").is(":checked") == false) {
                    alert("만14세 이상 고객 가입에 동의하여 주십시오.");
                    $("[name=chkAgeAgreement]").focus();
                    return false;
                }

                if ($("[name=chkEssentialAgreement]").is(":checked") == false) {
                    alert("회원이용약관에 동의하여 주십시오.");
                    $("[name=chkEssentialAgreement]").focus();
                    return false;
                }

                if ($("[name=chkEssentialAgreementPurpose]").is(":checked") == false) {
                    alert("개인정보 수집이용에 동의하여 주십시오.");
                    $("[name=chkEssentialAgreementPurpose]").focus();
                    return false;
                }

                if ( ($("[name=chkChoiceAgreementForSamSungMembership]").is(":checked") == true)
                    || ($("[name=chkChoiceAgreementForSamSungPersonalData]").is(":checked") == true)
                    || ($("[name=chkChoiceAgreementForSamSungChoicePersonalData]").is(":checked") == true)
                    || ($("[name=chkChoiceAgreementForSamSungThirdParty]").is(":checked") == true) ) {

                    if ($("[name=chkChoiceAgreementForSamSungMembership]").is(":checked") == false) {
                        alert("삼성전자 멤버십 회원 이용 약관에 동의하여 주십시오.");
                        $("[name=chkChoiceAgreementForSamSungMembership]").focus();
                        return false;
                    }

                    if ($("[name=chkChoiceAgreementForSamSungPersonalData]").is(":checked") == false) {
                        alert("삼성전자 개인정보 수집 이용 동의하여 주십시오.");
                        $("[name=chkChoiceAgreementForSamSungPersonalData]").focus();
                        return false;
                    }

                    if ($("[name=chkChoiceAgreementForSamSungChoicePersonalData]").is(":checked") == false) {
                        alert("삼성전자 선택적인 개인정보 수집 이용 동의하여 주십시오.");
                        $("[name=chkChoiceAgreementForSamSungChoicePersonalData]").focus();
                        return false;
                    }

                    if ($("[name=chkChoiceAgreementForSamSungThirdParty]").is(":checked") == false) {
                        alert("삼성전자 개인정보 제3자 제공 동의하여 주십시오.");
                        $("[name=chkChoiceAgreementForSamSungThirdParty]").focus();
                        return false;
                    }
                }

                if (($("[name=chkChoiceAgreementForLGMembership]").is(":checked") == true)
                    || ($("[name=chkChoiceAgreementForLGChoicePersonalData]").is(":checked") == true)) {


                    if ($("[name=chkChoiceAgreementForLGMembership]").is(":checked") == false) {
                        alert("LG전자 멤버십 회원 이용 약관에 동의하여 주십시오.");
                        $("[name=chkChoiceAgreementForLGMembership]").focus();
                        return false;
                    }

                    if ($("[name=chkChoiceAgreementForLGChoicePersonalData]").is(":checked") == false) {
                        alert("LG전자 개인정보 수집 이용 동의하여 주십시오.");
                        $("[name=chkChoiceAgreementForLGChoicePersonalData]").focus();
                        return false;
                    }

                }

                //$("#sMembershipPeriod").val($('input:checkbox[id="chkChoiceAgreementForSamSungChoic"]').val());

                $("#MainForm").submit();

            })

            $('.term_s .term_b a.detail').click(function () {
                var $selectBox = $(this).closest('.term_b').find('.txt_a');
                $selectBox.slideToggle(200);
            });


        })
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Literal ID="ltrHiddenField" runat="server"></asp:Literal>

    <!-- Step -->
	<div class="step_a">
		<div class="step_a_in">
			<div class="tit"><img src="/resources/member/tit_barunnone_join.png" alt="바른 ONE 회원가입"></div>
			<ul>
				<li><img src="/resources/member/img_step1.png" alt="Step1 본인인증"></li>
				<li class="on"><img src="/resources/member/img_step2.png" alt="Step2 약관동의"></li>
				<li><img src="/resources/member/img_step3.png" alt="Step3 정보입력"></li>
				<li><img src="/resources/member/img_step4.png" alt="Step4 가입완료"></li>
			</ul>
		</div>
	</div>
	<!-- Step -->	
	<!-- contents -->
	<div class="cont_a">
		<div class="cont_a_in check_all_area">
			<div class="agreeall_a clearfix">
				<div class="input_b size_big type1"><input type="checkbox" name="checkbox_big1" class="check_all" id="checkbox_big1_all"><label for="checkbox_big1_all"><strong>모든 약관을 확인하고 전체 동의합니다.</strong></label></div>
				<div class="b_btn_a"><a href="javascript:;" class="b_btn type2 right btnNextStep" id="btnNextStep1"><span>정보입력하기</span></a></div>
			</div>

			<!-- 바른손 동의 -->
			<div class="term_s barun_s">

                <!-- 만 14세 이상 가입동의 -->
				<div class="term_b" style="width:100%;">
    			    <h2><div class="input_b size_sm type1"><div class="ez-checkbox"><input type="checkbox" name="chkAgeAgreement" id="chkAgeAgreement" value="Y" class="ez-hide"></div><label for="chkAgeAgreement" runat="server">가입은 만 14세 이상 고객만 가능합니다. <span>(필수)</span></label></div></h2>
                </div>

                <div class="info_barun" style="display: none;">
					<!-- 약관내용 -->
					<ul id="wrapNewMember" runat="server">
						<li>㈜바른컴퍼니는 개인정보관련 관계법령을 준수하고 있습니다.</li>
						<li>㈜바른컴퍼니와 삼성전자 공동 멤버십 약관에 모두 동의하시면, ㈜바른컴퍼니 회원 분들만을 위해 삼성전자에서 제공하는 혼수 구매시 특별할인 및 사은품 등 다양한 혜택이 독점 제공됩니다.</li>
						<li>※ 삼성전자 공동 멤버십에 가입하지 않아도 ㈜바른컴퍼니의 회원가입이 가능합니다.</li>													
					</ul>

                    <ul id="wrapExistingMember" runat="server">
                        <li>㈜바른컴퍼니(이하 회사)가 제공하는 바른 ONE 서비스는 하나의 아이디로 고객의 모든 사용 정보를 통합하여 바른컴퍼니의 패밀리 사이트에 별도의 회원 가입 없이 로그인과 이용이 가능합니다</li>
                    </ul>

					<!-- / 약관내용 -->
				</div>

				<div class="term_b">
					<h2><div class="input_b size_sm type1"><input type="checkbox" name="chkEssentialAgreement" id="chkEssentialAgreement" value="Y"><label for="chkEssentialAgreement">이용약관 동의 <span>(필수)</span></label></div></h2>
					<!-- 약관box -->
					<div class="txt_a">
						<!-- policy영역 -->
						<div class="policy_a">
							<h3>[총칙]</h3>
							<div>
								<p>개인정보란 생존하는 개인에 관한 정보로서 당해 정보에 포함되어 있는 성명, 생년월일 등의 사항에 의하여 당해 개인을 식별할 수 있는 정보(당해 정보만으로는 특정 개인을 식별할 수 없더라도 다른 정보와 용이하게 결합하여 식별할 수 있는 것을 포함합니다)를 말합니다.</p>
								<p>㈜바른컴퍼니(이하 회사)가 제공하는 바른 ONE 서비스는 귀하의 개인정보보호를 매우 중요시하며, 『정보통신망 이용촉진 및 정보보호에관한법률』 상의 개인정보보호규정 및 정보통신부가 제정한 『개인정보보호지침』을 준수하고 있습니다. 회사는 개인정보보호정책을 통하여 귀하께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.</p>
								<p>회사는 개인정보보호정책을 홈페이지 첫 화면에 공개함으로써 귀하께서 언제나 용이하게 열람하실 수 있도록 조치하고 있습니다.</p>
								<p>회사는 개인정보보호정책의 지속적인 개선을 위하여 개인정보보호정책을 개정하는데 필요한 절차를 정하고 있습니다. 그리고 개인정보보호정책을 개정하는 경우 버전번호 등을 부여하여 개정된 사항을 귀하께서 쉽게 알아볼 수 있도록 하고 있습니다.</p>
							</div>
							<h3>[개인정보의 수집범위]</h3>
							<div>
								<p>바른 컴퍼니의 패밀리 사이트 이용자는 별도의 회원가입 절차 없이 대부분의 컨텐츠에 자유롭게 접근할 수 있습니다. </p>
								<p>바른 ONE  서비스에 가입하시고자 할 경우 다음의 정보를 입력해주셔야 하며 선택항목을 입력하지 않는 경우에도 서비스 이용에 제한은 없습니다.</p>
								<ul class="type_-">
									<li>- 회원 가입 시 수집하는 개인정보의 범위</li>
									<li>- 필수항목 : 가입자 이름, 생년월일, 아이디, 비밀번호, 주소, 휴대폰번호, 유선 전화번호, 이메일, 예식일자, 예식장</li>
									<li>- 선택항목 : 신랑이름, 신부이름, 양가부모이름, 인사말 등 청첩장 제작 시 기입정보 (답례품 제작을 위해 업체에서 요구하는 추가 정보, 비웨딩 고객은 모바일초대장 제작시 기입해야 하는 정보)</li>
								</ul>
							</div>
							
							<h3>[개인정보 수집에 대한 동의]</h3>
							<div><p>회사는 귀하께서 바른 ONE  서비스의 개인정보보호방침 또는 이용약관의 내용에 대해 「동의함」버튼 또는 「동의안함」버튼을 클릭할 수 있는 절차를 마련하여, 「동의함」버튼을 클릭하면 개인정보 수집에 동의한 것으로 간주합니다.</p></div>
							
							<h3>[상품의 제작 환불]</h3>
							<div>
								<ul class="type_num">
									<li>1. 환불 또는 재제작
										<ul class="type_abc">
											<li>A. 고객 검수완료 후, 인쇄가 잘못된 경우 카드의 불량, 잉크번짐, 글자누락, 오타인 경우 환불 또는 다시 제작해 드립니다</li>
											<li>B. 첩장이나 구매 상품이 파손된 경우 환불 또는 다시 제작해드립니다.</li>
											<li>C. 청첩장 및 봉투, 커스텀 제품의 수량이 부족한 경우 다시 제작해드립니다.</li>
											<li>D. 답례품의 수량이 주문보다 부족한 경우 필요한 수량만큼 추가 발송해 드립니다.</li>
											<li>E. 택배를 받지 못한 경우 환불, 재발송 또는 다시 제작해드립니다.</li>
											<li>F. 초안과 인쇄된 카드가 상이한 경우 환불 또는 다시 제작해드립니다.</li>
											<li>G. 주문한 카드와 받으신 카드가 다를 경우,  실 구매한 제품과 수령한 제품이 다를 경우  환불, 재발송 또는 다시 제작해드립니다.</li>
										</ul>
									</li>
									<li>2. 고객의 실비부담
										<ul class="type_abc">
											<li>A. 인쇄 컨펌 후 오타(약도, 인사말문구, 장소, 일시 등)에 의한 문제 발생시</li>
											<li>B. 주문 시 잘못된 정보 제공으로 인한 문제 발생시(주소, 전화번호, 이름 등의 오류)</li>
											<li>C. 물건을 받아 본 후 약도 및 인사말에 대해 고객님의 변심으로 인한 재인쇄 요구 시</li>
											<li>D. 초안확인 및 인쇄 후, 고객의 변심에 의한 경우</li>
										</ul>
									</li>
									<li>3. 기타
										<ul class="type_abc">
											<li>A. 회사의 명백한 과실인 경우 환불 또는 다시 제작해드립니다.</li>
										</ul>
									</li>
									<li>4. 교환/환불 정책
										<p>회사에서 상품이나 용역을 제공받은 고객은 다음과 같은 경우에 한하여 상품을 제공받은 날로부터 7일 이내에 구매취소를 요구할 수 있습니다.</p>
										<ul class="type_abc">
											<li>A. 고객에게 인도될 당시 당해 상품이 훼손된 경우</li>
											<li>B. 배송이나 용역이 약관에 표시된 기간을 초과한 경우 단, 아래와 같은 경우 교환/환불이 불가능합니다.</li>
										</ul>
										<ul class="type_star">
											<li>＊고객의 초안 확인이 끝난 인쇄상품의 인쇄내용의 변동을 원할 시</li>
											<li>＊고객의 단순 변심에 의한 구매 취소 요구 시</li>
											<li>＊고객은 규정에 의하여 상품이나 용역의 구매를 취소할 경우, 이미 제공받은 상품을 반환해야 하며 회사는 이미 지급 받은 상품의 대금을 상품을 반환 받은 날을 기준으로 10일 이내에 환불 송금해야 합니다. 규정에 의한 상품 취소의 경우 그것의 반환에 필요한 일체의 비용은 회사가 부담하는 것을 기본으로 합니다.</li>
											<li>＊환불기준 : 전주 수요일~화요일까지 금요일에 환불처리</li>
										</ul>
									</li>
									<li>5. 할인율 안내
										<ul class="type_abc">
											<li>A. 각 제품별 제품 상세화면 내에 할인율을 기재합니다.</li>
											<li>B. 할인율은 프로모션이나, 이벤트 진행 시 차이가 있을 수 있습니다.</li>
										</ul>
									</li>
									<li>6. 운송비 및 배송정책
										<ul class="type_abc">
											<li>A. 청첩장: 배송은 택배를 원칙으로 하며, 기본 배송료는 무료입니다. 배송지가 두 곳인 경우 혹은 추가 배송지가 있을 시 비용이 발생됩니다. 샘플배송은 무료 및 우편발송을 원칙으로 하며 특정상황에서 비용이 발생할 수 있습니다.</li>
											<li>B. 답례품: 배송은 택배를 원칙으로 하며, 제품에 따라 배송정책에 의거하여 택배비를 추가로 책정할 수 있습니다. </li>
											<li>C. 택배배송 소요일 (영업일 기준 / 공휴일 제외)
												<ul class="type_star">
													<li>* 평균배송기간 : 2~3일 (제주, 도서산간 지역 : 3~5일)</li>
													<li>* 주문폭주 및 일시품절상품의 주문제작, 맞춤상품의 배송과 명절, 폭설, 폭우등의 천재지변에 의한 특별기간에는 배송기간이 다소 지연될 수 있습니다. 인쇄 등 추가 서비스 절차를 요구하는 상품 및 서비스의 경우 1~2일 상품 및 서비스에 따라 추가 소요기간이 발생될 수 있습니다. 추가 소요기간과 비용은 각 상품 및 서비스 상세페이지에 기재합니다.</li>
												</ul>
											</li>
										</ul>
									</li>
								</ul>
							</div>

                            <!--160913 추가-->
                            <h3>[게시물의 관리]</h3>
							<div>
								<ul class="type_num">
									<li>1. 회사는 다음에 해당하는 게시물이나 자료를 사전통지 없이 삭제, 이동, 등록 거부 할 수 있습니다.
										<ul class="type_abc">
											<li>A. 회사, 다른 회원, 제 3자에게 심한 모욕을 주거나 명예를 손상시키는 내용인 경우</li>
											<li>B. 공공질서 및 미풍양속에 위반되는 내용을 유포하거나 링크시키는 경우</li>
											<li>C. 회사에서 규정한 게시물 원칙에 어긋나거나, 게시판 성격에 부합하지 않는 경우</li>
											<li>D. 불법복제 또는 해킹을 조장하는 내용인 경우</li>
											<li>E. 영리를 목적으로 하는 광고일 경우</li>
											<li>F. 범죄와 결부된다고 객관적으로 인정되는 내용일 경우</li>
											<li>G. 다른 이용자 또는 제 3자의 저작권 등 기타 권리를 침해하는 내용인 경우</li>
                                            <li>H. 정보통신망법 및 저작권법 등 기타 관계법령에 위배된다고 판단되는 경우 </li>
										</ul>
									</li>
                                 </ul>
							</div>
                                        
                            <h3>[게시물의 저작권 및 책임]</h3>
							<div>
								<ul class="type_num">
									<li>이용자가 서비스 내에 게시한 게시물의 저작권은 저작권법에 의해 보호를 받습니다. 회사가 작성한 저작물에 대한 저작권 및 기타 지적재산권은 회사에 귀속합니다.</li>
                                    <li>이용자는 자신이 게시한 게시물을 회사가 국내외에서 다음 각 호의 목적으로 사용하는 것을 허락합니다. 
                                    	<ul class="type_abc">
											<li>A. 서비스 내에서 이용자 게시물의 복제, 전송, 전시, 배포 및 우수 게시물을 서비스 화면에 노출하기 위하여 이용자  게시물의 크기를 변화하거나 단순화하는 등의 방식으로 수정하는 것</li>
											<li>B. 회사의 서비스를 홍보하기 위한 목적으로 미디어, 통신사 등에게 이용자의 게시물 내용을 보도, 방영하게 하는 것. 단 이 경우 회사는 회원의 개별 동의 없이 미디어, 통신사 등에게 개인정보를 제공하지 않습니다.</li>
											<li>C. 서비스 내에서 작성한 게시물은 바른컴퍼니의 패밀리 사이트(바른손카드, 비핸즈카드, 더카드, 프리미어페이퍼)에  사용될 수 있습니다.</li>
										</ul>
                                    </li>
                                    <li>회원은 고객센터 또는 1:1문의를 통해 작성한 게시물에 대한 삭제, 검색결과 제외, 비공개 등의 조치를 취할 수 있습니다. <br>단, 베스트 이용후기나 프로모션 당첨 등을 통하여 고객이 회사로부터 이득을 취한 경우, 혜택발생 시점 이후의 게시물 삭제 요청은 회사의 판단에 의하여 보류될 수 있습니다.   </li>
                                    <li>회원이 게시한 게시물에 대하여 정보통신망법 및 저작권법 등 관련법에 위배되거나 문제 발생시, 모든 책임은 게시물을 게시한 회원 본인에게 있습니다.</li>
                                    <li>회원은 서비스를 이용하여 취득한 정보를 임의 가공, 판매하는 행위 등 서비스에 게재된 자료를 상업적으로 사용할 수 없습니다.</li>
                                 </ul>
							</div>
                            <!--/160913 추가-->

							<h3>[고지의 의무]</h3>
							<div>
								<p>현 이용약관은 2013년 02월에 제정되었으며 정부의 정책 또는 보안기술의 변경에 따라 내용의 추가ㆍ삭제 및 수정이 있을 시에는 개정 후 시행 최소 7일 전부터 홈페이지의 '공지'란을 통해 고지할 것입니다.</p>
							</div>
						</div>
						<!-- / policy영역 -->
					</div>
					<!-- / 약관box -->	
				</div>

				<div class="term_b">
					<h2><div class="input_b size_sm type1"><input type="checkbox" name="chkEssentialAgreementPurpose" id="chkEssentialAgreementPurpose" value="Y"><label for="chkEssentialAgreementPurpose">개인정보 수집 이용 동의 <span>(필수)</span></label></div></h2>
					<!-- 약관box -->
					<div class="txt_a">
						<!-- policy영역 -->
						<div class="policy_a">
							<h3>[총칙]</h3>
							<div>
								<ul class="type_num">									
									<li>1. ㈜바른컴퍼니(이하 회사)는 회원 및 비회원 여러분들께 상품 구매 및 기타 다양한 서비스 제공을 목적으로 아래와 같이 개인정보를 수집 및 활용합니다.</li>
									<li>2. 본 수집-이용동의서 상의 용어 정의는 '(주)바른컴퍼니 개인정보처리방침'에서 준용합니다.</li>
								</ul>
							</div>
							<h3>[개인정보 수집에 대한 동의]</h3>
							<div>
								<p>회사는 귀하께서 개인정보처리방침 또는 이용약관의 내용에 대해 「동의함」버튼 또는 「동의안함」버튼을 클릭할 수 있는 절차를 마련하여, 「동의함」버튼을 클릭하면 개인정보 수집에 동의한 것으로 간주합니다.</p>
							</div>
							<h3>[개인정보 수집목적 및 이용목적]</h3>
							<div>
								<ul class="type_num">									
									<li>1. 회사는 다음과 같은 목적을 위하여 아래 항목의 개인정보를 수집하고 있습니다.
										<ul class="type_abc">
											<li>A. 성명, 아이디, 비밀번호: 회원제 서비스 이용에 따른 본인 식별 절차에 이용</li>
											<li>B. 이메일주소, 전화번호(일반 및 휴대전화): 고지사항 전달, 본인 의사 확인, 불만 처리 등 원활한 의사소통 경로의 확보, 새로운 서비스/신상품이나 이벤트 정보의 안내</li>
											<li>C. 은행계좌정보 및 신용카드정보(입력): 구매대금 결제</li>
											<li>D. 주소, 전화번호: 상품배송, 청구서, 경품과 쇼핑 물품배송에 대한 정확한 배송지확보</li>
											<li>E. 생년월일, 주소: 인구통계학적 분석 자료(이용장의 연령별, 성별, 지역별 통계분석)</li>
											<li>F. IP Address, 방문 일시, 서비스 이용기록(자동으로 생성되는 개인정보) : 부정이용방지, 비인가 사용방지, 분쟁조정 해결을 위한 기록보존 등</li>
											<li>G. 그 외 선택항목: 개인맞춤 서비스를 제공하기 위한 자료</br>
											단, 이용자의 기본적 인권 침해의 우려가 있는 민감한 개인정보(인종 및 민족, 사상 및 신조, 출신지 및 본적지, 정치적 성향 및 범죄기록, 건강상태 및 성생활 등)는 수집하지 않습니다.</li>
										</ul>
									</li>
								</ul>
							</div>
							<h3>[개인정보의 수집항목]</h3>
							<div>
								<p>바른 컴퍼니의 패밀리 사이트 이용자는 별도의 회원가입 절차 없이 대부분의 컨텐츠에 자유롭게 접근할 수 있습니다. 회사의 회원제 서비스를 이용하시고자 할 경우 다음의 정보를 입력해주셔야 하며 선택항목을 입력하시지 않았다 하여 서비스 이용에 제한은 없습니다.</p>
								<ul class="type_num">									
									<li>1.회원 가입 시 수집하는 개인정보의 범위
										<ul class="type_abc">
											<li>A. 필수항목 : 가입자 이름, 생년월일, 아이디, 비밀번호, 주소, 휴대폰번호, 유선 전화번호, 이메일, 예식일자, 예식장</li>
											<li>B. 선택항목 : 신랑이름, 신부이름, 양가부모이름, 인사말 등 청첩장 제작 시 기입정보</br>
											(답례품 제작을 위해 업체에서 요구하는 추가 정보, 비웨딩 고객은 모바일초대장 제작시 기입해야 하는 정보)
											</li>
										</ul>									
									</li>
								</ul>
							</div>
							<h3>[개인정보 수집방법]</h3>
							<div>
								<ul class="type_num">									
									<li>1. 상기 항목에 명시된 개인정보 항목은 전적으로 회사의 서비스를 이용하고자 하는 고객에 의한 작성을 통해 수집 됩니다.</li>
									<li>2. 사이트 회원가입 절차, 상담절차, 이벤트나 경품 행사, 영업업무 위탁사 또는 제휴사 등으로부터의 수집, 이동 전화 및 유-무선 인터넷 서비스 사용시 생성정보 수집 툴을 통한 방법(쿠키) 등으로 개인 정보를 수집합니다.</li>
								</ul>
							</div>
							<h3>[개인정보 보유 및 이용기간]</h3>
							<div>
								<ul class="type_num">									
									<li>1. 귀하의 개인정보는 다음과 같이 개인정보의 수집목적 또는 제공받은 목적이 달성되면 파기됩니다. 단, 상법 등 관련법령의 규정에 의하여 다음과 같이 거래 관련 권리 의무 관계의 확인 등을 이유로 일정기간 보유하여야 할 필요가 있을 경우에는 일정기간 보유합니다. </li>
									<li>2. 회원가입정보의 경우, 회원을 탈퇴하거나 회원에서 제명된 경우 등 사전 보유목적, 기간 및 보유하는 개인정보 항목을 명시하여 동의를 구합니다.
										<ul class="type_abc">
											<li>A. 계약 또는 청약철회 등에 관한 기록: 5년</li>
											<li>B. 대금결제 및 재화 등의 공급에 관한 기록: 5년</li>
											<li>C. 소비자의 불만 또는 분쟁처리에 관한 기록: 3년</li>
										</ul>
									</li>
									<li>3. 귀하의 동의를 받아 보유하고 있는 거래정보 등을 귀하가 열람을 요구하는 경우 회사는 귀하의 정보를 열람ㆍ확인 할 수 있도록 조치합니다.</li>
								</ul>
							</div>
						</div>
						<!-- / policy영역 -->
					</div>
					<!-- / 약관box -->
				</div>
                <!-- / 개인정보 수집 이용 동의 -->

        	
            <!-- 삼성전자 동의 -->
			<div class="term_s samsung_s" id="wrapSamsungAgreement" runat="server">
            
                <!-- 삼성전자 동의 -->
                <div class="term_b">
                    <h2><div class="input_b size_sm type1"><input type="checkbox" name="chkChoiceAgreementForSamSungMembershipAll" id="chkChoiceAgreementForSamSungMembershipAll" value="Y" class="agreement-samsung_main"><label for="chkChoiceAgreementForSamSungMembershipAll">삼성전자 멤버십 전체 이용 약관 동의 <span>(선택)</span></label></div></h2>
					<!-- 약관box -->
					<div class="txt_a">
                        <!-- 삼성전자 멤버십 회원 이용 약관 -->
                        <div class="term_b" style="float:left; width:100%;">
                            <h2><div class="input_b size_sm type1"><input type="checkbox" name="chkChoiceAgreementForSamSungMembership" id="chkChoiceAgreementForSamSungMembership" value="Y" class="agreement-samsung"><label for="chkChoiceAgreementForSamSungMembership">삼성전자 멤버십 회원 이용약관 <span>(선택)</span></label></div></h2>
                            <!-- 약관box -->
                            <div class="txt_a_new" style="width: 94%; border:1px solid #f9f9f8; ">
                                <!-- policy영역 -->
                                <div class="policy_a">
                                        <h3 style="padding: 14px 0px 0px 0;	">제1장 총칙</h3>
                                        <h3 style="padding: 7px 0 7px 0;">제1조 (목적)</h3>
                                        본 약관은 삼성전자 멤버십을 이용함에 있어 삼성전자 멤버십 회원과 삼성전자 주식회사(이하 "삼성전자"라 합니다)의 제반 권리, 의무 및 관련절차 등을 규정하는데 그 목적이 있습니다.
                                        <h3>제2조 (정의)</h3>
                                        <ol>
                                            <li>"삼성전자 멤버십"(이하 "멤버십"이라 합니다)이란, 삼성전자 멤버십 회원을 위해 삼성전자가 제공하는 서비스입니다.</li>
                                            <li>"삼성전자 멤버십 회원"(이하 "회원"이라 합니다)이라 함은 회원가입 절차를 통하여 정상적으로 회원고유번호를 발급받고, 멤버십 서비스를 이용할 수 있는 고객을 말합니다.</li>
                                            <li>"멤버십 서비스"란 삼성전자, 삼성전자 멤버십 지정매장, 제휴사 및 제휴가맹점이 별도로 정한 기준 및 조건에 따라 제공하는 고객 혜택을 의미합니다. 구체적인 내용은 본 약관 제4장에서 규정합니다.</li>
                                            <li>"삼성전자 멤버십 홈페이지"(이하 "홈페이지"라 합니다)란, 삼성전자가 회원에게 효율적인 멤버십 서비스 및 멤버십 관련 정보 제공 등을 위하여 운영하는 인터넷 사이트를 말하며, 이에 관한 구체적인 내용은 본 약관 제7장에서 규정합니다.</li>
                                            <li>"제휴사 및 제휴가맹점"이란 삼성전자와 계약을 체결하여 고객에게 멤버십 가입, 제휴 멤버십카드 발급, 삼성전자 포인트 적립 및 사용 등의 서비스를 제공하는 자를 말합니다.</li>
                                            <li>"삼성전자 멤버십 지정매장"(이하 "지정매장")이란 삼성전자 제품 및 서비스를 판매하는 매장 중 삼성전자가 지정하는 매장으로서 고객이 멤버십 가입, 멤버십카드 발급, 삼성전자 포인트 적립 및 사용 등을 할 수 있는 곳을 말합니다. 지정매장은 홈페이지를 통해 확인하실 수 있으며, 사정에 따라 일부 매장이 제외, 추가 및 변경될 수 있습니다.</li>
                                            <li>지정매장, 제휴사 및 제휴가맹점은 각 매장 및 사업장의 환경 및 정책, 특성에 따라 멤버십의 운영 방식과 서비스의 범위에 차이가 있을 수 있습니다. 또한 일부 지정매장과 제휴사 및 제휴가맹점에서는 멤버십 가입, 멤버십카드 발급, 삼성전자 포인트 적립 및 사용에 제한이 있을 수 있습니다. </li>
                                            <li>"삼성전자 포인트"란 회원에게 삼성전자, 제휴사 및 제휴가맹점이 별도로 정한 기준 및 조건에 따라 적립되고, 삼성전자, 지정매장, 제휴사 및 제휴가맹점에서 사용할 수 있는 서비스 상의 가상 데이터를 의미합니다. 삼성전자 포인트는 전자금융거래법의 선불전자지급수단으로서 이에 관한 구체적인 내용은 본 약관 제5장에서 규정합니다.</li>
                                        </ol>
                                        <h3>제3조 (약관 개정)</h3>
                                        <ol>
                                            <li>본 약관은 관계 법령이 정하는 바에 따라 수시로 개정될 수 있으며, 약관을 개정하고자 할 경우 삼성전자는 개정된 약관을 적용하고자 하는 날(이하 "효력 발생일")로부터 1개월 이전에 약관이 개정된다는 사실과 개정된 내용, 개정 사유 등을 홈페이지에 게시하고, 다음 각 호에서 규정한 제1호에서 제6호 중 1가지 이상의 방법으로 회원에게 고지하여 드립니다. 이 경우 개정 전 내용과 개정 후 내용을 명확하게 비교하여 회원이 알기 쉽도록 표시합니다. 만약, 법령의 개정으로 인하여 긴급하게 약관을 변경하는 경우에는 효력 발생일 직전에 고지하여 드리고, 변경된 약관을 홈페이지에 1개월 이상 게시합니다.
                                                <ol>
                                                    <li>전자우편(E-MAIL)</li>
                                                    <li>서면</li>
                                                    <li>SMS, LMS 등 휴대전화 메시지</li>
                                                    <li>전화</li>
                                                    <li>홈페이지 또는 어플리케이션 내 게시</li>
                                                    <li>제휴사 및 제휴가맹점 내 게시</li>
                                                </ol>
                                            </li>
                                            <li>삼성전자가 E-MAIL 또는 서면을 통해 본 약관이 개정된 사실 및 개정된 내용을 회원에게 고지하는 경우에는 회원이 삼성전자에 제공한 E-MAIL address나 주소지 중 가장 최근에 제공된 E-MAIL address나 주소지로 통보합니다. </li>
                                            <li>본 조의 규정에 의하여 개정된 약관(이하 "개정약관" 이라 한다)은 원칙적으로 그 효력 발생일로부터 유효합니다. 본 약관의 개정과 관련하여 이의가 있는 회원은 회원탈퇴를 할 수 있습니다. 단, 이의가 있음에도 불구하고 회원이 당사의 고지가 있은 후 효력 발생일까지 아무런 이의를 제기하지 않았을 경우에는 개정된 약관을 승인한 것으로 간주합니다.</li>
                                        </ol>
                                        <h3>제2장 회원가입 및 탈회</h3>
                                        <h3>제4조 (회원자격 및 가입)</h3>
                                        <ol>
                                            <li>회원으로 가입하기 위해서는 삼성전자, 지정매장, 제휴사 및 제휴가맹점이 제시한 방식을 통해 본인인증기관으로부터의 인증결과값(CI:Connecting Information)의 확인이 가능한 개인고객이어야 합니다. 만 14세 미만의 고객이 회원이 되기 위해서는 법정대리인(부모 등)의 동의가 필요하며, 이 경우 법률에 의거 또는 제휴사의 정책에 따라 법정대리인의 동의 여부와 관계없이 가입을 제한하거나 일부 서비스 제공이 불가능 할 수 있습니다. 삼성전자, 지정매장, 제휴사 및 제휴가맹점의 특성에 따라 법정대리인의 동의 확인이 불가능하다고 판단되면, 만 14세 미만 고객의 가입신청이 거부될 수 있습니다.</li>
                                            <li>멤버십 가입 신청은 삼성전자, 지정매장, 제휴사 및 제휴가맹점에서 가능합니다. 회원으로 가입하고자 하는 고객은 삼성전자, 지정매장, 제휴사 및 제휴가맹점이 정한 절차에 따라 신청자의 필수 정보를 기입한 후, 본 약관 및 별도의 '개인정보 수집ㆍ이용 동의서' 및 '개인정보 제3자 제공 동의서'에 동의한다는 의사표시를 함으로써 회원 가입신청을 할 수 있습니다.</li>
                                            <li>멤버십 가입 신청이 가능한 지정매장, 제휴사 및 제휴가맹점은 삼성전자와 지정매장, 제휴사 및 제휴가맹점의 상호 협의에 따라 변경될 수 있으며, 일부 지정매장, 제휴사 및 제휴가맹점에서는 회원가입이 제한 될 수 있습니다. 멤버십 가입 신청에 관한 구체적인 내용은 홈페이지에서 확인할 수 있습니다. </li>
                                            <li>제2항의 회원 가입신청이 있더라도 삼성전자는 다음 각 호의 사유가 있는 경우에는 회원 가입을 승낙하지 않습니다.
                                                <ol>
                                                    <li>회원가입신청자의 CI로 이미 회원가입이 되어 있는 경우</li>
                                                    <li>회원가입신청자의 필수 정보사항 및 각종 동의서 상에 허위 기재, 중요 정보의 누락, 식별 불가, 또는 오기가 있는 경우</li>
                                                    <li>회원가입신청자가 동 약관 5조 2항에 의하여 이전에 회원의 자격을 상실한 적이 있는 경우. 단, 삼성전자가 재가입을 허용하는 경우는 예외로 합니다. </li>
                                                </ol>
                                            </li>
                                            <li>회원은 회원자격을 타인에게 양도하거나 대여 또는 담보의 목적으로 이용할 수 없습니다.</li>
                                        </ol>
                                        <h3>제5조 (회원탈회 및 정지ㆍ상실)</h3>
                                        <ol>
                                            <li>회원은 콜센터(1588-3366)와의 통화 및 홈페이지, 기타 삼성전자가 정하는 방법으로 회원 탈회를 요청할 수 있으며, 삼성전자는 회원의 요청에 따라 조속히 회원탈회에 필요한 제반 절차를 수행합니다.</li>
                                            <li>회원이 다음 각 호의 사유에 해당하는 경우, 삼성전자는 즉시 해당 회원에게 부여된 회원의 지위 및 멤버십 서비스를 정지 또는 상실시킬 수 있으며, 이 경우 삼성전자는 회원의 지위 및 멤버십 서비스가 정지 또는 상실되었음을 정지ㆍ상실일로부터 1개월 이내에 서면, 전화, 전자우편(E-MAIL), SMS 등의 방법 중 1가지 이상을 통하여 회원에게 알려 드립니다. 또한 아래 사유 발생에 따라 회원자격 정지ㆍ상실된 회원은 향후 멤버십 가입이 제한될 수 있습니다. 제한 기간은 삼성전자가 별도로 정합니다.
                                                <ol>
                                                    <li>회원가입 신청 시, 허위의 내용을 기재ㆍ등록한 경우</li>
                                                    <li>회원이 사망한 경우<br>
                                                        (이 때 회원 자격 및 기타 멤버십 서비스와 관련된 권리나 의무는 회원의 상속인에게 상속되지 않으며, 상속인에게 별도의 통보를 하지 않습니다.)</li>
                                                    <li>다른 회원의 멤버십 혜택을 부당하게 방해하거나 그 정보를 도용하는 등 관련 법령을 위반하여 정보통신 이용 질서를 위협하는 경우 </li>
                                                    <li>삼성전자, 지정매장, 제휴사 및 제휴가맹점에서 법령 및 본 약관에서 금지하거나 반하는 행위를 하는 경우</li>
                                                    <li>구매금액 또는 삼성전자 포인트를 부정적립 또는 부정사용 하는 경우 및 멤버십카드를 부정 사용한 경우 <br>
                                                        - 부정적립이란 회원이 실제로 상품이나 서비스를 구매하지 않았음에도 불구하고 해당 회원에게 구매금액 또는 삼성전자 포인트가 적립된 경우 또는 실제 구매 금액 이상으로 포인트가 적립된 경우를 말합니다.<br>
                                                        - 부정 사용이란 타 회원의 동의 없이 타 회원의 포인트 또는 멤버십카드를 수단과 방법에 관계없이 임의로 사용한 경우를 말합니다.<br>
                                                        - 부정 적립 또는 부정 사용한 회원은 적립 및 사용된 포인트나 그 상당액을 반환하여야 합니다.</li>
                                                </ol>
                                            </li>
                                            <li>본 조 제2항 각 호의 사유로 자격이 정지 또는 상실된 회원은 제2항 각 호의 사유가 자신의 고의 또는 과실에 기한 것이 아님을 소명할 수 있습니다. 이 경우 삼성전자는 회원의 소명 내용을 심사하여 회원의 주장이 타당하다고 판단하는 경우 회원으로 하여금 정상적인 멤버십 서비스를 이용할 수 있도록 합니다. </li>
                                            <li>본 조 제1항에 의한 회원 탈회 또는 제2항에 의한 회원자격 정지ㆍ상실이 확정되는 시점은 다음 각 호와 같습니다.
                                                <ol>
                                                    <li>사망으로 인한 자격상실의 경우에는 회원 사망일에 자격상실이 확정됩니다.</li>
                                                    <li>기타의 경우에는 회원탈회 요청일 또는 삼성전자가 회원자격 정지ㆍ상실을 결정한 날 회원자격 정지ㆍ상실이 확정됩니다. </li>
                                                </ol>
                                            </li>
                                            <li>회원 탈회 시 회원의 멤버십 서비스 및 적용된 혜택은 탈회요청일 또는 자격상실일자에 소멸되며, 탈회 후 재가입 요청 시 탈회 시 소멸된 포인트는 복원되지 않습니다.</li>
                                            <li>삼성전자는 일정 기간 삼성전자 포인트의 적립 및 사용 또는 멤버십카드 사용 이력이 없는 회원을 탈회 처리할 수 있습니다. 위 기간은 5년으로 정하며, 삼성전자는 탈회를 처리하기 전에 서면, 전화, 전자우편(E-MAIL), SMS 등의 방법 중 1가지 이상을 통하여 회원에게 이를 안내합니다. </li>
                                        </ol>
                                        <h3>제3장 멤버십카드</h3>
                                        <h3>제6조 (멤버십카드의 종류 및 발급)</h3>
                                        <ol>
                                            <li>멤버십카드의 종류는 멤버십카드를 사용할 수 있는 제휴사 및 제휴가맹점에 따라 달라 질 수 있습니다. 
                                                자세한 멤버십카드의 종류는 홈페이지를 통해 확인하실 수 있으며, 사정에 따라 멤버십카드의 종류는 변경될 수 있습니다.</li>
                                            <li>멤버십카드 발급을 원하는 회원은 삼성전자, 지정매장, 제휴사 및 제휴가맹점이 정한 신청 양식에 신청자 필수 정보 사항을 기재 또는 입력하여 멤버십카드 발급을 신청할 수 있습니다.</li>
                                            <li>멤버십카드 발급은 지정매장 또는 홈페이지에서 신청하실 수 있습니다. 단, 일부 지정매장에서는 멤버십카드 발급이 제한될 수 있으며, 
                                                이는 지정매장이 소속된 타 회사 및 사업장의 자체 정책에 의한 것이므로 삼성전자가 강제할 수 없음을 알려 드립니다.</li>
                                            <li>일부 제휴 멤버십카드는 해당 제휴사 및 제휴가맹점에서도 발급받을 수 있습니다. 이 경우 회원은 제휴사 및 제휴가맹점에서 규정한 회원가입 및 카드 발급 절차를 따라야 합니다.</li>
                                            <li>멤버십카드의 형태는 플라스틱 카드, 모바일 카드, 사이버 카드가 있으며 홈페이지, 일부 지정매장과 제휴사 및 제휴가맹점에서는 플라스틱 카드가 아닌 모바일 카드 또는 사이버 카드가 발급됩니다. 모바일 카드와 사이버 카드는 삼성전자 포인트 사용 등 일부 기능이 제한될 수 있으며 모바일 카드와 사이버 카드를 발급받은 회원은 플라스틱 카드의 추가 발급을 신청할 수 있습니다.</li>
                                            <li>지정매장, 제휴사 및 제휴가맹점별 멤버십카드 발급 가능 여부 및 발급 가능한 멤버십카드 종류는 변경 될 수 있으며, 자세한 내용은 홈페이지에서 확인 할 수 있습니다. </li>
                                        </ol>
                                        <h3>제7조 (플라스틱 및 모바일 멤버십카드 분실 및 재발급)</h3>
                                        <ol>
                                            <li>멤버십카드 중 플라스틱 또는 모바일 카드를 분실한 회원은 즉시 지정매장, 콜센터(1588-3366), 홈페이지 등을 통해 해당 카드를 분실처리 하여야 합니다. 회원은 이 과정에서 본인확인 및 본인인증을 요청받을 수 있습니다.</li>
                                            <li>삼성전자는 분실처리 접수 즉시, 해당 멤버십카드의 상태를 변경하고 사용을 중지하는 등 필요한 제반 조치를 취합니다. 분실처리된 카드를 제3자가 사용할 경우 고객에게 발생하는 손해는 삼성전자가 부담하나, 본 약관에 달리 규정되어 있지 않는 한 삼성전자는 회원이 제1항에 따른 분실요청을 하기 전에 발생한 손해에 대하여는 책임지지 않습니다.</li>
                                        </ol>
                                        <h3>제8조 (멤버십카드 관리 및 손해발생시 책임)</h3>
                                        <ol>
                                            <li>회원은 선량한 관리자로서의 주의를 다하여 멤버십카드를 이용, 관리하여야 하며, 멤버십카드를 타인에게 대여하거나 양도 또는 담보의 목적으로 이용할 수 없습니다.</li>
                                            <li>삼성전자는 멤버십카드의 위조나 변조로 발생한 사고로 인하여 회원에게 손해가 발생한 경우에는 그 손해를 배상할 책임을 부담합니다. </li>
                                            <li>제2항의 규정에도 불구하고 삼성전자는 다음 각 호의 어느 하나에 해당하는 경우에는 그 책임의 전부 또는 일부를 회원이 부담하게 할 수 있습니다.
                                                <ol>
                                                    <li>천재지변, 전쟁, 테러 또는 삼성전자의 귀책사유 없이 발생한 정전, 화재, 건물의 훼손 등 불가항력으로 인한 경우</li>
                                                    <li>회원이 멤버십카드를 타인에게 대여하거나 사용을 위임한 경우,</li>
                                                    <li>양도 또는 담보의 목적으로 제공한 경우, </li>
                                                    <li>멤버십카드 관리를 소홀히 하여 타인이 이를 이용할 수 있도록 방치한 경우, </li>
                                                    <li>삼성전자가 요구하는 카드에 관한 추가적인 보안조치를 정당한 사유없이 거부하여 타인이 멤버십카드를 사용하게 된 경우</li>
                                                </ol>
                                            </li>
                                            <li>삼성전자는 제2항의 규정에 따른 책임을 이행하기 위해서는 보험 또는 공제에 가입하거나 준비금을 적립하는 등 필요한 조치를 다합니다. </li>
                                        </ol>
                                        <h3>제4장 멤버십 서비스</h3>
                                        <h3>제9조 (멤버십 서비스의 운영)</h3>
                                        삼성전자는 멤버십 회원에게 다음과 같은 서비스를 제공합니다.
                                        <ol>
                                            <li>정보 제공</li>
                                            <li>이벤트 참여 기회 제공</li>
                                            <li>기타 삼성전자의 멤버십 서비스 정책에 따라 제공되는 혜택</li>
                                        </ol>
                                        <h3>제10조 (멤버십 서비스의 게시)</h3>
                                        삼성전자는 멤버십 서비스 정책의 상세 내용을 멤버십 홈페이지(http://membership.samsung.com/sec)에 게시합니다.
                                        <h3>제11조 (멤버십 서비스 제공 조건)</h3>
                                        <ol>
                                            <li>일부 서비스는 서비스 특성 또는 정책에 따라 연령∙가족관계 등 인적 자격, 지정 매장에서의 일정액 이상 구매 등 특정 요건을 충족한 경우에만 제공될 수 있습니다.</li>
                                            <li>일부 서비스는 제휴사의 사정에 따라 적용이 제한되거나 차등 제공될 수 있습니다.</li>
                                        </ol>
                                        <h3>제12조 (멤버십 서비스의 폐지, 변경 또는 중단)</h3>
                                        <ol>
                                            <li>멤버십 서비스는 서비스 유지 곤란, 운영 정책의 변경 등 삼성전자 또는 제휴사의 사정에 의하여 폐지, 변경 또는 중단될 수 있습니다.</li>
                                            <li>운영중인 멤버십 서비스를 폐지, 변경 또는 중단하고자 하는 경우 삼성전자는 그 내용을 변경기준일 [7 ]일 전에 홈페이지에 게시하여 사전 고지합니다. 그러나 부득이한 사유로 긴급하게 폐지, 변경 또는 중단하여야 하는 경우에는 효력 발생일 직전에 게시할 수 있습니다.</li>
                                        </ol>
                                        <h3>제5장 삼성전자포인트</h3>
                                        <h3>제13조 (삼성전자 포인트 적립)</h3>
                                        <ol>
                                            <li>삼성전자는 멤버십카드를 발급받고 삼성전자, 지정매장에서 제품 및 서비스(삼성전자가 정책에 따라 국내에 직접 공급한 제품 및 서비스에 한하며, 삼성전자가 아닌 타사가 공급하거나 삼성전자가 생산하였더라도 직접 공급하지 않은 제품 및 서비스는 제외됩니다.)를 구매하여 구매금액 결제 및 배송이 완료된 회원, 혹은 삼성전자가 제시한 적립 조건을 충족하는 회원에게, 구매금액×적립율(단, 퍼센트 단위 소수점이하 절사, 이하 같음), 혹은 사전에 고지한 금액의 삼성전자 포인트를 삼성전자의 정책에 따라 지정한 일자에 적립해 드립니다. <br>
                                                단, 삼성전자 포인트의 적립은 고객의 구매정보 및 구매 금액이 확인되어야만 적립 가능하며, 일부 지정 매장, 제휴사 및 제휴가맹점에서는 삼성전자 포인트 적립이 제한될 수 있습니다. 삼성전자 포인트 적립이 가능한 지정 매장, 제휴사 및 제휴가맹점은 변경 될 수 있으며, 홈페이지를 통해 구체적인 내용을 확인할 수 있습니다.</li>
                                            <li>기본적립율, 월간 또는 연간 적립한도 등의 운영 기준은 삼성전자의 정책에 의해 운영됩니다. 다만, 정책에 따라 추가로 삼성전자 포인트를 지급할 수 있으며, 이 때 적립한도 등의 기준은 별도로 적용될 수 있습니다. 삼성전자는 동일한 행사에 대해 포인트를 중복 지급하지 않으며, 삼성전자 포인트의 운영 기준은 삼성전자의 정책에 의해 변경될 수 있습니다.</li>
                                            <li>삼성전자는 하기 유형의 회원에게는 삼성전자 포인트를 적립하지 않습니다. 만일 아래 해당하는 회원이 삼성전자 포인트 적립을 받았을 경우 해당 삼성전자 포인트를 반환해야 하고, 삼성전자 포인트를 이미 사용했다면 포인트 상당 금액을 반환하여야 합니다.
                                                <ol>
                                                    <li>전자제품 판매업자</li>
                                                    <li>지인구매대행 회원 (단, 직계가족의 구매를 대행하는 것은 예외로 합니다.)</li>
                                                    <li>사업상 제품을 구매하여 고객에게 납품하는 회원</li>
                                                    <li>업무 상의 목적으로 제품을 구매한 삼성전자 임직원</li>
                                                    <li>지정매장의 판매직원 (판매상담사, 세일즈프로, 매장 자체 부녀사원 등)</li>
                                                    <li>실제로 삼성전자로부터 제품이나 서비스를 직접 구매한 소비자가 아니거나, 실제 구매자의 인적사항을 확인할 수 없는 회원</li>
                                                    <li>기타 제1호 내지 제6호와 유사하게 영업 또는 재판매를 목적으로 제품을 구매하는 회원</li>
                                                </ol>
                                            </li>
                                            <li>삼성전자는 삼성전자 포인트 적립 및 사용에 관한 오류가 발생한 것을 확인하는 경우 이를 즉시 조사하여 처리합니다. 또한 회원은 삼성전자 포인트 적립 및 사용에 오류가 있다는 사실을 알게 된 즉시 삼성전자에 정정을 요구할 수 있습니다. 단. 이 경우 삼성전자는 삼성전자 포인트 적립의 오류 관련 조사를 위해 회원에게 자료 또는 정보 등을 요청 할 수 있습니다.</li>
                                            <li>삼성전자는 제4항 오류를 발견하거나 회원으로부터 정정을 통지 받은 후 2주 이내에 오류의 원인과 처리결과를 회원에게 알려드립니다. </li>
                                        </ol>
                                        <h3>제14조 (삼성전자 포인트 회입 및 소멸)</h3>
                                        <ol>
                                            <li>회원이 이미 제품 및 서비스의 구매를 취소하는 경우, 혹은 삼성전자 포인트의 적립 조건을 상실하였을 경우, 그로 인해 적립되었던 삼성전자 포인트는 그 적립이 취소됩니다. 만약 회원이 삼성전자 포인트를 이미 사용했다면, 삼성전자 포인트 상당 금액을 반환하거나 향후 적립되는 포인트를 통해 상계처리하셔야 합니다.</li>
                                            <li>삼성전자 포인트의 유효기간은 기본적으로 적립일 이후 24개월이며, 사전에 정의된 유효기간이 경과하면 해당 삼성전자 포인트는 자동으로 소멸됩니다. 단 특정 조건에서 적립 시에는 사전에 정의된 유효기간은 2년보다 짧을 수 있습니다. 이 경우 회원에게 사전에 정의된 유효기간을 고지합니다.</li>
                                        </ol>
                                        <h3>제15조 (삼성전자 포인트 사용)</h3>
                                        <ol>
                                            <li>회원은 삼성전자 및 지정매장, 제휴사 및 제휴가맹점에서 제품 또는 서비스(삼성전자가 정책에 따라 국내에 직접 공급한 제품 및 서비스에 한하며, 삼성전자가 아닌 타사가 공급하거나 삼성전자가 생산하였더라도 직접 공급하지 않은 제품 및 서비스는 제외됩니다.) 대금을 결제하는 경우, 삼성전자가 정한 절차에 따라 삼성전자 포인트를 사용할 수 있습니다. 단, 일부 지정 매장, 제휴사 및 제휴가맹점에서는 삼성전자 포인트 사용이 제한될 수 있으며 사용이 가능한 지정 매장, 제휴사 및 제휴가맹점은 홈페이지를 통해 확인할 수 있습니다.</li>
                                            <li>회원은 삼성전자 포인트를 사용하기 위해 플라스틱 또는 모바일 카드를 제시하거나 카드번호 및 비밀번호를 입력하여야 하고, 필요 시 추가 비밀번호 입력 또는 본인확인 및 인증을 통해 본인이 보유한 삼성전자 포인트를 사용한다는 사실을 입증할 수 있어야 합니다. 회원이 비밀번호 관리를 소홀히 하여 타인에게 노출된 경우 또는 카드의 도난, 분실 기타 사고로 인한 삼성전자 포인트 손실에 대하여 삼성전자는 책임을 지지 않습니다. </li>
                                            <li>삼성전자 포인트는 5,000포인트 이상부터 1포인트 단위로 사용이 가능하며, 1포인트는 1원의 교환 가치를 가집니다. 다만, 제휴사 또는 제휴가맹점에서는 삼성전자 포인트를 사용할 수 있는 최대금액 등의 제한이 있을 수 있으며, 이는 변경될 수 있습니다.</li>
                                            <li>삼성전자 포인트는 사전에 부여된 유효기간이 짧은 포인트 또는 적립 시점이 앞선 포인트부터 사용됩니다.</li>
                                        </ol>
                                        <h3>제16조 (양도 등 금지)</h3>
                                        <ol>
                                            <li>삼성전자 포인트는 양도, 상속 기타 거래의 대상이 될 수 없습니다.</li>
                                            <li>삼성전자는 삼성전자의 정책에 따라 삼성전자 포인트의 양도를 일부 허용할 수 있습니다. 이 경우 허용 조건 및 범위 등은 멤버십 홈페이지에 게시합니다.</li>
                                            <li>본 약관 제12조 제2항은 본 조에 준용됩니다.</li>
                                        </ol>
                                        <h3>제17조(삼성전자 포인트 적립 및 사용 등 기록의 보존 및 자료 등의 제공)</h3>
                                        <ol>
                                            <li>삼성전자는 삼성전자 포인트 적립 및 사용 등의 기록을 5년간 유지, 보존합니다.</li>
                                            <li>삼성전자는 회원의 요청이 있을 경우 다른 법률에 저촉되지 않는 범위 내에서 삼성전자가 보존․관리하고 있는 삼성전자 포인트 적립 및 사용 등의 관련 기록․자료를 요청을 받은 날부터 2주 이내에 회원에 제공합니다.</li>
                                        </ol>
                                        <h3>제18조(비밀보장의무) </h3>
                                        삼성전자는 법령에 정한 경우를 제외하고는 멤버십포인트 관련 업무를 수행함에 있어서 알게 된 회원 관련 정보를 본인의 동의 없이는 다른 사람에게 제공하지 않습니다. 다만, 삼성전자의 관리소홀로 인한 회원 관련 정보 도난 및 유출 시에는 삼성전자가 책임을 부담합니다.<br>
                                        <h3>제6장 개인정보 보호</h3>
                                        <h3>제19조 (개인정보 수집ㆍ이용)</h3>
                                        <ol>
                                            <li>삼성전자는 회원이 작성한 '개인정보 수집ㆍ이용 동의' 및 제품 및 서비스 이용 중 회원으로부터 추가로 획득한 동의에 따라 회원의 개인정보를 수집ㆍ이용할 수 있습니다.</li>
                                            <li>회원은 삼성전자에 제공한 개인정보와 관련하여 변경사항이 있는 경우 지체 없이 삼성전자에 그 변경사실을 통지하여야 합니다. 회원이 변경사실의 통지를 태만히 함으로써 삼성전자로부터의 연락, 통지 또는 문서 등이 연착하거나 도착하지 않아 발생한 손해는 회원이 부담하여야 합니다. </li>
                                            <li>개인정보의 수집ㆍ이용에 관한 내용은 삼성전자, 지정매장, 제휴사 및 제휴가맹점의 사정에 따라 변경 될 수 있습니다. 이 경우 삼성전자는 제3조 1항에 명시한 방식에 의거하여, 변경 내역을 고지합니다.</li>
                                        </ol>
                                        <h3>제20조 (마케팅활용을 위한 위탁 및 제3자 제공)</h3>
                                        <ol>
                                            <li>삼성전자는 '마케팅활용을 위한 위탁 동의' '개인정보 제3자 제공 동의'에 따라 회원의 개인정보를 위탁하거나 제공할 수 있습니다. 회원은 이를 원치 않을 경우 거부하실 수 있으며, 거부로 인해 일부 멤버십 서비스에 제한이 있을 수 있습니다.</li>
                                            <li>개인정보의 제공 등에 관한 내용은 삼성전자, 지정매장, 제휴사 및 제휴가맹점의 사정에 따라 변경될 수 있습니다. 이 경우 삼성전자는 제3조 1항에 명시한 방식에 의거하여, 변경 내역을 고지합니다.</li>
                                            <li>삼성전자는 아래의 경우에는 회원의 동의를 얻지 아니하고 제3자에게 개인정보를 제공할 수 있습니다.
                                                <ol>
                                                    <li>회원으로부터 개인정보 수집이용동의서를 통해 사전 동의를 받은 경우</li>
                                                    <li>관련법령에 따라 국가, 공공기관 등의 요청이 있는 경우</li>
                                                    <li>통계작성을 위하여, 특정 개인을 식별할 수 없는 형태로 제공되어 제공하는 경우</li>
                                                </ol>
                                            </li>
                                        </ol>
                                        <h3>제21조 (개인정보 보유 및 이용기간)</h3>
                                        <ol>
                                            <li>삼성전자는 수집된 회원의 개인정보를 해당 회원이 회원 자격을 유지하는 기간 내 보유하고 이용할 수 있습니다. 다만, 회원이 탈퇴하거나 자격을 상실할 경우 삼성전자는 이후 고객이 불만 제기 및 서비스 요청할 경우를 대비하여 회원 탈퇴 또는 자격 상실 후 5년 간 개인정보를 삭제하지 아니합니다. 위 기간이 경과하면 회원의 별도 요청이 없을 경우라도 수집된 회원정보를 삭제 및 파기합니다. </li>
                                            <li>본 조 제1항에도 불구하고 상법 등 관련 법령의 규정에 의하여 거래 관련 권리의무 관계의 확인 등을 이유로 일정기간 보유해야 할 필요가 있을 경우에는 삼성전자는 관련법령이 정한 기간 또는 다음 각 호의 기간동안 개인정보를 보유할 수 있습니다.
                                                <ol>
                                                    <li>계약 또는 청약철회 등에 관한 기록 : 5년 </li>
                                                    <li>대금결제 및 재화 등의 공급에 관한 기록 : 5년 </li>
                                                    <li>소비자의 불만 또는 분쟁처리에 관한 기록 : 5년</li>
                                                    <li>삼성전자 포인트 적립 및 사용 등에 관한 기록 : 5년 또는 1년</li>
                                                    <li>기타 개별적으로 이용자의 동의를 받는 경우 : 해지가 처리된 시점까지</li>
                                                </ol>
                                            </li>
                                        </ol>
                                        <h3>제22조 (개인정보보호를 위한 회원의 권리)</h3>
                                        <ol>
                                            <li>회원 또는 그 법정대리인은 개인정보의 수집, 이용, 제공에 대해 회원이 동의한 내용을 철회할 수 있으며, 자신의 개인정보를 열람하거나 정정할 수 있습니다. </li>
                                            <li>회원은 다음과 같은 방법으로 본 조 제1항에 기재된 회원 개인정보의 열람 또는 정정을 청구 할 수 있습니다. <br>
                                                - 콜센터(1588-3366)와 통화 <br>
                                                - 홈페이지를 통해 요청 <br>
                                                - 지정매장에 방문하여 요청 (단, 해당 지정매장의 회원으로 등록된 경우에 한하며, 지정매장의 정책 및 환경에 따라 일부 지정매장에서는 불가할 수 있습니다.)</li>
                                            <li>삼성전자는 회원으로부터 동의 철회, 열람 및 정정 요구를 받은 경우에는 수집된 개인정보를 파기 및 정정하는 등의 조치를 취하고 지체 없이 그 결과를 회원에게 통지합니다.</li>
                                        </ol>
                                        <h3>제23조 (개인정보위탁)</h3>
                                        삼성전자는 수집된 개인정보의 취급 및 관리 등의 업무를 스스로 수행함을 원칙으로 하나, 원활한 업무 처리를 위해 필요한 경우 업무의 일부 또는 전부를 삼성전자가 선정한 업체에 위탁할 수 있으며 이를 사전에 회원에게 고지합니다.
                                        <h3>제24조(개인정보보호책임자)</h3>
                                        <ol>
                                            <li>삼성전자는 수집된 회원의 개인정보 관리를 위해 개인정보보호책임자의 성명과 연락처를 홈페이지에 공지합니다.</li>
                                            <li>개인정보보호책임자는 삼성전자의 사정에 따라 변경될 수 있습니다. 이 경우 변경사항을 본 약관 제3조 제1항에 규정된 통지방법을 준용하여 회원에게 알려 드리며, 별도의 약관 변경 절차는 생략합니다.</li>
                                        </ol>
                                        <h3>제7장 홈페이지</h3>
                                        <h3>제25조(홈페이지 운영)</h3>
                                        <ol>
                                            <li>삼성전자는 홈페이지 운영과 관련하여 관계 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며, 이 약관이 정하는 바에 따라 지속적이고 안정적으로 서비스를 제공하는 데 최선을 다합니다.</li>
                                            <li>삼성전자는 홈페이지를 통하여 다음과 같은 업무를 수행합니다.
                                                <ol>
                                                    <li>회원에게 멤버십 관련 제반 정보의 제공 </li>
                                                    <li>회원정보 등록, 변경, 조회 등</li>
                                                    <li>삼성전자 포인트 및 혜택의 신청, 조회 등</li>
                                                    <li>회원대상 삼성전자 및 제휴 프로모션 </li>
                                                    <li>기타 삼성전자가 정한 업무</li>
                                                </ol>
                                            </li>
                                            <li>삼성전자는 컴퓨터 등 정보통신설비의 점검, 보수, 교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 홈페이지 서비스의 제공을 일시적으로 중단할 수 있습니다. 위의 사유로 홈페이지 서비스를 중단하고자 할 경우 삼성전자는 e-mail 또는 홈페이지에 게시하는 방법으로 회원에게 홈페이지 서비스 중단 사실을 알려 드립니다. </li>
                                        </ol>
                                        <h3>제26조(홈페이지에 관한 회원의 의무)</h3>
                                        <ol>
                                            <li>회원은 홈페이지 서비스 이용과 관련하여 다음 각 호의 행위를 해서는 아니됩니다.
                                                <ol>
                                                    <li>홈페이지 서비스 이용을 위한 제반 사항 신청 또는 변경 시 허위내용 기재 행위</li>
                                                    <li>홈페이지에 게시된 각종 정보의 무단 변경, 삭제 등 훼손 행위</li>
                                                    <li>삼성전자가 허용한 정보 이외의 다른 정보(컴퓨터 프로그램 및 광고 등)를 송신하거나 게시하는 행위</li>
                                                    <li>외설 또는 폭력적인 정보를 홈페이지에 공개하거나 게시하는 행위</li>
                                                    <li>삼성전자 홈페이지를 이용함으로써 얻은 정보를 삼성전자의 사전 승낙없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제 3자에게 이용하게 하는 행위</li>
                                                </ol>
                                            </li>
                                        </ol>
                                        <h3>제8장 기타</h3>
                                        <h3>제27조 (멤버십의 종료 및 변경)</h3>
                                        <ol>
                                            <li>관련 법령의 제ㆍ개정, 감독기관의 구속력 있는 명령 기타의 사유로 부득이 서비스를 변경ㆍ종료(이하 "변경"이라 합니다)하고자 할 경우, 삼성전자는 서비스 변경 예정일로부터 1개월 이전에 본 약관 제3조 제1항에 규정된 통지방법 중 1가지 이상의 방법으로 회원에게 알려 드립니다.</li>
                                            <li>제1항에도 불구하고, 서비스 제공과 관련된 제휴사 및 제휴가맹점의 일방적 제휴조건 변경ㆍ도산, 천재지변, 금융환경의 급변 등의 경영위기 및 그 밖에 이에 준하는 사유에 따른 불가피한 경우, 삼성전자는 서비스를 변경 또는 중단할 수 있습니다. 이 경우 삼성전자는 해당 서비스가 변경되었음을 서비스 변경일로부터 7영업일 이내에 본 약관 제3조 제1항에 규정된 통지방법 중 1가지 이상의 방법으로 회원에게 알려 드립니다. 제1항과 제2항에 의거하여 멤버십이 종료되는 당일, 잔여 삼성전자 포인트 및 혜택이 자동으로 소멸됩니다.</li>
                                        </ol>
                                        <h3>제28조 (약관 위반시의 책임)</h3>
                                        회원은 본 약관을 위반함으로써 발생하는 모든 책임을 부담하며, 이로 인하여 삼성전자에게 손해를 입힌 경우에는 배상하여야 합니다.
                                        <h3>제29조 (회원에 대한 통지)</h3>
                                        <ol>
                                            <li>삼성전자가 회원에 대한 통지를 하는 경우 본 약관에 다른 규정이 없는 한 삼성전자는 본 약관 제3조 제1항 각호의 규정된 1가지 이상의 방법에 따라 통지할 수 있습니다.</li>
                                            <li>삼성전자가 서면으로 통지했을 때에는 천재지변 등 불가항력적인 경우 외에는 보통의 우송기간이 지났을 때 도달한 것으로 추정합니다.</li>
                                            <li>회원이 회원정보 변경을 게을리함에 따라 제2항에 의하여 발송한 서면통지가 회원에게 연착하거나 도달하지 아니한 때에는 보통의 우송기간이 경과한 때에 도달한 것으로 간주합니다.</li>
                                        </ol>
                                        <h3>제30조 (분쟁의 해결 등)</h3>
                                        본 약관에 의한 멤버십 포인트 이용과 관련하여 분쟁이 발생한 경우 회원은 삼성전자의 고객센터 및 기타 분쟁처리절차를 통해 그 해결을 요구하거나 금융감독원 금융분쟁조정위원회, 한국소비자보호원 소비자분쟁조정위원회 등을 통하여 분쟁조정을 신청할 수 있으며, 본 약관에서 정하지 아니한 사항과 약관의 해석에 관하여는 관계 법령 또는 상관례를 따릅니다.
                                        <h3>제31조 (관할법원)</h3>
                                        본 약관에 따른 거래에 관한 소송은 회원의 주소지 또는 영업소 소재지를 관할하는 법원으로 하되, 회원의 주소지를 알 수 없거나 주소지가 분명하지 아니한 경우에는 민사소송법상의 관할 법원으로 합니다.<br>
                                        <br>
                                        <h3>부칙</h3>
                                        <h3>제1조 (시행일)</h3>
                                        본 약관은 2017년 1월 1일부터 시행됩니다.
                                    </div>
                                <!-- / policy영역 -->
                            </div>
                            <!-- / 약관box -->
                        </div>
                        <!-- / 삼성전자 멤버십 회원 이용 약관 -->
                        
                        <!-- 삼성전자 개인정보 수집 이용 동의 -->
                        <div class="term_b">
                            <h2><div class="input_b size_sm type1"><input type="checkbox" name="chkChoiceAgreementForSamSungPersonalData" id="chkChoiceAgreementForSamSungPersonalData" value="Y" class="agreement-samsung"><label for="chkChoiceAgreementForSamSungPersonalData">삼성전자 멤버십 개인정보 수집 <span>(선택)</span></label></div></h2>
                            <!-- 약관box -->
                            <div class="txt_a_new" style="/* background: #fff; */width: 95%;border: 0;">
                                <!-- policy영역 -->
                                <div class="policy_a">
                                        <h3 style="padding: 0 0 10px;">필수적인 개인정보 수집 이용 동의</h3>
                                        삼성전자 주식회사(이하 '삼성전자'라 합니다)는 최초 회원 가입 또는 서비스 이용 시 이용자로부터 아래와 같은 개인정보를 수집하고 있습니다. 개인정보 처리에 대한 상세한 사항은 삼성전자 멤버십 홈페이지(http://membership.samsung.com/sec/)에 공개한 '개인정보 처리방침'을 참조하십시오. 다만, 본 동의서 내용과 상충되는 부분은 본 동의서의 내용이 우선합니다. 귀하께서는 필수항목 수집·이용에 대한 동의를 거부하실 수 있으나, 이는 서비스 제공에 필수적으로 제공되어야 하는 정보이므로, 동의를 거부하실 경우 회원 가입 및 서비스 이용 등이 제한됩니다.
                    
                                        <ol>
                                            <li>
                                                <h3>1) 수집항목:</h3>
                                                <h3>가) 멤버십 가입에 필요한 정보</h3>
                                                <ol>
                                                    <li>이메일 주소, 전화번호, 우편번호, 주소, 비밀번호, 성명, 성별, 생년월일, 중복가입 확인정보(DI), 암호화된 동일인 식별정보(CI), 만 14세 미만 아동의 경우 법정대리인 정보(법정대리인의 이름, 생년월일, DI, CI)</li>
                                                </ol>
                                                <h3>나) 삼성전자 멤버십 제휴처 통해 가입 시 필요한 정보</h3>
                                                <ol>
                                                    <li>결혼 관련 정보 [결혼(예식)예정일, 예식장정보, 구매예정제품], 이사 관련 정보 [이사예정일, 이사예정평수, 구매예정제품, 이벤트신청일], 출산 관련 정보 [출산예정일, 임신 개월수, 자녀 수, 자녀 나이, 구매예정 및 관심제품, 이벤트 신청일], 전역 관련 정보 [전역예정일, 군구분(사병/간부/군무원)]<br>
                        ※ 단, 결혼/이사/출산/전역 관련 제휴처에서 가입하는 고객에 한하여 수집합니다.</li>
                                                </ol>
                                                <h3>다) 멤버십 이용 과정에서 필요한 정보</h3>
                                                <ol>
                                                    <li>※ 멤버십 이용 과정에서 필요한 필수정보는 서비스 제공 단계에 따라 필요한 범위 내에서 수집 됩니다.</li>
                                                    <li>재화ㆍ용역 구매정보 [구매모델ㆍ서비스명, 구입처, 구입일시, 구입가격/수량, 결제수단정보, 결제카드정보, 제조번호, 상담내역]</li>
                                                    <li>포인트거래정보 [포인트적립·사용액, 적립·사용내역, 적립·사용일시, 적립·사용처]</li>
                                                    <li>서비스 수리 관련정보[수리모델명, 수리일자, 수리내용, 수리비용, 결제수단정보, 결제카드정보, 제조번호, 수리결과, 상담내역]<br>
                                                    • 배송ㆍ이전설치 관련정보[배송ㆍ이전설치모델명, 배송ㆍ이전설치일자, 구매자명, 구매자 (휴대)전화번호, 구매자 주소, 인수자 (휴대)전화번호, 인수자 주소, 배송ㆍ이전 설치 내용, 배송ㆍ이전 설치결과, 배송ㆍ이전설치결제비용, 결제수단정보, 결제카드정보, 제조번호]<br>
                                                    ※ 배송ㆍ이전설치 관련 인수자 개인정보는 이용자가 인수자로부터 적법하게 수집하여 삼성전자에 제공함에 대한 동의를 받았음을 전제로 합니다.<br>
                                                    • 폐가전 관련정보 [폐가전 회수일시, 회수품목, 회수대수]<br>
                                                    • 콜센터 상담 내역 및 상담 결과 [문의 일시, 내용 및 아웃바운드 TM 접촉, 내용]<br>
                                                    • 플러스 페이 결제일, 플러스 페이 신용카드 종류<br>
                                                    • 멤버십 무상SVC연장 대상 여부, 무상SVC연장 만료월, 무상SVC부족구매기한, 부족액<br>
                                                    • 로열블루 등급, 내년상위등급, 구매기한, 부족액<br>
                                                    • 추가 멤버십 포인트 제공 제휴업체의 서비스 가입 정보<br>
                                                    [제휴업체명(㈜대명스테이션(대명라이프웨이 상조 서비스), ㈜홀리스트, ㈜케이티씨에스, ㈜LG유플러스(IPTV), ㈜청호나이스(정수기)), 가입여부 및 가입일]</li>
                                                </ol>
                                            </li>
                                            <li>수집목적</li>
                                            <table border="0" cellspacing="0" cellpadding="0" class="header_h">
                                                <colgroup>
                                                    <col style="width:30%">
                                                    <col style="width:70%">
                                                </colgroup>
                                                <tbody><tr>
                                                    <td><p align="center">구분</p></td>
                                                    <td><p align="center">자세한내용</p></td>
                                                </tr>
                                                <tr>
                                                    <td><p align="left">① 회원관리 및 본인확인</p></td>
                                                    <td><p align="left">
                        -	본인 확인, 연령 확인, 만 14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 불만 처리 등 민원처리, 고지사항 전달, 혜택 제공 및 안내, 불량회원의 부정이용 방지와 비인가 사용방지<br>
                        -	회원제 상품 구매 및 서비스 이용에 따른 본인확인<br>
                        -	개인정보 처리 및 정보주체의 개인정보 열람, 정정, 삭제, 처리정지 요구 시 본인확인, 개인식별
                                                    </p></td>
                                                </tr>
                                                <tr>
                                                    <td><p align="left">② 서비스 제공에 관한 계약이행 및 서비스 제공에 따른 요금 정산<br>삼성전자 멤버십 서비스 제공</p></td>
                                                    <td><p align="left">
                        -	상품, 멤버십 서비스 제공, 구매 및 결제, 상품 배송<br>
                        -	사용자에 최적화된 서비스, 편의제공 및 기능 개선<br>
                        -	이용자가 구매한 상품에 대한 A/S 및 업데이트 정보 등 제공<br>
                        -	멤버십 혜택 제공 (포인트 적립 및 사용, 프리미엄 등급 혜택)
                                                    </p></td>
                                                </tr>
                                            </tbody></table>
                                            
                                            <li>보유 및 이용 기간:</li>
                                            회원의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다.<br><br>
                                            다만, 삼성전자는 관련법령의 규정에 의하여 개인정보를 보유할 필요가 있는 경우, 해당 법령에서 정한 바에 의하여 아래와 같이 개인정보를 보유할 수 있습니다.
                        
                                            <table border="0" cellspacing="0" cellpadding="0" class="header_h">
                                                <colgroup>
                                                    <col style="width:33%">
                                                    <col style="width:13%">
                                                    <col style="width:53%">
                                                </colgroup>
                                                <tbody><tr>
                                                    <td><p align="center">보유 항목</p></td>
                                                    <td><p align="center">보유 기간</p></td>
                                                    <td><p align="center">법적 근거</p></td>
                                                </tr>
                                                <tr>
                                                    <td><p align="left">이용자의 포인트 내역</p></td>
                                                    <td><p align="left">5년</p></td>
                                                    <td><p align="left">상법</p></td>
                                                </tr>
                                                <tr>
                                                    <td><p align="left">계약 또는 청약철회 등에 관련 기록</p></td>
                                                    <td><p align="left">5년</p></td>
                                                    <td><p align="left">전자상거래 등에서의 소비자보호에 관한 법률</p></td>
                                                </tr>
                                                <tr>
                                                    <td><p align="left">대금결제 및 재화 등의 공급에 관한 기록</p></td>
                                                    <td><p align="left">5년</p></td>
                                                    <td><p align="left">전자상거래 등에서의 소비자보호에 관한 법률</p></td>
                                                </tr>
                                                <tr>
                                                    <td><p align="left">소비자의 불만 또는 분쟁처리에 관한 기록</p></td>
                                                    <td><p align="left">3년</p></td>
                                                    <td><p align="left">전자상거래 등에서의 소비자보호에 관한 법률</p></td>
                                                </tr>
                                                <tr>
                                                    <td><p align="left">신용정보의 수집/처리 및 이용 등에 관한 기록</p></td>
                                                    <td><p align="left">3년</p></td>
                                                    <td><p align="left">신용정보의 이용 및 보호에 관한 법률</p></td>
                                                </tr>
                                                <tr>
                                                    <td><p align="left">표시/광고에 관한 기록</p></td>
                                                    <td><p align="left">6개월</p></td>
                                                    <td><p align="left">전자상거래 등에서의 소비자보호에 관한 법률</p></td>
                                                </tr>
                                                <tr>
                                                    <td><p align="left">이용자의 인터넷 등 로그기록/ 이용자의 접속지 추적자료<br>그 외의 통신사실 확인 자료</p></td>
                                                    <td><p align="left">3개월<br>12개월</p></td>
                                                    <td><p align="left">통신비밀보호법</p></td>
                                                </tr>
                                            </tbody></table>
                                        </ol>			   
                                    </div>
                                <!-- / policy영역 -->
                            </div>
                            <!-- / 약관box -->
                        </div>
                        <!-- / 삼성전자 개인정보 수집 이용 동의 -->
            
                        <!-- 삼성전자 선택적인 개인정보 수집 이용 동의 -->
                        <div class="term_b" style="float:left; width:100%;">
                            <h2><div class="input_b size_sm type1"><input type="checkbox" name="chkChoiceAgreementForSamSungChoicePersonalData" id="chkChoiceAgreementForSamSungChoicePersonalData" value="Y" class="agreement-samsung"><label for="chkChoiceAgreementForSamSungChoicePersonalData">삼성전자 멤버십 마케팅 정보 수신 <span>(선택)</span></label></div></h2>
                            <!-- 약관box -->
                            <div class="txt_a_new" style="/* background: #fff; */width: 94%;border: 0;">
                                <!-- policy영역 -->
                                <div class="policy_a">
                                    <h3 style="padding: 0 0 10px;">마케팅 정보 수신 동의</h3>
                                        <div>특별한 제안, 멤버십 혜택, 뉴스레터를 받아 보려면 이 옵션을 실행하세요.<br><br>
                                        삼성전자는 아래와 같이 개인정보 처리 업무를 외부 전문업체에 위탁하여 처리하고 있습니다. 마케팅 정보를 받는 데 동의하면 아래와 같이 마케팅 활동 관련 업무를 수탁업체에 위탁하는 것에 대해서도 동의한 것으로 간주합니다. 마케팅 활동 및 관련 업무를 위한 위탁에 동의하지 않으시는 경우, 신제품 안내, 이벤트 소식 안내 및 참여, 혜택 적용 등이 제한됩니다.<br>
                                        </div>
                                        <!-- 160902 수정1 -->
                                        <table border="0" cellspacing="0" cellpadding="0" class="header_h">
                                            <colgroup>
                                                <col style="width:33%">
                                                <col style="width:33%">
                                                <col style="width:33%">
                                            </colgroup>
                                            <tbody><tr>
                                                <td><p align="center">구분</p></td>
                                                <td><p align="center">수탁업체의 명칭</p></td>
                                                <td><p align="center">위탁하는 업무의 내용</p></td>
                                            </tr>
                                            <tr>
                                                <td rowspan="2"><p align="left">마케팅 및<br>마케팅 관련 활동을 위한 업무위탁</p></td>
                                                <td><p align="left">㈜한국리서치, 마크로밀엠브레인</p></td>
                                                <td><p align="left">제품 소비자 만족도 및 사용행태 조사</p></td>
                                            </tr>
                                            <tr>
                                                <td width="500px;"><p align="left">제일기획㈜ 및 협력사<a href="http://membership.samsung.com/sec/PopCheillInfo" onclick="window.open(this.href, 'mywin','left=20,top=20,width=480,height=500,esizable=no,status=no,scrollbars=no,menubar=no'); return false;">(목록보기)</a>, ㈜지엠컴, (주)제3채널, (주)에프엠커뮤니케이션즈, ㈜유베이스, (주)데이타존, 대성전산(주), 빌포스트(주), 인포뱅크(주), ㈜케이디뱅크, 주식회사 디메이크</p></td>
                                                <td><p align="left">이벤트 대행 및 이벤트 문의 처리, 이벤트 관련 고지, 경품배송, DM발송, TM, 프로모션 대행 업무, 제세공과금처리</p></td>
                                            </tr>						
                                        </tbody></table>
                                        <!-- / 160902 수정1 -->	
                    
                                        <p><br>삼성전자 주식회사(이하 '삼성전자'라 합니다)는 최초 회원 가입 또는 서비스 이용 시 이용자로부터 아래와 같은 개인정보를 수집하고 있습니다. 귀하께서는 선택항목 수집·이용에 대한 동의를 거부하실 수 있으며, 이는 서비스 제공에 필수적으로 제공되어야 하는 정보가 아니므로 동의를 거부하시더라도 회원 가입, 서비스 이용, 홈페이지 이용 등이 가능합니다. 다만 선택항목 수집·이용에 대하여 동의하지 않으실 경우, 이벤트 참여 및 판촉 안내 등 서비스에 제한이 있을 수 있습니다.</p>
                                        <div>
                                            <ol>
                                                <li>
                                                <h3>수집항목</h3>
                                                • 가입사유, 직업<br>
                                                • 가구정보 [배우자 성명, 배우자 생년월일, 자녀 성명, 자녀 성별, 자녀 생년월일]<br>
                                                ※ 배우자 및 자녀의 개인정보는 이용자가 적법하게 이를 수집하였다는 것을 전제로 합니다.<br>
                                                • 마케팅 활동ㆍ이벤트 관련 정보[마케팅활동 내용 및 결과, 이벤트참여 내용 및 결과]<br>
                                                • 쿠폰/이벤트코드 보유 및 사용, 경품선택/수령결과<br>
                                                • 제휴사 및 제휴가맹점 관련정보 [제휴사명, 제휴사 회원번호, 제휴사 회원가입일, 이벤트 참여일, 제휴사 관련 혜택 및 마케팅활동 정보]<br>
                                                ※ 제휴사는 삼성전자와 고객에 대한 상품 및 서비스 안내 등과 관련하여 제휴 계약을 체결한 자를 의미합니다.<br>
                                                </li>
                                                <li>
                                                <h3>수집목적</h3>
                                                <table border="0" cellspacing="0" cellpadding="0" class="header_h">
                                                    <colgroup>
                                                        <col style="width:50%">
                                                        <col style="width:50%">
                                                    </colgroup>
                                                    <tbody><tr>
                                                        <td><p align="center">구분</p></td>
                                                        <td><p align="center">자세한내용</p></td>
                                                    </tr>
                                                    <tr>
                                                        <td><p align="center">⑤ 마케팅에 활용<br>(선택항목에 한함)</p></td>
                                                        <td><p align="left">• 당사 및 제휴사의 상품ㆍ서비스, 사은ㆍ판촉행사, 이벤트 등의 마케팅 활동 안내 및 이용권유 (SMS·DM·TM·Email, Push-mail, 푸쉬메시지 발송)<br>
                                                        • 고객에 대한 맞춤형 서비스, 편의 제공 및 이벤트 경품배송<br>
                                                        • 시장조사, 고객만족도조사, 상품ㆍ서비스 개발연구, 고객별 통계분석자료 활용<br>
                                                        </p></td>
                                                    </tr>
                                                </tbody></table>
                                                </li>
                    
                                                <li>
                                                <h3>보유 및 이용 기간</h3>
                                                회원의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다.<br>
                                                다만, 삼성전자는 관련법령의 규정에 의하여 개인정보를 보유할 필요가 있는 경우, 해당 법령에서 정한 바에 의하여 아래와 같이 개인정보를 보유할 수 있습니다.
                                                <table border="0" cellspacing="0" cellpadding="0" class="header_h">
                                                    <colgroup>
                                                        <col style="width:33%">
                                                        <col style="width:13%">
                                                        <col style="width:54%">
                                                    </colgroup>
                                                    <tbody><tr>
                                                        <td><p align="center">보유 항목</p></td>
                                                        <td><p align="center">보유기간</p></td>
                                                        <td><p align="center">법적 근거</p></td>
                                                    </tr>
                                                    <tr>
                                                        <td><p align="left">계약 또는 청약철회 등에 관련 기록</p></td>
                                                        <td><p align="left">5년</p></td>
                                                        <td><p align="left">전자상거래 등에서의 소비자보호에 관한 법률</p></td>
                                                    </tr>
                                                    <tr>
                                                        <td><p align="left">대금결제 및 재화 등의 공급에 관한 기록</p></td>
                                                        <td><p align="left">5년</p></td>
                                                        <td><p align="left">전자상거래 등에서의 소비자보호에 관한 법률</p></td>
                                                    </tr>
                                                    <tr>
                                                        <td><p align="left">소비자의 불만 또는 분쟁처리에 관한 기록</p></td>
                                                        <td><p align="left">3년</p></td>
                                                        <td><p align="left">전자상거래 등에서의 소비자보호에 관한 법률</p></td>
                                                    </tr>
                                                    <tr>
                                                        <td><p align="left">신용정보의 수집/처리 및 이용 등에 관한 기록</p></td>
                                                        <td><p align="left">3년</p></td>
                                                        <td><p align="left">신용정보의 이용 및 보호에 관한 법률</p></td>
                                                    </tr>
                                                    <tr>
                                                        <td><p align="left">표시/광고에 관한 기록</p></td>
                                                        <td><p align="left">6개월</p></td>
                                                        <td><p align="left">전자상거래 등에서의 소비자보호에 관한 법률</p></td>
                                                    </tr>
                                                    <tr>
                                                        <td><p align="left">이용자의 인터넷 등 로그기록/ 이용자의 접속지 추적자료<br>그 외의 통신사실 확인 자료</p></td>
                                                        <td><p align="left">3개월<br>12개월</p></td>
                                                        <td><p align="left">통신비밀보호법</p></td>
                                                    </tr>
                                                </tbody></table>
                                                </li>
                                                        <li>
                                                            <style>
                                                            .container{
                                                              position:relative;
                                                              display:block;

                                                            }
                                                            .cover{
                                                              width:100%;
                                                              height:100%;
                                                              background:transparent;
                                                              position:absolute;
                                                              z-index:2;
                                                              top:0;
                                                              left:0;
                                                              display:none;

                                                            }

                                                            .container.disable-checkbox .cover{
                                                              display:block;
                                                            }
                                                            </style>
                                                            (선택입력) 개인정보 유효기간 별도지정 요청<br /> 
                                                            정보통신망법 제29조 및 동법 시행령 제16조에서는, 정보통신망 서비스를 1년 동안 이용하지 않는 이용자의 개인정보를 파기 또는 분리저장ㆍ관리하도록 규정하고 있습니다. <br />
                                                            하지만 이용자는 수집된 개인정보를 파기 또는 분리저장ㆍ관리하여야 하는 개인정보 유효기간을 1년이 아니라 달리 설정할 것을 요청할 수 있습니다. <br />
                                                            <br/>개인정보 유효기간을<br/>
                                                            <div class="input_b size_sm type1" style="margin: 10px 0 0px 21px;">
                                                                <input type="hidden" name="sMembershipPeriod" id="sMembershipPeriod" />
										                        <div class="ez-checkbox">
											                        <div class="ez-checkbox"><div class="ez-checkbox"><input name="chkChoiceAgreementForSamSungChoiceYearlData" type="checkbox" id="Checkbox1" value="R" class="ez-hide SamSungChoiceYear not-chk" checked></div></div>
										                        </div>
										                        <label for="chkChoiceAgreementForSamSungChoiceYearlData" style="font-size: 14px;">삼성전자멤버십 탈퇴 시까지</label>
                                                                  <span class="container disable-checkbox">
                                                                      <!--<div class="cover"></div>-->
                                                                      <input name="chkChoiceAgreementForSamSungChoiceYearlData" type="checkbox" id="Checkbox2"  class="ez-hide SamSungChoiceYear not-chk" value="5">5년  <input name="chkChoiceAgreementForSamSungChoiceYearlData" type="checkbox" id="Checkbox3"  class="ez-hide SamSungChoiceYear not-chk" value="3">3년  <input name="chkChoiceAgreementForSamSungChoiceYearlData" type="checkbox" id="Checkbox4" class="ez-hide SamSungChoiceYear not-chk" value="1">1년 으로 요청합니다.

                                                                  </span>
									                        </div>
                                                        </li>

                                            </ol>
                                        </div>
                        
                                    </div>
                                <!-- / policy영역 -->
                            </div>
                            <!-- / 약관box -->
                        </div>
                        <!-- / 삼성전자 선택적인 개인정보 수집 이용 동의 -->

                        <!-- 삼성전자 개인정보 제3자 제공 동의 -->
                        <div class="term_b">
                            <h2><div class="input_b size_sm type1"><input type="checkbox" name="chkChoiceAgreementForSamSungThirdParty" id="chkChoiceAgreementForSamSungThirdParty" value="Y" class="agreement-samsung"><label for="chkChoiceAgreementForSamSungThirdParty">삼성전자 멤버십 개인정보 제3자 제공 <span>(선택)</span></label></div></h2>
                            <!-- 약관box -->
                            <div class="txt_a_new" style="/* background: #fff; */width: 95%;border: 0;">
                                <!-- policy영역 -->
                                <div class="policy_a">
                                        <h3>개인정보 제3자 제공 동의</h3>
                                        <br>삼성전자는 수집된 개인정보를 이용자의 동의가 있는 경우에 한하여 아래와 같이 제3자에 제공하고 있습니다. 귀하께서는 귀하의 개인정보를 제3자에게 제공하는 것에 대한 동의를 거부하실 수 있으나, 동의를 거부하실 경우 이벤트 소식 안내 및 참여, 혜택 적용, 판촉 안내 등 서비스에 제한이 있을 수 있습니다.<br>
                                        <table border="0" cellspacing="0" cellpadding="0" class="header_h">
                                            <colgroup>
                                                <col style="width:20%">
                                                <col style="width:40%">
                                                <col style="width:20%">
                                                <col style="width:20%">
                                            </colgroup>
                                            <tbody><tr>
                                                <td><p><strong>제공받는 자의 명칭 </strong></p></td>
                                                <td><p><strong>제공되는 개인정보 </strong></p></td>
                                                <td><p><strong>제공받는 자의 이용목적 </strong></p></td>
                                                <td><p><strong>보유 및 이용기간 </strong></p></td>
                                            </tr>
                                            <tr>
                                                <td><p align="left">-&nbsp; 삼성전자판매㈜, 삼성전자 대리점 <br>
                                                        &nbsp;&nbsp;(<a href="http://www.samsung.com/sec/support/location/supportServiceLocation.do?page=SHOP.LOCATION" target="_blank" title="새창띄움">목록보기</a>) </p>
                                                    <ul>
                                                        <li>※ 대리점 리스트가 추가 또는 변경되는 경우, 목록보기에 반영됩니다. (삼성판매 및 대리점의 경우, 고객께서 해당 매장에서 멤버십카드 발급, 구매상담, 제품 구입한 경우에 한하여 고객의 개인정보가 제공됩니다.)</li>
                                                    </ul>
                                                    <p align="left">-&nbsp; 홈플러스주식회사, 홈플러스테스코주식회사, 이마트, 백화점 (롯데, 현대, 신세계, 갤러리아, AK, 동아, 대구 등), 홈쇼핑, 온라인쇼핑몰 등 제휴 거래선</p>
                                                    <p align="left">※ 삼성전자 지정매장은 신규 또는 해지 등 계약 변경에 따라 변경될 수 있으며, 멤버십홈페이지 등을 통해 확인할 수 있습니다.</p>
                                                    </td>
                                                <td><p align="left">ㆍ이름, 본인인증기관으로부터의 인증결과값<br>
                                                        (CI:Connecting Information), 이메일주소(ID), 생년월일, 성별, 우편번호, 주소, 휴대전화번호<br>
                                                        ㆍ결혼 관련 정보 [결혼(예식)예정일, 예식장정보, 구매예정제품], 이사 관련 정보 [이사예정일, 이사예정평수, 구매예정제품, 이벤트신청일], 출산 관련 정보 [출산예정일, 임신 개월수, 자녀 수, 자녀 나이, 구매예정 및 관심제품, 이벤트 신청일]<br>
                                                        ※ 단, 결혼/이사/출산 관련 제휴처에서 가입하는 고객에 한하여 제공합니다.<br>
                                                        ㆍ재화ㆍ용역 구매정보 [구매품목 및 모델ㆍ서비스명, 구입처, 구입일시, 구입가격/수량, 제조번호, 상담내역]<br>
                                                        ㆍ포인트거래정보 [포인트카드정보, 포인트적립·사용액, 적립·사용내역, 적립·사용일시, 적립·사용처]<br>
                                                        ㆍ플러스 페이 결제일, 플러스 페이 신용카드 종류, 결제카드정보<br>
                                                        ※ 단, 플러스 페이 신청 고객에 한하여 제공합니다.<br>
                                                        ㆍ멤버십 무상SVC연장 대상 여부, 무상SVC연장 만료월, 무상SVC부족구매기한, 부족액<br>
                                                        ㆍ프리미엄 등급, 예상상위등급, 구매기한, 부족액<br>
                                                        ㆍ콜센터 상담 내역 및 상담 결과 [문의 일시, 내용 및 아웃바운드 TM 접촉, 내용]<br>
                                                        ㆍ서비스 수리 관련정보[수리모델명, 수리일자, 수리내용, 수리비용, 제조번호, 수리결과, 상담내역 ]<br>
                                                        ㆍ배송ㆍ이전설치 관련정보 [배송ㆍ이전설치모델명, 배송ㆍ이전 설치일자, 구매자명, 구매자(휴대)전화번호, 구매자 주소, 인수자 (휴대)전화번호, 인수자 주소, 배송ㆍ이전 설치 내용, 배송ㆍ이전설치결과, 제조번호<br>
                                                        ㆍ폐가전 관련정보 [폐가전 회수일시, 회수품목, 회수대수]<br>
                                                        ㆍ콜센터 상담 내역 및 상담 결과 [문의 일시, 내용 및 아웃바운드 TM 접촉, 내용]<br>
                                                        ㆍ가구정보 [자택전화번호, 반려동물 동거 여부 및 종류]<br>
                                                        ㆍ직업 [직장 전화번호, 결혼여부, 선호 매장]<br>
                                                        ㆍ관심 제품 고객 조사 결과<br>
                                                        ㆍ마케팅 활동ㆍ이벤트 관련 정보 [마케팅활동 내용 및 결과, 이벤트참여 내용 및 결과]<br>
                                                        ㆍ제휴사 및 제휴가맹점 관련정보 [제휴사명,  제휴사 회원번호, 제휴사 회원가입일, 이벤트 참여일, 제휴사 관련 혜택 및 마케팅활동 정보]<br>
                                                        ※ 제휴사는 삼성전자와 고객에 대한 상품 및 서비스 안내 등과 관련하여 제휴 계약을 체결한 자를 의미합니다.</p></td>
                                                <td><p>ㆍ 상품·서비스, 사은·판촉행사, 이벤트 등의 마케팅 활동 안내 및 이용권유<br>
                                                        ㆍ 시장조사, 고객만족도조사, 상품·서비스 개발연구, 고객별 통계분석자료 활용<br>
                                                        ㆍ 회원유치, 통신판매, 전화권유판매, 전화상담업무, SMS·DM·TM·E-mail·Push-mail 발송<br>
                                                        ㆍ TM·SMS·DM·E-mail·Push-mail 등을 통한 사은행사 안내</p></td>
                                                <td><p>제공 동의일로부터 개인정보의 제공 목적을 달성할 때까지</p></td>
                                            </tr>
                                            <tr>
                                                <td><p align="left">-&nbsp;고객이 사용하는<br>
                                                        &nbsp;&nbsp;카드사<a href="http://membership.samsung.com/sec/lnc/KoJointMemAgreementPop" onclick="window.open(this.href, 'mywin','left=20,top=20,width=800,height=350,toolbar=1,resizable=0'); return false;">(목록보기)</a> </p></td>
                                                <td><p align="left">ㆍ 구입일시, 구입가격, 결제수단정보, 결제카드정보 <br>
                                                        ※ 고객이 결제카드의 금융혜택 신청 시, 신청 건에 한하여 해당 결제 카드사에만 제공합니다.</p></td>
                                                <td><p>ㆍ 금융 프로그램 적용 </p></td>
                                                <td><p>제공 동의일로부터 개인정보의 제공 목적을 달성할 때까지 </p></td>
                                            </tr>
                                            <tr>
                                                <td valign="top"><p align="left">-&nbsp;㈜홀리스트, ㈜케이티씨에스, ㈜LG유플러스, ㈜청호나이스</p></td>
                                                <td valign="top"><p align="left">ㆍ 이름, 주소, 휴대전화번호, 제휴업체의 서비스 신청상품명, 설치 요청일, 본인인증기관으로부터의 인증결과값<br>
                                                        &nbsp;&nbsp;(CI:Connecting Information)</p></td>
                                                <td valign="top"><p align="left">ㆍ 제휴업체의 서비스 가입시 추가 포인트 제공</p></td>
                                                <td valign="top"><p align="left">이용 목적 달성시까지</p></td>
                                            </tr>
                                        </tbody></table>
                        
                                    </div>
                                <!-- / policy영역 -->
                            </div>
                            <!-- / 약관box -->
                        </div>
                        <!-- / 삼성전자 개인정보 제3자 제공 동의 -->
                    </div>
					<!-- / 약관box -->
				</div>
                <!-- 삼성전자 동의 -->

            </div>            
            <!--<div class="b_clear" style="margin-bottom: 2%;"></div>-->
                

                <!--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     20200702 회원약관 LG 추가     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-->

 			<div id="wrapLGAgreement" class="samsung_s" runat="server">
               <!-- LG 전자 동의 -->
                <div class="term_b">
                    <h2><div class="input_b size_sm type1"><input type="checkbox" name="chkChoiceAgreementForLGMembershipALL" id="chkChoiceAgreementForLGMembershipALL" value="Y"><label for="chkChoiceAgreementForLGMembershipALL">LG전자 멤버십 전체 이용 약관 동의 <span>(선택)</span></label></div></h2>
                    <!-- / LG전자 전체 동의 그룹-->
                    <!-- LG전자 멤버십 회원 이용 약관 -->
                    <div class="txt_a">
                        <div class="term_b" style="float:left; width:100%;">
                            <h2><div class="input_b size_sm type1"><input type="checkbox" name="chkChoiceAgreementForLGMembership" id="chkChoiceAgreementForLGMembership" value="Y"><label for="chkChoiceAgreementForLGMembership">LG전자 멤버십 회원 이용약관 <span>(선택)</span></label></div></h2>
                            <!-- 약관box -->
                            <div class="txt_a_new" style="/* background: #fff; */width: 95%;border: 0;">
                                <!-- policy영역 -->
                                <div class="policy_a">
                                    <h3 style="padding: 7px 0 7px 0;">제1조 (목적)</h3>
                                    본 약관은 엘지전자 주식회사(이하 '회사')가 운영하는 LG전자 멤버십 서비스의 이용과 관련한 제반 사항을 명확히 규정함으로써, 회원에 대한 고객서비스의 증진과 회원의 제반 권리 · 의무 및 관련 절차 등을 규정하는데 그 목적이 있습니다. 
                                    <h3>제2조 (용어의 정의)</h3>
                                    <ol>
                                        <li>본 약관에서 사용하는 용어의 정의는 다음과 같습니다.</li>
                                        <li>1. “LG전자 멤버십 서비스”(이하 ‘멤버십 서비스’)란 회원이 제품 구매 시 회사에서 규정한 기준에 따라 일정액을 멤버십 포인트로 환산하여 적립하며, 제품구매, 케어솔루션 요금 납부, A/S 비용 납부 등의 각종 서비스를 제공 받을 수 있도록 하는 포인트 서비스를 말합니다.</li>
                                        <li>2. “LG전자 멤버십 회원”(이하 '회원')이란 만14세 이상이며, 회사에게 회원 가입의사를 밝히고, 회사가 이를 승인하여 멤버십 카드를 발급함으로써 멤버십 서비스에 가입한 개인을 말합니다.</li>
                                        <li>3. “멤버십 서비스 가맹점”(이하 '가맹점')이란 회사와 적법한 방법과 절차에 따라 멤버십 서비스 가맹계약을 체결하여 제반 서비스를 공동으로 운영하기로 합의한 사업자를 의미합니다.</li>
                                        <li>
                                            <table border="0" cellspacing="0" cellpadding="0" class="header_h">
                                                <colgroup>
                                                    <col style="width:30%">
                                                    <col style="width:70%">
                                                </colgroup>
                                                <tbody>
                                                    <tr>
                                                        <td><p align="center">구분</p></td>
                                                        <td><p align="center">멤버십 서비스 가맹점</p></td>
                                                    </tr>
                                                    <tr>
                                                        <td><p align="center">오프라인 매장</p></td>
                                                        <td><p align="center">베스트샵 등</p></td>
                                                    </tr>
                                                    <tr>
                                                        <td><p align="left">온라인몰</p></td>
                                                        <td><p align="left">LG전자 베스트샵 온라인몰 (www.lgbestshopmall.co.kr)</p></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </li>
                                        <li>구체적인 가맹점 현황은 회사 및 가맹점의 사정에 따라 변경될 수 있으며, 회사는 현황 및 변경 사항을 회사의 대표사이트(www.lge.co.kr)를 통하여 공개합니다.</li>
                                        <li>4.“ 멤버십 포인트”란 회원이 가맹점에서 상품 구매 시 회사가 정한 기준에 따라 적법하게 부여 받은 포인트를 말합니다.</li>
                                    </ol>


                                    <h3>제 3 조 (이용계약의 성립)</h3>
                                    <ol>
                                        <li>1. 이용계약은 회원이 가맹점에서의 회원 가입신청서 작성 및 회사 대표사이트에서의 회원가입 시 본 약관 동의를 통해 가입신청의사를 밝힌 후 회사가 이를 승낙함으로써 성립합니다.</li>
                                        <li>2. 회사는 가입신청자의 신청에 대하여 서비스 이용을 승낙함을 원칙으로 합니다. 다만, 회사는 다음 각 호에 해당하는 신청에 대하여는 승낙을 하지 않거나 사후에 다음 각 호의 사유가 발생된 경우 회원에 대한 통지로 이용계약을 해지할 수 있습니다.</li>
                                        <li>① 가입신청자가 본 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우. 다만, 회원자격 상실 후 1년이 경과한 자로서 회사의 회원 재가입 승낙을 얻은 경우에는 예외로 함.</li>
                                        <li>② 회원가입시에 실명이 아니거나 타인의 명의를 이용한 경우</li>
                                        <li>③ 회원가입시에 허위의 정보를 기재하거나, 회사가 제시하는 내용을 기재하지 않은 경우</li>
                                        <li>④ 가입신청자가 만 14세 미만의 아동인 경우</li>
                                        <li>⑤ 이용자의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우</li>
                                        <li>3. 회사는 회원가입 시 본인확인과 기존 가입여부 확인을 위해 휴대폰 인증 등의 방법으로 실명확인 또는 본인인증을 요청할 수 있습니다.</li>
                                        <li>4. 회사는 회원에 대해 회사정책에 따라 등급별로 구분하여 서비스 내용에 차등을 둘 수 있습니다. 회원 등급에 따른 서비스 내용은 대표사이트에(www.lge.co.kr) 별도 안내할 예정입니다.</li>
                                    </ol>


                                    <h3>제 4 조 (회원정보의 변경)</h3>
                                    <ol>
                                        <li>1. 회원은 언제든지 서면, 전자우편, 전화(1544-7777), 대표사이트(www.lge.co.kr), 기타 개인정보 처리방침에 기재된 방법 등을 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다.</li>
                                        <li>2. 회원은 회원가입신청 시 기재한 사항이 변경되었을 경우 전항의 방법으로 회사에게 통지하여야 하며, 통지하지 아니하여 발생하는 불이익에 대해서는 회사가 책임을 지지 않습니다.</li>
                                    </ol>

                                    <h3>제 5 조 (회원의 의무)</h3>
                                    <ol>
                                        <li>1. 회원은 본 약관에서 규정하는 사항과 이용안내 또는 공지사항 등을 통하여 회사가 공지하는 사항을 준수하여야 하며, 회사의 업무에 방해되는 행위를 하여서는 안됩니다.</li>
                                        <li>2. 회원은 회사가 제공한 멤버십 서비스, 멤버십 포인트, 기타 멤버십 서비스가 제공하는 혜택을 이용하여 영업 활동을 할 수 없습니다.</li>
                                        <li>3. 회원은 멤버십 서비스의 이용권한, 보유하고 있는 멤버십 포인트, 기타 이용 계약상 지위를 타인에게 양도 또는 증여할 수 없으며, 이를 담보로 제공할 수 없습니다. 단, 포인트 선물하기 서비스를 이용하는 경우는 제외합니다.</li>
                                        <li>4. 회원이 전항을 위반한 경우 양도∙증여∙담보 제공한 멤버십 포인트는 소멸 처리되고, 회원은 멤버십 서비스에 따라 제공받은 혜택을 반환하여야 합니다.</li>
                                    </ol>

                                    <h3>제 6 조 (멤버십 포인트의 적립)</h3>
                                    <ol>
                                        <li>1. 회원은 가맹점에서 상품을 구매하거나 서비스를 이용할 경우 멤버십 카드를 제시하여 대금결제금액에 따라 정해진 멤버십 포인트를 적립 받을 수 있습니다. 단, 온라인몰 구매는 ‘LG전자 베스트샵 온라인몰 (www.lgbestshopmall.co.kr)’ 구매에 한해서만 적용됩니다. 이외의 온라인 구매 건 및 납품판매 건은 적립대상에서 제외됩니다.</li>
                                        <li>2. 회원은 멤버십 모바일 앱의 포인트 선물하기 기능을 사용하여 멤버십 회원간 합의에 따라 선물이 가능한 보유 포인트 내에서 1,000포인트 단위 또는 보유 포인트 전체를 주고 받을 수 있습니다.</li>
                                        <li>멤버십 포인트는 회원이 상품대금 결제 후 상품 배송이 완료된 때로부터 7일이 경과된 날에 적립됩니다. 단, 포인트 선물하기 서비스로 선물 받은 멤버십 포인트는 즉시 적립됩니다.</li>
                                        <li>회원이 구입한 상품의 구매를 취소한 경우 해당 멤버십 포인트의 적립은 취소되며, 만일 회원이 적립된 멤버십 포인트를 이미 사용하였거나 포인트 선물하기 서비스로 선물한 경우에는 사용 또는 선물한 멤버십 포인트에 상당하는 금원을 별도로 회사에 지급하여야 합니다.</li>
                                        <li>3. 멤버십 포인트 적립은 월 100만원, 년 200만원을 한도로 하며, 동일 행사 및 동일 모델에 대해서는 1건을 초과하여 적립할 수 없습니다.</li>
                                        <li>포인트 선물하기 서비스를 통한 멤버십 포인트 선물하기, 선물받기는 각 월 2회로 한정하며 금액에는 한도가 없습니다.</li>
                                        <li>4. 회사는 멤버십 포인트의 운영기준 및 적립률을 회사 대표사이트에 게시합니다. 적립률은 회사와 가맹점의 사정에 따라 조정될 수 있으며, 조정 시 본 약관 제15조 제1항의 방법에 의해 고지됩니다.</li>
                                    </ol>

                                    <h3>제 7 조 (멤버십 포인트의 사용)</h3>
                                    <ol>
                                        <li>1. 회원은 가맹점에서 상품 구매시 구매대금의 일부 또는 전부를 적립된 멤버십 포인트로 결제하거나, 회원이 회사와 케어솔루션 계약 또는 케어십 서비스 계약을 체결한 경우에는 케어솔루션 요금 또는 서비스 비용을 적립된 멤버십 포인트로 결제할 수 있습니다. 단, 멤버십 포인트 사용분에 대해서는 멤버십 포인트가 재적립되지 않습니다.</li>
                                        <li>멤버십 모바일 앱의 포인트 선물하기 기능을 사용하여 멤버십 회원간 합의에 따라 선물이 가능한 보유 포인트 내에서 1,000포인트 단위 또는 보유 포인트 전체를 주고 받을 수 있습니다</li>
                                        <li>2. 회원이 멤버십 포인트 사용 시 1멤버십 포인트는 1원으로 환산됩니다. 단, 회사는 환산비율을 변경할 수 있으며 변경 시에는 본 약관 제15조제1항의 방법으로 고지합니다.</li>
                                        <li>3. 회원은 가맹점에서 멤버십카드 제시 시 회사와 가맹점 사이에 체결한 계약 또는 업무협약에 따라 별도의 혜택을 받을 수 있습니다.</li>
                                    </ol>

                                    <h3>제 8 조 (멤버십 포인트의 정정, 취소 및 소멸)</h3>
                                    <ol>
                                        <li>1. 멤버십 포인트의 적립 및 사용에 오류가 있을 경우, 회원은 오류발생 시점부터 90일 이내에 회사에 정정 신청을 하여야 하며, 회사는 회원의 정정 신청일로부터 3개월 이내에 조정할 수 있습니다. 단, 회원은 오류를 증명할 수 있는 영수증 등 해당 자료를 회사에 제시하여야 합니다.</li>
                                        <li>2. 전항의 정정신청이 정당한 것으로 판명된 경우 회사는 오류 포인트를 정정하고 그 결과를 회원에게 통보합니다.</li>
                                        <li>3. 회원이 부당한 방법으로 멤버십 포인트를 적립, 사용한 경우 회사는 해당 멤버십 포인트의 적립을 취소할 수 있으며, 부당 사용부분에 대해서는 부당이득 반환 청구 또는 손해배상 청구를 할 수 있습니다.</li>
                                        <li>제2항에 따라 멤버십 포인트 적립 취소를 통보하는 경우 회원은 통보를 받은 날로부터 90일 이내에 서면으로 이의를 제기할 수 있으며, 기한 내에 이의가 없는 경우에는 회원이 멤버십 포인트 적립 취소에 동의한 것으로 봅니다.</li>
                                        <li>4. 대금 결제 또는 회사에서 운영하는 이벤트에 의해 적립된 멤버십 포인트의 사용기간은 적립일로부터 3년이며, 이 기간 내에 사용하지 않은 멤버십 포인트는 3년이 경과한 시점에 순차적으로 자동 소멸됩니다. 단, 회원의 자격은 계속 유지 됩니다.</li>
                                        <li>5. 회원간 합의에 의해 포인트 선물하기 기능을 통해 적립된 포인트의 사용기간은 본래 가지고 있던 포인트의 잔여 소멸기간에 상관없이 3년이며, 이 기간 내에 사용하지 않은 멤버십 포인트는 3년이 경과한 시점에 순차적으로 자동 소멸 됩니다. (단, 회원의 자격은 계속 유지됩니다)</li>
                                    </ol>
                                    
                                    <h3>제 9 조 (멤버십카드의 이용 및 관리)</h3>
                                    <ol>
                                        <li>1. 멤버십카드는 회원 본인이 직접 사용하여야 하며, 타인에게 대여하거나 양도 또는 담보의 목적으로 이용할 수 없습니다.</li>
                                        <li>2. 멤버십카드는 회원 스스로의 책임하에 관리하여야 하며, 회원의 고의 또는 과실로 멤버십카드가 훼손, 분실, 도단 등의 사고가 발생한 경우, 회원은 즉시 그 사실을 회사에 통지하여야 합니다.</li>
                                        <li>3. 회원으로부터 전항에 따른 통지를 받은 경우, 회사는 즉시 사고 등록 및 당해 멤버십카드의 사용을 중지하는 등의 필요한 제반 조치를 취합니다. 단, 회사는 당해 회원이 전항에 따른 통지를 한 시점 이전에 발생한 손해에 대해서는 회사의 고의∙과실이 없는 경우 어떠한 책임도 지지 않습니다.</li>
                                    </ol>

                                    <h3>제 10 조 (멤버십 서비스 중지 및 종료)</h3>
                                    <ol>
                                        <li>1. 회사는 본 약관에서 정하는 바에 따라 계속적이고 안정적인 멤버십 서비스의 제공을 위하여 지속적으로 노력하며, 설비에 장애가 생기거나 멸실 된 때에는 지체 없이 이를 수리 복구하여야 합니다. 다만, 천재지변, 비상사태 또는 그 밖에 부득이한 경우에는 멤버십 서비스를 일시 중지하거나 종료할 수 있습니다.</li>
                                        <li>2. 멤버십 서비스를 종료하고자 할 경우 회사는 멤버십 서비스를 종료하고자 하는 날로부터 3개월 이전에 본 약관 제15조 제1항에 규정된 통지방법을 준용하여 회원에게 알려드립니다.</li>
                                        <li>3. 서비스 종료일까지 사용하지 않은 멤버십 포인트는 자동으로 소멸됩니다.</li>
                                    </ol>

                                    <h3>제 11 조 (LG전자 VIP회원)</h3>
                                    <ol>
                                        <li>1. 회사는 회사가 정한 기준에 따라 매년 LG전자 VIP회원(이하 “VIP회원”)을 선정하며, VIP회원으로 선정된 회원은 당해 년도에 한해 VIP카드와 함께 회사가 제공하는 각종 VIP 서비스를 제공받을 수 있습니다.</li>
                                        <li>2. VIP회원의 선정기준은 회사의 내부 기준에 따라 매년 변경되며, VIP회원 선정 기준, 등록방법 및 카드 교체방법은 본 약관 제15조 제1항에 규정된 통지방법을 준용하여 회원에게 알려드립니다.</li>
                                        <li>3. VIP회원에 대한 혜택은 본 약관 제15조 제1항에 규정된 통지방법을 준용하여 통지되며, 본 혜택은 회사 사정에 따라 변경될 수 있습니다.</li>
                                    </ol>

                                    <h3>제 12 조 (회원탈퇴 및 자격상실/계약해지)</h3>
                                    <ol>
                                        <li>1. 회원은 언제든지 서면, E-MAIL, 전화, 대표사이트, 기타 회사가 정하는 방법으로 회원탈퇴를 요청할 수 있으며, 회사는 회원의 요청에 따라 조속히 회원 탈퇴에 필요한 제반절차를 수행합니다. 단, 회사 대표사이트를 통하여 회원으로 가입한 경우, 회사 대표사이트 내 회원 탈퇴는 별도로 회사 대표사이트에서 직접 탈퇴신청을 하여야 탈퇴절차가 완료됩니다.</li>
                                        <li>2. 회원이 다음 각 호의 사유에 해당하는 경우, 회사는 당해 회원에 대한 통보로서 회원의 자격을 상실(또는 계약 해지)시킬 수 있습니다.</li>
                                        <li>① 회원이 멤버십카드 가입 신청 시에 허위의 내용을 등록한 경우</li>
                                        <li>② 회원이 본 약관 제5조의 회원의 의무를 위반했을 경우</li>
                                        <li>③ 회원이 회사가 정하지 않은 방법으로 멤버십카드를 부정 발급하거나, 멤버십카드서비스와 포인트를 부정한 방법으로 사용 및 적립한 경우</li>
                                        <li>3. 회원이 사망한 경우에는 별도의 통보 없이 자격이 상실됩니다.</li>
                                        <li>4. 본 조 제2항의 사유로 회원 자격이 상실된 회원은 본 조 제2항 각호의 사유가 자신의 고의 또는 과실에 기한 것이 아님을 소명할 수 있습니다. 이 경우 회사는 회원의 소명 내용을 심사하여 회원의 주장이 타당하다고 판단하는 경우 회원으로 하여금 정상적으로 멤버십 서비스를 이용할 수 있도록 할 수 있습니다.</li>
                                        <li>5. 회원탈퇴 또는 자격의 상실이 확정될 경우, 그 때까지 사용하지 않은 잔여 멤버십 포인트는 함께 소멸됩니다.</li>
                                    </ol>


                                    <h3>제 13 조 (손해배상)</h3>
                                    <ol>
                                        <li>1. 회사와 회원은 본 약관의 규정을 위반함으로 인하여 상대방에게 손해가 발생한 경우, 발생한 모든 손해를 배상하여야 합니다.</li>
                                        <li>2. 회원이 멤버십 서비스를 이용함에 있어 행한 불법행위나 본 약관 위배행위로 인하여 회사가 회원 이외의 제3자로부터 손해배상 청구 또는 소송을 비롯한 각종 이의제기를 받은 경우 회원은 자신의 책임과 비용으로 회사를 면책시켜야 하며, 회사가 면책되지 못한 경우 당해 회원은 그로 인하여 회사에 발생한 모든 손해를 배상하여야 합니다.
                                    </ol>

                                    <h3>제 14 조 (면책사항)</h3>
                                    <ol>
                                        <li>1. 회사는 천재지변 또는 이에 준하는 불가항력으로 인하여 멤버십 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.</li>
                                        <li>2. 회사는 회원의 귀책사유로 인한 서비스 이용의 장애에 대하여 책임을 지지 않습니다.</li>
                                        <li>3. 회사는 회원이 서비스를 이용하여 기대하는 수익을 상실한 것이나 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않습니다.</li>
                                        <li>4. 회사는 서비스 이용과 관련하여 회원에게 발생한 손해 가운데 회원의 고의, 과실에 의한 손해에 대하여 책임을 지지 않습니다.</li>
                                        <li>포인트 선물하기 서비스는 LG전자 멤버십 서비스를 이용하시는 회원님께 다양한 혜택을 드리기 위하여 제공하는 서비스로 시스템 오류를 제외한 포인트 선물하기에 따른 회원간 분쟁 또는 잘못된 정보 입력에 따른 선물하기 오류에 대해서는 책임을 지지 않습니다.</li>
                                    </ol>

                                    <h3>제 15 조 (서비스의 변경 및 약관개정)</h3>
                                    <ol>
                                        <li>1. 멤버십 서비스의 내용이 변경되거나 본 약관을 개정하고자 할 경우 회사는 변경된 서비스 또는 개정된 약관을 적용하고자 하는 날(이하“효력발생일”)로부터 7일 이전에 약관이 개정된다는 사실과 개정된 내용 등을 E-MAIL, 서면, 가맹점 내 게시, SMS 통지, 회사 인터넷 홈페이지 게시 중 1가지 이상의 방법으로 회원에게 고지하여 드립니다. 다만, 회원에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다.</li>
                                        <li>2. 회사가 E-MAIL 통보 또는 서면통보의 방법으로 본 약관이 개정된 사실 및 개정된 내용을 회원에게 고지하는 경우에는 회원이 회사에 기 제공한 E-MAIL이나 주소지 중 가장 최근에 제공된 E-MAIL 또는 주소지로 통보합니다.</li>
                                        <li>3. 본 조의 규정에 의하여 개정된 약관(이하“개정약관”)은 원칙적으로 그 효력 발생일로부터 장래를 향하여 유효합니다.</li>
                                        <li>4. 본 약관의 개정과 관련하여 이의가 있는 회원은 회원탈퇴를 할 수 있습니다. 단, 이의가 있음에도 불구하고 본 조 제1항 내지 제2항에 정해진 바에 따른 회사의 고지가 있은 후 30일 이내에 회원탈퇴를 하지 않은 회원은 개정 약관에 동의한 것으로 봅니다.</li>
                                        <li>5. 회원이 개정약관의 적용에 동의하지 않는 경우 회사는 개정 약관의 내용을 적용할 수 없으며, 이 경우 회사 및 회원은 이용계약을 해지할 수 있습니다.</li>
                                    </ol>

                                    <h3>제 16 조 (약관에서 정하지 아니한 사항)</h3>
                                    <ol>
                                        <li>본 약관에서 정하지 아니한 사항과 본 약관의 해석에 관하여는 관계법령 및 상관례에 따릅니다.</li>
                                    </ol>
                                    
                                    <h3>제 17 조 (관할법원)</h3>
                                    <ol>
                                        <li>본 약관에 따른 분쟁의 해결은 회원과 회사가 상호 협의하여 결정하며, 합의가 이루어지지 않을 경우 대한민국 민사소송법의 관할조항에 의한 관할법원에서 해결합니다.</li>
                                    </ol>

                                    <h3>[부칙]</h3>
                                    <ol>
                                        <li>본 약관은 2020년 4월 20일부터 시행합니다.</li>
                                    </ol>
                                </div>
                                <!-- / policy영역 -->
                            </div>
                            <!-- / 약관box -->
                        </div>
                        <!-- / LG전자 멤버십 회원 이용 약관 -->
                        
                        <!-- LG전자 개인정보 수집 이용 동의 -->
                        <div class="term_b">
                            <h2><div class="input_b size_sm type1"><input type="checkbox" name="chkChoiceAgreementForLGChoicePersonalData" id="chkChoiceAgreementForLGChoicePersonalData" value="Y"><label for="chkChoiceAgreementForLGChoicePersonalData">LG전자 멤버십 개인정보 처리방침 <span>(선택)</span></label></div></h2>

                            <!-- 약관box -->
                            <div class="txt_a_new" style="/* background: #fff; */width: 95%;border: 0;">
                                <!-- policy영역 -->
                                <div class="policy_a">
                                    LG전자(이하“회사”라 함)은 「정보통신망이용촉진 및 정보보호 등에 관한 법률」 및 「개인정보보호법」을 비롯한 모든 개인정보보호 관련 법률 및 규정을 준수하고 있으며 회사의 개인정보 처리방침을 별도로 제정하고 이를 준수함으로써 고객의 개인정보를 보호하고 있습니다. 회사는 개인정보 처리방침을 통하여 고객님의 개인정보가 어떠한 목적과 방식으로 수집ㆍ이용되고 있으며, 고객님의 개인정보보호를 위해 회사가 어떠한 조치를 취하고 있는지 알려드립니다.
                                    본 개인정보 처리 방침은 관련 법령의 개정이나 회사의 정책에 의해 변경될 수 있으므로 회사의 멤버십 사이트(https://www.lge.co.kr/lgekr/membership)나 매장 방문 이용 시에 수시로 확인하여 주시기 바랍니다.	
                                    <ol>
                                        <li>
                                            <h3>1. 처리하는 개인정보의 항목</h3>
                                            <h3>가. 수집하는 개인정보 항목</h3>
                                            <ol>
                                                <li>• 제품 구매계약서(고객주문서 또는 판매전표 등)</li>
                                                <li>- 계약자 수집 필수 항목 : 성명, 연락처(유선/휴대폰), 주소</li>
                                                <li>- 인수자 수집 필수 항목 : 성명, 연락처(유선/휴대폰), 주소</li>
                                            </ol>
                                            <ol>
                                                <li>• LG전자 멤버십 가입 신청서</li>
                                                <li>- 필수항목 :성명, 주소, 전화번호, 휴대폰번호, 성별, 내/외국인 구분, 통신사, 본인확인정보(CI/DI), 멤버십ID, 멤버십 카드번호, 멤버십 포인트</li>
                                                <li>- 선택항목 :고객관심활동, 결혼여부, 고객구분</li>
                                            </ol>
                                            <ol>
                                                <li>• 모바일 LG전자 멤버십 가입 신청</li>
                                                <li>- 필수 항목 : 성명, 주소, 휴대폰번호, 생년월일, 성별, 내/외국인 구분, 통신사, 본인확인정보(CI/DI), 멤버십ID, 멤버십 카드번호, 멤버십 포인트</li>
                                                <li>- 선택 항목 : 고객구분</li>
                                                <li>※ LG전자 멤버십 앱 이용시 : "단말모델정보"</li>
                                            </ol>
                                            <ol>
                                                <li>• BEST SHOP 매장 상담 신청</li>
                                                <li>- 필수 항목 : 성명, 휴대폰번호</li>
                                            </ol>
                                            <ol>
                                                <li>• 웨딩클럽 모바일 멤버십 가입 신청</li>
                                                <li>- 필수 항목 : 성명, 주소, 휴대폰번호, 생년월일, 성별, 내/외국인 구분, 통신사, 본인확인정보(CI/DI), 결혼예정일, 멤버십ID, 멤버십 카드번호, 멤버십 포인트</li>
                                            </ol>
                                            <ol>
                                                <li>• 케어솔루션 계약서</li>
                                                <li>- 필수 항목 : 임차인 수집 항목: 성명, 연락처, 주소, 우편번호, 이메일, 신용카드/결제정보, 고유식별Key값, 본인확인정보(CI/DI) 인수자 수집 항목: 성명, 연락처(유선/휴대폰), 설치처 주소 제품</li>
                                            </ol>
                                            <ol>
                                                <li>• 구매/결제 또는 케어솔루션 계약 체결시 아래와 같은 결제정보들이 수집될 수 있습니다. (필수 항목)</li>
                                                <li>- 신용카드 결제 시: 카드사명, 카드번호, 유효기간</li>
                                                <li>- 계좌이체시: 은행명, 계좌번호, 정기출금일</li>
                                                <li>- 사은품 이용시: 주소, 전화번호</li>
                                            </ol>
                                            <ol>
                                                <li>• 제품구매 시 유료 서비스 이용 과정에서 아래와 같은 결재 정보들이 수집될 수 있습니다. (필수 항목)</li>
                                                <li>- 신용카드 결제 시: 카드사명, 카드번호, 카드소유자명, 유효기간</li>
                                                <li>- 휴대전화 결제 시: 이동전화번호, 통신사, 가입자 이름, 결제승인번호</li>
                                                <li>- 계좌이체 시: 은행명, 계좌번호, 예금주명, 정기출금일</li>
                                                <li>- 사은품 이용 시: 주소, 전화번호, 성명</li>
                                            </ol>
                                            <ol>
                                                <li>• VIP 멤버십 가입 신청서</li>
                                                <li>- 필수 항목 : 성명, 전화번호, 핸드폰, 주소, 생년월일</li>
                                            </ol>
                                            <ol>
                                                <li>• 경품/이벤트 응모권</li> 
                                                <li>- 필수 항목 : 성명, 주소, 전화번호, 휴대폰번호</li>
                                            </ol>
                                            <ol>
                                                <li>• LG전자 멤버십 가입 기간 내 BEST SHOP 매장에서의 제품 구매 정보, 멤버십 포인트의 적립/사용/소멸에 관한 정보, 사은품/캐시백 지급 정보, 판촉 실행 및 결과 정보</li>
                                                <li>※ 개인정보 수집 시 필수 항목의 수집ㆍ이용에 대한 동의를 거부하실 수 있으며, 동의를 거부하실 경우 서비스 이용이 제한 될 수 있습니다. 선택 항목의 수집ㆍ이용 동의를 거부 하실 경우에는 서비스 이용은 제한되지 않습니다.</li>
                                            </ol>

                                            <h3>나. 개인정보 수집방법 </h3>
                                            <ol>
                                                <li>서면양식, 전화, 팩스, 웹사이트, 모바일, 이벤트 참여를 통한 수집, 로그 분석 프로그램을 통한 자동 로그 수집, 제휴사로부터의 제공 등 이용자의 개인정보 수집은 적법하고 공정한 방법에 의해서만 수집되며 회사의 업무 서비스 제공 外, 기타 업무 목적으로는 수집ㆍ이용하지 않습니다.</li>
                                            </ol>	
                                        </li>
                                        <li>
                                            <h3>2. 처리하는 개인정보의 목적</h3>
                                            <ol>
                                                <li>회사는 구매계약, 서비스 계약, 회원 확인, 케어솔루션 계약 체결 및 유지판단 여부를 위한 신용정보조회 및 신용판단, 제품배송/설치, 유지보수, 콜센터 상담운영, 자동납부 및 요금정산업무, 이용대금 결제, 제품 마케팅/판촉업무(신상품, 이벤트 안 내, 경품 배송) 및 통계 분석을 통한 마케팅 자료로써 고객의 취향에 맞는 최적의 서비스를 제공하기 위한 목적으로 필요한 최소한의 고객 개인정보만을 수집 이용하고 있습니다. 수집하는 개인정보 항목에 따른 구체적인 처리 목적은 다음과 같습니다.</li>
                                                <h3>개인정보 수집 및 이용 목적 안내사항</h3>
                                                <table border="0" cellspacing="0" cellpadding="0" class="header_h">
                                                    <colgroup>
                                                        <col style="width:30%">
                                                        <col style="width:70%">
                                                    </colgroup>
                                                    <tbody>
                                                        <tr>
                                                            <td><p align="center">처리 정보</p></td>
                                                            <td><p align="center">처리 목적</p></td>
                                                        </tr>
                                                        <tr>
                                                            <td><p align="left">성 명</p></td>
                                                            <td><p align="left">제품배송, 제품설치 및 회수, 고객상담, 접수 등 계약 이행을 위한 제반업무, 멤버십 회원제 서비스 제공, 케어솔루션 서비스계약 체결에 따른 본인 확인, 케어솔루션 청약 시 신용정보 조회, 고객지향적 마케팅 각종 판촉행사 행사 제 품안내</p></td>
                                                        </tr>
                                                        <tr>
                                                            <td><p align="left">주소, 우편번호,전화번호, 핸드폰번호성별, 생년월일</p></td>
                                                            <td><p align="left">제품배송, 제품설치 및 회수, 콜센터 상담운영, 접수 등 계약 이행을 위한 제반 업무, 민원처리, 케어솔루션 정기 유지관리 방문서비스, 본인 실명 확인, 케어솔루션 신규 서비스 및 신상품/이벤트 안내, 고객지향적 마케팅, 각종 판촉 행사 및 경품배송, 행사 제품안내, 고객만족도 조사 </p></td>
                                                        </tr>
                                                        <tr>
                                                            <td><p align="left">이메일</p></td>
                                                            <td><p align="left">회사 개인정보처리방침/약관 변경사항 고지, 신규 서비스 및 신상품/이벤트 안내, 마케팅/광고 활용, 전자세금계산서 발행</p></td>
                                                        </tr>
                                                        <tr>
                                                            <td><p align="left">신용카드번호,카드사명,카드소유자명,유효기간, 계좌번호,은행명,예금주명,정기출금일, 이동전화번호,통신사,가입자이름,결제승인번호</p></td>
                                                            <td><p align="left">결제 정보 처리, 케어솔루션 요금 수납/이체</p></td>
                                                        </tr>
                                                        <tr>
                                                            <td><p align="left">본인확인정보(CI/DI)</p></td>
                                                            <td><p align="left">본인확인을 위한 암호화된 식별 코드</p></td>
                                                        </tr>
                                                        <tr>
                                                            <td><p align="left">고객구분</p></td>
                                                            <td><p align="left">타겟 판촉 시 고객을 구분하기 위함/ 고객지향적 마케팅 각종 판촉 행사 제품안내</p></td>
                                                        </tr>
                                                        <tr>
                                                            <td><p align="left">멤버십ID, 멤버십 카드번호, 멤버십 포인트</p></td>
                                                            <td><p align="left">LG전자 LG페이 서비스를 위한 멤버십 정보 제공</p></td>
                                                        </tr>
                                                        <tr>
                                                            <td><p align="left">단말모델정보(멤버십 앱 이용시)</p></td>
                                                            <td><p align="left">고객지향적 마케팅 및 각종 판촉업무(신상품, 이벤트 안내)</p></td>
                                                        </tr>
                                                        <tr>
                                                            <td><p align="left">제품 구매정보</p></td>
                                                            <td><p align="left">이용 정보 분석에 활용 (서비스 제공, 서비스 품질 개선, 신규 서비스 개발 및 고객 지향적 서비스/제품 등의 정보 제공을 위한 서비스 이용에 대한 통계적 분석)</p></td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </ol>
                                        </li>
                                        <li>
                                            <h3>3. 개인정보의 처리 및 보유기간</h3>
                                            <ol>
                                                <li>회사는 법령에 따른 개인정보 보유ㆍ이용기간 또는 개인정보 수집 시에 동의 받은 개인정보 보유.이용기간 내에서 개인정보를 처리.보유 하며, 동의철회 요구 시 지체없이 삭제 합니다. 고객의 정보 조회, 수정 또는 동의철회를 위해서는 제품을 구매하신 매장 또는 개인정보보호 책임자에게 연락하여 주십시오. 다만, 처리목적 또는 제공 받은 목적이 달성된 경우에도 상법 등 법령의 규정에 의하여 보존할 필요성이 있는 경우에는 고객의 개인정보를 보존할 수 있습니다.</li>
                                                <li>- 상법 등 법령의 규정에 의하여 보존할 필요성이 있는 경우</li>
                                                <li>- 대금결제 및 재화 등의 공급에 관한 기록: 5년</li>
                                                <li>- 납세 증거에 관한 기록: 5년</li>
                                                <li>- 개별적으로 고객의 동의를 받은 경우</li>
                                                <li>- 계약 또는 청약철회 등에 관한 기록: 5년</li>
                                                <li>- 소비자 불만 또는 분쟁처리에 관한 기록: 3년</li>
                                                <li>- 정당한 절차에 따라 보유기간을 미리 고객에게 고지하거나 명시한 경우</li>
                                                <li>- 표시/광고에 의한 기록 : 6개월</li>
                                                <li>- 신용정보의 수집처리 및 이용등에 관한 기록 3년</li>
                                            </ol>

                                            <h3>4. 개인정보 파기에 관한 사항</h3>
                                            <h3>가. 파기절차</h3>
                                            <ol>
                                                <li>고객이 제공한 개인정보는 목적이 달성된 후 별도의 데이터베이스시스템으로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 따라(3. 개인정보의 처리 및 보유기간 참조) 일정 기간 저장된 후 파기됩니다. 동 개인 정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.</li>
                                            </ol>
                                            <h3>나. 파기방법</h3>
                                            <ol>
                                                <li>종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.</li>
                                                <li>전자적 파일 형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.</li>
                                            </ol>
                                            <h3>5. 개인정보 제3자 제공에 관한 사항</h3>
                                            <ol>
                                                <li>회사는 이용자의 동의가 있거나 관련 법령의 규정에 의한 경우를 제외하고는 어떠한 경우에도 「개인정보의 수집항목 및 수집목적」, 「개인정보의 처리목적」에서 고지한 범위를 넘어 이용자의 개인정보를 이용하거나 제3자에게 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.</li>
                                                <li>- 사전에 제3자 제공에 동의한 경우</li>
                                                <li>- 서비스 제공에 따른 요금정산을 위해 필요한 경우</li>
                                                <li>- 계약 이행을 위해 필요한 경우(배송/서비스 등)</li>
                                                <li>- 타인에게 정신적, 물질적 피해를 줌으로써 그에 대한 법적 조치를 취하기 위해 고객정보를 공개해야 한다고 판단되는 충분한 근거가 있는 경우</li>
                                                <li>- 통계작성, 마케팅분석 또는 시장조사를 위해 필요한 경우로 특정 개인을 식별할 수 없는 형태로 가공하여 외부 기관 또는 단체 등에 제공하는 경우</li>
                                                <li>- 서비스의 제공에 관한 계약의 이행을 위하여 필요한 개인정보로서 경제적/기술적인 사유로 통상의 동의를 받는 것이 현저히 곤란한 경우</li>
                                            </ol>
                                        </li>
                                        <li>
                                            <h3>6. 개인정보의 위탁에 관한 사항</h3>
                                            <ol>
                                                <li>회사는 서비스 향상을 위해서 아래와 같이 개인정보를 위탁하고 있으며, 관계 법령에 따라 위탁계약 시 개인정VXC              보가 안전하게 관리될 수 있도록 필요한 사항을 규정하고 있습니다. 회사의 개인정보 위탁처리 기관 및 위탁업무 내용은 아래와 같습니다.</li>
                                            </ol>
                                            <h3>개인정보 위탁업체와 위탁업무 대한 표</h3>
                                            <table border="0" cellspacing="0" cellpadding="0" class="header_h">
                                                <colgroup>
                                                    <col style="width:30%">
                                                    <col style="width:70%">
                                                </colgroup>
                                                <tbody>
                                                    <tr>
                                                        <td><p align="center">위탁 업체(수탁자)</p></td>
                                                        <td><p align="center">위탁업무 내용</p></td>
                                                    </tr>
                                                    <tr>
                                                        <td><p align="left">㈜하이프라자, LG전자 전문점 ㈜LG CNS</p></td>
                                                        <td><p align="left">제품판매, 고객관리, 마케팅/판촉, 멤버십 카드 발급/포인트 적립, 케어솔루션 청약관리, 신상품/이벤트 안내(TM/DM/SMS 등), 경품배송</p></td>
                                                    </tr>
                                                    <tr>
                                                        <td><p align="left">LG전자 서비스센터 [전체보기]</p></td>
                                                        <td><p align="left">LG전자 및 기타 계약 제품 A/S, 부품 판매</p></td>
                                                    </tr>
                                                    <tr>
                                                        <td><p align="left">㈜LG CNS</p></td>
                                                        <td><p align="left">시스템 운영/유지 보수, 이벤트 당첨자 상품 배송을 위한 고객정보 추출, 제품/기업 및 이벤트 홍보 메일 전송을 위한 고객정보 추출, 모바일 상품권 발송 관리, 오프 라인 멤버십/케어솔루션 계약서 스캔, 고객DM 업무 대행</p></td>
                                                    </tr>
                                                    <tr>
                                                        <td><p align="left">㈜범한판토스</p></td>
                                                        <td><p align="left">제품 구매에 따른 물품 배송 및 제품설치, 케어솔루션 계약 신청 대행</p></td>
                                                    </tr>
                                                    <tr>
                                                        <td><p align="left">하이엠솔루텍㈜ | 헬스케어 매니저</p></td>
                                                        <td><p align="left">본인확인을 위한 암호화된 식별 코드</p></td>
                                                    </tr>
                                                    <tr>
                                                        <td><p align="left">하이텔레서비스㈜</p></td>
                                                        <td><p align="left">콜센터 상담업무(배송/설치관련 고객문의응대), 만족도 조사(제품구매,배송설치,서비스) 및 해피콜</p></td>
                                                    </tr>
                                                    <tr>
                                                        <td><p align="left">NICE 평가정보㈜, ㈜LG유플러스</p></td>
                                                        <td><p align="left">본인 실명확인, 케어솔루션 청약시 신용정보 조회, 케어솔루션 계약 체결 및 유지판단 여부 </p></td>
                                                    </tr>
                                                    <tr>
                                                        <td><p align="left">미래신용정보㈜</p></td>
                                                        <td><p align="left">케어설계약 후 채무불이행 시 채권추심 활동</p></td>
                                                    </tr>
                                                    <tr>
                                                        <td><p align="left">㈜LG유플러스/금융결제원</p></td>
                                                        <td><p align="left">케어솔루션 요금 수납/이체, SMS/MMS/LMS 발송 대행</p></td>
                                                    </tr>
                                                    <tr>
                                                        <td><p align="left">㈜디제이커뮤니케이션즈</p></td>
                                                        <td><p align="left">DDM발송/수납정보 안내</p></td>
                                                    </tr>
                                                    <tr>
                                                        <td><p align="left">㈜리서치 랩, 한국리서치, 닐슨컴퍼니코리아(유), ㈜비엔알아이</p></td>
                                                        <td><p align="left">만족도 조사(제품구매,배송설치,서비스)</p></td>
                                                    </tr>
                                                    <tr>
                                                        <td><p align="left">CJ대한통운㈜/한진택배㈜/우체국택배</p></td>
                                                        <td><p align="left">제품 및 상품 배송</p></td>
                                                    </tr>
                                                    <tr>
                                                        <td><p align="left">㈜HS애드/누리원기획</p></td>
                                                        <td><p align="left">온라인 광고,캠페인 업무 대행, 이벤트 판촉 사은품 제공</p></td>
                                                    </tr>
                                                    <tr>
                                                        <td><p align="left">㈜유비피에스</p></td>
                                                        <td><p align="left">LG전자 멤버십/케어솔루션 계약서 스캔 및 보관업무</p></td>
                                                    </tr>
                                                    <tr>
                                                        <td><p align="left">㈜이마트/㈜겔럭시아커뮤니케이션즈</p></td>
                                                        <td><p align="left">모바일 상품권 발송</p></td>
                                                    </tr>
                                                    <tr>
                                                        <td><p align="left">㈜서브원, ㈜건영물류시스템, ㈜원은</p></td>
                                                        <td><p align="left">경품/사은품 배송 대행</p></td>
                                                    </tr>
                                                    <tr>
                                                        <td><p align="left">㈜인터비즈시스템</p></td>
                                                        <td><p align="left">제세공과금 처리</p></td>
                                                    </tr>
                                                    <tr>
                                                        <td><p align="left">㈜에버텍교역, ㈜뜨레상사, ㈜다온비즈, ㈜신풍, ㈜이엠케이</p></td>
                                                        <td><p align="left">소형 제품 설치 및 배송 대행</p></td>
                                                    </tr>
                                                    <tr>
                                                        <td><p align="left">㈜유세스파트너스</p></td>
                                                        <td><p align="left">TM 및 고객응대</p></td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </li>
                                        <li>
                                            <h3>7. 개인정보 자동 수집의 목적 및 거부에 관한 사항</h3>
                                            <ol>
                                                <li>가. 쿠키등 사용 목적</li>
                                                <li>- 이용자의 접속빈도 또는 머문 시간 등을 분석하여 이용자의 취향과 관심분야를 파악하여 서비스개선에 활용</li>
                                                <li>- 웹사이트 방문 품목들에 대한 정보와 관심 있게 둘러본 품목들에 대한 자취를 추적하여 다음 번 웹사이트 방문 때 제품 정보를 제공</li>
                                                <li>나. 쿠키 설정 거부 방법</li>
                                                <li>- 이용자는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 쿠키 설정을 거부하는 방법으로는 사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다.</li>
                                                <li>- 설정방법의 예시(웹 브라우저의 경우) : 웹 브라우저 상단의 도구 > 인터넷 옵션 > 개인정보에서 변경. 단, 이용자께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다.</li>
                                                <li>- 처리중인 개인정보가 인터넷 홈페이지, P2P, 공유설정 등을 통하여 권한이 없는 자에게 공개되지 않도록 개인정보처리 시스템 및 개인정보처리자의 PC를 설정합니다.</li>
                                                <li>- 개인정보 수집, 활용 및 파기 시 그에 대한 법률이 권고하는 기준(정보통신망 이용촉진 및 정보보호 등에 관한 법률 및 개인정보보호법 등 관련 법령)에 따라 수집한 근거를 남기도록 하고 있으며, 이와 관련하여 내부 정책과 프로세스를 규정하 고 교육을 실시합니다.</li>
                                                <li>- ActiveX 설정 거부 방법</li>
                                                <li>- 설정방법의 예시(웹 브라우저의 경우) : 웹 브라우저 상단의 도구 > 인터넷 옵션 > 개인정보에서 변경. 단, 이용자께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다.</li>
                                                <li>A. 이용자는 ActiveX 설치에 대한 선택권을 가지고 있습니다. ActiveX 설정을 거부하는 방법은 다음과 같습니다.</li>
                                                <li>1) 웹 브라우저 상단의 도구 > 인터넷 옵션 > 보안 탭 클릭하여 하단의 사용자 지정수준 클릭 > ActiveX 컨트롤 및 플러그 인 항목에서 아래와 같이 체크함 </li>
                                                <li>- 바이너리 및 스크립트 동작 => 사용안함</li>
                                                <li>- 서명 된 ActiveX 컨트롤 다운로드 => 사용안함</li>
                                                <li>- 스크립팅하기 안전하지 않은 것으로 표시된 ActiveX 컨트롤 초기화 및 스크립팅 => 사용안함</li>
                                                <li>- 스크립팅하기 안전한 것으로 표시된 ActiveX 컨트롤 스크립트 => 사용안함</li>
                                                <li>- ActiveX 컨트롤 및 플러그인 실행 => 사용안함</li>
                                                <li>- ActiveX 컨트롤을 자동으로 사용자에게 확인 => 사용안함</li>
                                                <li>2) 새 웹 브라우저 창을 여신 후, 다시 접속해 주시기 바랍니다. 접속이 원활하게 되지 않을 경우에는 바이러스 및 악성 코드 제거 프로그램으로 바이러스와 악성코드를 제거 후에 다시 시도해 주시기 바랍니다.</li>
                                                <li>LG전자 웹사이트에 광고를 게재하는 배너에서도 광고주나 마케팅회사에 의해 쿠키가 사용되는 경우도 있음을 알려드립니다. 이 경우 당해 쿠키는 시스템 관리와 광고주에게 제공할 통계 집계 등을 위하여 이용자들의 IP 주소를 모으기도 합니다. 당해 쿠키가 수집하는 개인정보에 관한 사항은 광고주나 마케팅회사의 개인정보보호방침에 따릅니다.</li>
                                                <li>8. 개인정보의 안전성 확보조치에 관한 사항</li>
                                                <li>회사는 고객의 개인정보를 처리함에 있어 개인정보가 분실, 도난, 유출, 변조 또는 훼손되지 않도록 안전성 확보를 위하여 다음과 같은 기술적/관리적 대책을 강구하고 있습니다.</li>
                                                <li>가. 해킹 등에 대비한 대책</li>
                                                <li>회사는 해킹이나 컴퓨터 바이러스 등에 의해 고객의 개인정보가 유출되거나 훼손되는 것을 막기 위해 최선을 다하고 있습니다. 개인정보의 훼손에 대비해서 자료를 수시로 백업하고 있고, 최신 백신프로그램을 이용하여 고객들의 개인정보나 자료 가 유출되거나 손상되지 않도록 방지하고 있으며, 암호화통신 등을 통하여 네트워크상에서 개인정보를 안전하게 전송할 수 있도록 하고 있습니다. 그리고 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있으며, 기타 시스템적으로 보 안성을 확보하기 위한 가능한 모든 기술적 장치를 갖추려 노력하고 있습니다.</li>
                                                <li>나. 처리 직원의 최소화 및 교육</li>
                                                <li>회사의 개인정보관련 처리 직원은 담당자에 한정시키고 있고 이를 위한 별도의 비밀번호를 부여하여 정기적으로 갱신하고 있으며, 담당자에 대한 수시 교육을 통하여 개인 정보 처리방침의 준수를 강조하고 있습니다.</li>
                                                <li>9. 정보주체의 권리, 의무 및 그 행사방법에 관한 사항</li>
                                                <li>고객은 언제든지 등록되어 있는 자신의 개인정보를 조회하거나 수정할 수 있으며 멤버십 등의 가입 해지를 요청할 수도 있습니다. 고객의 개인정보 조회, 수정을 위해서는 '개인 정보변경'(또는'고객정보 수정' 등)을, 멤버십 등의 가입 해지(동의철회)를 위해서는 “회원탈퇴”를 요청하여 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다. 혹은 개인정보보호 책임자에게 서면, 전화 또는 이메일로 연락하시면 지 체 없이 조치하겠습니다. 고객이 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3 자에게 이미 제공한 경우에는 정정 처리 결과를 제3자에게 지 체 없이 통지하여 정정이 이루어지도록 하겠습니다.</li>
                                                <li>회사는 고객 혹은 법정 대리인의 요청에 의해 해지 또는 삭제된 개인정보는 “개인정보의 보유 및 이용기간”에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.</li>
                                                <li>10. 개인정보의 열람청구를 접수, 처리하는 부서 및 개인정보보호 책임자</li>
                                                <li>고객은 회사의 서비스를 이용하면서 개인정보침해에 대한 신고 상담이 필요하신 경우에는 개인정보보호 책임자에게 전화 또는 이메일 등을 통해 연락을 주시면 신속히 처리해 드릴 수 있도록 하겠습니다.</li>
                                                <li>[개인정보보호책임자 신고 연락처]</li>
                                                <li>- 개인정보보호 책임자 : 개인정보 Compliance 팀장</li>
                                                <li>- 개인정보 운영책임자: B2C판촉CRM팀 팀장[B2C전문점], 하이프라자 CRM파트장 [하이프라자 지점]</li>
                                                <li>- 전화번호: 02-2673-0695[B2C전문점], 02-2164-0868[하이프라자 지점]</li>
                                                <li>- E-mail주소 : privacy@lge.com</li>
                                                <li>기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다</li>
                                                <li>- 개인정보 침해신고센터 : (국번없이)118 (http://privacy.kisa.or.kr)</li>
                                                <li>- 개인정보 분쟁조정위원회 :1833-6972 (http://www.kopico.go.kr)</li>
                                                <li>- 대검찰청 사이버수사과 : (국번없이)1301, cid@spo.go.kr (http://spo.go.kr)</li>
                                                <li>- 경찰청 사이버안전국 : (국번없이)182 (http://cyberbureau.police.go.kr)</li>
                                                <li>11. 고지의 의무</li>
                                                <li>현 개인정보처리방침 내용 추가, 삭제 및 수정이 있을 시에는 개정 최소 7일 전부터 이메일 또는 대표사이트(www.lge.co.kr)의 '공지사항'을 통하여 고지할 것입니다. 단, 개인정보의 제3자 제공, 수집ㆍ이용 목적 변경, 보유기간 변경 등 중요한 사항이 변경되는 경우에는 고객의 동의를 얻도록 하겠습니다.</li>
                                                <li>시행일자 : 2020년 4월 20일</li>
                                            </ol>
                                        </li>
                                    </ol>
                                </div>
                                <!-- / policy영역 -->
                            </div>
                            <!-- / 약관box -->
                        </div>
                        <!-- / LG전자 개인정보 수집 이용 동의 -->  
                    </div>
                </div>
            </div>
                <!-- / LG전자 동의 -->
                <!--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   20200702 회원약관 LG 추가   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-->



					<!-- 까사미아 동의 20211130 추가 -->
					<div id="wrapCsAgreement" class="samsung_s" runat="server">
					<!--<h2><div class="input_b size_sm type1"><input type="checkbox" name="chkChoiceAgreementForMyomeeMembership" id="chkChoiceAgreementForMyomeeMembership" value="Y"><label for="chkChoiceAgreementForMyomeeMembership">롯데렌탈(묘미) 이용약관 동의 <span>(선택)</span></label></div></h2>-->

						<h2 style="overflow: hidden;text-align: left;	margin: 19px 0 13px 5px;">
							<div class="input_b size_sm type1">
								<div class="ez-checkbox">
									<div class="ez-checkbox"><div class="ez-checkbox"><div class="ez-checkbox"><input name="chkChoiceAgreementForCasamiaMembershipALL" type="checkbox" id="chkChoiceAgreementForCasamiaMembershipALL" value="Y" class="ez-hide agreement-casa"></div></div></div>
								</div>
								<label for="chkChoiceAgreementForCasamiaMembershipALL" style="position:absolute;margin: 0 0 0 2px; font-size:16px;">까사미아 멤버십 전체 이용약관 동의<span>(선택)</span></label>
							</div>
						</h2>

						<div style="width: 99%; margin: 0 auto; border: 1px solid #ddd; height: 85px; overflow-y: scroll; overflow-x: hidden;">

							<div class="term_b" style="float:left; width:100%;">
								<div class="input_b size_sm type1" style="margin: 10px 0 -6px 20px;">
									<div class="ez-checkbox">
										<div class="ez-checkbox"><div class="ez-checkbox"><div class="ez-checkbox"><input name="chkChoiceAgreementForCasamiaMembership" type="checkbox" id="chkChoiceAgreementForCasamiaMembership" value="Y" class="ez-hide agreement-casa"></div></div></div>
									</div>
									<label for="chkChoiceAgreementForCasamiaMembership" style="font-size: 14px;">까사미아 서비스 이용약관 <span>(선택)</span></label>
								</div>
								<!-- 약관box -->
								<div class="txt_a_new txt_a" style="width: 94%; border:0; overflow:hidden; ">
									<!-- policy영역 -->
									<div class="policy_a">
											<h3 style="padding: 7px 0 7px 0;">제1조 (목적)</h3>
											이 약관은 ㈜ 신세계까사(이하 “당사”라고 한다)에서 운영하는 까사미아 굳멤버스와 굳닷컴 (https://guudmembers.casamia.co.kr, https://www.guud.com) (이하 '사이트'이라 한다)에서 제공하는 인터넷 관련 서비스(이하 '서비스'라 한다)를 이용함에 있어 '당사'와 이용자의 권리, 의무 및 책임 사항을 규정함을 목적으로 합니다.
											<h3>제2조 (용어의 정의)</h3>
											<ol>
												<li>본 약관에서 사용하는 용어의 정의는 다음과 같습니다.</li>
												<li>① “사이트”란 당사가 재화 또는 용역(이하 '재화 등'이라 한다.)을 이용자에게 제공하기 위하여 컴퓨터, TV, 모바일 등 정보통신 설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 이를 운영하는 사업자의 의미로도 사용합니다.</li>
												<li>② “서비스”란 당사가 “사이트”를 통해 회원에게 제공하는 포인트 적립, 사용, 할인, 이벤트 참여 다양한 정보의 제공 및 상품(재화와 용역 포함)의 판매 또는 상품과 관련한 다양한 판촉행위 및, 기타 부가서비스 등의 전반적인 고객 서비스 프로그램을 말합니다.</li>
												<li>③ '이용자'란 “사이트”에 접속하여 이 약관에 따라 “사이트”가 제공하는 서비스를 이용하는 고객을 말하며, 회원과 비회원으로 구분합니다.</li>
												<li>④ '회원'이란 “사이트”에 본 약관 제6조에 정해진 가입 절차에 따라 가입하여 정상적으로 “사이트”가 제공하는 서비스를 이용할 수 있는 권한을 부여 받아 계속적으로 이용할 수 있는 고객을 말합니다.</li>
												<li>⑤ '비회원'이란 회원에 가입하지 않고 “사이트”가 제공하는 서비스를 이용하는 고객을 말합니다.</li>
												<li>⑥ “까사미아 굳멤버스 카드”(이하 '카드' 또는 문맥에 따라 '멤버스 카드'라 함)란 당사가 회원에게 발급하여 “서비스”를 정상적으로 이용하도록 사용 승인한 모바일카드로 일반카드 (단순 포인트 적립 사용만 가능)는 물론 당사와 별도로 제휴카드 발급 계약을 맺은 피 계약사가 발행한 다양한 제휴 카드(신용카드를 포함하며 이하에서 “제휴 카드”라 함) 및 계열사별 별도 서비스 정책에 따라 발급된 카드를 모두 포함합니다.</li>
												<li>⑦ “굳포인트”(이하 '포인트'라 함)란 당사가 운영하는 “서비스”를 통한 재화/서비스 구매 또는 “서비스” 참여 활동 시 지급되는 현금성 포인트를 말하며, “서비스”에서 제공하는 소진방법에 따라 적립/사용이 가능합니다.</li>
												<li>⑧ “제휴사”(이하 '제휴사'라 함)란 당사와 “사이트” 운영과 관련하여 제휴 계약을 맺고 서비스를 공동 제공하기로 합의한 회사로서 당해 회사의 영업점포 (이하 '제휴영업점'이라 함) 및 인터넷 사이트(이하 '사이트'이라 함)를 포함합니다. 추후 제휴사는 “사이트”의 사정에 따라 추가 또는 서비스 계약 해지 될 수 있으며 까사미아 굳멤버스 홈페이지(https://guudmembers.casamia.co.kr)를 통해 고지 합니다.</li>
												<li>⑨ “제휴영업점”이란 “서비스”를 제공하기 위해 “사이트”와 계약하여 “서비스”를 제공하는 자로서, 당사가 직접 운영하거나 위탁 계약을 맺고 당사 상표를 걸고 운영되는 영업점(이하 '영업점' 이라 함)을 말합니다. 단, 일부 매장은 제외 될 수 있습니다. 구체적인 제휴영업점의 내역은 “사이트”에서 확인 가능합니다</li>
											</ol>

											<h3>제3조 (약관 등의 명시와 설명 및 개정)</h3>
											<ol>
												<li>사정이 있는 경우에는 “당사”는 이용계약을 해지할 수 있습니다.</li>
												<li>① “당사”가 약관을 개정할 경우에는 그 개정 약관은 그 적용 일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관 조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정 약관 조항의 적용을 받기를 원하는 뜻을 제4항에 의한 개정 약관의 공지 기간 내에 “당사”에 송신하여 “당사”의 동의를 받은 경우에는 개정 약관 조항이 적용됩니다.</li>
												<li>② 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계 법령 또는 상관례에 따릅니다.</li>
											</ol>

											<h3>제4조 (서비스의 제공 및 변경)</h3>
											<ol>
												<li>
													① “당사”가 본 약관에 정해진 바에 따라 회원에게 제공하는 서비스는 아래와 같습니다.
													<ol>
														<li>1. 재화 또는 용역에 대한 정보 제공 및 구매 서비스</li>
														<li>회원은 “사이트”에서 상품 또는 서비스에 대해 정보 제공 및 구매 계약을 체결할 수 있으며, “사이트”를 통해 구매 계약이 체결된 재화 또는 용역을 배송 받을 수 있습니다.</li>
														<li>2. 적립 서비스</li>
														<li>회원은 “사이트”, 구입에서 상품 또는 서비스 구입 또는 이벤트 참여 등을 통해 포인트를 적립 받을 수 있습니다. 단, “사이트”의 사정에 따라 지정된 일부 상품은 제외 될 수 있습니다.</li>
														<li>3. 사용 서비스</li>
														<li>회원은 적립된 포인트를 사용하여 “사이트”에서 지정한 상품 또는 서비스를 구입할 수 있습니다. 단, 회원이 포인트를 사용 하기 위해서는 반드시 통합회원으로 기 가입 되어 있어야 합니다.</li>
														<li>4. 할인 서비스</li>
														<li>회원은 “사이트”에서 상품 또는 서비스 구입 시에 “사이트”의 정책에 따라 상품 구매액의 일부를 할인 받을 수 있습니다.</li>
														<li>5. 통합 아이디 서비스</li>
														<li>회원은 “사이트” ID와 비밀번호를 통합하여 이용할 수 있는 회원 인증 서비스인 통합 아이디 서비스를 이용할 수 있습니다.</li>
														<li>6. 기타 서비스</li>
														<li>“사이트”는 상기 각 호의 서비스 이외에도 추가적인 서비스를 개발하여 회원에게 제공할 수 있으며, 자세한 “서비스” 내용은 당사가 운영하는 “사이트”를 참조하시기 바랍니다.</li>
													</ol>
												</li>
												<li>② 회원에게 제공되는 “서비스”는 “당사”의 영업정책이나 “사이트”의 사정에 따라 변경될 수 있습니다.</li>
												<li>③ “사이트”는 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공 할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공 일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.</li>
												<li>④ “사이트”가 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화 등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 본 약관 8조에서 정한 방법 등으로 즉시 통지 합니다.</li>
												<li>⑤ 전항의 경우 “사이트”는 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “사이트”가 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.</li>
											</ol>

											<h3>제 5 조 (서비스의 중단)</h3>
											<ol>
												<li>
													① 당사는 다음 각 호에 해당하는 경우 “사이트” 서비스 제공을 전부 또는 일부를 제한하거나 중지할 수 있습니다.
													<ol>
														<li>1. 컴퓨터 등 정보통신설비의 점검, 보수, 교체 및 고장, 통신의 두절 등의 부득이한 사유가 발생한 경우</li>
														<li>2. 전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를 중지했을 경우</li>
														<li>3. 정전, 제반 설비의 장애 또는 이용량의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 경우</li>
														<li>4. “사이트” 서비스 제공업자와의 계약 종료 등과 같은 당사의 제반 사정으로 서비스를 유지할 수 없는 경우</li>
														<li>5. 기타 국가 비상 사태 나 천재 지변 등 불가항력적 사유가 있는 경우</li>
													</ol>
												</li>
												<li>② 당사는 본 조 제①항의 규정에 의하여 서비스의 이용을 제한하거나 중지한 때에는 그 사유 및 제한기간 등을 당사는 e-mail 또는 “사이트”에 게시하는 방법으로 회원에게 서비스 중단사실을 알려드립니다.</li>
												<li>③ 당사는 본 조 제①항의 사유로 서비스 제공의 일시적 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “사이트”가 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.</li>
												<li>④ 사업 종목의 전환, 사업의 포기, 업체간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “사이트”는 제8조에 정한 방법으로 이용자에게 통지하고 당초 “사이트”에서 제시한 조건에 따라 소비자에게 보상 합니다. 다만, “사이트”가 보상기준 등을 고지하지 아니한 경우에는 이용자들의 포인트 또는 적립금 등을 “사이트”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.</li>
											</ol>

											<h3>제 6 조 (회원 가입)</h3>
											<ol>
												<li>① 회원으로 가입하고자 하는 이용자는 “사이트”가 정한 가입 양식에 정해진 사항을 기입한 후 본 약관과 ‘개인정보처리방침(‘개인정보 수집 제공 및 활용 동의’ 등)'에 동의한다는 의사를 표시 함으로써 회원가입을 신청합니다</li>
												<li>
													② “사이트”는 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각호에 해당하지 않는 한 회원으로 등록합니다</li>
													<ol>
														<li>1. 가입 신청자가 이 약관 제7조 제3항에 의하여 이전에 회원 자격을 상실한 적이 있는 경우, 다만 제7조 제3항에 의한 회원 자격 상실 후 3년이 경과한 자로서 “사이트”의 회원 재가입 승낙을 얻은 경우에는 예외로 한다.</li>
														<li>2. 등록 내용에 허위, 기재 누락, 오기가 있는 경우</li>
														<li>3. 기타 회원으로 등록하는 것이 “사이트”의 기술상 현저히 지장이 있다고 판단되는 경우.</li>
														<li>4. 회원가입 신청일 현재 만 14세 미만인 경우</li>
													</ol>
												<li>③ 회원 가입 계약의 성립 시기는 “사이트”의 승낙이 회원에게 도달한 시점으로 합니다.</li>
												<li>④ 회원은 회원가입 시 등록 사항에 변경이 있는 경우, 상당한 기간 이내에 “사이트”에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.</li>
												<li>⑤ 회원은 회원자격을 타인에게 양도하거나 대여 또는 담보의 목적으로 이용할 수 없습니다.</li>
											</ol>

											<h3>제 7 조 (회원 탈퇴 및 자격 정지 등)</h3>
											<ol>
												<li>
													① 회원은 언제든지 서면, e-mail, 전화, 기타 당사가 정하는 방법으로 회원탈퇴를 요청할 수 있으며, “사이트”는 다음 제1호의 경우 또는 본 조 제②항 경우를 제외하고는 회원의 요청에 따라 조속히 회원탈퇴에 필요한 제반 절차를 수행합니다. 단, 회원탈퇴 시 이벤트 부정 이용 방지 등을 위하여 탈퇴일로부터 30일 이내에 재가입이 불가하나, 동 기간 중 제휴카드를 발급하는 경우에는 회원탈퇴가 자동 취소되며 정상적으로 서비스 이용이 가능합니다.
													<ol>
														<li>1. “사이트”를 통해 구매하거나 예약한 재화/서비스가 배송 중이거나 실현되지 아니한 때</li>
													</ol>
												</li>
												<li>② 포인트 사용 후 사용 된 포인트의 적립 원천이 되는 구매 행위의 취소로 인해 마이너스(-) 포인트가 발생한 회원은 별도 “당사”의 승인이나 해당 포인트에 해당하는 금액을 변제하기 전까지는 탈퇴가 불가합니다.</li>
												<li>
													③ 회원이 다음 각 호에 해당하는 경우, “사이트”는 당해 회원에 대한 통보로써 회원 자격을 상실시킬 수 있습니다. 단, 1.호의 경우에는 회원에 대한 통보 없이 자격이 상실됩니다
													<ol>
														<li>1. 회원이 사망한 경우</li>
														<li>2. “사이트”을 이용하여 구입한 재화 등의 대금, 기타 “사이트” 이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우</li>
														<li>3. 가입 신청 시 허위 내용을 등록한 경우</li>
														<li>4. 다른 사람의 ID와 비밀번호 또는 그 개인정보를 도용하는 경우</li>
														<li>5. 다음 각 호에 해당하는 행위를 하거나, 기타 “사이트”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우</li>
														<li>가. “사이트” 화면에 다른 사람의 명예를 훼손하거나 다른 사람의 “사이트” 이용을 방해하는 행위</li>
														<li>나. “사이트” 화면에 음란물을 개제하거나 음란사이트를 링크하는 행위</li>
														<li>6. 다음 각 호에 해당하는 행위를 하거나, 기타 “사이트”의 정상적인 영업활동 및 서비스 운영을 고의로 방해하는 행위를 하는 경우</li>
														<li>가. “사이트”의 이용과정에서 “사이트”의 직원에게 폭언, 협박 또는 음란한 언행 등을 하는 행위</li>
														<li>나. “사이트”를 통해 재화 등을 구매한 후 정당한 이유 없이 상습 또는 반복적으로 취소, 반품하여 업무를 방해하는 행위</li>
														<li>7. 기타 본 약관이 규정하는 회원의 의무를 위반하거나, 서비스 운영을 고의로 방해하는 행위를 하는 경우</li>
														<li>8. “사이트”의 합리적인 판단에 기하여 서비스의 제공을 거부할 필요가 있다고 인정할 경우</li>
													</ol>
												</li>
												<li>④ “사이트”가 회원 자격을 제한, 정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정 되지 아니하는 경우 “사이트”는 회원 자격을 상실시킬 수 있습니다</li>
												<li>⑤ “사이트”가 회원 자격을 상실시키는 경우에는 회원 등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 통지를 받은 날로부터 회원 등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다. “사이트”는 회원의 소명 내용을 심사하여 회원의 주장이 타당하다고 판단하는 경우 회원으로 하여금 계속하여 정상적인 서비스를 이용할 수 있도록 합니다.</li>
												<li>
													⑥ 본 조 제①항에 의한 회원탈퇴 또는 제③항에 의한 회원자격상실이 확정되는 시점은 아래와 같습니다.
													<ol>
														<li>1. 회원의 탈퇴요청의 경우에는 “사이트”가 회원탈퇴 처리의 완료를 통보하는 시점에서 탈퇴가 완료 됩니다. 다만, “사이트”는 완료 통보일로부터 30일의 유예 기간 동안 기 적립된 포인트 정보를 소멸시키지 아니하고 저장하였다가, 회원이 별도의 절차를 거쳐 재가입 요청을 하고 회사가 이를 허락하여 유예 기간 내 재가입할 경우, 모든 포인트를 재사용토록 하며, 재가입이 없이 유예기간이 지나면, 모든 포인트가 즉시 소멸됩니다.</li>
														<li>2. 회원자격상실의 경우 통보일에 회원 자격상실이 확정됩니다. 단 사망으로 인한 자격상실의 경우에는 “사이트”의 통보여부와 상관없이 회원 사망일에 자격상실이 확정되며, 당해 회원에게 제공된 서비스와 관련된 권리나 의무 및 포인트는 당해 회원의 상속인에게 상속되지 않습니다</li>
													</ol>
												</li>
												<li>
													⑦ 본 조 제①항에 의한 회원탈퇴 또는 제③항에 의한 회원자격상실이 된 경우 회원 정보는 다음과 같이 처리 됩니다.
													<ol>
														<li>1. 탈퇴한 회원의 정보는 본 약관 제15조에 규정하는 바에 따라 일정 기간 보유 후 삭제처리 됩니다.</li>
														<li>2. 회원 자격이 상실된 회원의 정보는 회원 자격상실 확정 후 서비스 부정 이용 방지 및 타 회원의 추가적인 피해 방지를 위해 2년간 보유하며, 이 기간 동안 재가입 및 서비스 이용이 불가 할 수도 있습니다.</li>
													</ol>
												</li>
											</ol>

											<h3>제 8 조 (회원에 대한 통지)</h3>
											<ol>
												<li>① “사이트”가 회원에 대한 통지를 하는 경우, 회원이 “사이트”와 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.</li>
												<li>② “사이트”는 불특정 다수 회원에 대한 통지의 경우 1주일 이상 “사이트” 게시판에 게시함으로써 개별 통지에 갈음 할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별 통지를 합니다.</li>
											</ol>
											
											<h3>제 9 조 (구매신청)</h3>
											<ol>
												<li>
													① “사이트” 이용자는 “사이트”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “사이트”는 이용자가 구매를 신청함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다.
													<ol>
														<li>1. 재화 등의 검색 및 선택</li>
														<li>2. 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력</li>
														<li>3. 약관 내용, 청약철회권이 제한되는 서비스, 배송료, 설치비등의 비용 부담과 관련한 내용에 대한 확인</li>
														<li>4. 이 약관에 동의하고 위 3호의 사항을 확인하거나 거부하는 표시(예. 마우스 클릭)</li>
														<li>5. 재화 등의 구매 신청 및 이에 관한 확인 또는 “사이트”의 확인에 대한 동의</li>
														<li>6. 결제 방법의 선택</li>
														<li>7. 기타 “사이트”가 별도로 정하는 절차</li>
													</ol>
												</li>
												<li>② “사이트”가 제3자에게 구매자 개인정보를 제공•위탁할 필요가 있는 경우 실제 구매신청 시 구매자의 동의를 받아야 하며, 회원가입 시 미리 포괄적으로 동의를 받지 않습니다. 이 때 “사이트”는 제공되는 개인정보 항목, 제공받는 자, 제공받는 자의 개인정보 이용 목적 및 보유‧이용 기간 등을 구매자에게 명시하여야 합니다. 다만 「정보통신망이용촉진 및 정보보호 등에 관한 법률」 제25조 제1항에 의한 개인정보 취급위탁의 경우 등 관련 법령에 달리 정함이 있는 경우에는 그에 따릅니다.</li>
											</ol>

											<h3>제 10 조 (계약의 성립)</h3>
											<ol>
												<li>
													① “사이트”는 제9조와 같은 구매 신청에 대하여 다음 각호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정 대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.
													<ol>
														<li>1. 신청 내용에 허위, 기재 누락, 오기가 있는 경우</li>
														<li>2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우</li>
														<li>3. 상행위(재판매)를 목적으로 구매하는 거래이거나, 거래 정황상 상행위(재판매)를 목적으로 한 구매로 판단되는 경우</li>
														<li>4. 기타 구매 신청에 승낙하는 것이 “사이트” 기술상 현저히 지장이 있다고 판단하는 경우</li>
													</ol>
												</li>
												<li>② “사이트”의 승낙이 제12조 제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.</li>
												<li>③ “사이트”의 승낙의 의사 표시에는 이용자의 구매 신청에 대한 확인 및 판매 가능 여부, 구매 신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.</li>
											</ol>

											<h3>제 11 조 (지급 방법)</h3>
											<ol>
												<li>
													① “사이트”에서 구매한 재화 또는 용역에 대한 대금 지급 방법은 다음 각호의 방법 중 가용한 방법으로 할 수 있습니다. 단, “사이트”는 이용자의 지급 방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.
													<ol>
														<li>1. 온라인 무통장입금, 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌 이체</li>
														<li>2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제</li>
														<li>3. 전자 화폐에 의한 결제</li>
														<li>4. “사이트”가 지급한 포인트등에 의한 결제</li>
														<li>5. “사이트”과 계약을 맺었거나 “사이트”가 인정한 상품권에 의한 결제</li>
														<li>6. 기타 전자적 지급 방법에 의한 대금 지급 등</li>
													</ol>
												</li>
											</ol>

											<h3>제 12 조 (수신 확인 통지, 구매 신청 변경 및 취소)</h3>
											<ol>
												<li>① “사이트”는 이용자의 구매 신청이 있는 경우 이용자에게 수신 확인 통지를 합니다.</li>
												<li>② 수신 확인 통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인 통지를 받은 후 즉시 구매 신청 변경 및 취소를 요청할 수 있고, “사이트”는 배송 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조 청약 철회 등에 관한 규정에 따릅니다.</li>
											</ol>


											<h3>제 13 조 (재화 등의 공급)</h3>
											<ol>
												<li>① “사이트”는 이용자와 재화 등의 공급 시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만 “사이트”가 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 3영업일 이내에 조치를 취합니다. 다만, 소비자와 “사이트”간 재화 등의 공급 시기에 관하여 별도의 약정이 있는 경우에는 그러하지 아니합니다. 이때 “사이트”는 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.</li>
												<li>② “사이트”는 이용자가 구매한 재화에 대해 배송 수단, 수단별 배송 비용 부담자, 수단별 배송 기간 등을 명시 합니다. 만약 “사이트”가 약정 배송 기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 “사이트”가 고의, 과실이 없음을 입증한 경우에는 그러하지 아니합니다.</li>
												<li>③ “사이트”와 이용자간에 상품의 인도시기 또는 용역의 제공시기에 관하여 별도의 약정이 있는 경우에는 당해 약정이 이 약관에 우선합니다</li>
											</ol>

											<h3>제 14 조 (환급)</h3>
											<ol>
												<li>① “사이트”는 이용자가 구매 신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.</li>
											</ol>

											<h3>제 15 조 (청약 철회 등)</h3>
											<ol>
												<li>① “사이트”와 재화 등의 구매에 관한 계약을 체결한 이용자는 「전자상거래 등에서의 소비자보호에 관한 법률」 제13조 제2항에 따른 계약내용에 관한 서면을 받은 날(그 서면을 받은 때보다 재화 등의 공급이 늦게 이루어진 경우에는 재화 등을 공급받거나 재화 등의 공급이 시작된 날을 말합니다)부터 7일 이내에는 청약의 철회를 할 수 있습니다. 다만, 청약철회에 관하여 「전자상거래 등에서의 소비자보호에 관한 법률」에 달리 정함이 있는 경우에는 동 법 규정에 따릅니다.</li>
												<li>
													② 이용자는 재화 등을 배송 받은 경우 다음 각호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.
													<ol>
														<li>1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우 (다만 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약 철회를 할 수 있음)</li>
														<li>2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우</li>
														<li>3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화 등의 가치가 현저히 감소한 경우</li>
														<li>4. 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우</li>
														<li>5. '사이트”가 특정 재화 등에 대하여 청약철회 시 회복할 수 없는 중대한 피해가 예상되어 사전에 청약철회 제한에 관하여 고지하고, 이용자의 동의가 이루어진 경우</li>
														<li>6. 주문제작의 경우에는 당사의 고의 또는 과실이 아닌 경우</li>
													</ol>
												</li>
												<li>③ 제2항 제2호 내지 제4호의 경우에는 “사이트”가 사전에 청약 철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용 상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약 철회 등이 제한되지 않습니다.</li>
												<li>④ 이용자는 제1항 및 제2항의 규정에도 불구하고 재화 등의 내용이 표시, 광고 내용과 다르거나 계약 내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약 철회 등을 할 수 있습니다.</li>
											</ol>

											<h3>제 16 조 (청약 철회 등의 효과)</h3>
											<ol>
												<li>① “사이트”는 이용자로부터 재화 등을 반환 받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급 합니다. 이 경우 “사이트”가 이용자에게 재화 등의 환급을 지연한 때에는 그 지연 기간에 대하여 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」 제21조의3에서 정하는 지연 이자율을 곱하여 산정한 지연 이자(이하 '지연 배상금'이라 한다)를 지급합니다.</li>
												<li>② “사이트”는 위 대금을 환급함에 있어서 이용자가 신용카드 그밖에 대통령령이 정하는 결제 수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제 수단을 제공한 사업자로 하여금 재화 등의 대금 청구를 정지 또는 취소하도록 요청합니다.</li>
												<li>③ 청약 철회 등의 경우 공급 받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. “사이트”는 이용자에게 청약 철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시, 광고 내용과 다르거나 계약 내용과 다르게 이행되어 청약 철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 “사이트”가 부담합니다.</li>
												<li>④ 이미 재화 등이 일부 사용 또는 일부 소비된 경우, “사이트”는 그 재화 등의 사용 또는 일부 소비에 의하여 이용자가 얻은 이익 또는 그 재화 등의 공급에 소요된 비용에 상당하는 금액으로서 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」 제24조에서 정하는 범위의 금액의 지급을 이용자에게 청구할 수 있습니다.</li>
												<li>⑤ 이용자가 상품을 구매하여 포인트를 지급 받은 경우 청약철회를 하기 위해서는 이를 “사이트”에 반환해야 합니다.</li>
												<li>⑥ 이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 “사이트”는 청약 철회 시 그 비용을 누가 부담하는지를 알기 쉽도록 명확하게 표시합니다.</li>
											</ol>
											
											<h3>제 17 조 (포인트의 적립 및 관리)</h3>
											<ol>
												<li>
													① “사이트”는 상품을 구입하거나 서비스를 이용하고 그에 따른 대금을 결제한 회원에게 “사이트” 간에 약정 고지된 바에 따라 아래와 같은 방식으로 포인트를 산정, 부여합니다. 단, 포인트와 관련하여 발생하는 제세공과금은 회원이 부담합니다.
													포인트 = (상품/서비스의 구입/이용 실 결제 대금) X (고지된 당사와 각 제휴사의 포인트 적립률 또는 할인율)
												</li>
												<li>② 제휴사의 정책에 따라 일부 제휴 영업점에서는 포인트 적립이 불가 할 수도 있으며 제휴사 운영하는 일부 온라인 쇼핑몰의 경우 적립률이 별도로 적용 될 수 있습니다. 이 경우 해당 제휴 영업점이나 쇼핑몰에 해당 내용을 별도 표기 또는 안내 합니다.</li>
												<li>③ 포인트는 배송 완료 시점 익일 자동 일괄 적립됩니다. 일부 제휴사의 경우는 해당 제휴사가 요구하는 방법에 의해 추후 적립을 해야 합니다. 적립되는 포인트는 가용화되는 즉시부터 물품 또는 서비스 구매 시, 사용할 수 있습니다. 가용화 되어 사용 가능한 포인트는 “사이트” 또는 제휴영업점에서 확인이 가능합니다.</li>
												<li>④ 본 조 제②항에 따라 산정 부여 되거나 이벤트로 인한 추가 적립되는 포인트 중 소수점 이하의 단위는 절사되고, “사이트”, 제휴가맹점이 별도로 정한 상품/서비스를 구매하거나 현금이나 신용카드 결제가 아닌 포인트로 결제하는 경우에는 포인트가 적립되지 않습니다.</li>
												<li>⑤ 본 조 제②항의 경우 회원이 상품/서비스에 대해 현금 또는 신용 카드로 결제를 한 후 멤버스 카드와 기존 제휴사 멤버십 카드 또는 기타의 제휴카드나 할인카드를 제시하고 이중 포인트 누적 또는 이중 할인요구 등을 했을 때 “사이트”는 이를 거부할 수 있습니다. 이때 회원은 “사이트”의 요구에 따라 하나의 포인트 제도 또는 할인제도를 선택하여야 합니다. 단, “사이트”가 중복 할인 서비스 또는 적립서비스 등을 개발해 별도로 허용한 경우는 제외합니다.</li>
												<li>⑥ 포인트 적립은 상품/서비스를 구입 즉시 요청 해 적립하는 것이 원칙으로 하나 “사이트”가 공식적으로 허용한 기한이 있는 경우 회원은 본인의 구매내역에 한하여 그 기간 내 구매가 이루어진 제휴영업점에서 구매 영수증을 제시함으로써 소급하여 적립을 청구 할 수 있습니다. “사이트”는 내부정책에 따라 포인트 소급 적립 청구 기간 변경이 가능하고 경우에 따라 회원의 소급 청구를 거부 할 수 있습니다.</li>
												<li>⑦ 회원의 구매로 인해 적립되는 포인트가 아닌 “사이트”가 이벤트 등의 마케팅 활동으로 회원에게 추가로 제공한 포인트의 유효기간은 “사이트”의 정책에 따라 별도로 책정 될 수 있으며 이는 별도로 공지합니다.</li>
												<li>⑧ 포인트 적립률 및 기준은 “사이트”의 내부 방침에 따라 임의로 변경될 수 있습니다.</li>
											</ol>

											<h3>제 18 조 (포인트의 사용)</h3>
											<ol>
												<li>① 포인트를 사용하기 위해서는 회원 가입을 통해 회원의 지위를 취득해야 합니다.</li>
												<li>② 적립된 포인트 사용 순서는 회원이 보유 중인 사용 가능한 포인트 (이하 '가용포인트'라 함) 중 소멸일자가 빠른 포인트부터 우선 차감 사용합니다.</li>
												<li>③ “사이트”는 별도로 사용 가능 최저 포인트 및 포인트 사용 단위를 정하며, 이는 “사이트” 이용 홈페이지 또는 제휴 영업점 매장 내 고시(구두안내 포함) 중 1가지 이상 방법으로 고지 됩니다.</li>
												<li>* 현재 “사이트”의 포인트 는 1포인트 이상인 경우 1포인트 단위로 사용가능합니다. 제휴영업점중 직영점은 10포인트 이상인 경우 10포인트 단위로 사용가능합니다. 기타 제휴영업점 및 제휴사이트 포인트는 개별로 고시된 내용에 따릅니다.</li>
												<li>④ 회원은 “사이트” 및 제휴영업점 내에서 상품/서비스의 결제 수단으로 포인트를 현금과 동일하게 사용하는 것은 가능하나, 현금으로 환불되지 않습니다.</li>
												<li>⑤ 회원은 포인트를 타인에게 양도하거나 대여 또는 담보의 목적으로 이용할 수 없습니다.</li>
												<li>⑥ 포인트 사용 후 사용 된 포인트의 적립 원천이 되는 구매 행위의 취소로 인해 잔여 포인트가 마이너스(-)인 경우 잔여 가용포인트가 0 포인트가 되기 전까지 적립되는 포인트는 사용이 불가합니다.</li>
												<li>
													⑦ '사이트'가 기존 멤버십 회원에게 개별적으로 제공했던 기존 멤버십 포인트는
													'당사”가 정한 정책에 따라 종전과 동일하게 사용 가능합니다.
												</li>
											</ol>

											<h3>제 18 조 (포인트의 사용)</h3>
											<ol>
												<li>① 포인트를 사용하기 위해서는 회원 가입을 통해 회원의 지위를 취득해야 합니다.</li>
												<li>② 적립된 포인트 사용 순서는 회원이 보유 중인 사용 가능한 포인트 (이하 '가용포인트'라 함) 중 소멸일자가 빠른 포인트부터 우선 차감 사용합니다..</li>
												<li>③ “사이트”는 별도로 사용 가능 최저 포인트 및 포인트 사용 단위를 정하며, 이는 “사이트” 이용 홈페이지 또는 제휴 영업점 매장 내 고시(구두안내 포함) 중 1가지 이상 방법으로 고지 됩니다.</li>
												<li>* 현재 “사이트”의 포인트 는 1포인트 이상인 경우 1포인트 단위로 사용가능합니다. 제휴영업점중 직영점은 10포인트 이상인 경우 10포인트 단위로 사용가능합니다. 기타 제휴영업점 및 제휴사이트 포인트는 개별로 고시된 내용에 따릅니다.</li>
												<li>④ 회원은 “사이트” 및 제휴영업점 내에서 상품/서비스의 결제 수단으로 포인트를 현금과 동일하게 사용하는 것은 가능하나, 현금으로 환불되지 않습니다.</li>
												<li>⑤ 회원은 포인트를 타인에게 양도하거나 대여 또는 담보의 목적으로 이용할 수 없습니다.</li>
												<li>⑥ 포인트 사용 후 사용 된 포인트의 적립 원천이 되는 구매 행위의 취소로 인해 잔여 포인트가 마이너스(-)인 경우 잔여 가용포인트가 0 포인트가 되기 전까지 적립되는 포인트는 사용이 불가합니다.</li>
												<li>
													⑦ '사이트'가 기존 멤버십 회원에게 개별적으로 제공했던 기존 멤버십 포인트는
													'당사”가 정한 정책에 따라 종전과 동일하게 사용 가능합니다.
												</li>
											</ol>

											<h3>제 19 조 (포인트의 정정, 취소 및 소멸)</h3>
											<ol>
												<li>① 적립된 포인트에 오류가 있을 경우 회원은 오류발생 시점부터 60일 이내에 “사이트”에 정정 신청을 하여야 하며, “사이트”는 회원의 정정 신청일로부터 최대 30일 이내에 정정절차를 마쳐야 합니다. 단, 회원은 이를 증명할 수 있는 유효한 영수증 등의 자료를 제시하거나, 해당 제휴영업점으로부터 동의를 얻어야 합니다.</li>
												<li>② 포인트는 최초 적립된 시점부터 24개월이 지난 시점의 해당 월 말일에 먼저 적립된 포인트부터 월 단위로 자동 소멸됩니다. “사이트”는 회원이 보유한 포인트를 소멸예정일이 도래하여 소멸시키는 경우 포인트 소멸과 관련된 내용을 최소 15일전에 e-mail 등으로 발송합니다. 단, 특정 이벤트를 통해 제공된 포인트는 이벤트 진행 시 포인트 유효기간 및 소멸일을 별도로 안내하고, 소멸 안내 e-mail 발송에서는 제외될 수 있습니다. 또한, 회원이 “사이트”에서 해당 월 소멸 예정 포인트 확인이 가능하도록 조치합니다.</li>
												<li>③ 회원이 구매한 물품 등을 환불하는 경우, 적립이나 사용한 포인트는 취소 또는 복원됩니다.</li>
												<li>④ 본 약관 제7조 제①항에 정해진 방법으로 탈퇴를 하고자 하는 회원이 잔여 포인트를 사용하고자 할 경우 회원탈퇴 요청일 전까지 적립된 가용 포인트를 본 약관이 정하는 바에 따라 사용해야 합니다.</li>
												<li>⑤ 탈퇴 전까지 사용하지 않은 포인트는 제7조 제⑥항에 의거 일정한 유예기간 이후 자동으로 소멸됩니다.</li>
											</ol>

											<h3>제 20 조 (개인정보보호)</h3>
											<ol>
												<li>① “사이트”는 회원이 가입신청을 할 때 제공하거나 서비스 이용 시 발생하는 각종 개인정보뿐만 아니라 사전에 회원으로부터 동의를 얻어 회원이 다양한 서비스 이용 시 발생하는 정보를 수시로 수집 저장 할 수 있으며, 이를 분석하여 회원에게 보다 나은 서비스를 제공하고 고객 지향적인 마케팅 활동을 하기 위해 사용합니다. 개인정보수집 및 활용에 관한 자세한 내용은 “사이트”에 게재되어 있는 '개인정보처리방침'에 따릅니다. 이에 관한 자세한 내용은 “사이트”를 참고하시기 바랍니다.</li>
												<li>② “사이트”는 이용자의 개인정보 수집 시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보 수집을 위해 회원으로부터 별도 양식에 따른 '개인정보처리방침(개인정보 수집 및 활용 동의서)'을 받고 있으며, 회원은 언제든지 이를 철회할 수 있습니다.</li>
												<li>③ 회원은 “사이트”에 제공한 개인정보에 변경사항이 있는 경우에는 지체 없이 “사이트”에 그 변경사실을 통지하여야 하며, 이를 통지하지 않아 발생한 손해에 대하여 “사이트”는 어떠한 책임도 지지 않습니다.</li>
												<li>④ “사이트”는 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우에 해당하여 회원가입 시 구매계약이행에 필요한 최소한의 특정 개인정보를 미리 수집합니다.</li>
												<li>⑤ “사이트”가 이용자의 개인 정보를 수집•이용하는 때에는 반드시 당해 이용자에게 그 목적을 고지하고 동의를 받습니다.</li>
												<li>⑥ “사이트”는 수집된 개인정보를 목적 외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용•제공단계에서 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.</li>
												<li>⑦ “사이트”가 제5항과 제6항에 의해 이용자의 동의를 받아야만 하는 경우에는 개인정보보호책임자의 신원(소속, 성명 및 전화번호 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받는자, 제공목적 및 제공할 정보의 내용)등 정보통신망 이용촉진 및 정보보호에 관한 법률과 개인정보보호법에서 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.</li>
												<li>
													⑧ “사이트”는 수집된 개인정보를 ‘개인정보처리방침’에 기재된 자에게만 제공하고 기재된 목적 범위 내에서만 활용하며 수집한 개인정보를 당해 회원의 동의없이 ‘개인정보처리방침'에 기재된 목적 범위를 넘어선 용도로 이용하거나 기재된 자 이외의 제3자에게 제공할 수 없습니다. <br/> 다만, 다음의 경우에는 예외로 합니다.
													<ol>
														<li>1. 배송업무상 배송업체에게 배송에 필요한 최소한의 회원의 정보(성명, 주소, 전화번호)를 알려주는 경우</li>
														<li>2. 통계작성 연구 또는 마케팅 활동 등을 위하여 필요한 경우로서 특정 개인을 알아볼 수 없는 형태로 가공되어 제공하는 경우</li>
														<li>3. 재화 등의 거래에 따른 대금정산을 위하여 필요한 경우</li>
														<li>4. 법률의 규정 또는 법률에 의하여 필요한 불가피한 사유가 있는 경우</li>
														<li>5. “사이트”와 관련하여 합병, 인수, 포괄적 영업양도 등이 있는 경우 합병 후 당사, 인수당사 및 영업양수인에 대하여 제공하는 경우</li>
													</ol>
												</li>
												<li>
													⑨ “사이트”는 수집된 회원의 개인정보를 수집 목적 또는 제공 받은 목적이 달성되면 지체 없이 파기함을 원칙으로 합니다. 다만, 다음 각호의 경우 일정기간 동안 예외적으로 수집한 회원정보의 전부 또는 일부를 보관할 수 있습니다.
													<ol>
														<li>1. 고객요구사항 처리 및 A/S의 목적 : 수집한 회원정보를 회원탈퇴 후 30일간 보유</li>
														<li>2. 기타 “사이트”가 필요에 의해 별도로 동의를 득한 경우 : 별도 동의를 받은 범위 (회원정보 및 보유 기간) 내에서 보유</li>
													</ol>
												</li>
												<li>
													⑩ 제9항에도 불구하고 상법 및 ‘전자상거래 등에서 소비자보호에 관한 법률' 등 관련 법령의 규정에 의하여 다음과 같이 일정기간 보유해야 할 필요가 있을 경우에는 관련 법령이 정한 기간 또는 다음 각 호의 기간 동안 회원정보를 보유할 수 있습니다.
													<ol>
														<li>1. 계약 또는 청약철회 등에 관한 기록 : 5년</li>
														<li>2. 대금결제 및 재화 등의 공급에 관한 기록 : 5년</li>
														<li>3. 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년</li>
													</ol>
												</li>
												<li>⑪ 회원은 회원탈퇴를 통해 본 약관과 관련한 개인정보의 제공 및 활용과 관련한 동의를 철회할 수 있습니다. 그 경우에도 “사이트”는 본 조 제9항과 10항에 한하여 회원정보를 보유할 수 있습니다.</li>
												<li>⑫ 이용자는 언제든지 “사이트”가 가지고 있는 자신의 개인 정보에 대해 열람 및 오류 정정을 요구할 수 있으며 “사이트”는 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 “사이트”는 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.</li>
												<li>⑬ “사이트”는 개인정보보호를 위하여 이용자의 개인정보를 처리하는 자를 최소한으로 제한하여야 하며, 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.</li>
												<li>⑭ “사이트” 또는 그로부터 개인 정보를 제공받는 제3자는 개인정보의 수집 목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.</li>
												<li>⑮ “사이트”는 개인정보의 수집•이용•제공에 관한 동의란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의 수집•이용•제공에 관한 이용자의 동의거절 시 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보의 수집•이용•제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.</li>
											</ol>

											<h3>제 21 조 (사이트의 의무)</h3>
											<ol>
												<li>① “사이트”는 본 약관에서 정한 바에 따라 계속적이고 안정적인 서비스의 제공을 위하여 지속적으로 노력하며, 설비에 장애가 생기거나 멸실 된 때에는 지체 없이 이를 수리 복구하여야 합니다. 본 약관 제5조 ①항에 근거하여 부득이한 경우에는 서비스를 일시 중단하거나 중지할 수 있습니다.</li>
												<li>② “사이트”는 회원의 개인정보 수집 및 이용에 관련 하여 ‘개인정보 처리 방침’을 준수하며, 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함) 보호를 위한 보안 시스템을 갖추어야 합니다.</li>
												<li>③ “사이트”는 회원으로부터 소정의 절차에 의해 제기되는 의견이나 불만이 정당하다고 인정할 경우에는 적절한 절차를 거처 처리하여야 합니다. 처리 시 일정 기간이 소요될 경우 회원에게 그 사유와 처리 일정을 알려주어야 합니다.</li>
												<li>④ “사이트”가 제공하는 서비스로 인하여 회원에게 손해가 발생한 경우 그러한 손해가 “사이트”의 고의나 과실에 기해 발생한 경우에 한하여 당사에서 책임을 부담하며, 그 책임의 범위는 예측이 가능한 통상손해에 한합니다.</li>
												<li>⑤ “사이트”는 정보통신망 이용촉진 및 정보보호에 관한 법률, 통신비밀보호법, 전기통신사업법 등 서비스의 운영, 유지와 관련 있는 법규를 준수합니다.</li>
												<li>⑥ “사이트”는 이용자가 원하지 않는 영리 목적의 광고성 전자 우편을 발송하지 않으며, “사이트”가 상품이나 용역에 대하여 '표시•광고의 공정화에 관한 법률' 제3조 소정의 부당한 표시, 광고 행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.</li>
											</ol>

											<h3>제 22 조 (톻합회원 ID 및 비밀번호에 대한 의무)</h3>
											<ol>
												<li>① 당사는 서비스를 “사이트”와 본 약관 제2조 제⑥항에 명시된 제휴사의 서비스홈페이지를 회원이 원활하게 이용 할 수 있도록 회원의 ID와 비밀번호를 통합하여 사용할 수 있는 통합아이디서비스를 제공하고 있습니다. 향후 통합아이디를 통해 사용할 수 있는 서비스 홈페이지는 “사이트”의 정책에 따라 추가/변동될 수 있습니다. 단, “사이트”를 제외한 서비스홈페이지 이용 시에는 “사이트”가 정한 정책에 따라, “사이트”의 서비스이용약관에 동의하는 등의 절차를 완료하여야 합니다.</li>
												<li>② 제18조의 경우를 제외한 회원의 ID 및 비밀번호에 관한 관리책임은 회원 본인에게 있으며 제3자에게 자신의 ID 및 비밀번호를 알려주거나 이용하게 해서는 안됩니다.</li>
												<li>③ 회원이 자신의 ID 및 비밀번호를 도용 당하거나 제3자가 사용하고 있음을 인지한 경우에는 즉시 “사이트”에 통보하여 그 안내에 따라야 합니다.</li>
												<li>④ “사이트”는 각 사의 귀책사유 없이 회원이 자신의 ID 및 비밀번호를 도용 당한 데 따른 손해에 대해서는 법적 책임을 부담하지 않습니다.</li>
											</ol>

											<h3>제 23 조 (이용자의 의무)</h3>
											<ol>
												<li>이용자는 다음 행위를 하여서는 안됩니다.</li>
												<li>1. 개인정보를 허위로 등록, 신청, 변경하는 행위</li>
												<li>2. 타인의 명의나 카드정보 등을 도용하여 물품을 구입하거나, 물품구입 등을 가장하여 “사이트”의 서비스를 이용하는 행위.</li>
												<li>3. “사이트”가 제공하는 서비스 이용방법에 의하지 아니하고 비정상적인 방법(컴퓨터 프로그램 포함)으로 서비스를 이용하거나 시스템에 접속하는 행위</li>
												<li>4. “사이트” 기타 제3자의 지적재산권을 침해하는 행위</li>
												<li>5. “사이트” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위</li>
												<li>6. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 “사이트”에 공개 또는 게시하는 행위</li>
											</ol>

											<h3>제 24 조 (연결 웹사이트와 피연결 웹사이트 간의 관계)</h3>
											<ol>
												<li>① 상위 웹사이트와 하위 웹사이트가 하이퍼링크(예: 하이퍼 링크의 대상에는 문자, 그림, 동화상 등이 포함됨) 방식 등으로 연결된 경우, 전자를 연결 웹사이트라고 하고 후자를 피연결 웹사이트라고 합니다.</li>
												<li>② 연결 웹사이트는 피연결 웹사이트가 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결 “사이트” 초기 화면 또는 연결되는 시점의 팝업 화면으로 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다.</li>
											</ol>

											<h3>제 25 조 (저작권의 귀속 및 이용 제한)</h3>
											<ol>
												<li>① “사이트”가 작성한 저작물에 대한 저작권 기타 지적 재산권은 “사이트”에 귀속합니다.</li>
												<li>② 이용자는 “사이트”를 이용함으로써 얻은 정보 중 “사이트”에게 지적 재산권이 귀속된 정보를 “사이트”의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리 목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.</li>
												<li>③ 회원이 게시한 게시물의 내용에 대한 권리와 책임은 이용자에게 있습니다. 따라서 회원의 게시물이 타인의 저작권을 침해함으로써 발생하는 민, 형사상의 책임은 전적으로 이용자가 부담하여야 합니다.</li>
												<li>④ “사이트”는 본 약관에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.</li>
												<li>
													⑤ “사이트”는 게시된 내용을 게시물의 동일성을 해하지 않는 범위 내에서 편집, 이동시킬 수 있는 권리를 보유하며, 다음의 경우 사전 통지 없이 삭제 할 수 있습니다.
													<ol>
														<li>1. 본 약관에 위배되거나 상용 또는 불법, 음란, 저속하다고 판단되는 게시물을 게시한 경우</li>
														<li>2. 다른 회원 또는 제3자를 비방하거나 중상 모략으로 명예를 손상시키는 내용인 경우</li>
														<li>3. 당사에서 규정한 게시기간이나 용량을 초과한 경우</li>
														<li>4. 공공질서 및 미풍양속에 위반되거나 범죄적 행위에 결부된다고 인정되는 내용일 경우</li>
														<li>5. 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우</li>
														<li>6. 탈퇴자가 게시한 게시물</li>
														<li>7. 기타 관계 법령에 위배되는 경우</li>
													</ol>
												</li>
											</ol>

											<h3>제 26 조 (서비스 이용 책임)</h3>
											<ol>
												<li>① 회원은 “사이트”의 적법한 권한 있는 자로부터 구체적으로 명시적인 사전 서면 승인을 받은 경우를 제외하고는 서비스를 이용하여 상품/서비스를 판매하는 영업활동을 할 수 없으며, 특히 해킹, 돈벌이 광고, 음란 사이트 등을 통한 상업행위, 상용S/W 불법배포 등을 할 수 없습니다. 이를 어기고 발생한 영업활동의 결과 및 손실, 관계기관에 의한 구속 등 법적 조치 등에 관해서는 당사가 책임을 지지 않습니다.</li>
											</ol>

											<h3>제 27 조 (서비스 이용 관련 분쟁 해결)</h3>
											<ol>
												<li>① “사이트”는 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상 처리하기 위하여 피해 보상 처리 기구인 고객만족센터를 설치 운영합니다.</li>
												<li>② “사이트”는 이용자로부터 제출되는 불만 사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리 일정을 즉시 통보합니다.</li>
												<li>③ “사이트”와 이용자간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해 구제 신청이 있는 경우에는 공정거래위원회 또는 시도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.</li>
											</ol>

											<h3>제 28 조 (서비스 종료)</h3>
											<ol>
												<li>① 서비스를 종료하고자 할 경우, “사이트”는 서비스를 종료하고자 하는 날('서비스 종료일')로부터 3개월 이전에 본 약관 제3조에 규정된 통지방법을 준용하여 회원에게 알려드립니다.</li>
												<li>② 서비스 종료일 이후 회원은 “사이트”에서 포인트 적립 및 기타 서비스 혜택을 받지 못하며, 통지일 시점에서 기 적립된 포인트는 “사이트”가 별도 지정하는 날(이하 '포인트 소멸일')까지 본 약관과 “사이트”가 지정하는 바에 따라 사용하여야 하며, 포인트 소멸일 이후 미사용 잔여분은 소멸됩니다.</li>
											</ol>

											<h3>제 29 조 (면책조항)</h3>
											<ol>
												<li>① 당사는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.</li>
												<li>② 당사는 회원의 귀책사유로 인한 서비스 이용의 장애에 대하여 책임을 지지 않습니다.</li>
												<li>③ 당사는 회원이 서비스를 이용하여 기대하는 수익을 상실한 것이나 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않습니다.</li>
												<li>④ 당사는 회원이 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다.</li>
												<li>⑤ 당사는 서비스 이용과 관련하여 가입자에게 발생한 손해 가운데 회원의 고의, 과실에 의한 손해에 대하여 책임을 지지 않습니다.</li>
											</ol>

											<h3>제 30 조 (준거법 및 관할법원)</h3>
											<ol>
												<li>① 본 약관에서 정하지 않은 사항과 본 약관의 해석에 관하여는 대한민국 관련법령 및 상관례에 따릅니다.</li>
												<li>② “사이트”와 이용자간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방 법원의 전속 관할로 합니다. 다만 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사 소송법상의 관할 법원에 제기합니다.</li>
												<li>③ “사이트”와 이용자간에 제기된 전자상거래 소송에는 한국법을 적용합니다.</li>
											</ol>
											<br/>
											<br/>
											<br/>
											<p>부칙</p>
											<h3>제1조 (약관의 효력)</h3>
											<p>이 약관은 2021년 8월 6일부터 시행합니다.</p>
										</div>
									<!-- / policy영역 -->
								</div>
								<!-- / 약관box -->
							</div>

                            <!-- 까사미아 위치정보서비스 활용동의 -->
							<div class="term_b">
								<h2>
									<div class="input_b size_sm type1">
										<div class="ez-checkbox">
											<input name="chkChoiceAgreementForCasamiaMembership2" type="checkbox" id="chkChoiceAgreementForCasamiaMembership2" class="ez-hide agreement-casa">
										</div>
										<label for="chkChoiceAgreementForCasamiaMembership2">까사미아 위치정보서비스 활용동의 <span>(선택)</span></label>
									</div>
								</h2>

								<!-- 약관box -->
								<div class="txt_a_new txt_a" style="/* background: #fff; */width: 95%;border: 0; overflow:hidden;">
									<div class="policy_a">
										(주)신세계까사는 직접 위치정보를 수집하거나 위치정보사업자로부터 위치정보를 전달받아 위치기반서비스(주변매장찾기)를 제공합니다. <br/>
										위치기반서비스의 이용요금은 무료입니다. 단, 무선서비스 이용시 발생하는 데이터 통신료는 별도이며, 이용자가 가입한 각 이동통신사의 정책을 따릅니다.
										<ol>
											<li>
												<h3>제１조 (목적)</h3>
												<ol>
													<li>이 약관은 ㈜신세계까사('까사미아 굳멤버스와 굳닷컴 http://guudmembers.casamia.co.kr, http://www.guud.com'이하 '당사')가 제공하는 위치기반서비스에 대해 “당사”와 위치기반서비스를 이용하는 개인위치정보주체(이하”이용자”)와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.</li>
												</ol>
											</li>
											<li>
												<h3>제２조 (약관의 효력 및 변경)</h3>
												<ol>
													<li>① 본 약관은 이용자가 본 약관에 동의하고 당사가 정한 소정의 절차에 따라 서비스의 이용자로 등록함으로써 효력이 발생합니다.</li>
													<li>② 당사는 법률이나 위치기반서비스의 변경사항을 반영하기 위한 목적 등으로 약관을 수정할 수 있습니다.</li>
													<li>③ 약관이 변경되는 경우 당사는 변경사항을 최소 15일 전에 회사의 홈페이지 등 공지사항 페이지를 통해 게시합니다.</li>
													<li>④ 단 개정되는 내용이 이용자 권리의 중대한 변경이 발생하는 경우에는 30일 전에 게시하도록 하겠습니다.</li>
												</ol>
											</li>
											<li>
												<h3>제３조 (약관 외 준칙)</h3>
												<ol>
													<li>이 약관에 명시되지 않은 사항은 위치정보의 보호 및 이용 등에 관한 법률, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전기통신기본법, 전기통신사업법 등 관계법령과 “당사”가 정한 지침 등의 규정에 따릅니다.</li>
												</ol>
											</li>
											<li>
												<h3>제４조 (서비스 내용 및 요금)</h3>
												<ol>
													<li>
														① 당사는 직접 위치정보를 수집하거나 위치정보사업자로부터 위치정보를 전달받아 아래와 같은 위치기반서비스를 제공합니다.
														<ol>
															<li>가. 주변매장찾기 : 현재의 위치를 기반으로 하여 주변 매장의 위치 등의 정보를 제공하는 서비스</li>
														</ol>
													</li>
													<li>② 제1항 위치기반서비스의 이용요금은 무료입니다. 단, 무선서비스 이용시 발생하는 데이터 통신료는 별도이며, 이용자가 가입한 각 이동통신사의 정책을 따릅니다.</li>
												</ol>
											</li>
											<li>
												<h3>제５조 (개인위치정보주체의 권리)</h3>
												<ol>
													<li>① 이용자는 언제든지 개인위치정보의 수집•이용•제공에 대한 동의 전부 또는 일부를 유보할 수 있습니다.</li>
													<li>
														② 이용자는 언제든지 개인위치정보의 수집•이용•제공에 대한 동의 전부 또는 일부를 철회할 수 있습니다. <br/>
														이 경우 당사는 지체없이 철회된 범위의 개인위치정보 및 위치정보 수집•이용•제공사실 확인자료를 파기합니다.
													</li>
													<li>③ 이용자는 개인위치정보의 수집•이용•제공의 일시적인 중지를 요구할 수 있으며, 당사는 이를 거절할 수 없고 이를 충족하는 기술적 수단을 갖추고 있습니다.</li>
													<li>
														④ 이용자는 당사에 대하여 아래 자료의 열람 또는 고지를 요구할 수 있고, 당해 자료에 오류가 있는 경우에는 그 정정을 요구할 수 있습니다. 이 경우 당사는 정당한 이유 없이 요구를 거절하지 아니합니다.
														<ol>
															<li>1. 이용자에 대한 위치정보 수집•이용•제공사실 확인자료</li>
															<li>2. 이용자의 개인위치정보가 위치정보의 보호 및 이용 등에 관한 법률 또는 다른 법령의 규정에 의하여 제3자에게 제공된 이유 및 내용</li>
														</ol>
													</li>
													<li>⑤ 이용자는 제1항 내지 제4항의 권리행사를 고객센터를 통해 당사에 요구할 수 있습니다.</li>
												</ol>
											</li>
											<li>
												<h3>제６조 (위치정보 이용ㆍ제공사실 확인자료 보유근거 및 보유기간)</h3>
												<ol>
													<li>당사는 위치정보의 보호 및 이용 등에 관한 법률 제16조 제2항에 근거하여 이용자에 대한 위치정보 수집•이용•제공 후 즉각 파기하며 별도로 보관하지 않습니다.</li>
												</ol>
											</li>
											<li>
												<h3>제７조 (적용제외)</h3>
												<ol>
													<li>만 14세 미만인자는 회원 가입대상이 아니므로, 당사는 회원가입이 불가능한 만14세 미만 자의 위치정보를 수집하지 않습니다. 따라서 만14세 미만의 이용자에 대해서는 위치기반서비스와 관련한 민원 발생 등에 대해서는 책임을 지지 않습니다.</li>
												</ol>
											</li>
											<li>
												<h3>제８조 (서비스의 이용제한 및 중지)</h3>
												<ol>
													<li>① 당사는 위치기반서비스사업자의 정책변경 등과 같이 당사의 제반 사정 또는 법률상의 이유로 위치정보서비스를 유지할 수 없는 경우, 위치기반서비스의 전부 또는 일부를 제한•변경하거나 중지할 수 있습니다.</li>
													<li>② 제1항에 의한 위치기반서비스 중단의 경우에는 당사는 사전에 인터넷 등에 공지하거나 이용자에게 통지합니다.</li>
												</ol>
											</li>
											<li>
												<h3>제９조 (개인위치정보 이용 또는 제공)</h3>
												<ol>
													<li>① 당사는 개인위치정보를 이용하여 위치기반서비스를 제공하는 경우 본 약관에 고지하고 동의를 받습니다.</li>
													<li>② 당사는 이용자의 동의 없이 개인위치정보를 제3자에게 제공하지 않으며, 제3자에게 제공하는 경우에는 제공 받는 자 및 제공목적을 사전에 이용자에게 고지하고 동의를 받습니다.</li>
													<li>
														③ 당사는 개인위치정보를 이용자가 지정하는 제3자에게 제공하는 경우 개인위치정보를 수집한 통신단말장치로 매회 이용자에게 제공받는 자, 제공일시 및 제공목적을 즉시 통보합니다. 단, 아래 각 호에 해당하는 경우에는 이용자가 미리 특정하여 지정한 통신단말장치 또는 전자우편주소, 온라인게시 등으로 통보합니다.
														<ol>
															<li>1. 개인위치정보를 수집한 당해 통신단말장치가 문자, 음성 또는 영상의 수신기능을 갖추지 아니한 경우</li>
															<li>2. 회원이 개인위치정보를 수집한 당해 통신단말장치 외의 통신단말장치 또는 전자우편주소로 통보할 것을 미리 요청한 경우</li>
														</ol>
													</li>
												</ol>
											</li>
											<li>
												<h3>제１０조 (손해배상)</h3>
												<ol>
													<li>이용자는 당사의 위치정보의 보호 및 이용 등에 관한 법률 제15조 내지 26조의 규정을 위반한 행위로 손해를 입은 경우에 당사에 대하여 손해배상을 청구할 수 있습니다. 이 경우 당사는 고의 또는 과실이 없음을 입증하지 아니하면 책임을 면할 수 없습니다.</li>
												</ol>
											</li>
											<li>
												<h3>제１１조 (면책)</h3>
												<ol>
													<li>
														① 당사는 다음 각 호의 경우로 위치기반서비스를 제공할 수 없는 경우 이로 인하여 이용자에게 발생한 손해에 대해서는 책임을 부담하지 않습니다.
														<ol>
															<li>1. 천재지변 또는 이에 준하는 불가항력의 상태가 있는 경우</li>
															<li>2. 위치기반서비스 제공을 위하여 당사와 서비스제휴계약을 체결한 제3자의 고의적인 서비스방해가 있는 경우</li>
															<li>3. 이용자의 귀책사유로 위치기반서비스 이용에 장애가 있는 경우</li>
															<li>4. 제1호 내지 제3호를 제외한 기타 회사의 고의•과실이 없는 사유로 인한 경우</li>
														</ol>
													</li>
													<li>② 당사는 위치기반서비스 및 위치기반서비스에 게재된 정보, 자료, 사실의 신뢰도, 정확성 등에 대해서는 보증을 하지 않으며 이로 인해 발생한 이용자의 손해에 대하여는 책임을 부담하지 아니합니다.</li>
												</ol>
											</li>
											<li>
												<h3>제１２조 (분쟁의 조정)</h3>
												<ol>
													<li>① 당사는 위치정보와 관련된 분쟁의 해결을 위해 이용자와 성실히 협의 합니다.</li>
													<li>② 전항의 협의에서 분쟁이 해결되지 않는 경우, 회사와 이용자는 위치정보의 보호 및 이용 등에 관한 법률 제28조의 규정에 의해 방송통신위원회에 재정을 신청하거나, 개인정보보호법 제43조의 규정에 의해 개인정보 분쟁위원회에 조정을 신청할 수 있습니다.</li>
												</ol>
											</li>
											<li>
												<h3>제１３조 (회사의 주소 및 연락처)</h3>
												<ol>
													<li>당사의 상호, 주소, 전화번호 그 밖의 연락처는 다음과 같습니다.</li>
													<li>상호 : ㈜신세계까사</li>
													<li>주소 : 서울시 중구 남대문시장10길 2 메사빌딩 5-6층</li>
													<li>전화번호 : 1588-3408</li>
													<li>이메일주소 : casamia@shinsegae.com</li>
												</ol>
											</li>
											<li>
												<h3>부칙</h3>
												<h3>제１조 시행일</h3>
												<ol>
													<li>본 약관은 2021년 8월 6일부터 적용됩니다.</li>
												</ol>
											</li>
											<li>
												<h3>제２조 위치정보관리 책임자 정보</h3>
												<ol>
													<li>당사는 다음과 같이 위치정보 관리책임자를 지정하여 이용자들이 서비스 이용과정에서 발생한 민원사항 처리를 비롯하여 개인위치정보주체의 권리 보호를 위해 힘쓰고 있습니다.</li>
													<li>위치정보 관리책임자 (개인정보보호책임자 겸직)</li>
												</ol>
											</li>
										</ol>
									</div>
								</div>
							</div>
							<!-- //까사미아 위치정보서비스 활용동의 -->

							<!-- 까사미아 개인정보 수집 이용 동의 -->
							<div class="term_b">
								<h2>
									<div class="input_b size_sm type1">
										<div class="ez-checkbox">
											<input name="chkChoiceAgreementForCasamiaMembership3" type="checkbox" id="chkChoiceAgreementForCasamiaMembership3" class="ez-hide agreement-casa">
										</div>
										<label for="chkChoiceAgreementForCasamiaMembership3">까사미아 개인정보 처리방침<span>(선택)</span></label>
									</div>
								</h2>

								<!-- 약관box -->
								<div class="txt_a_new txt_a" style="/* background: #fff; */width: 95%;border: 0; overflow:hidden;">
									<!-- policy영역 -->
									<div class="policy_a">
										㈜ 신세계까사(이하 '당사'라고 한다)에서 운영하는 까사미아 굳멤버스와 굳닷컴 (https://guudmembers.casamia.co.kr, https://www.guud.com)는 개인정보보호법에 따라 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다. <br/>
										당사는 개인정보처리방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다. <br/><br/>
										○ 본 방침은 2021년 8월 6일부터 시행됩니다.
										<ol>
											<li>
												<h3>제1조 총칙</h3>
												<ol>
													<li>１. 개인정보란 생존하는 개인에 관한 정보로서 당해 정보에 포함되어 있는 성명 등의 사항에 의하여 당해 개인을 식별할 수 있는 정보(당해 정보만으로는 특정 개인을 식별할 수 없더라도 다른 정보와 용이하게 결합하여 식별할 수 있는 것을 포함)를 말합니다.</li>
													<li>２. 당사는 회원의 개인정보를 매우 중요시하고, 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』, 『개인정보보호법』 등의 관련 법률을 준수하고 있으며, 그에 의거한 개인정보처리방침을 정하여 이용자의 권익보호에 최선을 다하고 있습니다.</li>
													<li>３. 당사는 개인정보처리방침을 통하여 회원께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.</li>
													<li>４. 당사는 개인정보처리방침을 홈페이지 첫 화면에 공개함으로써 회원께서 언제나 용이하게 보실 수 있도록 조치하고 있습니다.</li>
													<li>５. 당사 회원의 개인정보보호는 당사 개인정보처리방침에 의해 이루어지며, 링크된https://guudmembers.casamia.co.kr 또는 https://www.guud.com 에서 확인 가능합니다.</li>
												</ol>
											</li>

											<li>
												<h3>제2조 개인정보 수집항목 및 이용목적</h3>
												<ol>
													<li>
														１. 당사는 까사미아 굳멤버스 통합회원(이하 “통합회원”이라고 합니다) 및 까사미아 굳멤버스 간편가입회원 (이하 “간편회원”이라고 합니다)에게 본인확인, 포인트 적립 및 결제 서비스, 다양하고 편리한 서비스를 제공하기 위해 아래의 방법을 통해 개인정보를 수집하고 있습니다. 비회원 고객 또한 당사에서 운영하는 사이트에서 상품을 구매할 수 있으며, 이 경우 아래와 같이 배송, 대금 결제, 서비스 안내 등을 위해 최소한의 개인정보만을 요청하여 동의를 구합니다.
														<ol>
															<li>가 당사가 제공하는 회원제 서비스에 따른 본인 확인 절차에 활용</li>
															<li>나 마일리지 적립 및 사용, 정산, 고객센터 운영 등</li>
															<li>다 물품 및 서비스 상품에 대한 주문 및 접수, 대금 결제, 주문상품 배송 및 회원에 대한 각종 편의 서비스 제공</li>
															<li>라 경품 및 물품 배송에 대한 정확한 배송지 확보</li>
															<li>마 당사가 제공하는 서비스 및 이벤트 정보 제공(SMS/전자우편/DM /TM 등)</li>
															<li>바 당사의 제휴행사 및 서비스 홍보를 위한 마케팅 자료 활용</li>
															<li>사 공지/불만처리 등을 위한 원활한 의사소통의 경로 확보</li>
															<li>아 업무와 관련된 통계자료 작성 및 서비스 개발</li>
														</ol>
													</li>
													<li style="margin-top: 24px;">２. 개인정보 수집항목</li>
													<li>
														<table border="0" cellspacing="0" cellpadding="0" class="header_h">
															<tbody>
																<tr>
																	<td colspan="2"><p align="center">구분</p></td>
																	<td><p align="center">수집시점</p></td>
																	<td><p align="center">수집항목</p></td>
																	<td><p align="center">이용목적</p></td>
																	<td><p align="center">보유기간</p></td>
																</tr>
																<tr>
																	<td rowspan="4"><p align="left">통합회원(까사미아 굳멤버스 온라인/매장 통합회원)</p></td>
																	<td rowspan="2"><p align="left">필수</p></td>
																	<td><p align="left">회원가입</p></td>
																	<td><p align="left">성명, 아이디, 비밀번호, 전자우편주소, 휴대전화번호, 주소, 본인확인에 필요한 정보(CI, DI, 생년월일, 성별) 외국인여부(외국인회원에 한함) 등)</p></td>
																	<td><p align="left">회원제 서비스에 따른 본인확인 및 회원관리, 공지(알림)/불만처리, 고객상담, 거점기반 서비스 제공 등</p></td>
																	<td rowspan="2"><p align="left">회원 탈퇴 후 30일까지 또는 법정 의무 보유기간까지</p></td>
																</tr>
																<tr>
																	<td><p align="left">주문/결제/배송</p></td>
																	<td><p align="left">성명, 휴대전화번호, 전자우편주소, 배송정보(주문자 및 수취인주소, 수취인명, 수취인연락처 등), 결제정보(계좌정보, 신용카드정보, 포인트카드 번호, 기프트카드번호, 환불 계좌정보, 현금영수증 발행여부 등)</p></td>
																	<td><p align="left">신세계포인트 적립/사용, 마일리지 적립/사용, 기프트카드 사용, 물품/서비스 주문, A/S, 결제, 배송, 현금영수증 발행, 청약철회시 계좌환불, 부정사용자의 식별 등</p></td>
																</tr>
																<tr>
																	<td rowspan="2"><p align="left">선택</p></td>
																	<td><p align="left">마케팅</p></td>
																	<td><p align="left">전자우편주소, 성명, 휴대전화번호, 마케팅 수신 동의여부</p></td>
																	<td><p align="left">서비스 및 이벤트 정보 제공 (SMS/전자우편 등)</p></td>
																	<td><p align="left">회원 탈퇴 시 또는 동의 철회 시</p></td>
																</tr>
																<tr>
																	<td><p align="left">클럽</p></td>
																	<td><p align="left">결혼증빙자료, 입주증빙자료, 결혼기념일, 가족수, 자녀 생년월일, 관심상품</p></td>
																	<td><p align="left">클럽 가입을 통함 서비스 및 이벤트 정보 제공(SMS/전자우편/DM/TM 등)</p></td>
																	<td><p align="left">회원 탈퇴 시 또는 목적 달성 시</p></td>
																</tr>
																
																<tr>
																	<td rowspan="4"><p align="left">간편회원</p></td>
																	<td rowspan="2"><p align="left">필수</p></td>
																	<td><p align="left">회원가입</p></td>
																	<td><p align="left">전자우편주소(아이디), 성명, 비밀번호, 휴대전화번호, 14세 이상 여부</p></td>
																	<td><p align="left">이용자 식별, 서비스이행을 위한 연락</p></td>
																	<td rowspan="2"><p align="left">회원 탈퇴 후 30일까지 또는 법정 의무 보유기간까지</p></td>
																</tr>
																<tr>
																	<td><p align="left">주문/결제/배송</p></td>
																	<td><p align="left">성명, 휴대전화번호, 전자우편주소, 배송정보(주문자 및 수취인주소, 수취인명, 수취인연락처 등), 결제정보(계좌정보, 신용카드정보, 포인트카드 번호, 기프트카드번호, 환불 계좌정보, 현금영수증 발행여부 등)</p></td>
																	<td><p align="left">신세계포인트 적립/사용, 기프트카드 사용, 물품/서비스 주문, A/S, 결제, 배송, 불만처리시 본인 확인, 현금영수증 발행, 청약철회시 계좌환불, 부정사용자의 식별 등</p></td>
																</tr>
																<tr>
																	<td rowspan="2"><p align="left">선택</p></td>
																	<td><p align="left">가입/주문</p></td>
																	<td><p align="left">주소</p></td>
																	<td><p align="left">거점기반 서비스 제공</p></td>
																	<td rowspan="2"><p align="left">회원 탈퇴 시 또는 동의 철회 시</p></td>
																</tr>
																<tr>
																	<td><p align="left">마케팅</p></td>
																	<td><p align="left">전자우편주소, 성명, 휴대전화번호, 마케팅 수신 동의 여부</p></td>
																	<td><p align="left">서비스 및 이벤트 정보 제공 (SMS/전자우편 등)</p></td>
																</tr>
																<tr>
																	<td><p align="left">비회원</p></td>
																	<td><p align="left">필수</p></td>
																	<td><p align="left">주문/결제/배송</p></td>
																	<td><p align="left">주소, 성명, 휴대전화번호, 전자우편주소, 배송정보(주문자 및 수취인주소, 수취인명, 수취인연락처 등), 결제정보(계좌정보, 신용카드정보, 포인트카드 번호, 기프트카드 번호, 환불 계좌정보, 현금영수증 발행여부 등)</p></td>
																	<td><p align="left">신세계포인트 적립/사용, 기프트카드 사용, 주문자 / 배송지 정보 확보, 현금영수증 발행, 불만처리 의사소통 경로 확보, 주문상품에 대한 결제 및 취소 청약철회 시 계좌환불</p></td>
																	<td><p align="left">목적 달성 시 또는 법정 의무 보유기간까지</p></td>
																</tr>
																<tr>
																	<td><p align="left">입점문의</p></td>
																	<td><p align="left">필수</p></td>
																	<td><p align="left">입점문의 등록 시</p></td>
																	<td><p align="left">담당자명, 전화번호, 휴대폰번호, 팩스번호, 전자우편주소</p></td>
																	<td><p align="left">입점 문의 접수, 상담 및 적정성 검토를 위한 담당자 정보 수집</p></td>
																	<td><p align="left">목적 달성 시 또는 법정 의무 보유기간까지</p></td>
																</tr>
																<tr>
																	<td><p align="left">입점신청</p></td>
																	<td><p align="left">필수</p></td>
																	<td><p align="left">입점신청 등록 시</p></td>
																	<td><p align="left">대표자명, 회사전화번호, 회사주소, 회사계좌정보, 담당자명, 전화번호, 휴대폰번호, 팩스번호, 전자우편주소</p></td>
																	<td><p align="left">입점 문의 신청, 상담 및 적정성 검토를 위한 담당자 정보 수집</p></td>
																	<td><p align="left">목적 달성 시 또는 법정 의무 보유기간까지</p></td>
																</tr>
																<tr>
																	<td colspan="3"><p align="left">SNS를 통한 회원가입 서비스 이용 시 SNS로부터 제공 받는 정보</p></td>
																	<td><p align="left">전자우편주소(아이디), 성명, 휴대전화번호, 14세 이상 여부</p></td>
																	<td colspan="2">
																		<p align="left">
																			전자우편주소(아이디), 성명, 휴대전화번호, 14세 이상 여부<br/>	
																			※ SNS로부터 제공받은 정보는 회원가입 단계에서만 이용하며, 회원가입이 진행되지 않는 경우 즉시 파기합니다. 또한, 당사의 회원가입 절차를 통해 고객이 직접 동의한 경우에 한하여 개인정보를 보관합니다.
																		</p>
																	</td>
																</tr>
																<tr>
																	<td colspan="3"><p align="left">로그인 연동 서비스</p></td>
																	<td colspan="3"><p align="left">※ 당사는 고객의 편의를 위해 SNS 연동 로그인, 지문이용 로그인 방식을 제공하고 있습니다. <br/> 이와 같은 로그인시 당사가 고객의 개인정보를 추가 수집하지 않으며, 다만 임의의 인증값만 비교하고 있습니다.</p></td>
																</tr>
																<tr>
																	<td colspan="3"><p align="left">서비스 이용과정 및 사업 처리과정에서 수집될 수 있는 개인정보</p></td>
																	<td><p align="left">서비스 이용 및 중지기록, 접속로그, 쿠키, 접속IP정보, 결제기록, 이용정지기록, 은행 계좌정보, 신용카드정보, 포인트카드 번호, 거래정보</p></td>
																	<td rowspan="2"><p align="left">소비자보호를 위한 법적 의무 준수, 서비스 통계 분석 등</p></td>
																	<td rowspan="2"><p align="left">회원 탈퇴 시 또는 법정 의무 보유기간까지</p></td>
																</tr>
																<tr>
																	<td colspan="3"><p align="left">모바일기기 이용 시 수집될 수 있는 개인정보</p></td>
																	<td><p align="left">단말기식별번호, 단말기OS정보, 광고 식별자, 이동통신사, PUSH 수신여부</p></td>
																</tr>
															</tbody>
														</table>
														<p>※ 소득세법에 따라 경품 지급 등을 위한 제세공과금 처리 목적으로 주민등록번호, 계좌번호 등을 수집할 수 있습니다.</p>
													</li>
													<li>
														3. 당사는 모바일 앱 서비스를 위하여 아래와 같이 고객의 이동통신단말기 내 정보 및 기능에 접근, 이용할 수 있습니다. 필수 접근항목은 앱 설치 시 또는 최초 실행 시 안내 및 동의를 받으며, 선택 접근항목은 해당 서비스 최초 이용 시 별도 동의를 받습니다. 선택 접근항목의 경우 OS버전에 따라 동의 받는 방법이 다를 수 있으나, 회원이 거부하더라도 기본 서비스 이용에는 제한이 없습니다.
														<table border="0" cellspacing="0" cellpadding="0" class="header_h">
															<tbody>
																<tr>
																	<td><p align="center">필수여부</p></td>
																	<td><p align="center">접근항목</p></td>
																	<td><p align="center">접근목적</p></td>
																</tr>
																<tr>
																	<td><p align="center">필수</p></td>
																	<td><p align="center">기기 및 앱 기록 권한</p></td>
																	<td><p align="center">앱 실행 시 오류확인, 사용성 개선</p></td>
																</tr>
																<tr>
																	<td rowspan="3"><p align="center">선택</p></td>
																	<td><p align="center">사진/카메라</p></td>
																	<td><p align="center">포토상품평, 스캔검색, 모바일영수증, 증강현실줄자, 이미지첨부, 이미지 상품검색</p></td>
																</tr>
																<tr>
																	<td><p align="center">마이크</p></td>
																	<td><p align="center">음성검색</p></td>
																</tr>
																<tr>
																	<td><p align="center">바이오정보(지문,안면인식)</p></td>
																	<td><p align="center">바이오인증 로그인 이용</p></td>
																</tr>
															</tbody>
														</table>
														<p>
															※ 선택적 접근권한에 동의하지 않아도 기본적인 서비스 이용은 가능합니다. <br/>
															※ 모바일 기기 및 앱의 설정기능을 통해 접근권한을 설정하실 수 있으며, 일부 OS버전에 따라 권한설정이 불가능 할 수도 있습니다.
														</p>
													</li>
													<li>
														４. 회원 탈퇴 시 필수 개인정보는 회원의 요구사항 처리, 포인트 소멸 일시 보류 등의 목적으로 30일 이내의 유예기간을 두고 파기합니다. 또한 관계 법령의 규정에 따라 귀하의 개인정보를 보존할 의무가 있는 경우에는 일정 기간 보관할 수 있습니다.
													</li>
													<li>
														５. 개인정보의 수집방법
														<ol>
															<li>① 홈페이지, 상담게시판, 전화, 팩스, 이벤트응모, 배송 요청</li>
															<li>② 로그 분석 프로그램을 통한 생성정보수집, '쿠키(cookie)'에 의한 정보 수집</li>
															<li>③ 관계사 및 구매자로부터의 제공</li>
															<li>④ 스마트폰용 어플리케이션을 통한 수집</li>
														</ol>
													</li>
													<li>
														６. 회원은 개인정보 수집 동의를 거부할 권리가 있으나, 동의 거부 시 제3조에서 규정하고 있는 당사가 제공하는 서비스를 받을 수 없습니다
													</li>
													<li>
														７. 허위 정보 입력 시 당사의 조치 <br/>
														회원은 자신의 정보에 대해 정확성 및 적법성을 보장해야 합니다. 만약 이를 위반하여 타인의 정보를 도용하는 등 각종 방법으로 허위 정보를 입력할 경우 당사는 해당 회원을 관계법령에 따라 신고 할 수 있으며 강제 탈퇴를 시킬 수도 있습니다.
													</li>
													<li>
														８. 당사는 회원의 기본적 인권 침해의 우려가 있는 민감한 개인정보는 수집하지 않습니다.
													</li>
													<li>
														９. 회원이 자발적으로 공개한 개인정보로 인해 회원 개인에게 발생하는 손실이나 문제는 전적으로 개인의 책임이며, 공개적인 공간에 게재되는 개인정보는 다른 사람이 수집하여 무단으로 사용할 수 있음을 인지하시어, 이로 인해 원하지 않는 피해를 입을 수 있음을 유념하시기 바랍니다.
													</li>
												</ol>
											</li>

											<li>
												<h3>제3조 개인정보의 보유, 이용기간 및 파기</h3>
												<ol>
													<li>
														１. 당사는 개인정보의 수집목적 또는 제공받은 목적이 달성된 때에는 회원의 개인정보를 지체 없이 파기합니다.
														<ol>
															<li>가 회원가입 정보 : 회원탈퇴를 요청한 시점으로 30일 내</li>
															<li>나 배송정보 : 물품 또는 서비스가 인도되거나 제공된 때</li>
															<li>다 설문조사, 이벤트 등의 목적을 위하여 수집한 경우 : 당해 설문조사, 이벤트 등을 종료한 때</li>
															<li>
																라 본인확인정보 : 본인임을 확인 한 때 <br/>
																단, 상법 등 관련법령의 규정에 의하여 다음과 같이 거래 관련 관리 의무 관계의 확인 등을 이유로 일정기간 보유하여야 할 필요가 있을 경우에는 일정기간 보유합니다. 
															</li>
															<li>가 계약 또는 청약철회 등에 관한 기록 : 5년</li>
															<li>나 대금결제 및 재화 등의 공급에 관한 기록 : 5년</li>
															<li>다 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년</li>
															<li>라 웹사이트 방문 기록 : 3개월</li>
														</ol>
													</li>
													<li>
														２. 개인정보 파기방법은 아래와 같습니다.
														<ol>
															<li>가 종이에 출력된 개인정보: 분쇄기로 분쇄하거나 소각</li>
															<li>나 전자적 파일형태로 저장된 개인정보: 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제</li>
														</ol>
													</li>
													<li>
														３. 개인정보 유효기간 제도 도입
														<ol>
															<li>가 당사는 장기간(1년 이상) 서비스 미 이용자의 개인정보보호를 위하여 2015년 8월 이후에는 다른 이용자의 회원정보와 분리하여 저장, 관리합니다.</li>
															<li>나 개인정보 유효기간은 회원이 회원정보등록 또는 회원정보수정페이지를 통해 1년, 3년, 5년, 탈퇴 시 중 선택이 가능하며, 회원이 유효기간을 선택하지 않을 시 1년을 기준으로 자동 설정합니다.</li>
															<li>다 미이용의 기간은 로그인, 주문/결제 등으로 산정하며 법령에서 정의한 기간 동안 서비스 미 이용자에 대하여 분리, 저장 관리하며, 이 경우 정보의 이용, 사용 자체를 금지합니다.</li>
															<li>라 당사는 미 이용자 개인정보 분리/저장시점 도래 1개월 이전에 이메일 등을 통해 해당 이용자에게 관련 내용을 공지합니다.</li>
															<li>마 분리, 저장된 미 이용자 개인정보는 관련 법령에 따라 일정기간 동안 보유하며, 해당 기간 종료 후 파기됩니다. 파기되지 않은 개인정보는 해당 이용자의 요청에 따라 서비스 이용을 재개하는 시점에 다시 제공됩니다.</li>
															<li>바 이용자 요청에 의해 해지 또는 삭제된 개인정보는 “개인정보 보유 및 이용기간”에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.</li>
														</ol>
													</li>
												</ol>
											</li>

											<li>
												<h3>제4조 개인정보의 제공 및 공유</h3>
												<ol>
													<li>１. 당사 회원으로 가입하시면 까사미아 굳멤버스와 굳닷컴이 제공하는 서비스를 하나의 아이디로 이용할 수 있습니다.</li>
													<li>２. 당사는 고객의 개인정보를 제2조(개인정보의 수집항목 및 이용목적)에서 고지한 범위 내에서 사용하며, 동 범위를 초과하여 이용하거나 사전 동의 없이 타인 또는 타기업•기관등 제3자에게 제공하지 않습니다.</li>
													<li>３. 회원의 개인정보를 제공하거나 공유하는 경우에는 제공받는 자, 제공목적, 제공항목, 보유/이용기간 등에 대해 개별적으로 사이트, 전자우편 또는 서면, 신청서 등을 통해 고지한 후 이에 대하여 별도 동의를 구합니다.</li>
													<li>
														４. 다만 다음 사항은 예외적으로 동의 없이 개인정보 제공이 가능합니다.
														<ol>
															<li>가 수사목적으로 관계법률에서 정한 절차와 방법에 따라 수사기관이 개인정보 제공을 요구하는 경우</li>
															<li>나 통계작성, 학술연구나 시장조사 등을 위하여 특정 개인을 식별할 수 없는 형태로 광고주, 협력사나 연구단체 등에 제공하는 경우</li>
															<li>다 기타 관계법률의 규정에 따른 요청이 있는 경우</li>
															<li>
																라 서비스 제공에 따른 요금(마일리지) 정산과 사은품 배송을 위하여 필요한 경우 <br/>
																※ 회사는 영업의 양도 등에 관한 사유가 발생하여 회원의 개인정보 이전이 필요한 경우, 관계법률에서 규정한 절차와 방법에 따라 개인정보 이전에 관한 사실 등을 사전에 고지하며, 회원에게는 개인정보 이전에 관한 동의 철회권을 부여합니다.
															</li>
															<li>
																５. 회원은 개인정보 제3자 제공 동의를 거부할 권리가 있으며, 제3자 제공 동의 여부와 관계 없이 회원에 가입할 수 있습니다. 단, 개인정보 제3자 제공 동의 거부 시, 상기 이용목적에 명시된 서비스를 받으실 수 없습니다.
															</li>
														</ol>
													</li>
												</ol>
											</li>

											<li>
												<h3>제5조 수집한 개인정보의 처리위탁</h3>
												<ol>
													<li>
														１. 당사는 서비스 이행을 위해 아래와 같이 개인정보 처리 업무를 외부업체에 위탁하여 운영하고 있습니다. 
														<table border="0" cellspacing="0" cellpadding="0" class="header_h">
															<tbody>
																<tr>
																	<td><p align="center">수탁업무</p></td>
																	<td><p align="center">수탁자</p></td>
																</tr>
																<tr>
																	<td><p align="center">웨딩기프트, DM, 카다로그, 이벤트 상품 발송업체</p></td>
																	<td><p align="center">(주)KDM</p></td>
																</tr>
																<tr>
																	<td><p align="center">SMS, E-mail, APP PUSH 발송 시스템 유지보수</p></td>
																	<td><p align="center">CJ 올리브네트웍스</p></td>
																</tr>
																<tr>
																	<td><p align="center">택배발송</p></td>
																	<td><p align="center">CJ 택배</p></td>
																</tr>
																<tr>
																	<td><p align="center">구매이력 확인 및 사은품 발송</p></td>
																	<td><p align="center">모바일이앤앰애드</p></td>
																</tr>
																<tr>
																	<td><p align="center">POS, ERP, CRM, 멤버십 시스템 운영 및 유지보수</p></td>
																	<td><p align="center">(주)신세계 I&C</p></td>
																</tr>
																<tr>
																	<td><p align="center">CS 시스템 운영 유지보수</p></td>
																	<td><p align="center">(주)크루드시스템</p></td>
																</tr>
																<tr>
																	<td><p align="center">C-BOOK 유지보수</p></td>
																	<td><p align="center">모비딕</p></td>
																</tr>
																<tr>
																	<td><p align="center">본인인증</p></td>
																	<td><p align="center">NICE 신용평가정보(주)</p></td>
																</tr>
																<tr>
																	<td><p align="center">본인인증</p></td>
																	<td><p align="center">KCB</p></td>
																</tr>
																<tr>
																	<td><p align="center">AS 기사앱 유지보수</p></td>
																	<td><p align="center">진승정보통신</p></td>
																</tr>
																<tr>
																	<td><p align="center">주문상품 택배발송</p></td>
																	<td><p align="center">(주)아이제이로지스틱스</p></td>
																</tr>
																<tr>
																	<td><p align="center">설치상품 배송대행업체</p></td>
																	<td><p align="center">미정</p></td>
																</tr>
																<tr>
																	<td><p align="center">*택배사(상품 배송 업무 처리)</p></td>
																	<td><p align="center"><a href="https://guudmembers.casamia.co.kr/web/coInfo/shipCoInfo" target="_blank">[택배사 보기]</a></p></td>
																</tr>
																<tr>
																	<td><p align="center">*상품판매 제휴업체(입점상품 주문 확인 및 배송 업무 처리)</p></td>
																	<td><p align="center"><a href="https://guudmembers.casamia.co.kr/web/coInfo/companyCoInfo" target="_blank">[상품판매 제휴업체 보기]</a></p></td>
																</tr>
																<tr>
																	<td><p align="center">구매에 필요한 신용카드, 현금결제 등의 결제정보 전송</p></td>
																	<td>
																		<p align="center">
																			(주)케이지이니시스 <br/>
																			NHN 한국사이버결제 주식회사 <br/>
																			네이버파이낸셜(주)
																		</p>
																	</td>
																</tr>
																<tr>
																	<td><p align="center">쇼핑몰 주문정보 통합관리 솔루션 제공</p></td>
																	<td>
																		<p align="center">
																			(주)다우기술 <br/>
																			네모커머스(주) <br/>
																			(주)플레이오토
																		</p>
																	</td>
																</tr>
																<tr>
																	<td><p align="center">배송지키미 서비스 제공(배송위치 및 도착정보 제공)</p></td>
																	<td><p align="center">(주)굿스플로</p></td>
																</tr>
																<tr>
																	<td><p align="center">상품 추천 서비스 대행 업무</p></td>
																	<td><p align="center">(주)레코벨</p></td>
																</tr>
																<tr>
																	<td><p align="center">전산시스템 구축, 운영, 유지보수, 보안시스템 운영</p></td>
																	<td><p align="center">신세계아이앤씨</p></td>
																</tr>
															</tbody>
														</table>
														<p>
															※ 개인정보의 보유 및 이용 기간: 회원탈퇴 시 혹은 위탁 계약 종료 시까지 <br/>
															※ 직송 등 일부 배송형태에 따라, 전자상거래소비자보호법 제21조에 의거 판매를 의뢰한 협력사에 배송정보가 제공됩니다.
														</p>
													</li>
													<li style="margin-top:14px;">
														２. 당사는 고객이 미리 동의가 있거나, 관련 법령의 규정에 의한 경우를 제외하고는 어떠한 경우에도 본 동의서에서 명시한 범위를 넘어 고객의 개인정보를 이용하거나 타인 또는 타 기업이나 기관에 제공하지 않습니다. 단, 고객의 문의 내용이나 불만 내용이 당사 매장 내 입점한 협력업체와의 관계라고 판단될 경우에는 신속한 서비스를 위해 해당 협력업체에 고객의 개인정보 및 접수 내용을 제공할 수 있습니다.
													</li>
													<li>
														３. 위탁계약 시 개인정보보호의 안전을 기하기 위하여 개인정보보호 관련 지시 엄수, 개인정보에 관한 금지 및 사고 시의 책임부담 등을 명확히 규정하고 당해 계약 내용을 서면 및 전자적으로 보관하고 있습니다. 동 업체가 변경될 경우, 당사는 변경된 업체 명을 개인정보처리방침 화면에 공지합니다
													</li>
												</ol>
											</li>

											<li>
												<h3>제6조 개인정보의 열람, 정정 탈퇴 및 동의 철회 방법</h3>
												<ol>
													<li>
														１. 회원은 등록되어 있는 자신의 개인정보를 열람하거나 정정, 탈퇴할 수 있으며, 당사에 다음 각 항의 어느 사항에 대한 열람, 제공, 정정 및 탈퇴를 요구할 수 있습니다.
														<ol>
															<li>① 당사가 가지고 있는 회원의 개인정보</li>
															<li>② 당사가 회원의 개인정보를 이용하거나 제3자에게 제공한 현황</li>
															<li>③ 회원이 개인정보 수집•이용•제공 등의 동의를 한 현황</li>
															<li>가 홈페이지 : 로그인 후 『회원정보수정』을 클릭 하여 회원정보 열람, 정정 또는 마이페이지 > 회원정보관리 > 회원정보수정를 통하여 탈퇴가 가능합니다.</li>
															<li>나 까사미아 고객센터 문의 : 본인 확인 후 개인정보 열람, 정정, 탈퇴가 가능합니다.</li>
															<li>다 개인정보보호책임자 또는 고객센터로 서면, 전화 또는 이메일을 통해 연락하시면 지체 없이 조치하겠습니다.</li>
														</ol>
													</li>
													<li>２. 회원이 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리 결과를 제3자에게 지체 없이 통지하여 정정이 이루어지도록 조치하겠습니다.</li>
													<li>３. 당사는 회원의 요청에 의해 해지 또는 삭제된 개인정보는 당사가 수집하는 개인정보의 보유 및 이용 기간에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.</li>
												</ol>
											</li>

											<li>
												<h3>제7조 개인정보 자동수집 장치의 설치, 운영 및 거부</h3>
												<ol>
													<li>１. 당사는 개인화된 서비스를 제공하기 위하여 ‘쿠키(cookie)’를 사용하기도 합니다. ‘쿠키(cookie)’는 HTTP서버에서 사용자의 브라우저에 보내는 아주 작은 데이터 꾸러미로서 회원의 컴퓨터 하드드라이브에 저장됩니다. 쿠키는 귀하의 컴퓨터는 식별하지만 귀하를 개인적으로 식별하지는 않습니다.</li>
													<li>
														당사는 다음과 같은 목적으로 쿠키를 사용합니다.
														<ol>
															<li>가 회원과 비회원의 접속 빈도나 방문 시간 등을 분석하고 이용자의 취향과 관심분야를 파악하여 타겟(Target) 마케팅 및 서비스 개편 등의 척도로 활용합니다.</li>
															<li>나 당사가 진행하는 각종 이벤트에서 회원의 참여 정도 및 방문 수를 파악하여 차별적인 응모 기회를 부여하고 개인의 관심 분야에 따라 차별화된 정보를 제공하기 위한 자료로 이용됩니다.</li>
															<li>
																다 쇼핑한 품목들에 대한 정보와 관심 있게 둘러본 품목들에 대한 자취를 추적하여 다음 번 쇼핑 때 개인 맞춤 서비스를 제공하는데 이용합니다. 쿠키 브라우저의 종료시나 로그아웃 시 만료됩니다. 쿠키는 하루가 지나면 만료되며, 브라우저의 '쿠키삭제'시 삭제하실 수 있습니다.
																<ol>
																	<li>* 쿠키의 설치 및 거부</li>
																	<li>- 귀하는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서 귀하는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다.</li>
																	<li>- 다만, 쿠키의 저장을 거부할 경우에는 로그인이 필요한 일부 서비스 이용에 어려움이 있을 수 있습니다.</li>
																	<li>- 쿠키설정 거부방법은 다음과 같습니다.</li>
																	<li>① Internet Explorer의 경우 : 웹 브라우저 상단의 도구 메뉴 > 인터넷 옵션 > 개인정보 > 설정</li>
																	<li>② Chrome의 경우 : 웹 브라우저 우측의 설정 메뉴 > 화면 하단의 고급 설정 표시 > 개인정보의 콘텐츠 설정 버튼 > 쿠키</li>
																</ol>
															</li>
															<li>
																３. IP 주소 및 접속기기 정보
																<ol>
																	<li>가 IP 주소는 인터넷 망 사업자가 인터넷에 접속하는 이용자의 PC 등 기기에 부여하는 온라인 주소정보 입니다.</li>
																	<li>나 기기정보는 기기의 구동을 위해 사용되는 S/W를 통해 확인 가능한 정보를 일컫습니다. OS(Windows, MAC OS 등), 접속한 브라우저 종류 등을 수집하며 모바일앱 접속의 경우 모바일 플랫폼 관련정보 등을 의미합니다.</li>
																</ol>
															</li>
														</ol>
													</li>
												</ol>
											</li>

											<li>
												<h3>제8조 개인정보보호책임자</h3>
												<ol>
													<li>
														１. 당사는 개인정보 처리에 관한 업무를 총괄해서 책임지고 회원의 개인정보를 보호하고, 개인정보처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.
														<table border="0" cellspacing="0" cellpadding="0" class="header_h">
															<tbody>
																<tr>
																	<td><p align="center">구분</p></td>
																	<td><p align="center">담당</p></td>
																</tr>
																<tr>
																	<td><p align="center">개인정보보호책임자(CPO)</p></td>
																	<td><p align="center">김찬후 담당</p></td>
																</tr>
																<tr>
																	<td><p align="center">개인정보보호부서</p></td>
																	<td><p align="center">까사미아 CSR팀</p></td>
																</tr>
																<tr>
																	<td><p align="center">전화번호</p></td>
																	<td><p align="center">1588-3408</p></td>
																</tr>
																<tr>
																	<td><p align="center">전자우편주소</p></td>
																	<td><p align="center">casamia@shinsegae.com</p></td>
																</tr>
															</tbody>
														</table>
													</li>
													<li>２. 정보주체는 당사의 서비스를 이용하시면서 발생한 모든 개인정보보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 당사는 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.</li>
													<li>
														３. 기타 개인정보침해에 대한 신고 또는 상담이 필요하신 경우에는 아래 기관으로 문의하시기 바랍니다.
														<ol>
															<li>- 개인정보침해신고센터 (http://privacy.kisa.or.kr/ 국번없이 118)</li>
															<li>- 개인정보분쟁조정위원회 (http://www.kopico.go.kr/ 1833-6972)</li>
															<li>- 대검찰청 사이버수사과 (http://www.spo.go.kr / 02-3480-3570)</li>
															<li>- 경찰청 사이버안전국 (http://cyberbureau.police.go.kr / 경찰민원콜센터 182)</li>
														</ol>
													</li>
												</ol>
											</li>
											
											<li>
												<h3>제9조 개인정보보호를 위한 기술적/제도적 관리</h3>
												<ol>
													<li>
														１. 기술적 대책 <br/>
														당사는 회원의 개인정보를 취급함에 있어 개인정보가 분실, 도난, 누출, 변도 또는 훼손되지 않도록 안정성 확보를 위하여 다음과 같은 기술적 대책을 강구하고 있습니다.
														<ol>
															<li>가 회원의 개인정보는 비밀번호에 의해 보호되며, 파일 및 전송 데이터를 암호화하거나 파일 잠금기능(Lock)을 사용하여 중요한 데이터는 별도의 보안기능을 통해 보호되고 있습니다.</li>
															<li>나 당사는 백신프로그램을 이용하여 컴퓨터 바이러스에 의해 피해를 방지하기 위한 조치를 취하고 있습니다. 백신프로그램은 주기적으로 업데이트되며 갑작스런 바이러스가 출현할 경우 백신이 나오는 즉시 이를 제공함으로써 개인정보가 침해되는 것을 방지하고 있습니다.</li>
															<li>다 당사는 암호알고리즘을 이용하여 네트워크 상의 개인정보를 안전하게 전송할 수 있는 보안장치(SSL 또는 SET)를 채택하고 있습니다.</li>
															<li>라 해킹 등 외부 침입에 대비하여 각 서버마다 침입차단시스템 및 취약점 분석 시스템 등을 이용하여 보안에 만전을 기하고 있습니다.</li>
														</ol>
													</li>
													<li>
														２. 관리적 대책 <br/>
														당사는 회원의 개인정보에 대한 접근권한을 최소한의 인원으로 제한하고 있습니다. 그 최소한의 인원에 해당하는 자는 다음과 같습니다.
														<ol>
															<li>- 이용자를 직접 상대로 하여 마케팅 업무를 수행하는 자</li>
															<li>- 개인정보보호책임자 및 담당자 등 개인정보관리업무를 수행하는 자</li>
															<li>- 기타 업무상 개인정보의 처리가 불가피한 자</li>
															<li>- 개인정보를 처리하는 직원을 대상으로 새로운 보안 기술 습득 및 개인정보보호의무 등에 관해 정기적인 사내 교육 및 외부 위탁교육을 실시하고 있습니다.</li>
															<li>- 입사 시 개인정보 관련 처리자의 보안서약서를 통하여 사람에 의한 정보유출을 사전에 방지하고 개인정보보호 정책에 대한 이행사항 및 직원의 준수여부를 감시하기 위한 내부절차를 마련하고 있습니다.</li>
															<li>- 개인정보 관련 처리자의 업무 인수인계는 보안이 유지된 상태에서 철저하게 이뤄지고 있으며 입사 및 퇴사 후 개인정보 사고에 대한 책임을 명확화하고 있습니다.</li>
															<li>- 개인정보와 일반 데이터를 혼합하여 보관하지 않고 별도로 분리하여 보관하고 있습니다.</li>
															<li>- 전산실 및 자료보관실 등을 특별 보호구역으로 설정하여 출입을 통제하고 있습니다</li>
															<li>- 당사는 회원 개인의 실수나 회사의 귀책사유 없이 발생하는 개인정보관련 문제에 대해서는 책임을 지지 않습니다. 회원 개개인이 본인의 개인정보를 보호하기 위해 자신의 아이디와 비밀번호를 적절하게 관리하고 여기에 대한 책임을 져야 합니다.</li>
															<li>- 그 외 내부 관리자의 실수나 기술관리 상의 사고로 인해 개인정보의 상실, 유출, 변조, 훼손이 유발될 경우 당사는 즉각 사실을 알리고 적절한 대책과 보상을 강구할 것입니다</li>
														</ol>
													</li>
												</ol>
											</li>

											<li>
												<h3>제10조 개인정보 열람청구</h3>
												<ol>
													<li>
														１. 회원은 자신의 개인정보에 대하여 개인정보 보호법 제35조에 따른 개인정보의 열람 청구를 아래 부서에 할 수 있습니다. 당사는 정보주체의 개인정보 열람청구가 신속하게 처리되도록 노력하겠습니다.
														<ol>
															<li>
																▶ 개인정보 열람청구 접수•처리 부서 <br/>
																부서명 : 까사미아 CS팀 <br/>
																연락처 : 1588-3408 <br/>
																이메일 : casamia@shinsegae.com
															</li>
														</ol>
													</li>
													<li>
														２. 회원은 제1항의 열람청구 접수․처리부서 이외에, 행정안전부의 ‘개인정보보호 종합지원 포털’ 웹사이트(www.privacy.go.kr)를 통하여서도 개인정보 열람청구를 하실 수 있습니다.
														<ol>
															<li>▶ 행정안전부 개인정보보호 종합지원 포털 → 개인정보 민원 → 개인정보 열람등 요구 (본인확인을 위하여 아이핀(I-PIN)이 있어야 함)</li>
														</ol>
													</li>
													<li>３. 회원이 개인정보의 오류 등에 대한 정정 또는 삭제를 요구한 경우에는 당사는 정정 또는 삭제를 완료할 때까지 당해 개인정보를 이용하거나 제공하지 않습니다.</li>
													<li>４. 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.</li>
													<li>
														５. 회원님의 개인정보 권리행사 요구 거절 시 불복을 위한 이의제기 절차는 다음과 같습니다.
														<ol>
															<li>① 해당 부서에서 열람 등 요구에 대한 연기 또는 거절 시 요구 받은 날로부터 10일 이내에 정당한 사유 및 이의제기 방법 등을 통지</li>
															<li>② 해당 부서에서 회원님의 이의제기 신청 및 접수(서면, 전화, 이메일) 개인정보 담당자가 내용 확인</li>
															<li>③ 개인정보 보호책임자가 처리결과에 대해 최종 검토</li>
															<li>④ 해당 부서에서 회원님에게 처리결과 통보</li>
														</ol>
													</li>
													<li>
														６. 당사가 이 개인정보처리방침을 지키지 않는다고 판단되시면, 위 개인정보 보호책임자 또는 개인정보 보호담당자에게 알려주십시오. 지적하신 문제를 조속히 확인하고 수정이 필요한 경우에는 최대한 빠른 시간 내에 조치하도록 노력하겠습니다. 당사는 회원님들의 개인정보와 관련하여 회원님 여러분들의 의견을 수렴하고 있으며 불만을 처리하기 위하여 모든 절차와 방법을 마련하고 있습니다.
													</li>
												</ol>
											</li>

											<li>
												<h3>제11조 정보주체의 권익침해에 대한 구제방법</h3>
												<ol>
													<li>
														１. 아래의 기관은 당사와는 별개의 기관으로서, 당사의 자체적인 개인정보 불만처리, 피해구제 결과에 만족하지 못하시거나 보다 자세한 도움이 필요하시면 문의하여 주시기 바랍니다.
														<ol>
															<li>
																▶ 개인정보 침해신고센터 (한국인터넷진흥원 운영) <br/>
																소관업무 : 개인정보 침해사실 신고, 상담 신청 <br/>
																홈페이지 : privacy.kisa.or.kr <br/> 
																전화 : (국번없이) 118 <br/>
																주소 : (58324) 전남 나주시 진흥길 9(빛가람동 301-2) 3층 개인정보침해신고센터
															</li>
															<li>
																▶ 개인정보 분쟁조정위원회 <br/>
																소관업무 : 개인정보 분쟁조정신청, 집단분쟁조정 (민사적 해결) <br/>
																홈페이지 : www.kopico.go.kr <br/>
																전화 : (국번없이) 1833-6972 <br/>
																주소 : (03171)서울특별시 종로구 세종대로 209 정부서울청사 4층
															</li>
															<li>▶ 대검찰청 사이버범죄수사단 : 02-3480-3573 (www.spo.go.kr)</li>
															<li>▶ 경찰청 사이버안전국 : 182 (http://cyberbureau.police.go.kr)</li>
														</ol>
													</li>
													<li>
														２. 또한, 개인정보의 열람, 정정•삭제, 처리정지 등에 대한 정보주체자의 요구에 대하여 공공기관의 장이 행한 처분 또는 부작위로 인하여 권리 또는 이익을 침해 받은 자는 행정심판법이 정하는 바에 따라 행정심판을 청구할 수 있습니다.
														<ol>
															<li>▶ 중앙행정심판위원회(www.simpan.go.kr)의 전화번호 안내 참조</li>
														</ol>
													</li>
												</ol>
											</li>

											<li>
												<h3>제12조 아동의 개인정보보호</h3>
												<ol>
													<li>당사는 법정 대리인의 동의가 필요한 만 14세 미만 아동의 회원 가입을 받고 있지 않습니다.</li>
												</ol>
											</li>

											<li>
												<h3>제13조 광고성 정보 전송</h3>
												<ol>
													<li>
														당사는 회원의 사전 동의를 받지 않으면 영리목적의 광고성 정보를 전송하지 않습니다. <br/>
														당사는 상품정보 안내 등 온라인 마케팅을 위해 광고성 정보를 전자우편 등으로 전송하는 경우 전자우편의 제목란 및 본문란에 다음 사항과 같이 회원께서 쉽게 알아 보실 수 있도록 조치합니다.
													</li>
													<li>
														<ol>
															<li>가 전자우편의 제목란: (광고)라는 문구를 제목란에 표시하며, 전자우편 본문란의 주요 내용을 표시합니다.</li>
															<li>나 전자우편의 본문란: 이용자가 수신거부의 의사표시를 할 수 있는 전송자의 명칭, 전자우편 주소, 전화번호 및 주소를 명시합니다. 이용자가 수신거부의 의사를 쉽게 표시할 수 있는 방법을 한글 및 영문으로 각각 명시합니다.</li>
														</ol>
													</li>
												</ol>
											</li>

											<li>
												<h3>제14조 고지의 의무</h3>
												<ol>
													<li>현 개인정보처리방침은 2021년 8월 6일에 개정되었으며 정부의 정책 또는 보안기술의 변경에 따라 내용의 추가, 삭제 및 수정이 있을 시에는 개정 최소 7일 전부터 홈페이지를 통해 고지할 것입니다.</li>
													<li>개인정보처리방침 시행일자 : 2021년 8월 6일</li>
												</ol>
											</li>
										</ol>
									</div>
									<!-- / policy영역 -->
								</div>
								<!-- / 약관box -->
							</div>
							<!-- / 까사미아 개인정보 수집 이용 동의 -->

							<!-- 까사미아 영상정보처리기기 운영 관리 방침 -->
							<div class="term_b">
								<h2>
									<div class="input_b size_sm type1">
										<div class="ez-checkbox">
											<input name="chkChoiceAgreementForCasamiaMembership4" type="checkbox" id="chkChoiceAgreementForCasamiaMembership4" class="ez-hide agreement-casa">
										</div>
										<label for="chkChoiceAgreementForCasamiaMembership4">까사미아 영상정보처리기기 운영 관리 방침 <span>(선택)</span></label>
									</div>
								</h2>

								<!-- 약관box -->
								<div class="txt_a_new txt_a" style="/* background: #fff; */width: 95%;border: 0; overflow:hidden;">
									<div class="policy_a">
										<p style="line-height:18px;">
											(주)신세계까사 (이하 당사라 함)는 영상정보처리기기 운영.관리 방침을 통해 <br/>
											당사에서 처리하는 영상정보가 어떠한 용도와 방식으로 이용.관리되고 있는지 알려드립니다.
										</p>
										<ol>
											<li>
												<h3>1. 영상정보처리기기의 설치근거 및 설치목적</h3>
												<p>당사는 개인정보보호법 제25조 제1항에 따라 다음과 같은 목적으로 영상정보처리기기를 설치, 운영 합니다.</p>
												<ol>
													<li>가. 시설안전 및 화재예방</li>
													<li>나. 고객의 안전을 위한 범죄예방</li>
													<li>다. 차량도난 및 파손방지</li>
												</ol>
											</li>
											<li>
												<h3>2. 설치대수, 설치위치 및 촬영범위</h3>
												<table border="0" cellspacing="0" cellpadding="0" class="header_h" style="margin-top: 4px;">
													<tbody>
														<tr>
															<td><p align="center">구분</p></td>
															<td><p align="center">설치대수</p></td>
															<td><p align="center">설치위치 및 촬영범위</p></td>
														</tr>
														<tr>
															<td><p align="center">CCTV</p></td>
															<td><p align="center">616</p></td>
															<td><p align="center">건물내•외곽 및 주차장 등 전 층</p></td>
														</tr>
														<tr>
															<td><p align="center">차량번호인식 카메라</p></td>
															<td><p align="center">11</p></td>
															<td><p align="center">주차장 입•출입로</p></td>
														</tr>
													</tbody>
												</table>
											</li>
											<li>
												<h3>3. 관리책임자 및 접근 권한자</h3>
												<p>귀하의 영상정보를 보호하고 개인영상정보와 관련한 불만을 처리하기 위하여 아래와 같이 개인영상정보 보호책임자를 두고 있습니다.</p>
												<table border="0" cellspacing="0" cellpadding="0" class="header_h" style="margin-top: 4px;">
													<tbody>
														<tr>
															<td><p align="center">구분</p></td>
															<td><p align="center">소속</p></td>
															<td><p align="center">직위</p></td>
															<td><p align="center">연락처</p></td>
														</tr>
														<tr>
															<td rowspan="2"><p align="center">영상정보처리기기 <br/> 관리책임자</p></td>
															<td><p align="center">본사 물류</p></td>
															<td><p align="center">인사총무팀장</p></td>
															<td><p align="center">02-6420-7108</p></td>
														</tr>
														<tr>
															<td><p align="center">점포</p></td>
															<td><p align="center">점포관리자</p></td>
															<td><p align="center">홈페이지( <a href="http://www.guud.com" target="_blank">http://www.guud.com</a> ) <br/> 매장안내 참조</p></td>
														</tr>
													</tbody>
												</table>
												<p>(대리점의 경우, 영상정보처리기기 관리책임은 각 대리점주에게 있습니다.)</p>
											</li>
											<li>
												<h3>4. 영상정보의 촬영시간, 보관기간, 보관장소 및 방법</h3>
												<table border="0" cellspacing="0" cellpadding="0" class="header_h" style="margin-top: 4px;">
													<tbody>
														<tr>
															<td><p align="center">촬영시간</p></td>
															<td><p align="center">보관기간</p></td>
															<td><p align="center">보관장소</p></td>
														</tr>
														<tr>
															<td><p align="center">24시간</p></td>
															<td><p align="center">촬영일로부터 최대 30일 이내</p></td>
															<td><p align="center">각 점포</p></td>
														</tr>
													</tbody>
												</table>
												<p>
													<strong style="color:#000;">처리방법</strong> : 개인영상정보의 목적외 이용, 제3자 제공, 파기, 열람 등 요구에 관한 사항을 기록.관리하고,   보관기간 만료시 복원이 불가능한 방법으로 영구삭제(출력물의 경우 파쇄 또는 소각)합니다.
												</p>
											</li>
											<li>
												<h3>5. 영상정보처리기기 설치 및 관리 등의 위탁에 관한 사항</h3>
												<p>
													당사는 아래와 같이 영상정보처리기기 설치 및 관리 등을 위탁하고 있으며, <br/>
													관계법령에 따라 위탁 계약시 개인정보가 안전하게 관리될 수 있도록 필요한 사항을 규정하고 있습니다.
												</p>
												<table border="0" cellspacing="0" cellpadding="0" class="header_h" style="margin-top: 4px;">
													<tbody>
														<tr>
															<td><p align="center">수탁업체</p></td>
															<td><p align="center">업무</p></td>
															<td><p align="center">연락처</p></td>
														</tr>
														<tr>
															<td><p align="center">에스원</p></td>
															<td><p align="center">CCTV 유지보수</p></td>
															<td><p align="center">1588-3112</p></td>
														</tr>
														<tr>
															<td><p align="center">아마노</p></td>
															<td><p align="center">주차</p></td>
															<td><p align="center">02-2058-0898</p></td>
														</tr>
														<tr>
															<td><p align="center">애니파킹</p></td>
															<td><p align="center">주차</p></td>
															<td><p align="center">1800-6715</p></td>
														</tr>
													</tbody>
												</table>
											</li>
											<li>
												<h3>6. 개인영상정보의 확인 방법 및 장소에 관한 사항</h3>
												<p>
													<strong style="color:#000">확인방법 </strong> : 점포별 영상정보 접근권한자에게 미리 연락하고 점포를 방문하시면 확인 가능합니다.
												</p>
												<p>
													<strong style="color:#000">확인장소 </strong> 확인하고자 하는 점포의 보안실 또는 주차장 상황실
												</p>
											</li>
											<li>
												<h3>7. 정보주체의 영상정보 열람 등 요구에 대한 조치</h3>
												<p>
													귀하는 개인영상정보에 관하여 열람 또는 존재확인, 삭제를 원하는 경우 언제든지 영상정보처리기기 운영자에게 요구하실 수 있습니다. <br/>
													단, 귀하가 촬영된 개인영상정보 및 명백히 정보주체의 급박한 생명, 신체, 재산의 이익을 위하여 필요한 개인영상정보에 한정됩니다. <br/>
													당사는 개인영상정보에 관하여 열람 또는 존재확인, 삭제를 요구한 경우 지체없이 필요한 조치를 하겠습니다.
												</p>
											</li>
											<li>
												<h3>8. 영상정보의 안전성 확보조치</h3>
												<p>
													당사는 처리하는 영상정보는 암호화 조치 등을 통하여 안전하게 관리되고 있습니다. <br/>
													또한 당사는 개인 영상정보보호를 위한 관리적 대책으로서 개인정보에 대한 접근 권한을 차등부여하고 있고, 개인 영상정보의 위.변조 방지를 위하여 개인영상정보의 생성 일시, 열람시 열람 목적.열람자.열람 일시 등을 기록하여 관리하고 있습니다.  <br/>
													이 외에도 개인영상정보의 안전한 물리적 보관을 위하여 잠금장치를 설치하고 있습니다
												</p>
											</li>
											<li>
												<h3>9. 개인정보 처리방침 변경에 관한 사항</h3>
												<p>
													이 영상정보처리기기 운영.관리방침은 2021년 11월 2일에 제정되었으며 법령.정책 또는 보안기술의 변경에 따라 내용의 추가.삭제 및 수정이 있을 시에는 시행하기 최소 7일전에 당사 홈페이지를 통해 변경사유 및 내용 등을 공지하도록 하겠습니다.
												</p>
												<p>- 공고일자 : 2021년 11월 2일 / 시행일자 : 2021년 11월 2일 / 개정일자 : 2021년 11월 2일</p>
											</li>
										</ol>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- / 까사미아 동의 20211130 추가 -->

					<!-- KT 동의 20220330 추가 -->
					<div id="Div1" class="samsung_s" runat="server">

						<h2 style="overflow: hidden;text-align: left;	margin: 19px 0 13px 5px;">
							<div class="input_b size_sm type1">
								<div class="ez-checkbox">
									<div class="ez-checkbox"><div class="ez-checkbox"><div class="ez-checkbox"><input name="chkChoiceAgreementForKtMembership" type="checkbox" id="chkChoiceAgreementForKtMembership" value="Y" class="ez-hide agreement-kt"></div></div></div>
								</div>
								<label for="chkChoiceAgreementForKtMembership" style="position:absolute;margin: 0 0 0 2px; font-size:16px;">KT 마케팅 활용 동의<span>(선택)</span></label>
							</div>
						</h2>

						<div style="width: 99%; margin: 0 auto; border: 1px solid #ddd; height: 95px; overflow-y: scroll; overflow-x: hidden;">
							<div class="term_b" style="float:left; width:100%;">
								<!-- 약관box -->
								<div class="txt_a_new txt_a" style="width: 94%; height:218px; border:0; overflow:hidden; ">
									<!-- policy영역 -->
									<div class="policy_a">
                                        <h3>개인정보를 제공받는 자: KT</h3>
                                            <ol>
                                                <li>개인정보 제공 목적: 전화를 이용한 KT 상품/서비스/혜택 안내 및 판매, 그 외 문자, 이메일 등을 이용한 할인/사은/판촉행사 혜택 등 정보 제공</li>
                                                <li>&nbsp;</li>
                                                <li>개인정보 제공 항목: 이름, 성별, 생년월일, 핸드폰번호, 예식예정일, 주소, 회원가입일, 동의일자, 이메일</li>
                                                <li>&nbsp;</li>
                                                <li>개인정보 보유 및 이용기간: 제공 동의일로부터 1년 (고객동의 철회 시 지체 없이 파기)</li>
                                                <li>&nbsp;</li>
                                                <li>※ 위와 같은 본인의 개인정보 제3자 제공에 관한 동의를 거부할 권리가 있습니다. 단, 동의 거부 시 상품 정보 제공 및 혜택 안내가 제한될 수 있습니다.</li>
                                                <li>&nbsp;</li>
                                                <li>※ 본 통신서비스에 동의하신 고객정보의 보호를 위해 파트너사(제공 받는자)는 관련법령을 준수한 개인정보보호 시스템을 구축하여 동의고객 정보를 안전하게 보호 및 파기할 의무를 가지고 있으며, 파트너사는 캠페인 진행에 따른 광고비용을 지급하고 있습니다.</li>
                                                 <li>&nbsp;</li>
                                           </ol>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

            <!-- 롯데묘미 동의 -->
			<div class="Myomee_s" id="wrapMyomeeAgreement" runat="server">
              <!-- 롯데묘미 수집 이용 동의 -->
				<div class="term_b " >
					<h2><div class="input_b size_sm type1"><input type="checkbox" name="chkChoiceAgreementForMyomeeMembership" id="chkChoiceAgreementForMyomeeMembership" value="Y"><label for="chkChoiceAgreementForMyomeeMembership">롯데렌탈(묘미) 이용약관 동의 <span>(선택)</span></label></div></h2>
					<!-- 약관box -->
					<div class="txt_a">
						<!-- policy영역 -->
						<div class="policy_a">
							<h3>제1조 (목적)</h3>
							<div>
								<P>약관은 롯데렌탈(주)(이하 "회사"라 한다)가 운영하는 사이버 몰에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다)를 이용함에 있어 “몰”과 이용자의 권리.의무 및 책임사항을 규정함을 목적으로 합니다.</P>
							</div>
							<h3>제2조 (정의)</h3>
							<div>
								<ul class="type_num">									
									<li>1. “몰”이란 회사가 재화 또는 용역(이하 “재화 등”이라 함)을 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장(www.myomee.com 및 모바일 앱 등)을 말하며, 아울러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.</li>
									<li>2. “이용자”란 “몰”에 접속하여 이 약관에 따라 “몰”이 제공하는 서비스를 받는 회원 및 비회원을 말합니다.</li>
									<li>3. ‘회원’이라 함은 “몰”에 회원등록을 한 자로서, 계속적으로 “몰”이 제공하는 서비스를 이용할 수 있는 자를 말합니다.</li>
									<li>4. ‘비회원’이라 함은 회원에 가입하지 않고 “몰”이 제공하는 서비스를 이용하는 자를 말합니다.</li>
									<li>5. “이용계약”이란 “몰”이 제공하는 서비스에 관한 회원의 이용신청을 회사가 승낙함으로써 성립하는 계약을 말합니다.</li>
									<li>6. “ID”라 함은 회원의 식별과 서비스 이용을 위하여 회원이 설정하고 회사가 승인하여 등록된 전자우편주소를 말합니다.</li>
									<li>7. “비밀번호”라 함은 회원의 동일성 확인과 회원의 권익 및 비밀보호를 위하여 회원 스스로가 설정하여 사이트에 등록한 문자와 숫자의 조합을 말합니다.</li>
								</ul>
							</div>
							<h3>제3조 (약관 등의 명시와 설명 및 개정)</h3>
							<div>
								<ul class="type_num">									
									<li>1. “몰”은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 있는 곳의 주소를 포함), 전화번호.모사전송번호.전자우편주소, 사업자등록번호, 통신판매업 신고번호, 개인정보관리책임자 등을 이용자가 쉽게 알 수 있도록 ”몰”의 초기 서비스화면(전면)에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.</li>
									<li>2. “몰”은 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회.배송책임.환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.</li>
									<li>3. “몰”은 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 「전자문서 및 전자거래기본법」, 「전자금융거래법」, 「전자서명법」, 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」, 「방문판매 등에 관한 법률」, 「소비자기본법」 등 관련 법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.</li>
									<li>4. “몰”이 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 몰의 초기화면에 그 적용일자 7일 이전부터 적용일자 전일까지 공지합니다. 다만, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다. 이 경우 "몰“은 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.</li>
									<li>5. “몰”이 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정 전의 약관조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제3항에 의한 개정약관의 공지기간 내에 “몰”에 송신하여 “몰”의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.</li>
									<li>6. 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제 등에 관한 법률, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계법령 또는 상관례에 따릅니다.</li>
								</ul>
							</div>
							<h3>제4조 (서비스의 제공 및 변경)</h3>
							<div>
								<ul class="type_num">									
									<li>1. “몰”은 다음과 같은 업무를 수행합니다.
										<ul class="type_abc">
											<li>A. 재화 또는 용역에 대한 정보 제공</li>
											<li>B. 재화 또는 용역에 대한 렌탈계약, 할부계약, 판매계약 등(이하 “구매계약”)의 체결</li>
											<li>C. “구매계약”이 체결된 재화 또는 용역의 배송 4. 기타 “몰”이 정하는 업무</li>		
										</ul>									
									</li>
									<li>2. “몰”은 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.</li>
									<li>3. “몰”이 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화 등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 전화, 이메일 등으로 즉시 통지합니다.</li>
									<li>4. 전항의 경우 “몰”은 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.</li>
								</ul>
							</div>
							<h3>제5조 (서비스의 중단)</h3>
							<div>
								<ul class="type_num">									
									<li>1. “몰”은 컴퓨터 등 정보통신설비의 보수점검.교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.</li>
									<li>2. “몰”은 제1항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “몰”이 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.</li>
									<li>3. 사업종목의 전환, 사업의 포기, 업체 간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “몰”은 제8조에 정한 방법으로 이용자에게 통지하고 당초 “몰”에서 제시한 조건에 따라 소비자에게 보상합니다. 다만, “몰”이 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “몰”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.</li>
								</ul>
							</div>
							<h3>제6조 (회원가입)</h3>
							<div>
								<ul class="type_num">									
									<li>1. 이용자는 “몰”이 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.</li>
									<li>2. “몰”은 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각 호에 해당하지 않는 한 회원으로 등록합니다.
									<ul class="type_abc">
											<li>A. 가입신청자가 이 약관 제7조 제2항에 의하여 이전에 회원자격을 상실한 적이 있는 경우. 다만 제7조제2항에 의한 회원자격 상실 후 3년이 경과한 자로서 “몰”의 회원재가입 승낙을 얻은 경우에는 예외로 한다.</li>
											<li>B. 가입신청, 등록 내용에 허위, 기재누락, 오기가 있는 경우</li>
											<li>C. 만 19세 미만의 자가 회원 가입 신청을 하는 경우</li>		
											<li>D. 본인확인절차에서 본인이 아님이 확인된 경우</li>
											<li>E. 회원탈퇴 후 1개월 이내에 재가입 신청을 하는 경우.다만, 판매회원의 경우 재가입 신청제한 기간은 2개월로 합니다.</li>
											<li>F. 회사로부터 회원자격정지 조치 등을 받은 회원이 그 조치 기간에 이용계약을 임의 해지하고 재가입 신청을 하는 경우(재이용이 허락되더라도, 서비스 이용과정에서 본인확인 후 회원자격정지 조치를 받았던 사실이 확인되면 해당 ID의 이용계약이 해지될 수 있음)</li>
											<li>G. “몰” 이용약관의 적용을 받는 자가 해당 약관을 위반한 경우</li>
											<li>H. 이 약관에 위배되거나 위법 또는 부당한 회원 가입신청임이 확인된 경우</li>
											<li>I. 기타 회원으로 등록하는 것이 “몰”의 기술상 현저히 지장이 있다고 판단되는 경우</li>
										</ul>	
									</li>
									<li>3. 회원가입계약의 성립 시기는 “몰”의 승낙이 회원에게 도달한 시점으로 합니다.</li>
									<li>4. 회원은 회원가입시 등록한 사항에 변경이 있는 경우, 상당한 기간 이내에 “몰”에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.</li>
								</ul>
							</div>
							<h3>제7조 (회원 탈퇴 및 자격 상실 등)</h3>
							<div>
								<ul class="type_num">									
									<li>1. 회원은 다음 각호에서 정한 바에 따라 이용계약을 해지할 수 있습니다.
										<ul class="type_abc">
											<li>A. 회원은 언제든지 회사에 해지의 의사를 통지하여 이용계약을 해지할 수 있습니다. 단, 해지의사를 통지하기 전에 현재 진행 중인 모든 상품의 거래를 완료하거나 철회 또는 취소하여야 하며, 거래의 철회 또는 취소로 인한 불이익은 회원 본인이 부담하여야 합니다. 또한, 회원이 “몰”에 대한 "구매계약" 등의 채무를 전부 이행하지 않으면 회원이 해당 채무를 전부 이행할 때까지 “몰”은 회원의 이용계약 해지를 제한할 수 있으며, 회원이 이 약관과 관계 법령 등을 위반하여 이용이 정지된 경우 “몰”이 재발방지를 위하여 회원의 이용계약 해지를 제한할 수 있습니다.</li>
											<li>B. 회원의 의사로 해지한 경우 “몰”은 회원에게 이메일(E-mail), 전화, 팩스 또는 기타의 방법으로 해지사실을 통지합니다. 이용계약은 “몰”의 해지의사를 회원에게 통지한 시점에 종료됩니다.</li>
											<li>C. 회원의 의사로 해지한 후 회원 재가입, 임의 해지 등을 반복적으로 행하여 “몰”이 제공하는 각종 할인쿠폰, 이벤트 혜택 등 경제적 이익을 편법으로 수취하거나 이 과정에서 명의를 무단으로 사용하는 등 편법과 불법행위를 하는 것을 차단하고자 “몰”는 회원에게 회원 탈퇴한 날로부터 1개월(탈퇴시 회원이 판매회원의 지위도 동시에 가진 상태인 경우에는 2개월)이 지나야 재가입 할 수 있게 하고 있으며 회원은 이 약관이 정하는 회원가입절차와 관련 조항에 따라 “몰”에 통지된 재이용 의사를 “몰”로부터 승낙 받은 이후에 서비스를 재이용할 수 있습니다.</li>		
											<li>D. 회원 재가입, 임의해지 등을 반복적으로 행하여 “몰”가 제공하는 각종 할인쿠폰, 이벤트 혜택 등의 경제적 이익을 편법으로 수취하거나 이 과정에서 명의를 무단으로 사용하는 등 편법과 불법 행위를 하는 것을 차단하고자 회원탈퇴 후 1개월(탈퇴시 회원이 판매회원의 지위도 동시에 가진 상태인 경우에는 2개월) 동안 해당 회원의 아이디, 성명, CI, DI, 탈퇴일자, 탈퇴사유 등 개인정보를 보관합니다.</li>
										</ul>	
									</li>
									<li>2. “몰”은 다음 각호에서 정한 바에 따라 이용계약을 해지할 수 있습니다.
										<ul class="type_abc">
											<li>A. “몰”는 회원에게 다음 각목의 1에 해당하는 사유가 발생하거나 확인되면 이용계약을 해지할 수 있습니다.
												<ul class="type_abc">
													<li>가. 다른 회원 또는 “몰”(직원·상담원 포함)의 권리나 명예, 신용 기타 정당한 이익을 침해하거나 대한민국 법령, 공공질서 또는 선량한 풍속에 위배되는 행위를 한 경우</li>
													<li>나. 서비스의 원활한 진행을 방해하거나 방해할 우려가 있는 아래의 행위 등을 하거나 시도한 경우
														<ul class="type_abc">
															<li>• 합리적 사유 없이 상습적·악의적으로 이의를 제기하는 행위</li>
															<li>• 구매하거나 이용중인 상품 또는 서비스에 특별한 하자가 없음에도 상습적으로 사용 후 취소, 반품 등을 하는 행위</li>
															<li>• 그 외 “몰”이 정한 안전거래 이용규칙을 위반한 경우</li>
														</ul>
													</li>
													<li>다. 회원이 이 약관에 위배되는 행위를 하거나 이 약관에서 정한 해지사유가 발생한 경우</li>
													<li>라. 회원에게 제6조에서 정한 이용계약의 승낙거부사유가 있음이 확인된 경우</li>
												</ul>	
											</li>
											<li>B. “몰”이 해지할 때에는 “몰”은 회원에게 이메일(E-mail), 전화, 팩스, 기타의 방법으로 해지 사유를 밝혀 해지 의사를 통지합니다. 이용계약은 “몰”의 해지의사가 회원에게 도달한 시점에 종료됩니다. 단, 이메일(E-mail)을 통한 해지의사 통지의 경우 발송시점을 도달시점으로 간주합니다.</li>
											<li>C. 본 항에 따라 “몰”이 이용계약을 해지하더라도, 해지 이전에 이미 체결된 "구매계약"의 완결에 관해서는 해당 구매계약 및 본 약관이 계속 적용됩니다.</li>
											<li>D. 본 항에서 정한 바에 따라 이용계약이 종료될 때에는 “몰”은 별도 통지 없이 해당 회원과 관련된 “구매계약” 또는 거래를 취소 또는 해지할 수 있고, "구매계약"에 따른 채무가 이행되지 아니하는 경우 회원은 취소 또는 해지된 “구매계약” 또는 거래의 모든 채무를 전부 이행하여야 합니다.</li>
											<li>E. 본 항에서 정한 바에 따라 이용계약이 종료되면 “몰”은 회원의 재이용 신청을 그 승낙하지 않을 수 있습니다.</li>
										</ul>	
									</li>
									<li>3. 이용계약의 종료와 관련하여 발생한 손해에 대해서는 자신의 귀책사유로 이용계약이 종료된 해당 회원이 책임을 져야 하고, “몰”는 귀책사유가 없는 한 책임을 지지 않습니다.</li>
									<li>4. “몰”이 회원자격을 상실시키는 경우에는 회원등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 회원등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다.</li>
								</ul>
							</div>
							<h3>제8조 (회원에 대한 통지)</h3>
							<div>
								<ul class="type_num">									
									<li>1. “몰”이 회원에 대한 통지를 하는 경우, 회원이 “몰”과 미리 약정하여 지정한 전자우편 주소나 이동전화SMS 등으로 할 수 있습니다.</li>
									<li>2. “몰”은 불특정다수 회원에 대한 통지의 경우 1주일이상 “몰” 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.</li>
								</ul>
							</div>
							<h3>제9조 (구매계약 신청 및 개인정보 제공 동의 등)</h3>
							<div>
								<ul class="type_num">									
									<li>1. “몰”이용자는 “몰”상에서 다음 또는 이와 유사한 방법에 의하여 구매 또는 "구매계약"(이하 "구매 등"이라 한다)을 신청하며, “몰”은 이용자가 "구매 등"의 신청을 함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다.
										<ul class="type_abc">
											<li>A. "재화 등"의 검색 및 선택</li>
											<li>B. 받는 사람의 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력</li>
											<li>C. 약관내용, 청약철회권이 제한되는 서비스, 배송료.설치비 등의 비용부담과 관련한 내용에 대한 확인</li>		
											<li>D. 이 약관에 동의하고 위 3.호의 사항을 확인하거나 거부하는 표시(예, 마우스 클릭)</li>
											<li>E. "재화 등"의 "구매 등" 신청 및 이에 관한 확인 또는 “몰”의 확인에 대한 동의</li>
											<li>F. 결제방법의 선택</li>
										</ul>	
									</li>
									<li>2. “몰”이 제3자에게 이용자 개인정보를 제공할 필요가 있는 경우 1) 개인정보를 제공받는 자, 2)개인정보를 제공받는 자의 개인정보 이용목적, 3) 제공하는 개인정보의 항목, 4) 개인정보를 제공받는 자의 개인정보 보유 및 이용기간을 이용자에게 알리고 동의를 받아야 합니다. (동의를 받은 사항이 변경되는 경우에도 같습니다.)</li>
									<li>“몰”이 제3자에게 이용자의 개인정보를 취급할 수 있도록 업무를 위탁하는 경우에는 1) 개인정보 취급위탁을 받는 자, 2) 개인정보 취급위탁을 하는 업무의 내용을 구매자에게 알리고 동의를 받아야 합니다. (동의를 받은 사항이 변경되는 경우에도 같습니다.) 다만, 서비스제공에 관한 계약이행을 위해 필요하고 구매자의 편의증진과 관련된 경우에는 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」에서 정하고 있는 방법으로 개인정보 취급방침을 통해 알림으로써 고지절차와 동의절차를 거치지 않아도 됩니다.</li>
								</ul>
							</div>
							<h3>제10조 (계약의 성립)</h3>
							<div>
								<ul class="type_num">									
									<li>1. “몰”은 제9조와 같은 "구매 등" 신청에 대하여 다음 각 호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.
										<ul class="type_abc">
											<li>A. 신청 내용에 허위, 기재누락, 오기가 있는 경우</li>
											<li>B. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우</li>
											<li>C. 기타 구매신청에 승낙하는 것이 “몰” 기술상 현저히 지장이 있다고 판단하는 경우</li>		
										</ul>	
									</li>
									<li>2. “몰”의 승낙이 제12조 제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.</li>
									<li>3. “몰”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.</li>
								</ul>
							</div>
							<h3>제11조 (지급방법)</h3>
							<div>
								<ul class="type_num">									
									<li>1. “몰”에서 구매한 재화 또는 용역에 대한 대금지급방법은 다음 각 호의 방법중 개별 “구매계약”에서 허용하는 방법으로 할 수 있습니다. 단, “몰”은 이용자의 지급방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.
										<ul class="type_abc">
											<li>A. 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌이체</li>
											<li>B. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제</li>
											<li>C. 온라인무통장입금</li>
											<li>D. 전자화폐에 의한 결제</li>
											<li>E. 수령 시 대금지급</li>
											<li>F. 마일리지 등 “몰”이 지급한 포인트에 의한 결제</li>
											<li>G. “몰”과 계약을 맺었거나 “몰”이 인정한 상품권에 의한 결제</li>
											<li>H. 기타 전자적 지급 방법에 의한 대금 지급</li>
										</ul>	
									</li>
									<li>2. “몰”의 승낙이 제12조 제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.</li>
									<li>3. “몰”의 승낙의 의사표시에는 이용자의 구매 신청에 대한 확인 및 판매가능 여부, 구매신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.</li>
								</ul>
							</div>
							<h3>제11조의 1(할인쿠폰)</h3>
							<div>
								<ul class="type_num">									
									<li>1. 할인쿠폰은 “몰”이 무상으로 발행하는 쿠폰으로, 발행대상, 발행경로, 사용대상 등에 따라 구분될 수 있으며, 할인쿠폰의 세부구분, 할인금액(할인율), 사용방법, 사용기한 및 제한에 대한 사항은 할인쿠폰 또는 서비스화면에 표시됩니다. 할인쿠폰의 종류 및 내용과 발급여부에 관하여는 “몰”의 정책에 따라 달라질 수 있습니다.</li>
									<li>2. 할인쿠폰은 현금으로 출금될 수 없으며, 할인쿠폰에 표시된 유효기간이 만료되거나 이용계약이 종료되면 소멸합니다.</li>
									<li>3. 할인쿠폰은 회사에서 별도로 명시한 경우를 제외하고는 타인에게 양도할 수 없으며, 부정한 목적이나 용도로 사용할 수 없습니다. 이를 위반한 경우 회사는 할인쿠폰을 소멸시키거나 회원자격을 정지할 수 있습니다.</li>
									<li>4. 회원이 부정한 방법으로 보관금, 할인쿠폰을 획득한 사실이 확인될 경우 회사는 회원의 보관금, 할인쿠폰 회수, ID 삭제 및 형사고발 등 기타 조치를 취할 수 있습니다.</li>
								</ul>
							</div>
							<h3>제11조의 2(보관금)</h3>
							<div>
								<ul class="type_num">									
									<li>1. 회원은 환급 또는 환불받을 금액을 보관금으로 “몰”에 예치할 수 있으며 이 보관금을 구매 등의 결제 수단으로 사용할 수 있습니다.</li>
									<li>2. 회원은 보관금의 환급을 요구할 수 있으며 “몰”은 환급계좌 등의 확인을 거쳐 지체없이 지급합니다.</li>
								</ul>
							</div>
							<h3>제12조 (수신확인통지.구매신청 변경 및 취소)</h3>
							<div>
								<ul class="type_num">									
									<li>1. “몰”은 이용자의 구매 등에 관한 신청이 있는 경우 이용자에게 수신확인통지를 합니다. 수신확인통지는 “몰”에서 회원이 확인 가능한 방법으로의 통지, 전자우편주소(E-mail), 전화, 팩스 또는 기타의 방법으로 합니다.</li>
									<li>2. 수신확인통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인통지를 받은 후 즉시 구매신청 변경 및 취소를 요청할 수 있고 “몰”은 배송 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조의 청약철회 등에 관한 규정에 따릅니다.</li>
								</ul>
							</div>
							<h3>제13조 (재화 등의 공급)</h3>
							<div>
								<ul class="type_num">									
									<li>1. “몰”은 이용자와 재화 등의 공급시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만, “몰”이 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 3영업일 이내에 조치를 취합니다. 이때 “몰”은 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.</li>
									<li>2. “몰”은 이용자가 구매한 재화에 대해 배송수단, 수단별 배송비용 부담자, 수단별 배송기간 등을 명시합니다. 만약 “몰”이 약정 배송기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 “몰”이 고의.과실이 없음을 입증한 경우에는 그러하지 아니합니다.</li>
								</ul>
							</div>
							<h3>제14조 (환급)</h3>
							<div>
								<P>“몰”은 이용자가 구매신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.</P>
							</div>
							<h3>제15조 (청약철회 등)</h3>
							<div>
								<ul class="type_num">									
									<li>1. “몰”과 재화등의 구매에 관한 계약을 체결한 이용자는 「전자상거래 등에서의 소비자보호에 관한 법률」 제13조 제2항에 따른 계약내용에 관한 서면을 받은 날(그 서면을 받은 때보다 재화 등의 공급이 늦게 이루어진 경우에는 재화 등을 공급받거나 재화 등의 공급이 시작된 날을 말합니다)부터 7일 이내에는 청약의 철회를 할 수 있습니다. 다만, 청약철회에 관하여 「전자상거래 등에서의 소비자보호에 관한 법률」에 달리 정함이 있는 경우에는 동 법 규정에 따릅니다.</li>
									<li>2. 이용자는 재화 등을 배송 받은 경우 다음 각 호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.
										<ul class="type_abc">
											<li>A. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우(다만, 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)</li>
											<li>B. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우 </li>
											<li>C. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화등의 가치가 현저히 감소한 경우 </li>
											<li>D. 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우 </li>
											<li>E. 기타 구매자가 환불이나 교환을 요청할 수 없는 합리적인 사유가 있는 경우</li>
										</ul>	
									</li>
									<li>3. 제2항 제2호 내지 제5호의 경우에 “몰”이 사전에 청약철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약철회 등이 제한되지 않습니다.</li>
									<li>4. 이용자는 제1항 및 제2항의 규정에 불구하고 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약철회 등을 할 수 있습니다.</li>
									<li>5. 반품이나 교환에 필요한 왕복 배송비와 기타 필요한 비용은 귀책사유가 있는 쪽에서 부담합니다.</li>
									<li>6. 반품을 신청할 때 반품송장번호를 기재하지 않으면 반품처리와 환불이 지연될 수 있습니다.</li>
									<li>7. 교환신청을 하더라도 교환할 물품의 재고가 없으면 교환할 수 없으며, 이 때는 반품으로 처리됩니다.</li>
									<li>8. 교환에 드는 비용은 물품하자의 경우에는 “몰” 또는 판매자가 왕복배송비를 부담하나 이용자의 변심에 의한 경우에는 이용자가 부담합니다.</li>
									<li>9. 배송상의 문제로 이용자가 손해를 보았을 때 그에 대한 책임은 해당 배송업체를 지정한 “몰” 또는 판매자에게 있습니다.</li>
									<li>10. “몰”은 이용자의 교환 또는 반품의 요청이 정당하지 않다고 판단하면 이용자의 의사표시를 취소할 수 있습니다. 또한, 이용자의 교환, 반품 등이 접수된 날로부터 14일이 지날 때까지 이미 수령한 상품을 “몰”또는 판매자에게 반환하지 않거나 전화, 이메일(E-mail) 등으로 연락되지 않으면 교환, 반품의 의사를 철회한 것으로 간주할 수 있습니다.</li>
									<li>11. 카드결제로 구매한 건의 환불은 카드결제 취소를 통하여 하는 것을 원칙으로 합니다.</li>
									<li>12. 이용자는 상품이 발송되기 전까지 “구매계약”을 취소할 수 있으며, 배송 중이면 취소가 아닌 반품절차에 의해 처리됩니다.</li>
									<li>13. 결제완료 상태에서는 취소신청 접수 시 즉시 취소처리가 완료됩니다.</li>
									<li>14. 이용자가 "몰"과 구매계약 이외에 렌탈계약, 할부계약 등을 체결하는 경우에는 개별 계약에서 정한 절차에 따라 청약철회 등을 할 수 있습니다.</li>
								</ul>
							</div>
							<h3>제16조 (청약철회 등의 효과)</h3>
							<div>
								<ul class="type_num">									
									<li>1. “몰”은 이용자로부터 재화 등을 반환받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급합니다. 이 경우 “몰”이 이용자에게 재화등의 환급을 지연한때에는 그 지연기간에 대하여 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」제21조의3에서 정하는 지연이자율을 곱하여 산정한 지연이자를 지급합니다.</li>
									<li>2. “몰”은 위 대금을 환급함에 있어서 이용자가 신용카드 또는 전자화폐 등의 결제수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제수단을 제공한 사업자로 하여금 재화 등의 대금의 청구를 정지 또는 취소하도록 요청합니다.</li>
									<li>3. 청약철회 등의 경우 공급받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. “몰”은 이용자에게 청약철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시·광고 내용과 다르거나 계약내용과 다르게 이행되어 청약철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 “몰”이 부담합니다.</li>
									<li>4. 이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 “몰”은 청약철회 시 그 비용을 누가 부담하는지를 이용자가 알기 쉽도록 명확하게 표시합니다.</li>
								</ul>
							</div>
							<h3>제17조 (개인정보보호)</h3>
							<div>
								<ul class="type_num">									
									<li>1. “몰”은 이용자의 개인정보 수집시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보를 수집합니다.</li>
									<li>2. “몰”은 회원가입시 구매계약이행에 필요한 정보를 미리 수집하지 않습니다. 다만, 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우로서 최소한의 특정 개인정보를 수집하는 경우에는 그러하지 아니합니다.</li>
									<li>3. “몰”은 이용자의 개인정보를 수집·이용하는 때에는 당해 이용자에게 그 목적을 고지하고 동의를 받습니다.</li>
									<li>4. “몰”은 수집된 개인정보를 목적외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용·제공단계에서 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.</li>
									<li>5. “몰”이 제3항과 제4항에 의해 이용자의 동의를 받아야 하는 경우에는 개인정보관리 책임자의 신원(소속, 성명 및 전화번호, 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받은자, 제공목적 및 제공할 정보의 내용) 등 「정보통신망 이용촉진 및 정보보호 등에 관한 법률」 제22조 제1항 및 제24조의2 제1항이 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.</li>
									<li>6. 이용자는 언제든지 “몰”이 가지고 있는 자신의 개인정보에 대해 열람 및 오류정정을 요구할 수 있으며 “몰”은 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 “몰”은 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.</li>
									<li>7. “몰”은 개인정보 보호를 위하여 이용자의 개인정보를 취급하는 자를 최소한으로 제한하여야 하며 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.</li>
									<li>8. “몰” 또는 그로부터 개인정보를 제공받은 제3자는 개인정보의 수집목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.</li>
									<li>9. “몰”은 개인정보의 수집·이용·제공에 관한 동의란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의 수집·이용·제공에 관한 이용자의 동의거절시 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보의 수집·이용·제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.</li>
									<li>10. 연결”몰” 또는 피연결”몰”에서는 우리 “몰”의 개인정보취급방침이 적용되지 않습니다. 링크된 사이트 및 상품 등을 제공하는 제3자의 개인정보 취급과 관련하여서는 해당 사이트 및 제3자의 개인정보취급방침을 확인할 책임이 회원에게 있으며, 회사는 이에 대하여 책임을 부담하지 않습니다.</li>
									<li>11. “몰”은 다음과 같은 경우에 법이 허용하는 범위 내에서 회원의 개인정보를 제3자에게 제공할 수 있습니다.
										<ul class="type_abc">
											<li>A. 수사기관이나 기타 정부기관으로부터 정보제공을 요청 받은 경우</li>
											<li>B. 회원이 법령을 위반하는 등의 부정행위를 확인하기 위해 필요한 경우</li>
											<li>C. 기타 법률에 의해 요구되는 경우</li>
										</ul>	
									</li>

								</ul>
							</div>
							<h3>제18조 (“몰“의 의무)</h3>
							<div>
								<ul class="type_num">									
									<li>1. “몰”은 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 이 약관이 정하는 바에 따라 지속적이고, 안정적으로 재화.용역을 제공하는데 최선을 다하여야 합니다.</li>
									<li>2. “몰”은 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함)보호를 위한 보안 시스템을 갖추어야 합니다.</li>
									<li>3. “몰”이 상품이나 용역에 대하여 「표시.광고의 공정화에 관한 법률」 제3조 소정의 부당한 표시.광고행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.</li>
									<li>4. “몰”은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.</li>
								</ul>
							</div>
							<h3>제19조 (회원의 ID 및 비밀번호에 대한 의무)</h3>
							<div>
								<ul class="type_num">									
									<li>1. ID와 비밀번호에 관한 관리책임은 회원에게 있습니다.</li>
									<li>2. 회원은 자신의 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.</li>
									<li>3. 회원이 자신의 ID 및 비밀번호를 도난당하거나 제3자가 사용하고 있음을 인지한 경우에는 바로 “몰”에 통보하고 “몰”의 안내가 있는 경우에는 그에 따라야 합니다.</li>
								</ul>
							</div>
							<h3>제20조 (이용자의 의무) 이용자는 다음 행위를 하여서는 안 됩니다.</h3>
							<div>
								<ul class="type_num">									
									<li>1. 신청 또는 변경시 허위 내용의 등록</li>
									<li>2. 타인의 정보 도용</li>
									<li>3. “몰”에 게시된 정보의 변경</li>
									<li>4. “몰”이 정한 정보 이외의 정보(컴퓨터 프로그램 등) 등의 송신 또는 게시</li>
									<li>5. “몰” 기타 제3자의 저작권 등 지적재산권에 대한 침해</li>
									<li>6. “몰” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위</li>
									<li>7. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 몰에 공개 또는 게시하는 행위</li>
								</ul>
							</div>
							<h3>제21조 (연결“몰”과 피연결“몰” 간의 관계)</h3>
							<div>
								<ul class="type_num">									
									<li>1. 상위 “몰”과 하위 “몰”이 하이퍼링크(예: 하이퍼링크의 대상에는 문자, 그림 및 동화상 등이 포함됨)방식 등으로 연결된 경우, 전자를 연결 “몰”(웹 사이트)이라고 하고 후자를 피연결 “몰”(웹사이트)이라고 합니다.</li>
									<li>2. 연결“몰”은 피연결“몰”이 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결“몰”의 초기화면 또는 연결되는 시점의 팝업화면으로 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다.</li>
								</ul>
							</div>
							<h3>제22조 (저작권의 귀속 및 이용제한)</h3>
							<div>
								<ul class="type_num">									
									<li>1. “몰“이 작성한 저작물에 대한 저작권 기타 지적재산권은 ”몰“에 귀속합니다.</li>
									<li>2. 이용자는 “몰”을 이용함으로써 얻은 정보 중 “몰”에게 지적재산권이 귀속된 정보를 “몰”의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다. ③ “몰”은 약정에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.</li>
									<li>3. 회원이 “몰”의 서비스를 이용하면서 작성한 각종 게시물의 저작권은 회원 본인에게 있으며, 해당 게시물의 저작권 침해를 비롯한 민·형사상 모든 책임은 회원 본인이 집니다.</li>
									<li>4. “몰”은 회원이 등록한 게시물을 검색사이트나 다른 사이트에 노출할 수 있으며, 판촉, 홍보 및 기타의 자료로 무상으로 사용할 수 있습니다. 또한, 회사가 제공하는 서비스 내에서 회원 게시물을 복제, 전시, 전송, 배포할 수 있으며 2차적 저작물과 편집저작물로 작성 할 수 있습니다. 다만, 해당 게시물을 등록한 회원이 게시물의 삭제 또는 사용중지를 요청하면 회사는 관련 법률에 따라 보존해야 하는 사항을 제외하고 즉시 삭제 또는 사용을 중지합니다.</li>
									<li>5. 본 조 제5항에 언급된 회사의 사용권은 “몰” 서비스를 운영하는 동안에만 확정적으로 유효합니다.</li>
									<li>6. “몰”이 본 조 제5항 이외의 방법으로 회원의 게시물을 상업적으로 이용하고자 할 때에는, 전화, 팩스, 이메일(E-mail)등의 방법으로 미리 회원의 동의를 얻어야 합니다. 회사가 본 항에 따라 회원의 게시물을 상업적으로 이용할 때 회사는 별도의 보상제도를 운영할 수 있습니다.</li>
									<li>7. “몰”이 작성한 저작물에 대한 저작권과 지적 재산권은 회사에 귀속합니다.</li>
									<li>8. 이용자가 “몰”을 이용하여 얻은 정보를 회사의 승낙 없이 복제, 송신, 출판, 배포, 방송, 기타 방법으로 이용하거나 제3자에게 이용하게 할 때 그에 대한 책임은 이용자 본인에게 있습니다.</li>
									<li>9. 회원은 “몰” 내에서 자신의 저작권이 침해되면 회사가 운영하는 신고센터 제도를 이용하여 자신의 정당한 권리를 보호받을 수 있습니다.</li>
									<li>10. 회원은 “몰” 내에서 자신의 저작권이 침해되면 회사가 운영하는 신고센터 제도를 이용하여 자신의 정당한 권리를 보호받을 수 있습니다.</li>
									<li>11. 게시물의 내용이 다음 각 호의 내용을 담고 있을 때 “몰”은 게시물을 삭제하거나 게시자에게 특정 서비스의 이용제한 또는 정지, 이용계약의 해지 등의 조치를 할 수 있습니다. 이때 게시물이 삭제되면 해당 게시물과 관련된 게시물(답변글, 댓글 등)도 모두 삭제됩니다.
										<ul class="type_abc">									
											<li>A. 대한민국의 법령을 위반하는 내용을 포함하는 경우</li>
											<li>B. 타인의 권리나 명예, 신용 기타 정당한 이익을 침해하는 경우</li>
											<li>C. 정보통신기기의 오작동을 일으킬 수 있는 악성코드나 데이터를 포함하는 경우</li>
											<li>D. 사회 공공질서나 미풍양속에 위배되는 경우</li>
											<li>E. 기타 제1호 내지 제4호에 준하는 중대한 사유로 말미암아 회사가 제공하는 서비스의 원활한 진행을 방해하는 것으로 판단되는 경우</li>
										</ul>
									</li>
									<li>12. “몰”이 제11항에 따라 게시물을 삭제했을 때, 해당 게시자는 “몰”에 이의를 제기하여 구제받을 수 있습니다.</li>
								</ul>
							</div>
							<h3>제23조 (분쟁해결)</h3>
							<div>
								<ul class="type_num">									
									<li>1. “몰”은 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상처리하기 위하여 피해보상처리기구를 설치.운영합니다.</li>
									<li>2. “몰”은 이용자로부터 제출되는 불만사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.</li>
									<li>3. “몰”과 이용자 간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해구제신청이 있는 경우에는 공정거래위원회 또는 시·도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.</li>
								</ul>
							</div>
							<h3>제24조 (재판권 및 준거법)</h3>
							<div>
								<ul class="type_num">									
									<li>1. “몰”과 이용자 간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방법원의 전속관할로 합니다. 다만, 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사소송법상의 관할법원에 제기합니다.</li>
									<li>2. “몰”과 이용자 간에 제기된 전자상거래 소송에는 대한민국 법령을 적용합니다.</li>
								</ul>
							</div>
							<h3>제25조 (기타 조항)</h3>
							<div>
								<ul class="type_num">									
									<li>1. “몰”은 필요하면 특정 서비스나 기능의 전부 또는 일부를 “몰”을 통해 미리 공지한 후 일시적 또는 영구적으로 수정하거나 중단할 수 있습니다.</li>
									<li>2. 각 당사자는 상대방의 서면 동의 없이 이 약관상의 권리와 의무를 제3자에게 양도하거나 처분할 수 없습니다.</li>
									<li>3. 이 약관과 관련하여 당사자 간의 합의에 따라 추가로 작성된 계약서, 협정서, 통보서 등과 회사의 정책변경, 법령의 제·개정 또는 공공기관의 고시나 지침 등에 따라 “몰”이 “몰”에 공지하는 내용도 이용계약의 일부를 구성합니다.</li>
									<li>4. “몰”은 구매자 회원이 서비스를 이용할 때 발생할 수 있는 정당한 의견이나 불만 사항을 적극적으로 수렴하여 해결하고, 회원 상호 간의 분쟁을 조정하기 위하여 고객센터를 설치하고 운영합니다. “몰”은 회원이 제기하는 각종 불만사항과 의견을 적극적으로 검토한 후 정당하다고 판단될 때에는 이를 신속하게 처리하며, 즉시 처리하기가 어려운 사항이 있으면 그 사유와 처리기간을 전자우편주소(E-mail), 전화, 팩스 또는 기타의 방법으로 회원에게 통보합니다.</li>
								</ul>
							</div>
							<div>
								<p>[부칙] 본 약관은 2017년 8월 1일부터 적용됩니다.</p>
							</div>
						
						</div>
						<!-- / policy영역 -->
					</div>
					<!-- / 약관box -->	
				</div>
				<!-- / 롯데렌탈(묘미) 이용약관 동의 -->

				<!-- 롯데렌탈(묘미) 마케팅 활용동의 및 개인정보처리 동의-->
				<div class="term_b" >
					<h2><div class="input_b size_sm type1"><input type="checkbox" name="chkChoiceAgreementForMyomeeMarketing" id="chkChoiceAgreementForMyomeeMarketing" value="Y"><label for="chkChoiceAgreementForMyomeeMarketing">롯데렌탈(묘미) 마케팅 활용동의 및 개인정보처리 동의 <span>(선택)</span></label></div></h2>
					<div class="txt_a">
						<!-- policy영역 -->
						<div class="policy_a">
								</br>
								<p>롯데렌탈주식회사(이하 '회사')는 회원 개개인의 프라이버시를 적극적이고 효과적으로 보호하며 '정보통신망이용촉진 및 정보보호 등에 관한법률' 등 모든 관련법규를 준수하기 위하여 '개인정보처리방침'을 제정하고 이를 준수하고 있습니다. 회원 가입시 그리고 웹사이트(www.myomee.com) 및 묘미 모바일 앱(이하 통칭 '묘미') 방문시에 수시로 확인하여 주시기 바랍니다.</br>회사의 개인정보처리방침은 법률의 개정 및 정부지침의 변경 또는 회사 내부방침의 변경에 따라 바뀔 수 있습니다. [개인정보처리방침] 이 변경될 경우 변경사항은 ‘묘미’에 게시됩니다. 변경사항에 의문이 있으실 경우는 언제라도 담당자에게 문의하시거나 ‘묘미’에 방문하여 확인하실 수 있습니다.</p>
								<h3>개인정보의 수집 및 이용목적</h3>
								<div>
								<ul class="type_num">									
									<li>회사가 수집한 개인정보의 수집 및 이용 목적에 관한 세부항목은 다음과 같습니다.
										<ul class="type_abc">
											<li>A. 서비스 이용에 따른 본인식별, 가입의사 확인, 연령제한 서비스 이용</li>
											<li>B. 고지사항 전달, 불만처리 의사소통 경로 확보, 물품배송 시 정확한 배송지 정보 확보</li>
											<li>C. 신규 서비스 등 최신정보 안내 및 개인맞춤서비스 제공을 위한 자료</li>
											<li>D. 유료정보 이용에 대한 요금결제</li>
											<li>E. 부정 이용방지 및 비인가 사용방지</li>
											<li>F. 기타 원활한 양질의 서비스 제공(보험판매, 제휴서비스 등의 양질의 서비스 소개와 기타 정보를 텔레마케팅, 휴대폰문자서비스, 이메일마케팅 서비스로 제공) 등. 단, 제휴상품의 텔레마케팅 서비스는 “부가서비스에 대한 개인정보활용 동의서”에 선택적으로 동의한 회원에 한하여 할 수 있습니다.</li>
										</ul>
									</li>
									<li>• 마케팅활용 동의 거부권 [텔레마케팅 거부권]</br>
									마케팅활용 동의 거부권이란 회사가 직접 진행하는 모든 텔레마케팅에 대한 동의철회권을 뜻하며, 회사는 회원의 텔레마케팅 거부 요청 시 5일 이내 필요한 조치를 완료하여 고객불편을 최소화 합니다.</li>
									
									<li>• 마케팅 활용 동의 거부권 행사 방법</br>
										가. 전화 접수 : 1522-4100 (고객센터)</br>
						    			나. '묘미'접수 (직접수정) : MY 페이지
									</li>
								</ul>
								</div>
								<h3>수집하는 개인정보 항목 및 방법</h3>
								<div>
									<p>회사는 아래와 같이 개인정보를 수집하고 있습니다.</p>
								<ul class="type_num">									
									<li>1. 수집항목
										<ul class="type_abc">
											<li>A. 통합회원('묘미'회원 + L.POINT회원)
												<ul class="type_abc">
													<li>이용자의 식별을 위한 필수 정보: 아이디(ID), 비밀번호</li>
													<li>본인확인을 위한 정보: 이름, 생년월일, 성별, 연계정보(CI), 중복확인가입정보(DI), 아이핀번호(아이핀본인인증의 경우)</li>
													<li>주문시의 결제 및 상품 배송을 위한 내용 : 결제정보(카드번호, 계좌번호), 주소, 전화번호, 휴대폰번호</li>
													<li>계약이행의 연락 및 안내 등의 고지를 위한 내용 : 이메일주소, 이메일 수신여부, SMS 수신여부, 우편물 수신처</li>
													<li>서비스 이용 및 상담 : 이름, 아이디(ID), 생년월일, 이메일주소, 휴대폰번호</li>
													<li>비밀번호를 잊은 경우의 신속한 처리를 위한 내용 : 비밀번호연상문구/답변</li>
													<li>만 14세미만의 경우 법정대리인 정보 : 법정대리인의 이름, 연락처, 이메일주소</li>
													<li>제휴사를 통한 가입시 추가로 필요한 정보 : 결혼·이사·출산 관련정보</br>
														※ 단, 결혼·이사·출산 관련 제휴처에서 가입하는 고객에 한하여 수집합니다.
													</li>
												</ul>
											</li>
											<li>B. 간편회원('묘미'회원)
												<ul class="type_abc">
													<li>이용자의 식별을 위한 내용 : 이름, 이메일주소(ID), 휴대폰번호, 비밀번호</li>
													<li>주문시의 결제 및 상품 배송을 위한 내용 : 결제정보(카드번호, 계좌번호), 주소, 전화번호, 휴대폰번호</li>
													<li>서비스 이용 및 상담 : 이름, 아이디(ID), 이메일주소, 휴대폰번호</li>
													<li>부가서비스 동의시 : 생년월일, 성별</li>
												</ul>
											</li>
											<li>C. 서비스 이용 또는 사업처리 과정에서 아래와 같은 정보들이 생성되어 수집될 수 있습니다.
												<ul class="type_abc">
													<li>서비스이용기록, 접속로그, 쿠키, 접속IP정보, 결제기록, 이용정지기록</li>
													<li>모바일 서비스 이용시 : 고유기기식별값(IMEI 등), OS버전, 단말기 기기명, 광고식별자</li>
												</ul>
											</li>
										</ul>
									</li>
									<li>2. 개인정보 수집방법
										<ul class="type_abc">
											<li>A. 웹사이트(www.myomee.com) 또는/및 모바일 앱, 유무선전화, 모사전송, 서면신청서를 통한 회원 가입, 상담게시판 이용, 경품행사(이벤트) 응모 및 배송요청</li>
											<li>B. 제휴사로부터의 제공</li>
											<li>C. 로그분석 프로그램을 통한 생성정보 수집</li>
										</ul>
									</li>
								</ul>
								</div>
								<h3>개인정보의 보유 및 이용기간</h3>
								<div>
									<p>원칙적으로, 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 단, 관계법령의 규정에 의하여 보존할 필요가 있는 경우 회사는 아래와 같이 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다.</p>
								<ul class="type_num">
									<li>1. 회사 내부 방침에 의한 정보보유 사유
										<ul class="type_abc">
											<li>A. 부정이용기록 : 3년 (부정 이용 방지, 재가입 방지)</li>
										</ul>
									</li>
									<li>2. 관련법령에 따른 정보보유
										<ul class="type_abc">
											<li>A. 계약 또는 청약철회 등에 관한 기록 : 5년 (전자상거래 등에서의 소비자보호에 관한 법률)</li>
											<li>B. 대금결제 및 재화 등의 공급에 관한 기록 : 5년 (전자상거래 등에서의 소비자보호에 관한 법률)</li>
											<li>C. 거래내역 관련 정보 기록 : 5년 (국세기본법)</li>
											<li>D. 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년 (전자상거래 등에서의 소비자보호에 관한 법률)</li>
											<li>E. 신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년 (신용정보의 이용 및 보호에 관한 법률)</li>
											<li>F. 표시/광고에 관한 기록 : 6개월 (전자상거래 등에서의 소비자보호에 관한 법률)</li>
											<li>G. 통신사실 확인자료 기록 : 3개월 (통신비밀보호법)</li>
										</ul>
									</li>
								</ul>
								</div>
								<h3>목적 외 사용 및 제3자에 대한 제공</h3>
								<div>
								<ul class="type_num">
									<li>1. 회사는 법령에 근거가 있거나 정부의 관련 지침, 지시 등 예외적인 경우를 제외하고는 이용자의 사전동의없이 이용자의 개인정보를 본 개인정보처리방침상의 정보이용목적을 넘어 사용하거나 제 3자에게 제공하지 않습니다.</li>
									<li>2. 이용자가 가입약관을 위배하거나 제3자에게 피해를 주는 등의 부정한 행위 등으로 인하여 법적 조치를 취하거나 사법기관의 요청이 있을 경우에는 이용자의 동의없이 관련 기관에 제공할 수 있습니다.</li>
									<li>3. 이용자에게 보다 나은 서비스 제공을 위하여 이용자의 개인정보를 제휴사, 후원사 등에 제공할 수 있습니다. 이러한 경우에도 제공받는 자, 제공받는 자의 이용 목적, 제공할 정보의 내용, 제공받는 자의 개인정보보호 및 이용기간을 전자우편 또는 서면으로 개별통지하거나 인터넷 사이트에 명시하여 이용자의 동의(예: 마우스 클릭)를 받도록 하겠습니다. 또한, 이용자가 동의하지 않는 경우에는 제휴사, 후원사 등에게 정보를 제공하지 않겠습니다.</li>
								</ul>
								</div>
								<h3>개인정보의 처리위탁</h3>
								<div>
									<p>회사는 보다 나은 서비스의 제공, 고객편의 제공 등 원활한 업무수행을 위하여 아래와 같이 개인정보의 처리에 관한 업무를 위탁하고 있습니다.</p>
								</div>
							<table border="0" cellspacing="0" cellpadding="0" class="header_h">
								<colgroup>
									<col style="width:50%">
									<col style="width:50%">
								</colgroup>
								<tbody><tr>
									<td><p align="center">수탁업체의 명칭</p></td>
									<td><p align="center">위탁하는 업무의 내용</p></td>
								</tr>
								<tr>
									<td><p align="left">㈜롯데정보통신</p></td>
									<td><p align="left">전산시스템 구축 및 유지보수, 운영, 고객상담 업무일체</p></td>
								</tr>
								<tr>
									<td><p align="left">NICE 신용평가정보㈜</p></td>
									<td><p align="left">본인 인증, 실명확인, CB조회, Safekey 발급</p></td>
								</tr>
								<tr>
									<td><p align="left">KIBNET㈜</p></td>
									<td><p align="left">자동이체, 펌뱅킹 이체, 가상계좌, 예금주실명조회인증</p></td>
								</tr>
								<tr>
									<td><p align="left">㈜KG이니시스, L.pay</p></td>
									<td><p align="left">주문상품의 결제대행</p></td>
								</tr>
								<tr>
									<td><p align="left">농협은행 주식회사</p></td>
									<td><p align="left">펌뱅킹 및 부문 입출금 계좌 관리</p></td>
								</tr>
								<tr>
									<td><p align="left">㈜KB국민은행</p></td>
									<td><p align="left">에스크로(Escrow) 서비스, 부문 입출금 계좌 관리</p></td>
								</tr>
								<tr>
									<td><p align="left">KICC(한국정보통신㈜)</p></td>
									<td><p align="left">VAN 서비스, 카드승인, 청구 및 현금영수증 처리</p></td>
								</tr>	
								<tr>
									<td><p align="left">주식회사 엠티에스컴퍼티</p></td>
									<td><p align="left">카카오 알림톡, SMS, LMS 서비스대행</p></td>
								</tr>
								<tr>
									<td><p align="left">롯데글로벌로지스㈜ *동사의 관리를 받는 협력업체를 포함합니다.</p></td>
									<td><p align="left">물류센터운영, 상품분류업무 및 배송업무</p></td>
								</tr>										
							</tbody>
							</table>
							<h3>개인정보의 파기 절차 및 방법</h3>
							<div>
								<p>회사는 원칙적으로 개인정보 수집 및 이용목적이 달성된 후에는 해당 정보를 지체 없이 파기합니다. 파기절차 및 방법은 다음과 같습니다.</p>
							<ul class="type_num">									
								<li>1. 파기절차
									<ul class="type_abc">
										<li>A. 회원님이 회원가입 등을 위해 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기됩니다.</li>
										<li>B. 별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유 이외의 다른 목적으로 이용되지 않습니다.</li>
									</ul>
								</li>
								<li>2. 파기방법
									<ul class="type_abc">
										<li>A. 전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.</li>
										<li>B. 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.</li>
									</ul>
								</li>
							</ul>
							</div>
							<h3>동의 거부권 및 불이익</h3>
							<div>
								<p>귀하는 위와 같은 본인의 개인정보 수집∙이용에 관한 동의를 거부할 권리가 있습니다. 회원 가입을 위해 필요한 최소한의 정보인 필수사항의 수집∙이용에 관한 동의를 거부하는 경우에는 회원 가입이 불가합니다.</p>
							</div>

						</div>
						<!-- / policy영역 -->
					</div>
					<!-- / 약관box -->		
				</div>
				<!-- / 롯데렌탈(묘미) 마케팅 활용동의 및 개인정보처리 동의 -->
			</div>
			<!-- /롯데묘미 동의 180219 -->
            
                <!--<div class="b_clear" style="margin-bottom: 2%;"></div>-->

                <!--200330 수정영역-->
                <!-- 통신서비스 마케팅 활용 동의 -->
                <div id="wrapThirdPartyAgreementTelecom" class="term_b" style="float:left;width:50%;position: relative;" runat="server">
                    <h2 style="float:left; margin: 0 0 10px 0;"><div class="input_b size_sm type1"><input type="checkbox" name="chkChoiceAgreementForThirdPartyTelecomALL" id="chkChoiceAgreementForThirdPartyTelecomALL" value="Y" class="thirdparty-parent"><label for="chkChoiceAgreementForThirdPartyTelecomALL">제3자 마케팅 활용동의 <span>(선택)</span></label></div></h2>
                    <h2 style="float:right; width:100px;"><div class="input_b size_sm type1"><input type="checkbox" name="chkChoiceAgreementForThirdPartyShinhan" id="chkChoiceAgreementForThirdPartyShinhan" value="Y" class="thirdparty-child"><label for="chkChoiceAgreementForThirdPartyShinhan">생명보험</label></div></h2>   
                    <h2 style="float:right;width: 83px;"><div class="input_b size_sm type1"><input type="checkbox" name="chkChoiceAgreementForThirdPartyTelecom" id="chkChoiceAgreementForThirdPartyTelecom" value="Y" class="thirdparty-child"><label for="chkChoiceAgreementForThirdPartyTelecom">통신</label></div></h2><!-- 약관box -->
                    <div class="txt_a" style="clear:both;">
                        <!-- policy영역 -->
                        <div class="policy_a">
                            <div>
                                <h3>통신서비스 개인정보 제3자 제공</h3>
                                <br>
                                <span>개인정보를 제공받는자 : (주)SK브로드밴드,브로드밴드TS㈜,㈜유컴패니온</span><br>
                                <span>개인정보 제공 항목 : 성명,휴대폰번호,생년월일,성별,주소,이메일,예식일,참여일시,참여매체</span><br>
                                <span>개인정보 제공목적 : 전화,문자,이메일을 이용한 SK브로드밴드 통신상품 및 SK텔레콤 스마트홈 서비스 상품 안내 </span><br>
                                <span>보유 및 이용기간 : 제공동의일로부터 1년 (고객동의 철회 시 지체없이 파기)</span><br>
                                <span>※ 동의를 거부하실 수 있으나, 이 경우 상품 안내 및 이벤트 참여가 제한됩니다. </span><br>
                                <span>※ 본 통신서비스에 동의하신 고객정보의 보호를 위해 파트너사(제공받는자)는 관련법령을 준수한 개인정보보호 시스템을 구축하여 동의고객 정보를 안전하게 보호 및 파기할 의무를 가지고 있으며, 파트너사는 캠페인 진행에 따른 광고비용을 지급하고 있습니다.</span>
                            </div>
                            
                            <div>
                                <h3>금융서비스 개인정보 제3자 제공</h3>
                                <br>
                                <span>개인정보를 제공받는자 : 신한라이프생명보험㈜, 신한라이프생명보험㈜와 모집위탁 계약을 체결한 자</span><br>
                                <span>개인정보 제공 항목 : 성명,생년월일,성별,휴대폰번호,이메일,참여일,참여매체,예식일 정보</span><br>
                                <span>개인정보 제공목적 :  보험상품 판매를 위한 마케팅(전화,문자) 자료활용 및 경품발송(문자)</span><br>
                                <span>보유 및 이용기간 : 제공동의일로부터 1년 (고객동의 철회시 지체없이 파기) </span><br>
                                <span>※ 동의를 거부하실 수 있으나, 이 경우 상품 안내 및 이벤트 참여가 제한됩니다. </span><br>
                                <span>※ 본 통신서비스에 동의하신 고객정보의 보호를 위해 파트너사(제공받는자)는 관련법령을 준수한 개인정보보호 시스템을 구축하여 동의고객 정보를 안전하게 보호 및 파기할 의무를 가지고 있으며, 파트너사는 캠페인 진행에 따른 광고비용을 지급하고 있습니다.</span>
                            </div>
                        </div>
                        <!-- / policy영역 -->
                    </div>
                    <!-- / 약관box -->
                </div>
                <!-- / 통신서비스 마케팅 활용 동의 -->

                <!-- 개인정보 취급위탁동의 -->
                <div id="wrapThirdPartyAgreement" class="term_b" runat="server">
                    <h2><div class="input_b size_sm type1"><input type="checkbox" name="chkChoiceAgreementForThirdParty" id="chkChoiceAgreementForThirdParty" value="Y" class="agreement-thirdparty"><label for="chkChoiceAgreementForThirdParty">개인정보 처리 위탁 <span>(선택)</span></label></div></h2>
                    <!-- 약관box -->
                    <div class="txt_a">
                        <!-- policy영역 -->
                        <div class="policy_a">
                            <div>
                                <br>
                                수탁자 : ㈜멤플러스<br>
                                수탁업무 : 분야별 마케팅활용 동의회원 개인정보 처리 및 바른라이프(금융,통신,멤버십 등) 제휴상품 추천,안내
                                <br>
                                ※ 동의를 거부하실 수 있으나 , 이 경우 분야별 제휴혜택 안내 및 이벤트 참여가 제한됩니다.<br>
                            </div>
                        </div>
                        <!-- / policy영역 -->
                    </div>
                    <!-- / 약관box -->
                </div>
                <!--200330 수정영역-->


            </div>



            <div class="b_clear" style="margin-bottom: 5%;"></div>

			<!-- 하단버튼 -->
			<div class="b_btn_a" id="FooterButtonArea">
				<a href="javascript:history.back()" class="b_btn type2 dim left"><span>이전</span></a>
				<a href="javascript:;" class="b_btn type2 right btnNextStep" id="btnNextStep2"><span>정보입력하기</span></a>
			</div>
			<!-- / 하단버튼 -->
		</div>
	</div>
	<!-- / contents -->

</asp:Content>
