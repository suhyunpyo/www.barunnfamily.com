<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteOne.Master" AutoEventWireup="true" CodeBehind="BarunsonMcardForRegistrationComplete.aspx.cs" Inherits="BarunnIntergrationService.Member.BarunsonMcardForRegistrationComplete" %>
<%@ Register TagPrefix="ucAffiliatedBanner" TagName="AffiliatedBanner" Src="~/UserControl/banner/AffiliatedBanner.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <script type="text/javascript">
         $(document).ready(function () {
          
            //var getDocHeight = document.body.scrollHeight;
            //var chkLoginFlag = "";

            //if ($('#userId').val() != "" && $('#userDinfo').val() != "") {
            //    chkLoginFlag = "1";
            //} else {
            //    chkLoginFlag = "0";
            //}

            ////alert('iframeHeight|' + getDocHeight + ',ajaxFlag|' + chkLoginFlag + ',UserId|' + $('#userId').val() + ',userDinfo|' + encodeURIComponent($('#userDinfo').val()));
            //window.parent.postMessage({
            //    message: 'iframeHeight|' + getDocHeight + ',ajaxFlag|' + chkLoginFlag + ',UserId|' + $('#userId').val() + ',userDinfo|' + encodeURIComponent($('#userDinfo').val())
            //}, "*");
            window.parent.postMessage({ message: 'AuthFlag|Y' }, "*");

        });
     </script>
    <style type="text/css">
	.cont_a_in.check_all_area.step01{padding-top:0px;padding-bottom: 100px;}
	#wrap {background: #f7f8f9;}
	#wrap .header {position: static; border-bottom: 1px solid #aaa; padding: 40px 0; background: #fff;}
	#wrap .header h1 {position: static; float: none; margin: 0 auto; text-align: center;}
	#wrap .header h1 a {background:url(../img/common/logo_b.svg) no-repeat center; }
	.wp100{width:100%}
	.btn_wrap .btn{display:inline-block;padding:24px 0;box-sizing: border-box;text-align: center;}
	.btn_wrap .btn.type01 {background: #7988f8; color:#fff;  border:1px solid #7988f8;}
	/** top title **/
	.title_box {text-align: center;}
	.register h2 {font-size:30px; line-height: 30px; color:#333; font-weight: bold; margin-bottom: 60px;}

	
	/* 단계 */
	.step_view {margin-bottom: 70px;}
	.step_view ol {position: relative; display: inline-block; z-index: 1;}
	.step_view ol::after {content:""; position: absolute; width: 90%; height: 1px; top:14px; right: 50%; transform: translateX(50%); background: #ccc; z-index: -1;}
	.step_view li {display: inline-block; margin-right: 60px;}
	.step_view li:last-child {margin-right: 0;}
	.step_view li span {display: inline-block; width: 28px; height: 28px; line-height: 28px; background: #ccc; border-radius: 50%; font-size: 12px; font-weight: bold; color: #fff;}
	.step_view li p {font-size: 14px; color: #ccc; margin-top: 10px; font-weight: 500;}
	.step_view li p strong {color: inherit;}

	.step_view li.on span {background: #98A3F4;}
	.step_view li.on p {color: #333;}

	/** register contents **/
	.register {max-width: 1100px; margin: 0 auto;padding:60px 0 30px;transition: all 0.3s ease-in;}
	.register_box {background: #fff; border:1px solid #ebebeb; padding:54px 3.5%;}
	/*.register*/ .step_view li {margin-right: 114px;}
	.register .step_view li:last-child{margin-right: 0;}
	.register .step_view li p {font-size: 15px;}

	.register_text_wrap {text-align: center; margin:90px 0 80px;}
	.register_text_wrap .register_text {font-size: 22px; line-height: 34px; color: #708bff;}
	.register_text_wrap .sub_text {font-size:16px; line-height: 24px; color:#757575; font-weight: 300; letter-spacing: -0; margin-top: 20px;}

	.register .btn_wrap.bottom {max-width: 400px; text-align: center; margin:0 auto;}
	.register .btn_wrap.bottom .btn {font-size: 18px; height: 66px;}

	</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

	<section class="register">
				<div class="register_box">
					<div class="title_box">
						<h2>회원가입</h2>
						<!-- 회원가입 단계 -->
						<div class="step_view">
							<ol>
								<!--
									li class ="on" 추가 시 현재 단계 표시
								-->
								<li class="on">
									<span>1</span>
									<p><strong>본인인증</strong></p>
								</li>
								<li class="on">
									<span>2</span>
									<p><strong>정보입력</strong></p>
								</li>
								<li class="on">
									<span>3</span>
									<p><strong>가입완료</strong></p>
								</li>
							</ol>
						</div>
						<!-- //회원가입 단계 -->
					</div>
					<!-- 회원가입 컨텐츠 -->
					<div class="register_contents">
						<div class="register_text_wrap">
							<p class="register_text">회원가입을 환영합니다.</p>
							<p class="sub_text">
								바른컴퍼니에서 운영중인 패밀리 사이트의 <br>
								모든 서비스를 별도의 회원가입 없이 하나의 아이디로 <br>
								사용하실 수 있습니다.
							</p>
						</div>
	
					</div>
					<!-- //회원가입 컨텐츠 -->
					<div class="btn_wrap bottom">
						<a href="https://www.barunsonmcard.com/" class="btn type01 wp100">제작하러 가기</a>
					</div>

				</div>
			</section>
	 <asp:Literal ID="ltrBrandName" runat="server" ></asp:Literal>
	   <asp:Literal ID="ltrBrandUrl" runat="server"></asp:Literal>
<%--        <div class="cont_a">
	        	<div class="cont_a_in" style="padding: 40px 0 200px 0;">
	        		<div class="tit"><img src="/resources/member/txt_applycom_1.png" alt="회원가입을 환영합니다"></div>
                    <asp:Literal ID="ltrBrandName" runat="server"></asp:Literal>
	        		<!-- 하단버튼 -->

                    <asp:Literal ID="ltrBrandUrl" runat="server"></asp:Literal>
	        		<!-- / 하단버튼 -->
	        	</div>
	        </div>--%>
    
	<!-- / contents -->
<%--	<p class="b_talign_c b_mt20 b_mb20" style="color:#999;">바른컴퍼니에서 운영중인 패밀리 사이트의 모든 서비스를<br/>별도의 회원가입 없이 하나의 아이디로 사용할 수 있습니다.</p>--%>

 <%--   <div style="display: table; width: 100%; height: 120px;">
    <p class="" style="color:#999; vertical-align: middle;display: table-cell; text-align: center;">바른컴퍼니에서 운영중인 패밀리 사이트의 모든 서비스를<br>별도의 회원가입 없이 하나의 아이디로 사용할 수 있습니다.</p>
    </div>--%>

</asp:Content>
