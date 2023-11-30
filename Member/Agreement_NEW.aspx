<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteOne.Master" AutoEventWireup="true" CodeBehind="Agreement_NEW.aspx.cs" Inherits="BarunnIntergrationService.Member.Agreement_NEW" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<link rel="stylesheet" type="text/css" href="/resources/css/layout_premierpaper.css">
	<style>
		.step01 h1 {
			font-weight: 700;
			color: #333;
			padding: 0 0 50px 0;
		}

		.family_area {
			overflow: hidden;
			border-top: 1px solid #ddd;
			margin: 70px 0 0 0;
			padding: 28px 0;
		}

		.b_btn:hover {
			-webkit-box-shadow: none;
			box-shadow: none;
		}

		.step01 * {
			font-family: "Pretendard";
		}

		.register_logo_box {
			border-top: 1px solid #ebebeb;
		}

			.register_logo_box h2 {
				color: #333;
				word-break: keep-all;
				line-height: 22px;
			}

				.register_logo_box h2 strong {
					font-weight: bold;
					color: #333 !important;
				}

			.register_logo_box ul {
				max-width: 680px;
				margin: 0 auto;
				display: grid;
				grid-gap: 7px;
			}

			.register_logo_box li {
				border: 1px solid #ebebeb;
				border-radius: 3px;
				background: #fff;
			}

				.register_logo_box li img {
					vertical-align: middle;
					max-width: 100%;
				}

				.register_logo_box li a {
					display: block;
					height: 100%;
				}




		@media screen and (min-width:769px) {
			.br_point {
				display: none;
			}

			.event_grid_sec li {
				width: 25%;
			}

				.event_grid_sec li img {
					width: 92%;
				}

			.are_btn_area {
				width: 383px;
				height: 68px;
				border-radius: 5px;
				background-color: #333;
				color: #fff;
				font-weight: bold;
				font-size: 20px;
				display: block;
				line-height: 68px;
				margin: 60px auto 0 auto;
			}

			.tit_img {
				width: 300px;
			}

			.register_logo_box {
				padding: 38px 0 66px;
				margin-top: 92px;
			}

				.register_logo_box h2 {
					font-size: 16px;
					line-height: 22px;
					margin-bottom: 30px;
				}

				.register_logo_box ul {
					grid-template-columns: repeat(4, 1fr);
				}

				.register_logo_box li {
					height: 50px;
					line-height: 46px;
				}
		}

		@media screen and (max-width:768px) {
			.br_point {
				display: block;
			}

			.bi_inner img {
				padding: 0;
			}

			.bi_inner ul li {
				width: 50%;
				text-align: left;
				padding: 0px 0 2px 0px;
				float: left;
			}

			.bi_tc img {
				padding: 0;
			}

			.sp_bl {
				display: block;
				padding: 0 0 3px 0;
			}

			.cont_a h3 {
				padding: 0 0 9px 0;
			}

			.tit_img {
				width: 260px;
			}

			.txt_ar {
				margin: 15px 0 20px 0;
			}

			.bi_inner img {
				padding: 0;
				width: 98%;
			}


			.event_grid_sec {
				margin: 0 20px;
			}

				.event_grid_sec li {
					width: 48%;
				}

					.event_grid_sec li:not(:nth-child(2n)) {
						margin-right: 4%;
					}

					.event_grid_sec li:not(:nth-child(-n+2)) {
						margin-top: 6%;
					}

					.event_grid_sec li img {
						width: 100%;
					}

			.register_logo_box {
				background: #fff;
				margin: 44px 20px 0;
				padding: 30px 0 0;
			}

				.register_logo_box h2 {
					font-size: 14px;
					margin-bottom: 24px;
				}

				.register_logo_box ul {
					background: #f7f8f9;
					padding: 20px 25px;
					grid-template-columns: repeat(2, 1fr);
				}

				.register_logo_box li {
					height: 42px;
					line-height: 42px;
				}


			.are_btn_area {
				width: auto;
				height: 60px;
				border-radius: 5px;
				background-color: #333;
				color: #fff;
				font-weight: 500;
				font-size: 16px;
				display: block;
				line-height: 60px;
				margin: 52px 20px 0;
				letter-spacing: -0.3px;
			}
		}

		/* 추가 css */
		.bi_inner img {
			padding: 15px 15px 0 15px;
			vertical-align: bottom;
			width: 164px;
		}

		.bi_inner ul {
			max-width: 670px;
			margin: 0 auto;
			padding: 17px 10px 5px 10px;
		}

			.bi_inner ul li {
				float: left;
				width: 25%;
				text-align: center;
			}

		.bi_tc img {
			padding: 15px 15px 0 15px;
		}

		strong {
			font-weight: bold;
		}

		h3 {
			font-weight: normal !important;
		}

		.cont_a_in.check_all_area {
			width: 940px;
			background-color: #fff;
			padding: 40px;
			border: 0px solid #ddd;
		}


		/* 추가 */
		.step_a ul {
			width: 227px;
			margin: 0 auto; /* border: 1px solid red; */
			overflow: hidden;
		}

			.step_a ul li {
				text-align: center;
				float: left;
				text-align: center;
				color: #c8c8c8;
				font-size: 19px;
				font-weight: bold;
			}

				.step_a ul li.on {
					color: #333;
				}

					.step_a ul li.on span {
						background: #333;
						color: #fff;
						border: 1px solid #333;
					}

				.step_a ul li.m-line {
					width: 40px;
					height: 0;
					border: solid 1px #c8c8c8;
					margin: 34px 20px 0 20px;
				}

				.step_a ul li span {
					width: 20px;
					height: 20px;
					display: block;
					border-radius: 20px;
					text-align: center;
					line-height: 19px;
					margin: 10px auto;
					font-weight: bold;
					color: #c8c8c8;
					border: 1px solid #c8c8c8;
				}

		.sub_bottom_txt {
			font-size: 12px;
			letter-spacing: -0.3px;
			text-align: center;
			color: #757575;
		}

		.txt_ar {
			margin: 15px 0 0 0;
			font-size: 16px;
			color: #333;
		}

		.event_grid_sec::after {
			content: "";
			display: block;
			clear: both;
		}

		.event_grid_sec li {
			float: left;
		}

			.event_grid_sec li img {
				text-align: center;
			}

		@media screen and (max-width: 650px) {
		}

		body {
			background: #fff;
		}

		.input_b .ez-checkbox {
			background-image: url(/resources/img_inc/set_check_new.png);
		}

		.cont_a {
			background: #f7f8f9;
		}

		.cont_a_in.check_all_area {
			background: none;
			border: 0;
		}

		.b_btn.type2 {
			background - color: #515151;
			width: 100%;
		}

		.cont_a_in.check_all_area.step01 {
			padding-top: 30px;
			width: 52%;
			overflow: hidden;
		}

		@media screen and (max-width: 650px) {
			.cont_a_in.check_all_area.step01 {
				width: 76%;
				font-size: 11px;
			}

			.b_btn.type3 {
				background: #eff0f1;
				padding: 0px !important;
			}

			.step01 .b_btn.type3 {
				width: 100%;
			}

			.step01 .b_btn.type2 {
				width: 100% !important;
			}
		}
		/* 모바일 CSS 추가 */
		@media screen and (max-width: 1100px) {
			.cont_a_in.check_all_area {
				width: 95%;
				background-color: #fff;
				padding: 20px 0px;
			}
		}

		@media screen and (max-width: 320px) {
			.b_btn.type2.right span {
				text-indent: 0px;
				background: none;
			}
		}

    </style>

    <asp:Literal ID="AgreementStyleSheet" runat="server"></asp:Literal>

    <link href="/resources/css/Member/Agreement.css" rel="stylesheet">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Literal ID="ltrHiddenField" runat="server"></asp:Literal>
            
	<button class="b_btn type3" type="button" id="btnCPCLIENT">
        <asp:Literal ID="LiteralCellPhone" runat="server"></asp:Literal>
    </button>
			
	<asp:Literal ID="LiteralInfomation" runat="server" Visible="false"></asp:Literal>

	<div class="step_a">
		<ul>
			<li class="on"><span>1</span>본인인증</li>
			<li class="m-line"></li>
			<li><span>2</span>정보입력</li>
		</ul>
	</div>

	<div class="cont_a">
		<div class="cont_a_in check_all_area step01">
			<h1><img src="/Resources/member/new/tit_img.png" class="tit_img"></h1>
			<div style="overflow:hidden; display:block; ">
				<ul class="event_grid_sec">
					<li>
						<img src="/Resources/member/new/5148@3x.png">
						<div class="txt_ar">
							샘플 무료배송
						</div>
					</li>
					<li>
						<img src="/Resources/member/new/5147@3x.png">
						<div class="txt_ar">
							청첩장 10% 할인 쿠폰
						</div>
					</li>

					<li>
						<img src="/Resources/member/new/5145@3x.png">
						<div class="txt_ar">
							감사장 15% 할인 쿠폰
						</div>
					</li>
					
					<li>
						<img src="/Resources/member/new/5174@3x_2.png">
						<div class="txt_ar">
							신혼·웨딩 할인쿠폰
						</div>
					</li>
                        	
						
				</ul>
			</div>

			<a href="javascript:;" class="are_btn_area" id="btnCPCLIENT2">회원 가입하고 쿠폰받기</a><br>
			(청첩장 및 감사장 할인쿠폰은 마케팅 수신 전체동의 시 적용됩니다.)

			<div class="register_logo_box">
				<div class="register_section">
					<h2>바른컴퍼니 모든 서비스를 <br class="br_point"> <strong>1개의 아이디로 편리</strong>하게 이용하실 수 있습니다.</h2>
					<ul>
						<li>
							<a href="https://www.barunsoncard.com/" target="_blank">
								<img src="https://static.barunsoncard.com/barunnfamily/logo/barunsoncard.svg" alt="바른손카드 로고" />
							</a>
						</li>
						<li>
							<a href="https://www.premierpaper.co.kr/" target="_blank">
								<img src="https://static.barunsoncard.com/barunnfamily/logo/premierpaper.svg" alt="프리미어페이퍼 로고" />
							</a>
						</li>
						<li>
							<a href="https://www.barunsonmcard.com/" target="_blank">
								<img src="https://static.barunsoncard.com/barunnfamily/logo/barunsonmcard.svg" alt="바른손M카드 로고" />
							</a>
						</li>
						<li>
							<a href="https://barunsongshop.com/" target="_blank">
								<img src="https://static.barunsoncard.com/barunnfamily/logo/barunsongshop.svg" alt="바른손Gshop 로고" />
							</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
    </div>
           
    <asp:Literal ID="LiteralEventText" runat="server"></asp:Literal>
    <input type="hidden" name="hidSelectSiteCode" id="hidSelectSiteCode" runat="server" />

    <!-- / contents -->
    <script type="text/javascript" src="/Resources/js/Member/Agreement.js?t=2"></script>
	<script>
		var DomainSite = "<%=DomainSite%>";
        if (DomainSite.toLowerCase() == "premierpaper" || DomainSite.toLowerCase() == "barunsonmall") {
            $(".b_btn_a a span").text("가입하고 쿠폰받기")
		}
        $(".wrap").eq(0).css("background", "#fff");
        $(".step_a").eq(0).remove()

    </script>
</asp:Content>
