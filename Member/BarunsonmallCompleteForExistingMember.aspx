<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteOne.Master" AutoEventWireup="true" CodeBehind="BarunsonmallCompleteForExistingMember.aspx.cs" Inherits="BarunnIntergrationService.Member.BarunsonmallCompleteForExistingMember" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
.cont_txt span {padding: 20px 0 20px 0 ;}
.cont_txt .id_txt{ font-size:20px;}
.btn { margin: 30px;}
</style>

    
		<style type="text/css">
		body {background: #fff; border-top:5px solid #3e84d9} 
        .step01 h1 {font-weight: 700;color: #333; padding: 0 0 50px 0;}
        .family_area {overflow: hidden; border: 1px solid #ddd; margin: 20px 0; padding: 28px 0;}
        .bi_inner img {padding:15px 15px 0 15px;}
        .b_btn:hover { -webkit-box-shadow: none; box-shadow: none;}
		.head_a_in, .cont_a_in, .familysite_a_in, .step_a_in { width: 900px; margin: 0 auto;}
		.cont_a { background-color: #ffffff; text-align: center;}
		.b_dtable_1 {padding:0 15px 0 0;}
		.b_btn_a {margin:0;}
		.agreement_wrap .term_s .term_b {padding:0;}
		.agreeall_a .input_b {margin:0;}
		.term_s {margin: 4px;}
		.agreement_wrap .term_s .term_b > h2 span {font-size: 1em; color: #b1b1b1;}
		.agreement_wrap .term_s .term_b .txt_a {font-size: 12px; height: 60px;margin: 0px; height: 516px; border:0; background:none;}
		.agreement_wrap .term_s .term_b .input_b {margin:10px 0;}
		@media screen and (max-width: 700px){ 
		.layerPop { width: 350px; height: 600px; background: #fff; display: none; z-index: 100; position: fixed; left: 50%; top: 50%; transform: translate(-63%, -50%) !important; margin: auto;}
			body {overflow-x:hidden;}
		}
		
		.step_a ul {width: 226px;margin: 0 auto;/* border: 1px solid red; */overflow: hidden;}
        .step_a ul li {text-align:center;float: left;text-align: center; color: #c8c8c8; font-size:19px; font-weight:bold;}
        .step_a ul li.on {color: #c3967c;}
        .step_a ul li.on span {background:#c3967c; color:#fff; border:1px solid #c3967c;}
		.step_a ul li.m-line { width: 40px; height: 0; border: solid 1px #c3967c; margin: 34px 20px 0 20px;}
        .step_a ul li span{width: 20px;height: 20px; display: block; border-radius: 20px; text-align: center; line-height: 20px; margin: 10px auto; font-weight: bold;color: #c8c8c8;border: 1px solid #c8c8c8;}
		
		.are_wrap h3 { font-size: 15px; font-weight: 500; padding: 21px; border-bottom: 1px solid #ddd;}
		.layerPop {width:350px; height:600px; background:#fff; display:none; z-index:100; position:fixed;left:50%; top:50%; transform: translate(-50%, -50%); margin:auto;}
		.layerPop  .close{position: absolute; right: 20px;}
		#deemed {width:100%; height:100%; position:fixed; top:0; left:0; filter:Alpha(opacity=50);opacity:0.5; background:#000; z-index:1;}

		
		</style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="cont_a">
	    <div class="cont_txt"style=" text-align: center; "> 
        <span class="id_txt">회원님의 아이디는 <span style="color:#0b3f6e"><strong><asp:Literal ID="ltrUserID" runat="server"></asp:Literal></strong></span> 아이디로 가입되어 있습니다.<br> 위의 아이디로 로그인 해주시기 바랍니다.</span>
        <br/><br />
        <span>비밀번호가 기억나지 않으시면 비밀번호 찾기를 클릭해 주세요.</span>
        </div>

		<!-- 하단버튼 -->
		<div class="b_btn_a" style="margin-left:0; margin-bottom:25px !important;">
            <a href="javascript:;" id="btnGoLogin" class="b_btn type2 dim left" runat="server" target="_parent" ><span>로그인하기</span></a>
            <a href="javascript:;" id="btnGoFindPassword" class="b_btn type2 right_Page02" runat="server" target="_parent" ><span>비밀번호찾기</span></a>
		</div>
		<!-- / 하단버튼 -->

	</div>


	<!-- / contents -->

	<script>
		$(".step_a").html("").css("height", "67px");
    </script>

</asp:Content>
