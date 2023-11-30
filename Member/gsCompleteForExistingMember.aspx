<%@ Page Title="" Language="C#" MasterPageFile="~/Master/GShop_SiteOne.Master" AutoEventWireup="true" CodeBehind="gsCompleteForExistingMember.aspx.cs" Inherits="BarunnIntergrationService.Member.gsCompleteForExistingMember" %>
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
    

    <!-- 아이디/비밀번호 찾기 컨텐츠 -->
					<div class="register_contents">
						<!-- 안내 텍스트 -->
						<div class="register_text_wrap">
							<p class="find_text">
								회원님은 <span class="register_text"><asp:Literal ID="ltrUserID" runat="server"></asp:Literal></span> 아이디로 <br/>
								가입되어 있습니다.
							</p>
							<p class="sub_text">
								위의 아이디로 로그인 해주시기 바랍니다. <br/>
								비밀번호가 기억나지 않으시면 비밀번호 찾기를 클릭해 주세요.
							</p>
						</div>
						<!-- //안내 텍스트 -->
					</div>
					<!-- //아이디/비밀번호 찾기 컨텐츠 -->
					<!-- 아이디/비밀번호 찾기 하단 버튼 -->
					<div class="btn_wrap bottom">
                         <a href="javascript:;" id="btnGoLogin" class="btn type01 wp100" runat="server" target="_parent" >로그인하기</a>
                        <a href="javascript:;" id="btnGoFindPassword" class="btn type01_1 wp100 mt20" runat="server" target="_parent" >비밀번호찾기</a>

						<%--<a href="javascript:;" class="btn type01 wp100">로그인하기</a>
						<a href="javascript:;" class="btn type01_1 wp100 mt20">비밀번호 찾기</a>--%>
					</div>
					<!-- //아이디/비밀번호 찾기 하단 버튼 -->

    <script>
        $(".title_box h2").html("아이디/비밀번호 찾기");
        $(".step_view").remove();
    </script>
</asp:Content>

