<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteOne.Master" AutoEventWireup="true" CodeBehind="Agreement.aspx.cs" Inherits="BarunnIntergrationService.Member.Agreement" ClientIDMode="Static" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <asp:Literal ID="AgreementStyleSheet" runat="server"></asp:Literal>

	<%if (string.Equals(DomainSite.ToLower(), "premierpaper")){ %>
		<style type="text/css">

			
				/* 추가 css */
			.bi_inner img {padding:15px 15px 0 15px; vertical-align: bottom;}
			.bi_inner ul {max-width: 670px; margin: 0 auto; padding: 17px 10px 5px 10px;}
			.bi_inner ul li {float:left; width:25%; text-align:center;}
			.bi_tc img { padding: 15px 15px 0 15px;}
			strong {font-weight:bold;}
			h3 {font-weight:normal !important;}
			@media screen and (max-width: 650px){
				.bi_inner img{padding:0;}
				.bi_inner ul li {width: 45%;text-align: left;display: inline-block;padding: 10px 0 5px 0px; float:none;}
				.bi_tc img { padding: 0;}
				.sp_bl {display:block; padding:0 0 3px 0;}
				.cont_a h3 {padding: 0 0 9px 0;}
			}

            /* 추가 */

			.step01 h1 {font-weight: 700;color: #333; padding: 0 0 50px 0;}
			.family_area {overflow: hidden; border: 1px solid #ddd; margin: 20px 0; padding: 28px 0;}
			.bi_inner img {padding:15px 15px 0 15px;}
			.b_btn:hover { -webkit-box-shadow: none; box-shadow: none;}
            
			.step_a ul {width: 226px;margin: 0 auto;/* border: 1px solid red; */overflow: hidden;}
			.step_a ul li {text-align:center;float: left;text-align: center; color: #c8c8c8; font-size:19px; font-weight:bold;}
			.step_a ul li.on {color: #c3967c;}
			.step_a ul li.on span {background:#c3967c; color:#fff; border:1px solid #c3967c;}
			.step_a ul li.m-line { width: 40px; height: 0; border: solid 1px #c8c8c8; margin: 34px 20px 0 20px;}
			.step_a ul li span{width: 20px;height: 20px; display: block; border-radius: 20px; text-align: center; line-height: 20px; margin: 10px auto; font-weight: bold;color: #c8c8c8;border: 1px solid #c8c8c8;}
   
				body {background: #fff;border-top:5px solid #c3967c;} 
			.input_b .ez-checkbox {background-image: url(/resources/img_inc/set_check_new.png);} 
			.cont_a {background:#f7f8f9;}
			.cont_a_in.check_all_area {background:none; border:0;}
			.b_btn.type2 { background-color: #515151; width: 100%;}
			.cont_a_in.check_all_area.step01 {padding-top: 30px; width: 52%;overflow: hidden;}
			@media screen and (max-width: 650px) { 
			.cont_a_in.check_all_area.step01 { width: 76%; }
			.b_btn.type3 {background:#eff0f1;padding: 0px !important;}
			.step01 .b_btn.type3 {width:100%;}
			.step01 .b_btn.type2 {width:100%; !important}


		}
	
		</style>
	<%} %>

	<%if (string.Equals(DomainSite.ToLower(), "barunsonmall")){ %>
		<style type="text/css">

			
				/* 추가 css */
			.bi_inner img {padding:15px 15px 0 15px; vertical-align: bottom;}
			.bi_inner ul {max-width: 670px; margin: 0 auto; padding: 17px 10px 5px 10px;}
			.bi_inner ul li {float:left; width:25%; text-align:center;}
			.bi_tc img { padding: 15px 15px 0 15px;}
			strong {font-weight:bold;}
			h3 {font-weight:normal !important;}
			@media screen and (max-width: 650px){
				.bi_inner img{padding:0;}
				.bi_inner ul li {width: 45%;text-align: left;display: inline-block;padding: 10px 0 5px 0px; float:none;}
				.bi_tc img { padding: 0;}
				.sp_bl {display:block; padding:0 0 3px 0;}
				.cont_a h3 {padding: 0 0 9px 0;}
			}

            /* 추가 */

			.step01 h1 {font-weight: 700;color: #333; padding: 0 0 50px 0;}
			.family_area {overflow: hidden; border: 1px solid #ddd; margin: 20px 0; padding: 28px 0;}
			.bi_inner img {padding:15px 15px 0 15px;}
			.b_btn:hover { -webkit-box-shadow: none; box-shadow: none;}
            
			.step_a ul {width: 226px;margin: 0 auto;/* border: 1px solid red; */overflow: hidden;}
			.step_a ul li {text-align:center;float: left;text-align: center; color: #c8c8c8; font-size:19px; font-weight:bold;}
			.step_a ul li.on {color: #3e84d9;}
			 .step_a ul li.on span {background:#3e84d9; color:#fff; border:1px solid #3e84d9;}
			.step_a ul li.m-line { width: 40px; height: 0; border: solid 1px #c8c8c8; margin: 34px 20px 0 20px;}
			.step_a ul li span{width: 20px;height: 20px; display: block; border-radius: 20px; text-align: center; line-height: 20px; margin: 10px auto; font-weight: bold;color: #c8c8c8;border: 1px solid #c8c8c8;}
   
				body {background: #fff;border-top:5px solid #3e84d9;} 
			.input_b .ez-checkbox {background-image: url(/resources/img_inc/set_check_new.png);} 
			.cont_a {background:#f7f8f9;}
			.cont_a_in.check_all_area {background:none; border:0;}
			.b_btn.type2 { background-color: #515151; width: 100%;}
			.cont_a_in.check_all_area.step01 {padding-top: 30px; width: 52%;overflow: hidden;}
			@media screen and (max-width: 650px) { 
			.cont_a_in.check_all_area.step01 { width: 76%; }
			.b_btn.type3 {background:#eff0f1;padding: 0px !important;}
			.step01 .b_btn.type3 {width:100%;}
			.step01 .b_btn.type2 {width:100%; !important}

			.b_btn.type2{background-color:#000}
		}
	
		</style>
	<%} %>

    <link href="/resources/css/Member/Agreement.css" rel="stylesheet">

	

	<%--20210419 표수현 - 바른손카드 Css 분기 처리 Start--%>
    <%if (string.Equals(DomainSite.ToLower(), "barunsonmcard")){ %>
	<style type="text/css">
	.cont_a_in.check_all_area.step01{padding-top:0px;padding-bottom: 100px;}
	#wrap {background: #f7f8f9;height: 100vh;}
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
	.register {max-width: 1100px; margin: 0 auto;/* padding:60px 0 30px;*/ transition: all 0.3s ease-in;}
	.register_box {background: #fff; border:1px solid #ebebeb; padding:54px 3.5%;}
	/*.register*/ .step_view li {margin-right: 114px;}
	.register .step_view li:last-child{margin-right: 0;}
	.register .step_view li p {font-size: 15px;}

	.register_text_wrap {text-align: center; margin:90px 0 80px;}
	.register_text_wrap .register_text {font-size: 22px; line-height: 34px; color: #708bff;}
	.register_text_wrap .sub_text {font-size:16px; line-height: 24px; color:#757575; font-weight: 300; letter-spacing: -0; margin-top: 20px;}

	.register .btn_wrap.bottom {max-width: 400px; text-align: center; margin:0 auto;}
	.register .btn_wrap.bottom .btn {font-size: 18px; height: 66px;}

	.register input[type="text"],
	.register input[type="password"] {display:block; height:64px; color:#333; padding-left: 28px; width:calc(100% - 32px);}
	.register input[type="text"] {margin-bottom: -1px;}
	.register input[type="text"]::placeholder {color:#aaa;}

	/* IE */
	.register input[type="text"]:-ms-input-placeholder {color:#aaa;}

	
	@media screen and (max-width:1200px){
		#wrap {background: #fff;}
		#wrap .header {padding:20px 0;}
		.register_box {padding:0 3%; border: 0;}
	}
	@media screen and (max-width:475px){
		.register .step_view li {margin-right: 60px;}
		.register_text_wrap .register_text,
		.find_text {font-size: 20px; line-height: 30px;}
	}
	@media screen and (max-width:320px){
		.register .step_view li {margin-right: 40px;}
	}
	@media screen and  (min-width:280px) and (max-width:320px){
		.register_text_wrap .sub_text {font-size: 13px; letter-spacing: -1px;}
	}

	</style>
	<%} %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Literal ID="ltrHiddenField" runat="server"></asp:Literal>

    <div class="cont_a">
        <div class="cont_a_in check_all_area step01">
			
			<%if (string.Equals(DomainSite.ToLower(), "premierpaper") || string.Equals(DomainSite.ToLower(), "barunsonmall")){ %>
			<h1>회원 가입하고 쿠폰 받으세요</h1>
			<%} %>
            
			<button class="b_btn type3" type="button" id="btnCPCLIENT">
                <asp:Literal ID="LiteralCellPhone" runat="server"></asp:Literal>
            </button>
			
			<asp:Literal ID="LiteralInfomation" runat="server"></asp:Literal>

			<%--20210419 표수현 - 바른손카드 분기 처리 Start--%>
              <%if (string.Equals(DomainSite.ToLower(), "barunsonmcard")){ %>
			<%--<%Response.Write(Session["JOIN_STEP"].ToString()); %>--%>

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
								<li class="<%= Session["JOIN_STEP"].ToString() == "1" ? "on" : "" %>">
									<span>1</span>
									<p><strong>본인인증</strong></p>
								</li>
								<li class="<%= Session["JOIN_STEP"].ToString() == "2" ? "on" : "" %>">
									<span>2</span>
									<p><strong>정보입력</strong></p>
								</li>
								<li class="<%= Session["JOIN_STEP"].ToString() == "3" ? "on" : "" %>">
									<span>3</span>
									<p><strong>가입완료</strong></p>
								</li>
							</ol>
						</div>
						<!-- //회원가입 단계 -->
					</div>
					<!-- 회원가입 컨텐츠 -->
					<div class="register_contents">
						<!-- 안내 텍스트 -->
						<div class="register_text_wrap">
							<p class="register_text">
								바른컴퍼니의 <br>
								모든 서비스를 하나의 아이디로 <br>
								사용하실 수 있습니다.
							</p>
						</div>
						<!-- //안내 텍스트 -->
					</div>
					<!-- //회원가입 컨텐츠 -->
					<!-- 회원가입 하단 버튼 -->
					<div class="btn_wrap bottom"  id="FooterButtonArea">
						<a id="btnCPCLIENT2" href="javascript:;" class="btn type01 wp100">휴대폰 인증</a>
					</div>
					<!-- //회원가입 하단 버튼 -->
				</div>
			</section>

              <%} else { %>
                <div class="b_btn_a" id="FooterButtonArea" style="margin-top:0px;">
                    <a href="javascript:;" class="b_btn type2 btnNextStep right" id="btnCPCLIENT2"><span>휴대폰 인증하기</span></a>
                </div>
              <%} %>
           <%-- 20210419 표수현 - 바른손카드 분기 처리 End--%>
            



            <asp:Literal ID="LiteralEventText" runat="server"></asp:Literal>
            <input type="hidden" name="hidSelectSiteCode" id="hidSelectSiteCode" runat="server" />

        </div>
    </div>
    <!-- / contents -->
    <script type="text/javascript" src="/Resources/js/Member/Agreement.js?t=2"></script>
	<script>
		var DomainSite = "<%=DomainSite%>";
        if (DomainSite.toLowerCase() == "premierpaper" || DomainSite.toLowerCase() == "barunsonmall") {
            $(".b_btn_a a span").text("가입하고 쿠폰받기")
        }
        /*premierpaper*/
    </script>
</asp:Content>