<%@ Page Title="" Language="C#" MasterPageFile="~/Master/GShop_SiteOne.Master" AutoEventWireup="true" CodeBehind="GshopAgreement.aspx.cs" Inherits="BarunnIntergrationService.Member.GshopAgreement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    	<link rel="stylesheet" href="/Resources/css/gshop/reset.css">
	<link rel="stylesheet" href="//unpkg.com/swiper/swiper-bundle.min.css" />
	<link rel="preconnect" href="//fonts.gstatic.com">
	<link href="//fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600&display=swap" rel="stylesheet">
	<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="/Resources/css/gshop/common.css">
	<link rel="stylesheet" href="/Resources/css/gshop/register.css">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <asp:Literal ID="ltrHiddenField" runat="server"></asp:Literal>
                <div class="register_contents">
						<!-- 안내 텍스트 -->
						<div class="register_text_wrap">
							<p class="register_text">
								바른컴퍼니의 <br/>
								모든 서비스를 하나의 아이디로 <br/>
								사용하실 수 있습니다.
							</p>
						</div>
						<!-- //안내 텍스트 -->
					
					<!-- //회원가입 컨텐츠 -->
					<!-- 회원가입 하단 버튼 -->
					<div class="btn_wrap bottom">
						<a id="btnCPCLIENT2" href="javascript:;" class="btn type01 wp100">휴대폰 인증</a>
					</div>
                    </div>
					<!-- //회원가입 하단 버튼 -->
				
    <script type="text/javascript" src="/Resources/js/Member/Agreement.js?t=2"></script>
    <script src="//code.jquery.com/jquery-1.12.4.min.js"></script>
	<script src="/Resources/js/common.js"></script>
</asp:Content>
