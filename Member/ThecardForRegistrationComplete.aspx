<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteOne.Master" AutoEventWireup="true" CodeBehind="ThecardForRegistrationComplete.aspx.cs" Inherits="BarunnIntergrationService.Member.ThecardForRegistrationComplete" %>
<%@ Register TagPrefix="ucAffiliatedBanner" TagName="AffiliatedBanner" Src="~/UserControl/banner/AffiliatedBanner.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<%--    <input type="hidden" name="userId" id="userId" runat="server" value="" />
    <input type="hidden" name="userDinfo" id="userDinfo" runat="server" value="" />--%>

<!-- 제휴 배너 -->
<script>
    jQuery(document).ready(function () {

        //var getDocHeight = document.body.scrollHeight;
        //var chkLoginFlag = "";

        //if ($('#userId').val() != "" && $('#userDinfo').val() != "") {
        //    chkLoginFlag = "1";
        //} else {
        //    chkLoginFlag = "0";
        //}

        ////window.parent.postMessage({
        ////    message: 'iframeHeight|' + getDocHeight + ',ajaxFlag|' + chkLoginFlag +',UserId|' + $('#userId').val() + ',UserPW|' + $('#userPW').val() }, "*");

        //window.parent.postMessage({
        //    message: 'iframeHeight|' + getDocHeight + ',ajaxFlag|' + chkLoginFlag + ',UserId|' + $('#userId').val() + ',userDinfo|' + encodeURIComponent($('#userDinfo').val())
        //}, "*");


        //parent redirection
        //$("#MainForm").attr("target", "_parent");
        //$("#MainForm").attr("action", "http://www.thecard.co.kr/member/login_test_proc.asp");
        //$("#MainForm").submit();
        window.parent.postMessage({ message: 'AuthFlag|Y' }, "*");
    });
    
</script>

    <div class="cont_W">
	<div class="cont_a">
			<p><img src="/resources/member/thecard_check.jpg" alt="바른 ONE 회원가입"></p>
			<p>회원가입이 완료 되었습니다.</p>
			<p>더카드는 감동의 순간을 위해 최선을 다하겠습니다. </p>
			<p class="b_mt40">바른컴퍼니에서 운영중인 패밀리 사이트의 <span>모든 서비스를,  별도의 회원가입 없이 </span> 하나의 아이디로 사용할 수 있습니다. </p>
		
			<!-- 하단버튼 -->
            <asp:Literal ID="ltrBrandUrl" runat="server"></asp:Literal>
			<!-- / 하단버튼 -->

		
	</div>
	<!-- / contents -->
	</div>

</asp:Content>
