<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Site.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="BarunnIntergrationService.Member.Main" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">

        $(document).ready(function () {

            $(".btnSignIn").click(function () {
                $("#MainForm").submit();
            })

        })

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Literal ID="ltrInputDataForDupInfo" runat="server"></asp:Literal>

	<div class="cont_a">
		<div class="cont_a_in">
			<p class="subcopy"><img src="/resources/member/txt_welcome_01.png" alt="바른컴퍼니의 모든 서비스를 하나의 아이디로 편하게 쓰세요~"></p>

            <asp:Literal ID="ltrNewMember" runat="server">
			    <p class="tit"><img src="/resources/member/txt_welcome_02.png" alt="바른 ONE 회원가입"></p>
			    <div class="b_btn_a"><a href="javascript:;" class="b_btn type4 btnSignIn"><span>회원가입하기</span></a></div>
			    <div class="oneidinfo">
				    <p class="tit">바른 ONE 운영 안내</p>
				    <p class="txt">회원가입 신청 시 바른 ONE 회원으로 자동 가입되며<br> 바른컴퍼니의 패밀리 사이트에서 제공하는 다양한 서비스를<br> 하나의 아이디로 이용 및 구매할 수 있습니다.</p>
			    </div>
            </asp:Literal>

            <asp:Literal ID="ltrExistingMember" runat="server">
                <p class="tit"><img src="/resources/member/txt_welcome_03.png" alt="바른 ONE 통합회원"></p>
			    <div class="b_btn_a"><a href="javascript:;" class="b_btn type4 btnSignIn"><span>통합회원 전환하기</span></a></div>
			    <div class="oneidinfo">
				    <p class="tit">바른 ONE 운영 안내</p>
				    <p class="txt">통합아이디 전환 시 바른 ONE 회원으로 자동 가입되며<br> 바른컴퍼니의 패밀리 사이트에서 제공하는 다양한 서비스를<br> 하나의 아이디로 이용 및 구매할 수 있습니다.</p>
			    </div>
            </asp:Literal>

		</div>
	</div>

    <div class="familysite_a" id="divFamilySiteField" runat="server">
		<div class="familysite_a_in">
			<div class="tit">바른컴퍼니 패밀리 사이트</div>
			<div class="list_a">
				<dl>
					<dt>청첩장</dt>
					<dd><a href="http://www.barunsoncard.com/" target="_blank"><img src="/resources/img_inc/logo_barunsoncard_28.png" alt="바른손카드"></a></dd>
	<%--				<dd><a href="http://www.bhandscard.com/" target="_blank"><img src="/resources/img_inc/logo_bhands_28.png" alt="비핸즈카드"></a></dd>--%>
					<dd><a href="http://www.premierpaper.co.kr/" target="_blank"><img src="/resources/img_inc/logo_premierpaper_28.png" alt="프리미어페이퍼"></a></dd>
					<dd><a href="http://www.thecard.co.kr/" target="_blank"><img src="/resources/img_inc/logo_thecard_28.png" alt="더카드"></a></dd>
				</dl>
				<%--<dl>

					<dt>답례품&nbsp;&amp;&nbsp;기프트샵</dt>
					<dd><a href="http://www.celemo.co.kr/" target="_blank"><img src="/resources/img_inc/logo_celemo_28.png" alt="셀레모"></a></dd>
                    <dt>스마트한 결혼준비 APP</dt>
					<dd><a href="http://www.bewedding.co.kr/"><img src="/resources/img_inc/logo_bewedding_28.png" alt="비웨딩"></a></dd>
                    
				</dl>--%>
			</div>
		</div>
	</div>

</asp:Content>
