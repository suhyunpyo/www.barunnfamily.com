<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteOne.Master" AutoEventWireup="true" CodeBehind="BhandsCompleteForExistingMember.aspx.cs" Inherits="BarunnIntergrationService.Member.BhandsCompleteForExistingMember" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  <div class="cont_a">
    <div class="cont_a_in">
      <div style="line-height: 200%;font-size: 1em; padding:80px 0px;"> 회원님은 <strong style="color:#de5456;font-weight:bold"><asp:Literal ID="ltrUserID" runat="server"></asp:Literal></strong> 아이디로<br/>
        가입되어있습니다.<br/>
        <br/>
        위의 아이디로 로그인 해주시기 바랍니다.<br/>
        비밀번호가 기억나지 않으시면 비밀번호 찾기를 클릭해 주세요. </div>
    </div>
    <!-- 하단버튼 -->
    <div class="b_btn_a"> 
        <a href="javascript:;" id="btnGoLogin" class="b_btn type2" runat="server" target="_parent" ><span>로그인하기</span></a>
        <a href="javascript:;" id="btnGoFindPassword" class="b_btn dim type2" runat="server" target="_parent" ><span>비밀번호찾기</span></a>
    <!-- / 하단버튼 --> 
     </div>
  
  </div>
	<!-- / contents -->

</asp:Content>
