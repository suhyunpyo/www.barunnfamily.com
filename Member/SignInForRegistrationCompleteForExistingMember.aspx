<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Site.Master" AutoEventWireup="true" CodeBehind="SignInForRegistrationCompleteForExistingMember.aspx.cs" Inherits="BarunnIntergrationService.Member.SignInForRegistrationCompleteForExistingMember" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Step -->
	<div class="step_a">
		<div class="step_a_in">
			<div class="tit"><img src="/resources/member/tit_barunnone_join.png" alt="바른 ONE 회원가입"></div>
			<ul>
                <li><img src="/resources/member/img_step1.png" alt="Step1 본인인증"></li>
				<li><img src="/resources/member/img_step2.png" alt="Step2 약관동의"></li>
				<li><img src="/resources/member/img_step3.png" alt="Step3 정보입력"></li>
				<li class="on"><img src="/resources/member/img_step4.png" alt="Step4 가입완료"></li>
			</ul>
		</div>
	</div>
	<!-- Step -->	
	<!-- contents -->
	<div class="cont_a">
		<div class="cont_a_in">
			<div class="tit">회원님은 <strong><asp:Literal ID="ltrUserID" runat="server"></asp:Literal></strong> 아이디로<br> 통합회원 가입되어 있습니다.</div>
			<p class="txt">위의 아이디로 로그인 해주시기 바랍니다.<br>
			비밀번호가 기억나지 않으시면 비밀번호 찾기를 클릭해 주세요.</p>
			<!-- 하단버튼 -->
			<div class="b_btn_a">
                <a href="javascript:;" id="btnGoLogin" class="b_btn type1" runat="server"><span>로그인하기</span></a>
                <a href="javascript:;" id="btnGoFindPassword" class="b_btn dim type1" runat="server"><span>비밀번호찾기</span></a>
			</div>
			<!-- / 하단버튼 -->

<!-- 재휴배너 -->
<script language="javascript">
    jQuery(document).ready(function () {
        $("#divaffilated").jQBanner({ 
		nWidth: 850, nHeight: 124, nCount: 4, nOrderNo: ran_weight(), isActType: "fade", nStartUp: 0, nDelay: 5000, nSpeed: 1000, isBtnType: "li" });
    });
    function ran_weight() {
        var _data = {
            "1": 34, //10% 
            "2": 33, //20% 
            "3": 33 //30% 
        };
        for (var i = 0; i < 100; i++) {
            return (probability(_data));
        }
    }
    function probability(_data) {
        var arr = [];
        for (var el in _data) {
            for (var i = 0; i < _data[el]; i++) {
                arr[arr.length] = el;
            }
        }
        
        return arr[Math.round(Math.random() * (arr.length - 1))];
    }

</script>
<div class="affiliated_join" id="divAffiliated" runat="server">
	<div id="divaffilated" class="clsBanner">
		<ul class="clsBannerButton aff_list">
			<li class='fir' overclass='labelOverClass' outclass='fir'>쿠첸</li>
			<li  overclass='labelOverClass' outclass=''>롯데면세점</li>
			<li  overclass='labelOverClass' outclass=''>소프라움</li>
			<li  overclass='labelOverClass' outclass=''>삼성전자</li>
			<li  overclass='labelOverClass' outclass=''>SK브로드밴드</li>
			<li  overclass='labelOverClass' outclass=''>라이프케어</li>
		</ul>
		<div class="clsBannerScreen aff_bnr">
			<div>
				<a href='/event/event_affiliated_cuchen.asp'>
				<img src='/resources/data/banner/member/ban_850_test1.jpg' class='goods_best_img'  width='850' height='124' />
				</a>
			</div>
			<div>
				<a href='/event/event_affiliated_lotteduty.asp'>
				<img src='/resources/data/banner/member/ban_850_test2.jpg' class='goods_best_img'  width='850' height='124' />
				</a>
			</div>
			<div>
				<a href='/event/event_affiliated_sofraum.asp'>
				<img src='/resources/data/banner/member/ban_850_test3.jpg' class='goods_best_img'  width='850' height='124' />
				</a>
			</div>
			<div>
				<a href='/event/event_affiliated_samsungs.asp'>
				<img src='/resources/data/banner/member/ban_850_test4.jpg' class='goods_best_img'  width='850' height='124' />
				</a>
			</div>
			<div>
				<a href='/event/event_affiliated_skbroadband_tv.asp'>
				<img src='/resources/data/banner/member/ban_850_test5.jpg' class='goods_best_img'  width='850' height='124' />
				</a>
			</div>
			<div>
				<a href='/event/event_affiliated_lifecare.asp'>
				<img src='/resources/data/banner/member/ban_850_test6.jpg' class='goods_best_img'  width='850' height='124' />
				</a>
			</div>
		</div>
	</div>
</div>
<!-- / 재휴배너 -->

		</div>
	</div>
	<!-- / contents -->

</asp:Content>
