<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Site.Master" AutoEventWireup="true" CodeBehind="UserSecessionComplete.aspx.cs" Inherits="BarunnIntergrationService.MyPage.UserSecessionComplete" %>

<asp:Content ID="cphStyleSheet" ContentPlaceHolderID="cphStyleSheet" runat="server">
    <link rel="stylesheet" type="text/css" href="/resources/css/common.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/layout_mypage.css">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
			<div class="goodbye_txt">
				<p class="tit"><img src="/resources/mypage/txt_member_leave_2.png" alt="그 동안 바른컴퍼니의 서비스를 이용해 주셔서 감사합니다"></p>
				<p>앞으로도 고객 여러분의 말씀에 귀 기울이며<br><strong>최고의 서비스를 제공하도록 노력하겠습니다</strong></p>
				<p>고객님의 회원 탈퇴가 정상적으로 처리되었습니다.<br>
				답변해 주신 내용에 대해 깊이 고민하며 더욱 발전된 서비스를 제공하기 위해<br>
				노력하는 <strong>바른컴퍼니</strong>가 되겠습니다.<br>
				감사합니다.</p>
			</div>
			<!-- / 탈퇴안내 -->
			<!-- 하단버튼 -->
			<div class="b_btn_a">
                <asp:Literal ID="ltrFamilySite" runat="server"></asp:Literal>
			</div>
			<!-- / 하단버튼 -->			
		</div>
	</div>
	<!-- / contents -->

</asp:Content>
