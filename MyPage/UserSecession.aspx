<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Site.Master" AutoEventWireup="true" CodeBehind="UserSecession.aspx.cs" Inherits="BarunnIntergrationService.MyPage.UserSecession" ClientIDMode="Static" %>

<asp:Content ID="cphStyleSheet" ContentPlaceHolderID="cphStyleSheet" runat="server">
    <link rel="stylesheet" type="text/css" href="/resources/css/common.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/layout_mypage.css">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">

        $(document).ready(function () {

            $("[name=chkSecessionCause]").click(function () {

                if ($(this).val() == "117007" && $(this).is(":checked")) {
                    $("#divEtcComment").show();
                } else if ($(this).val() == "117007" && $(this).is(":checked") == false) {
                    $("#divEtcComment").hide();
                }

            })         

        })

        var ConfirmMessage = function () {
            if ($("[name=chkSecessionCause]:checked").length <= 0) {
                alert("탈퇴 사유를 선택해주세요.");
                return false;
            }
            
            if ($("[name=chkSecessionCause][value=117007]").prop("checked")) {
                var sEtcComment = $.trim($("[name=txtEtcComment]").val());
                if (sEtcComment == "") {
                    alert("기타 사유의 내용을 입력해주세요");
                    return false;
                }
            }

            var result = confirm("통합 회원을 탈퇴하시면 바른컴퍼니의\r\n모든 패밀리 사이트를 이용하실 수 없습니다.\r\n\r\n탈퇴하시겠습니까?");

            if (result == false)
                event.preventDefault();

            return result;
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <input type="hidden" name="hidDupInfo" id="hidDupInfo" runat="server" />
    <input type="hidden" name="hidReturnUrl" id="hidReturnUrl" runat="server" />
    <input type="hidden" name="hidSiteDiv" id="hidSiteDiv" runat="server" />

    <!-- Step -->
	<div class="step_a">
		<div class="step_a_in">
			<div class="tit"><img src="/resources/mypage/tit_member_leave.png" alt="바른 ONE 회원탈퇴"></div>
		</div>
	</div>
	<!-- Step -->	
	<!-- contents -->
	<div class="cont_a">
		<div class="cont_a_in">
			<!-- 탈퇴안내 -->
			<div class="leave_noti">
				<dl>
					<dt><img src="/resources/mypage/txt_member_leave_1.png" alt="회원탈퇴 안내"></dt>
					<dd>
						<ul class="b_noti01">
							<li>바른 ONE 회원을 탈퇴하시면 <strong>바른컴퍼니의 패밀리 사이트 전체에서 탈퇴 처리</strong>가 됩니다.<br>(바른컴퍼니 패밀리 사이트는 바른손카드, 프리미어페이퍼, 바른손엠카드 3곳의 사이트가 해당됩니다.)</li>
							<li>회원탈퇴 시 보유하고 있는 <strong>할인쿠폰 및 서비스는 자동소멸</strong>되며 재가입 시 복구되지 않습니다.</li>
							<li>회원탈퇴 시 개인정보는 <strong>소비자보호에 관한 법률에 의거, 개인정보보호정책에 따라 관리</strong>됩니다.</li>
						</ul>
					</dd>
				</dl>
			</div>
			<!-- / 탈퇴안내 -->
			<!-- 탈퇴이유 -->
			<div class="reason_a">
				<ul class="clearfix">
					<li><div class="input_b size_sm type3"><input type="checkbox" name="chkSecessionCause" value="117001" id="checkbox_sm1_101"><label for="checkbox_sm1_101" >배송불만</label></div></li>
					<li><div class="input_b size_sm type3"><input type="checkbox" name="chkSecessionCause" value="117002" id="checkbox_sm1_102"><label for="checkbox_sm1_102" >사이트 이용 불만</label></div></li>
					<li><div class="input_b size_sm type3"><input type="checkbox" name="chkSecessionCause" value="117003" id="checkbox_sm1_103"><label for="checkbox_sm1_103" >상품의 다양성 / 가격 품질 불만</label></div></li>
					<li><div class="input_b size_sm type3"><input type="checkbox" name="chkSecessionCause" value="117004" id="checkbox_sm1_104"><label for="checkbox_sm1_104" >개인정보 유출우려</label></div></li>
					<li><div class="input_b size_sm type3"><input type="checkbox" name="chkSecessionCause" value="117005" id="checkbox_sm1_105"><label for="checkbox_sm1_105" >교환 / 환불 불만</label></div></li>
					<li><div class="input_b size_sm type3"><input type="checkbox" name="chkSecessionCause" value="117006" id="checkbox_sm1_106"><label for="checkbox_sm1_106" >실질적인 혜택 부족</label></div></li>
					<li><div class="input_b size_sm type3"><input type="checkbox" name="chkSecessionCause" class="check_etc" value="117007" id="checkbox_sm1_107"><label for="checkbox_sm1_107" >기타사유</label></div></li>
				</ul>
				<div id="divEtcComment" class="reasonetc_a" style="display:none">
					<textarea name="txtEtcComment" id="txtEtcComment" style="width:100%"></textarea>
				</div>
			</div>
			<!-- / 탈퇴이유 -->
			<!-- 하단버튼 -->
			<div class="b_btn_a">
                <asp:LinkButton ID="btnSecession" CssClass="b_btn type2" runat="server" OnClick="btnSecession_Click" OnClientClick="return ConfirmMessage();"><span>탈퇴하기</span></asp:LinkButton>
				<a href="javascript:;" id="btnCancel" class="b_btn type2 dim" runat="server"><span>취소하기</span></a>
			</div>
			<!-- / 하단버튼 -->
		</div>
         <script>
             var Sitegubun = "<%=sitegubun%>";
             if (Sitegubun == "GS") {
                 $(".b_noti01 li").eq(0).html("바른 ONE 회원을 탈퇴하시면 <strong>바른컴퍼니의 패밀리 사이트 전체에서 탈퇴 처리</strong>가 됩니다.<br>(바른컴퍼니 패밀리 사이트는 바른손카드, 더카드, 프리미어페이퍼, 바른손엠카드, 바른손지샵 5곳의 사이트가 해당됩니다.)")
                 $(".head_a .head_a_in .bi").html("<a href=\"https://barunsongshop.com\" target=\"_blank\"><img src=\"/resources/img_inc/logo_barunsoncard.png\" srcset=\"https://gsauth.barunsoncard.com/img/common/barunsongshop.svg\" alt=\"바른손G샵\" width=\"142px\" height=\"30px;\"></a>")

             }
         </script>
	</div>
	<!-- / contents -->

</asp:Content>
