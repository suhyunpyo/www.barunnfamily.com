<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteOne.Master" AutoEventWireup="true" CodeBehind="BarunsonForRegistrationComplete.aspx.cs" Inherits="BarunnIntergrationService.Member.BarunsonForRegistrationComplete" %>
<%@ Register TagPrefix="ucAffiliatedBanner" TagName="AffiliatedBanner" Src="~/UserControl/banner/AffiliatedBanner.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>

.step_a {display: none;}

.register_complete * {font-family: "Pretendard";}
.register_complete {margin: 100px 0 60px;}
.register_complete .register_section {max-width: 720px; margin: 0 auto;}

.register_complete .register_title {text-align: center;}
.register_complete .register_title h1 {font-size: 26px; line-height: 38px; color:#333; letter-spacing: -0.52px; font-weight: 600;}
.register_complete .register_title h1 span {display: block;}
.register_complete .register_title .txt {display: none;}
.register_complete .register_title .sub_text {font-size: 16px; line-height: 28px; letter-spacing: -0.4px; color:#757575; margin-top: 10px;}

.register_contents { text-align: center;}
.register_logo_box h2 {font-size: 16px; line-height:22px; color:#333; margin-bottom: 30px; word-break: keep-all;}
.register_logo_box h2 strong {font-weight: bold; color: #333 !important;}

.register_contents .register_img_box {margin: 32px 0 58px;}
.register_contents .register_img_box img {max-width: 100%;}
.register_contents .btn_box {max-width: 610px; margin: 0 auto;}
.register_contents .btn_box::after {content: ""; display: block; clear: both;}
.register_contents .btn_box .btn {float: left; width: 48%; height: 68px; line-height: 68px; font-size: 20px; letter-spacing: -0.4px; text-align: center; box-sizing: border-box; border-radius: 5px; font-weight: 500;}
/* .register_contents .btn_box .btn.type01 {background: #fff; border:1px solid #333; color:#333;}
.register_contents .btn_box .btn.type02 {background: #333; border:1px solid #333; color:#fff;} */

.register_contents .btn_box .btn.type01 {float: none; display: inline-block; background: #fff; border:1px solid #333; color:#333;}
.register_contents .btn_box .btn.type02 {display: none; background: #333; border:1px solid #333; color:#fff;}

.register_complete .register_logo_box {background: #f7f8f9; padding: 68px 0 66px; margin-top: 92px;}
.register_complete .register_logo_box .register_section {text-align: center;}
.register_complete .register_logo_box ul {display: grid; grid-template-columns: 1fr 1fr;}
.register_complete .register_logo_box li {background: #fff;}
.register_complete .register_logo_box li img {vertical-align: middle; max-width: 100%;}
.register_complete .register_logo_box li a {display: block; height: 100%;}
.register_complete .register_logo_box li p {font-size: 14px; line-height: 16px; letter-spacing: -0.3px; color:#757575;}

@media screen and (min-width:769px){
    .br_point {display: none;}
    .register_complete .btn_box .btn:not(:last-child) {margin-right: 4%;}
    .register_complete .register_logo_box ul {border: 1px solid #ebebeb;}
    .register_complete .register_logo_box li {height: 105px; }
    .register_complete .register_logo_box li:not(:nth-child(2n)) {border-right: 1px solid #ebebeb;}
    .register_complete .register_logo_box li:not(:nth-child(-n+2)) {border-top: 1px solid #ebebeb;}
    .register_complete .register_logo_box li img {margin: 24px 0 3px;}
}
@media screen and (max-width:768px){
    
    .br_point {display: block;}

    .register_complete {margin: 60px 0 30px;}
    .register_complete .register_section {margin: 0 20px;}
    .register_complete .register_title h1 {font-size: 24px; line-height: 34px;}
    .register_complete .register_title .sub_text {font-size: 15px; line-height: 22px;}

    .register_contents .register_img_box {margin-bottom: 40px;}
    .register_contents .btn_box .btn {float: none; display: block; width: 100%; height: 60px; line-height:60px; font-size: 16px;}
    .register_contents .btn_box .btn:not(:last-child) {margin-bottom: 16px;}

    .register_complete h2 {font-size: 14px; margin-bottom: 24px;}
    .register_complete .register_logo_box {background: #fff; margin: 44px 20px 0; border-top: 1px solid #ebebeb; padding: 30px 0 0;}
    .register_complete .register_logo_box .register_section {margin: 0 auto;}
    .register_complete .register_logo_box ul {grid-gap: 7px; background: #f7f8f9; padding: 20px 25px;}
    .register_complete .register_logo_box li {height: 42px; line-height: 42px; border: 1px solid #ebebeb; border-radius: 3px;}
    
    .register_complete .register_logo_box li p {display: none;}
}

</style>

<script language='javascript'>

        var MobileYN = "<%=MobileYN%>";

        if (MobileYN == "N") {

            var _id = "";        // 로그인 - 회원아이디
            var _ag = 0;       // 로그인 - 회원의 나이
            var _mr = '';       // 로그인 - 회원의 결혼여부 ('single' , 'married' )
            var _gd = '';       // 로그인 - 회원의 성별 ('man' , 'woman')

            var _skey = '';    // 내부검색어

            var _jn = "join";        //  회원가입( 'join'), 회원탈퇴('withdraw' )
            var _jid = "<%=sUserId%>";       //  회원가입 - 회원아이디

            var _ud1 = '';     // 사용자 정의변수 1 ( 1 ~ 10 정수값)
            var _ud2 = '';     // 사용자 정의변수 2 ( 1 ~ 10 정수값)
            var _ud3 = '';     // 사용자 정의변수 3 ( 1 ~ 10 정수값)

            /*AceCounter Log Gathering Script V.8.0.2019080601*/
            var _AceGID = (function () { var Inf = ['gtc11.acecounter.com', '8080', 'BS4A42067772530', 'AW', '0', 'NaPm,Ncisy', 'ALL', '0']; var _CI = (!_AceGID) ? [] : _AceGID.val; var _N = 0; var _T = new Image(0, 0); if (_CI.join('.').indexOf(Inf[3]) < 0) { _T.src = "https://" + Inf[0] + '/?cookie'; _CI.push(Inf); _N = _CI.length; } return { o: _N, val: _CI }; })();
            var _AceCounter = (function () { var G = _AceGID; var _sc = document.createElement('script'); var _sm = document.getElementsByTagName('script')[0]; if (G.o != 0) { var _A = G.val[G.o - 1]; var _G = (_A[0]).substr(0, _A[0].indexOf('.')); var _C = (_A[7] != '0') ? (_A[2]) : _A[3]; var _U = (_A[5]).replace(/\,/g, '_'); _sc.src = 'https:' + '//cr.acecounter.com/Web/AceCounter_' + _C + '.js?gc=' + _A[2] + '&py=' + _A[4] + '&gd=' + _G + '&gp=' + _A[1] + '&up=' + _U + '&rd=' + (new Date().getTime()); _sm.parentNode.insertBefore(_sc, _sm); return _sc.src; } })();
            /* AceCounter Log Gathering Script End*/

        }
        else {

            var m_id = '';      // 로그인 - 회원아이디
            var m_ag = 0;     // 로그인 - 회원의 나이
            var m_mr = '';     // 로그인 - 회원의 결혼여부 ('single' , 'married' )
            var m_gd = '';     // 로그인 - 회원의 성별 ('man' , 'woman')

            var m_skey = '';   // 내부검색어

            var m_jn = "join";       // 회원가입('join'), 회원탈퇴('withdraw')
        var m_jid = "<%=sUserId%>";     // 회원가입 - 회원아이디

            var m_ud1 = '';    // 사용자 정의변수 1 ( 1 ~ 10 정수값)
            var m_ud2 = '';    // 사용자 정의변수 2 ( 1 ~ 10 정수값)
            var m_ud3 = '';    // 사용자 정의변수 3 ( 1 ~ 10 정수값)

            /* AceCounter Mobile WebSite Gathering Script V.8.0.2019080601*/
            var _AceGID = (function () { var Inf = ['m.barunsoncard.com', 'm.barunsoncard.com', 'AZ3A72533', 'AM', '0', 'NaPm,Ncisy', 'ALL', '0']; var _CI = (!_AceGID) ? [] : _AceGID.val; var _N = 0; if (_CI.join('.').indexOf(Inf[3]) < 0) { _CI.push(Inf); _N = _CI.length; } return { o: _N, val: _CI }; })();
            var _AceCounter = (function () { var G = _AceGID; var _sc = document.createElement('script'); var _sm = document.getElementsByTagName('script')[0]; if (G.o != 0) { var _A = G.val[G.o - 1]; var _G = (_A[0]).substr(0, _A[0].indexOf('.')); var _C = (_A[7] != '0') ? (_A[2]) : _A[3]; var _U = (_A[5]).replace(/\,/g, '_'); _sc.src = 'https:' + '//cr.acecounter.com/Mobile/AceCounter_' + _C + '.js?gc=' + _A[2] + '&py=' + _A[1] + '&up=' + _U + '&rd=' + (new Date().getTime()); _sm.parentNode.insertBefore(_sc, _sm); return _sc.src; } })();
            /* AceCounter Mobile Gathering Script End*/

        }


    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <input type="hidden" name="sendUserId" id="sendUserId" value="<%=UserId%>" />
        <input type="hidden" name="rouletteKey" id="rouletteKey" value="<%=RouletteKey != null ? RouletteKey : ""%>" />
        <input type="hidden" name="resultCode" id="resultCode" value="<%=ResultCode.HasValue ? ResultCode.Value.ToString() : ""%>" />
        <input type="hidden" name="errorMsg" id="errorMsg" value="<%=ErrorMsg != null ? ErrorMsg : ""%>" />
    <div class="register_complete">
        <div class="register_title">
            <h1>
                <span><%=sUserName%>님,</span> 
                <asp:Literal ID="ltrBrandName" runat="server"></asp:Literal> 회원가입이 <br class="br_point"> 완료되었습니다.
            </h1>
            <p class="sub_text">로그인 후 모든 서비스를 정상적으로 <br class="br_point"> 이용하실 수 있습니다.</p>
        </div>
        <div class="register_contents">
            <div class="register_section">
                <div class="register_img_box">
                    <img src="https://static.barunsoncard.com/barunnfamily/member/complete_img.png" alt="회원가입완료 이미지" />
                </div>
                <!-- 하단버튼 -->
                <asp:Literal ID="ltrBrandUrl" runat="server"></asp:Literal>
                <!-- / 하단버튼 -->
            </div>
            <div class="register_logo_box">
                <div class="register_section">
                    <h2>바른컴퍼니 모든 서비스를 <br class="br_point"> <strong>1개의 아이디로 편리</strong>하게 이용하실 수 있습니다.</h2>
                    <ul>
                        <li>
                            <a href="https://www.barunsoncard.com/" target="_blank">
                                <img src="https://static.barunsoncard.com/barunnfamily/logo/barunsoncard.svg" alt="바른손카드 로고" />
                                <p>국내 청첩장 점유율 1위 청첩장 브랜드</p>
                            </a>
                        </li>
                        <li>
                            <a href="https://www.premierpaper.co.kr/" target="_blank">
                                <img src="https://static.barunsoncard.com/barunnfamily/logo/premierpaper.svg" alt="프리미어페이퍼 로고" />
                                <p>품격을 더한 프리미엄 청첩장 브랜드</p>
                            </a>
                        </li>
                        <li>
                            <a href="https://www.barunsonmcard.com/" target="_blank">
                                <img src="https://static.barunsoncard.com/barunnfamily/logo/barunsonmcard.svg" alt="바른손M카드 로고" />
                                <p>간편하고 쉽게 전하는 특별한 초대</p>
                            </a>
                        </li>
                        <li>
                            <a href="https://barunsongshop.com/" target="_blank">
                                <img src="https://static.barunsoncard.com/barunnfamily/logo/barunsongshop.svg" alt="바른손Gshop 로고" />
                                <p>소중한 순간, 정성을 선물하는 답례품 기프트숍</p>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    
	<!-- / contents -->

    <script type="text/javascript">
        $(document).ready(function () {

            /*룰렛 이벤트 API 연동*/
            if ($("#rouletteKey").val() != "" && $("#resultCode").val() != "" && $("#errorMsg").val() != "") {

                var userid = $("#sendUserId").val();
                var roulettekey = $("#rouletteKey").val();
                var resultcode = Number($("#resultCode").val());
                var errormsg = $("#errorMsg").val();

                if (resultcode == 1) {
                    //중복 응모 여부 체크 및 응모 정보 저장
                    fnRouletteEventApply(userid, roulettekey);
                } else if (resultcode == -1) {
                    alert(errormsg + "!!\n\n고객센터에 문의바랍니다.");
                } else if (result.resultcode == -2) {
                    alert(errormsg + "!!\n\n고객센터에 문의바랍니다.");
                } else {
                    alert(errormsg + "!!\n\n고객센터에 문의바랍니다.");
                }
            }

            window.parent.postMessage({ message: 'AuthFlag|Y' }, "*");

        });

        function fnRouletteEventApply(userid, rouletteKey) {

            var paramData = JSON.stringify({
                "userId": userid,
                "partnerCode": "enmad",
                "extendData": rouletteKey
            });

            $.ajax({
                type: "POST",
                url: "CompleteForExistingMember.aspx/applyJehu",
                contentType: "application/json; charset=utf-8",
                data: paramData,
                crossDomain: false,
                dataType: "json",
                async: false,
                success: function (result) {

                    var resultData = JSON.parse(result.d);

                    if (resultData.RESULT == true) {
                        if (resultData.VALUE == "N") {
                            alert("룰렛 이벤트에 참여해 주셔서 감사합니다.\n\n룰렛 이벤트 참여 시 입력하신 휴대전화번호로 경품이 발송됩니다.");
                        } else {
                            alert("이벤트에 응모하신 내역이 있습니다.");
                        }
                    }
                },
                error: function (a, b, c) {
                    //alert("Error:" + a.status + a.statusText + b + c);
                    alert("Ajax 통신 에러!!\n\n고객센터에 문의바랍니다.");
                }
            });
        }
    </script>

</asp:Content>
