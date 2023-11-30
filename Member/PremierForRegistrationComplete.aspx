<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteOne.Master" AutoEventWireup="true" CodeBehind="PremierForRegistrationComplete.aspx.cs" Inherits="BarunnIntergrationService.Member.PremierForRegistrationComplete" %>
<%@ Register TagPrefix="ucAffiliatedBanner" TagName="AffiliatedBanner" Src="~/UserControl/banner/AffiliatedBanner.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<%--    <input type="hidden" name="userId" id="userId" runat="server" value="" />
    <input type="hidden" name="userDinfo" id="userDinfo" runat="server" value="" />--%>

<style>
.pp_img_wrap img {max-width: 100%; margin: 0 auto; text-align: center;}
.pp_m {display: none;}

@media screen and (max-width:1000px){
.pp_img_wrap.pp_m {display: block;}
.pp_img_wrap.pp_pc {display: none;}
.pp_m_text {font-size: 15px !important; line-height: 22px !important;}
}
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

        //window.parent.postMessage({
        //    message: 'iframeHeight|' + getDocHeight + ',ajaxFlag|' + chkLoginFlag + ',UserId|' + $('#userId').val() + ',userDinfo|' + encodeURIComponent($('#userDinfo').val())
        //}, "*");

        var MobileYN = "<%=MobileYN%>";

        if (MobileYN == "N") {
            //alert("<%=sUserId%>");

            var _id = '';        // 로그인 - 회원아이디
            var _ag = 0;       // 로그인 - 회원의 나이
            var _mr = '';       // 로그인 - 회원의 결혼여부 ('single' , 'married' )
            var _gd = '';       // 로그인 - 회원의 성별 ('man' , 'woman')

            var _skey = '';    // 내부검색어

            var _jn = 'join';        //  회원가입( 'join'), 회원탈퇴('withdraw' )
            var _jid = "<%=sUserId%>";       //  회원가입 - 회원아이디

            var _ud1 = '';     // 사용자 정의변수 1 ( 1 ~ 10 정수값)
            var _ud2 = '';     // 사용자 정의변수 2 ( 1 ~ 10 정수값)
            var _ud3 = '';     // 사용자 정의변수 3 ( 1 ~ 10 정수값)

           /*AceCounter Log Gathering Script V.8.0.2019080601 */
            var _AceGID = (function () { var Inf = ['gtc11.acecounter.com', '8080', 'BS4A42067772530', 'AW', '0', 'NaPm,Ncisy', 'ALL', '0']; var _CI = (!_AceGID) ? [] : _AceGID.val; var _N = 0; var _T = new Image(0, 0); if (_CI.join('.').indexOf(Inf[3]) < 0) { _T.src = "https://" + Inf[0] + '/?cookie'; _CI.push(Inf); _N = _CI.length; } return { o: _N, val: _CI }; })();
            var _AceCounter = (function () { var G = _AceGID; var _sc = document.createElement('script'); var _sm = document.getElementsByTagName('script')[0]; if (G.o != 0) { var _A = G.val[G.o - 1]; var _G = (_A[0]).substr(0, _A[0].indexOf('.')); var _C = (_A[7] != '0') ? (_A[2]) : _A[3]; var _U = (_A[5]).replace(/\,/g, '_'); _sc.src = 'https:' + '//cr.acecounter.com/Web/AceCounter_' + _C + '.js?gc=' + _A[2] + '&py=' + _A[4] + '&gd=' + _G + '&gp=' + _A[1] + '&up=' + _U + '&rd=' + (new Date().getTime()); _sm.parentNode.insertBefore(_sc, _sm); return _sc.src; } })();

            /*AceCounter Log Gathering Script End */
        }
        else {
            var m_id = '';      // 로그인 - 회원아이디
            var m_ag = 0;     // 로그인 - 회원의 나이
            var m_mr = '';     // 로그인 - 회원의 결혼여부 ('single' , 'married' )
            var m_gd = '';     // 로그인 - 회원의 성별 ('man' , 'woman')

            var m_skey = '';   // 내부검색어

            var m_jn = 'join';       // 회원가입('join'), 회원탈퇴('withdraw')
            var m_jid = "<%=sUserId%>";      // 회원가입 - 회원아이디

            var m_ud1 = '';    // 사용자 정의변수 1 ( 1 ~ 10 정수값)
            var m_ud2 = '';    // 사용자 정의변수 2 ( 1 ~ 10 정수값)
            var m_ud3 = '';    // 사용자 정의변수 3 ( 1 ~ 10 정수값)

            /*<!--AceCounter Mobile WebSite Gathering Script V.8.0.2019080601 -- >*/

            var _AceGID = (function () { var Inf = ['m.premierpaper.co.kr', 'm.premierpaper.co.kr', 'AZ3A72533', 'AM', '0', 'NaPm,Ncisy', 'ALL', '0']; var _CI = (!_AceGID) ? [] : _AceGID.val; var _N = 0; if (_CI.join('.').indexOf(Inf[3]) < 0) { _CI.push(Inf); _N = _CI.length; } return { o: _N, val: _CI }; })();
            var _AceCounter = (function () { var G = _AceGID; var _sc = document.createElement('script'); var _sm = document.getElementsByTagName('script')[0]; if (G.o != 0) { var _A = G.val[G.o - 1]; var _G = (_A[0]).substr(0, _A[0].indexOf('.')); var _C = (_A[7] != '0') ? (_A[2]) : _A[3]; var _U = (_A[5]).replace(/\,/g, '_'); _sc.src = 'https:' + '//cr.acecounter.com/Mobile/AceCounter_' + _C + '.js?gc=' + _A[2] + '&py=' + _A[1] + '&up=' + _U + '&rd=' + (new Date().getTime()); _sm.parentNode.insertBefore(_sc, _sm); return _sc.src; } })();
          /*  < !--AceCounter Mobile Gathering Script End-- >*/


        }

        $(".wrap").css("display", "none");

        window.parent.postMessage({ message: 'AuthFlag|Y' }, "*");

        alert("환영합니다^^\n고객님의 소중한 날을 위해 최선을\n다하겠습니다.");

        var Url = "<%=sb%>";

       location.replace(Url);
        

    });
</script>

<!-- 제휴 배너 -->
	<!-- contents -->
	<div class="cont_a end_wrap" style="display:none">
	    <div class="step03_img" style=" text-align: center; "> 
			<div class="pp_img_wrap pp_pc">
			  <a href="https://www.premierpaper.co.kr/product/product_list_new.asp?prod_div=new"><img src="http://www.premierpaper.co.kr/resources/images/member/welcome.jpg"></a>
			</div>
			<div class="pp_img_wrap pp_m">
			  <a href="https://m.premierpaper.co.kr/mobile/card/prdt_list.asp?cardType=new&tabgubun=N"><img src="http://www.premierpaper.co.kr/resources/images/member/welcome_m.jpg"></a>
			</div>	    
		</div>

			<!-- 하단버튼 -->

            <!--<asp:Literal ID="ltrBrandUrl" runat="server"></asp:Literal>-->
			<!-- / 하단버튼 -->

	</div>

    <div style="display: table; width: 100%; height: 120px;display:none">
        <p class="pp_m_text" style="color: #333;font-size: 17px;line-height: 24px;letter-spacing: -0.5px;vertical-align: middle;display: table-cell;text-align: center;font-weight: 500; font-family: 'Noto Sans Kr', sans-serif;">바른컴퍼니에서 운영중인 패밀리 사이트의 모든 서비스를<br/>별도의 회원가입 없이 하나의 아이디로 사용할 수 있습니다.</p>
    </div>
</asp:Content>
