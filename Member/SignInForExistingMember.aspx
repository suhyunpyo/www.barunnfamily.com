<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Site.Master" AutoEventWireup="true" CodeBehind="SignInForExistingMember.aspx.cs" Inherits="BarunnIntergrationService.Member.SignInForExistingMember" ClientIDMode="Static" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(function() {
	        /*기본 체크되어 있는 곳에 mark처리하기*/
            $('.id_list input:radio:checked').closest('dl').addClass('mark');
            $('.id_list dl.not.mark').find('.anotherid_a').slideDown(800);
        });

        $(document).ready(function () {

            $(".lblSiteName").click(function () {
                $(this).parent().find("[name=rdoSelectSiteCode]").trigger("click");
                $(this).parent().find("[name=rdoSelectSiteCode]").attr("checked", true);
            })

            $("[name^=CustomUserId]").focusin(function () {
                if ($.trim($(this).val()) == "") {
                    notiMessage = "";
                    $(this).parent().find(".noti").text(notiMessage);
                }
            })

            $("[name^=CustomUserId]").focusout(function () {
                var AvaliableID = CheckAvailableUserID(false);
                var notiMessage = (AvaliableID == false ? "이미 사용중인 아이디 입니다." : "");

                if (CheckUserID($(this).val()) == false) {
                    notiMessage = "아이디는 영문자로 시작하는 6~16자의 영문 또는 숫자의 조합이여야 합니다.";
                }

                if ($.trim($(this).val()) == "")
                    notiMessage = "";
                $(this).parent().find(".noti").text(notiMessage);
            })

            $("#btnNextStep").click(function () {
                var isValidation = true;
                var objSelectRadioButton = $("[name^=rdoSelectSiteCode]:checked");
                var objParent = $(objSelectRadioButton).parent().parent().parent();
                var IsAvailableYorN = $(objParent).attr("IsAvailableYorN");

                $("#SelectCustomUserId").val("");

                if (IsAvailableYorN == "N") {
                    
                    if (isValidation && $.trim($(objParent).parent().find("[name^=CustomUserId]").val()) == "") {
                        $(objParent).parent().find("[name^=CustomUserId]").focus();
                        errorMessage = "사용하실 아이디를 입력해주세요.";
                        isValidation = false;
                    }

                    if (CheckUserID($(objParent).parent().find("[name^=CustomUserId]").val()) == false) {
                        errorMessage = "아이디는 영문자로 시작하는 6~16자의 영문 또는 숫자의 조합이여야 합니다.";
                        isValidation = false;
                    }

                    if (isValidation) {
                        if (CheckAvailableUserID(false)) {
                            $("#SelectCustomUserId").val($(objParent).parent().find("[name^=CustomUserId]").val());
                        } else {
                            $(objParent).parent().find("[name^=CustomUserId]").focus();
                            errorMessage = "이미 사용중인 아이디 입니다.";
                            isValidation = false;
                        }
                    }
                }

                if (isValidation == false) {
                    alert(errorMessage);
                    return false;
                }

                $("#MainForm").submit();
            })

        })

        var CheckUserID = function (value) {
            var pattern = /^[A-Za-z0-9]+[A-Za-z0-9_.\-]{3,15}$/;
            var returnValue = pattern.test(value);
            
            return returnValue;
        }

        var CheckAvailableUserID = function (pAsync) {
            var result = false;

            var objSelectRadioButton = $("[name^=rdoSelectSiteCode]:checked");
            var objParent = $(objSelectRadioButton).parent().parent().parent();
            var userId = $(objParent).parent().find("[name^=CustomUserId]").val();

            $.ajaxSetup({ async: pAsync });
            $.getJSON("/Service/Member/CheckAvailableUser.ashx"
                , { USERID: userId, AUTHCODE: decodeURIComponent($("#DupInfo").val()), OUTPUT: "json" }
                , function (data) {
                    result = data.Avaliable;
                }
            );
            return result;
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Literal ID="ltrHiddenField" runat="server"></asp:Literal>

    <!-- Step -->
	<div class="step_a">
		<div class="step_a_in">
			<div class="tit"><img src="/resources/member/tit_barunnone_join.png" alt="바른 ONE 회원가입"></div>
			<ul>
         		<li class="on"><img src="/resources/member/img_step1.png" alt="Step1 본인인증"></li>
				<li><img src="/resources/member/img_step2.png" alt="Step2 약관동의"></li>
				<li><img src="/resources/member/img_step3.png" alt="Step3 정보입력"></li>
				<li><img src="/resources/member/img_step4.png" alt="Step4 가입완료"></li>
			</ul>
		</div>
	</div>
	<!-- Step -->	
	<!-- contents -->
	<div class="cont_a">
		<div class="cont_a_in">
			<!-- 상태표시 -->
			<div class="condition_noti">
				<strong><asp:Literal ID="ltrUserName" runat="server"></asp:Literal></strong>님은
                <br />바른컴퍼니의 패밀리 사이트에 이미 등록된 회원입니다.
			</div>
			<!-- / 상태표시 -->
			<!-- ID선택 -->
			<div class="selectid_b">
				<p class="date_info">2016.04.01부터 바른컴퍼니의 패밀리 사이트에 가입하는 회원은
                    <br />바른 ONE 아이디가 적용됩니다.</p>
                <p><asp:Literal ID="ltrInformationMessage" runat="server"></asp:Literal></p>
                <asp:Literal ID="ltrRegisteredSiteInformation" runat="server" ></asp:Literal>
			</div>
			<!-- / ID선택 -->
			<!-- 하단버튼 -->
			<div class="b_btn_a">
				<a href="javascript:;" class="b_btn type2 right" id="btnNextStep"><span>약관동의하기</span></a>
			</div>
			<!-- / 하단버튼 -->
		</div>
	</div>
	<!-- / contents -->

</asp:Content>
