<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteOne.Master" AutoEventWireup="true" CodeBehind="BhandsForRegistrationComplete.aspx.cs" Inherits="BarunnIntergrationService.Member.BhandsForRegistrationComplete" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
<%--    <input type="hidden" name="userId" id="userId" runat="server" value="" />
    <input type="hidden" name="userDinfo" id="userDinfo" runat="server" value="" />--%>

<script>
    jQuery(document).ready(function () {

        //var getDocHeight = document.body.scrollHeight;
        //var chkLoginFlag = "";

        //if ($('#userId').val() != "" && $('#userDinfo').val() != "") {
        //    chkLoginFlag = "1";
        //} else {
        //    chkLoginFlag = "0";
        //}

        //window.parent.postMessage({
        //    message: 'iframeHeight|' + getDocHeight + ',ajaxFlag|' + chkLoginFlag + ',UserId|' + $('#userId').val() + ',userDinfo|' + encodeURIComponent($('#userDinfo').val())
        //}, "*");
        window.parent.postMessage({ message: 'AuthFlag|Y' }, "*");

    });

</script>
	<div class="cont_a">
		<div class="cont_a_in">
			<div style="line-height: 200%;font-size: 1em; padding:80px 0px;">
		환영합니다.<br/>
		비핸즈카드는 감동의 순간을 위해 최선을 다하겠습니다.<br/><br/>
		바른컴퍼니에서 운영중인 패밀리 사이트의<br/>
		(바른손카드/비핸즈카드/더카드/프리미어페이퍼/바른손몰)<br/>
		모든 서비스를 별도의 회원가입 없이 하나의 아이디로 사용할 수 있습니다. 
		</div>

		</div>
		<!-- 하단버튼 -->

        <asp:Literal ID="ltrBrandUrl" runat="server"></asp:Literal>
    	<!-- / 하단버튼 -->
	</div>
</asp:Content>
