<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Site.Master" AutoEventWireup="true" CodeBehind="SignInForCertification.aspx.cs" Inherits="BarunnIntergrationService.Member.SignInForCertification" %>
<%@ Register TagPrefix="ucAffiliatedBanner" TagName="AffiliatedBanner" Src="~/UserControl/banner/AffiliatedBanner.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<script type="text/javascript">
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




    $(document).ready(function () {
        $("#btnCPCLIENT").click(function () {
            executeCPClient();
        })

        $("#btnIPIN").click(function () {
            executeIPIN();
        })
    })

    
    window.name = "'Parent_window";
    var executeCPClient = function () {
        document.domain = window.location.hostname; 

        window.open('', 'popupCPClient', 'width=500, height=461, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
        $("[name=formCPClientRequest]").attr("target", "popupCPClient");
 
        $("[name=formCPClientRequest]").attr("action", "https://nice.checkplus.co.kr/CheckPlusSafeModel/service.cb");
        $("[name=formCPClientRequest]").submit();
    }

    var executeIPIN = function () {

        document.domain = window.location.hostname; 
        
        window.open('', 'popupIPIN2', 'width=450, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
        $("[name=formIPINRequest]").attr("target", "popupIPIN2");
      
        $("[name=formIPINRequest]").attr("action", "https://cert.vno.co.kr/ipin.cb");
        $("[name=formIPINRequest]").submit();
    }

</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        
	    <div class="step_a">
		    <div class="step_a_in">
			    <div class="tit"><img src="/resources/member/tit_barunnone_join.png" alt="바른 ONE 회원가입"></div>
			    <ul>
         			<li class="on"><img src="/resources/member/img_step1.png" alt="Step1 본인인증"></li>
				    <li><img src="/resources/member/img_step2.png" alt="Step2 약관동의"></li>
				    <li><img src="/resources/member/img_step3.png" alt="Step3 정보입력"></li>
				    <li><img src="/resources/member/img_step4.png" alt="Step4 가입완료"></li>
			    </ul>
		    </div>
	    </div>

        <div class="cont_a">
		    <div class="cont_a_in">
			    <div class="tit"><img src="/resources/member/txt_authentication01.png" alt="안전한 회원가입을 위한 본인인증 단계입니다. 원하시는 인증방법을 선택해주세요"></div>
			    <p class="txt">본인인증 시 제공되는 정보는 해당 인증기관에서 직접 수집하며, 인증 이외의 용도로 이용 또는 저장하지 않습니다.</p>
			    <!-- 인증버튼 -->
			    <div class="authway_a">
                    
				    <dl>
                        <a href="javascript:;" id="btnCPCLIENT" runat="server">
					    <dd><img src="/resources/member/icon_mobile.png" alt="휴대폰 아이콘"></dd>
					    <dt><strong>휴대폰</strong> 인증</dt>
					    <dd>본인인증기관을 통해 <strong>본인인증 후 가입</strong> 하실 수 있습니다</dd>					    
                        </a>
				    </dl>
                    
				    <dl>
					    <a href="javascript:;" id="btnIPIN" runat="server">
					    <dd><img src="/resources/member/icon_ipin.png" alt="아이핀 아이콘"></dd>
					    <dt><strong>아이핀</strong> 인증</dt>
					    <dd>본인인증기관을 통해<strong> 아이핀 인증 후 가입</strong> 하실 수 있습니다</dd>
					    </a>
				    </dl>
			    </div>
			    <!-- / 인증버튼 -->
			    <div class="failnoti_a">
				    <div>
					    <dl>
						    <dt>인증에 실패하셨나요?</dt>
                            <asp:Literal ID="ltrCsCenterInformation" runat="server"></asp:Literal>
					    </dl>
				    </div>
			    </div>

		    </div>
	    </div>

</asp:Content>
