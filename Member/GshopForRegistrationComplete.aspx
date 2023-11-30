<%@ Page Title="" Language="C#" MasterPageFile="~/Master/GShop_SiteOne.Master" AutoEventWireup="true" CodeBehind="GshopForRegistrationComplete.aspx.cs" Inherits="BarunnIntergrationService.Member.GshopForRegistrationComplete" %>
<%@ Register TagPrefix="ucAffiliatedBanner" TagName="AffiliatedBanner" Src="~/UserControl/banner/AffiliatedBanner.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	 <style>
      body{background-color :#f1f1f1 }  
/*스텝
------------------------------------------*/
.step_a {background:url('/resources/img_inc/bg_pattern01.png') repeat left top;; padding-top: 0px;}
	.step_a_in {text-align:center;} 
	.step_a_in .tit { padding:35px 0; border-top:0px;}
	.step_a_in .tit+ul {height:1%; overflow:hidden;}
	.step_a_in ul li { width:270px; background-color:#3779d1; float:left; margin-left:1px;}
	.step_a_in ul li:first-child { margin-left:0;}
	.step_a_in ul li.on {width:287px; background-color:#2e96ff;}
    
.apcom_p {word-break:keep-all}
.apcom_p .cont_a { padding-bottom:0;}
.apcom_p .cont_a_in { background:url('/resources/member/bg_applycom.jpg') no-repeat left top; text-align:left; padding:40px 0 50px 0}
.apcom_p .cont_a .tit { margin-left:500px; margin-top:40px; font-size:28px; line-height:1.6}
.apcom_p .cont_a .txt { margin-left:500px;width:400px;font-size:18px; margin-top:46px; line-height:1.6}
.apcom_p .cont_a .b_btn_a { display:inline-block; margin-left:500px; margin-top:50px;}
.apcom_p.member_c .step_a_in .tit+ul { display:none}
	.step_a_in ul li img {width:auto;padding:8px 0 5px 0;}
    .b_btn.type2.right span {height:60px; line-height:60px; font-size:22px; background:url('/resources/img_inc/bul_arrow2_right.png') no-repeat right 50%; text-align:center;color:#fff;min-width:300px;}
	.b_btn.type2.left span {height:60px; line-height:60px; font-size:22px; background:url('/resources/img_inc/bul_arrow2_left.png') no-repeat left 50%; text-align:center; color:#fff;min-width:300px;}

.cont_a {background-color:transparent; text-align:center;padding:40px 0 50px 0;}
    	.head_a_in, .cont_a_in, .familysite_a_in, .step_a_in {width: 1100px;margin:0 auto;
    	}
        .b_btn.type2 {background-color:#2e96ff; }
            /*b, strong { font-weight: normal; color:#2e96ff !important;}*/


         </style>

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
           // window.parent.postMessage({ message: 'AuthFlag|Y' }, "*");

        });
     </script>
    <style type="text/css">
	.cont_a_in.check_all_area.step01{padding-top:0px;padding-bottom: 100px;}
    #wrap {background: #f7f8f9; height: 100vh;}
	/*#wrap {background: #f7f8f9;}*/
	#wrap .header {position: static; border-bottom: 1px solid #aaa; padding: 40px 0; background: #fff;}
	#wrap .header h1 {position: static; float: none; margin: 0 auto; text-align: center;}
	/*#wrap .header h1 a {background:url(../img/common/logo_b.svg) no-repeat center; }*/
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
	/*.step_view li p strong {color: inherit;}*/

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
    .wrap {background: #f7f8f9;height: 100vh;}
    
/** header **/
.header {position: fixed; top:0; left:0; width: 100%; background:#fff; padding:30px 0; border-bottom: 1px solid #e8e8e8; z-index: 100; transition: all 0.3s ease-in;}
.header h1 {position: absolute; left:3%;}
.header h1 a {display:inline-block;width: 201px;height:24px;background:url(/Resources/img_inc/barunsongshop.svg) no-repeat center;text-indent: -99999px;}
        html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p, blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn, em, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup, tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label, legend, table, caption, tbody, tfoot, thead, tr, th, td, article, aside, canvas, details, embed, figure, figcaption, footer, header, hgroup, menu, nav, output, ruby, section, summary, time, mark, audio, video {
            margin: 0;
            padding: 0;
            border: 0; /*font-size:100%;*/
            font-size: 14px;
            font: inherit;
            color: #333;
            font-family: 'Spoqa Han Sans Neo', "Open Sans","Spoqa Han Sans", Apple SD Gothic Neo, Nanum Barun Gothic, Nanum Gothic, "돋움", Dotum, Verdana, Arial, sans-serif;
            word-break: break-all;
            -ms-word-break: break-all;
            -webkit-text-size-adjust: none;
        }
	
	<link rel="stylesheet" href="//unpkg.com/swiper/swiper-bundle.min.css" />
	<link rel="preconnect" href="//fonts.gstatic.com">
	<link href="//fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600&display=swap" rel="stylesheet">
	<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
  </style>
    <%--	<link rel="stylesheet" href="/Resources/css/gshop/register.css">--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
						<a href="https://barunsongshop.com" class="btn type01 wp100">쇼핑하러 가기</a>
					</div>

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
	  <script>
          var html = "<div class=\"step_a\">";
          html = "	<div class=\"step_a_in\">";
          html += "		<div class=\"tit\"><img src=\"/resources/member/tit_barunnone_join_barunson.png\" alt=\"바른 ONE 회원가\"></div>";
          html += "		    <ul>";
          html += "		            <li style=\"width:33.1%;\" class=\"\"><img src=\"/resources/member/img_step1_barunson.png\" alt=\"Step1 본인인증\" style=\"padding: 10px 0px;\"></li>";
          html += "		            <li style=\"width:33.1%;\" class=\"\"><img src=\"/resources/member/img_step2_barunson.png\" alt=\"Step2 약관동의\" style=\"padding: 10px 0px;\"></li>";
          html += "		            <li style=\"width:33.1%;\" class=\"on\"><img src=\"/resources/member/img_step3_barunson.png\" alt=\"Step3 가입완료\" style=\"padding: 10px 0px;\"></li>";
          html += "			</ul>";
          html += "	</div>";
          //  html += "</div>";

          $(".step_view ol li").eq(1).addClass("on");
           $(".step_view ol li").eq(2).addClass("on");
         // $(".wrap .step_a").html(html);


         //   alert($(".wrap").html())
      </script>
</asp:Content>
