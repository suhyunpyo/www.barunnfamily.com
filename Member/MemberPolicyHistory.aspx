<%@ Page Title="" Language="C#"  AutoEventWireup="true" CodeBehind="MemberPolicyHistory.aspx.cs" Inherits="BarunnIntergrationService.Member.MemberPolicyHistory" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <meta
            name="viewport"
            content="width=device-width, initial-scale=1.0, user-scalable=no">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        
    <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
        <style>
            * {
                margin: 0;
                padding: 0;
            }
            #wrap {max-width: 800px; margin: 40px auto; }
			#wrap .policy_title::after {content: ""; display: block; clear: both;}
			#wrap h1 {float: left; font-size: 20px;}
			#wrap .policy_select {
				float: right; 
				height: 32px; 
				border:1px solid #dcdcdc; 
				background: #fff; 
				border-radius: 0; 
				padding: 0 20px 0 4px;
				color:#333;
				appearance: none;
				background: url(https://www.barunsoncard.com/resources/images/footer_arrow.png) no-repeat 97% 50%;
			}

			#wrap h3 {font-size: 14px;}

			.privacyWrap {
				padding: 24px 2%; 
				border-top:2px solid #333; 
				border-bottom: 2px solid #333; 
				font-size:12px;
				word-spacing:-1px;
				line-height:1.5em;
				margin-top: 12px;
			}
			
			.privacyWrap h3 {margin:40px 0 10px}
			.privacyWrap h3:first-child {margin:0 0 10px}
			.privacyWrap > h4 {margin:20px 0 10px}
			.privacyWrap ol {margin-left:25px}
			.privacyWrap ol li {margin-bottom:14px;list-style-type:decimal}
			.privacyWrap ul {margin-top: 10px; margin-left:18px;}
			.privacyWrap dt {color:#333;margin-top:10px}
			.privacyWrap table{border-collapse:collapse;width:99%}
			.privacyWrap table th{border:1px solid #ddd;padding:2px;text-align:center}
			.privacyWrap table td{border:1px solid #ddd;padding:2px}

			.site_logo {text-align: center; margin-top: 6%;}

			@media screen and (max-width:728px){
				#wrap {padding: 0 5.5%;}
				#wrap .policy_title h1 {float: none;}
				#wrap .policy_title .policy_select {float: none; display: block; width: 100%; margin-top: 10px;}
			
				#wrap .privacyWrap {margin-top: 20px;}

			}

        </style>        
    </head>
    <body>
	<input type="hidden" name="hidPolicyDiv" id="hidPolicyDiv" runat="server" />

	<div id="wrap">
			<div class="policy_title">
				<h1><asp:Literal ID="ltrPolicyName" runat="server"></asp:Literal></h1>

				<select name="policyseq" id="policyseq" runat="server"  class="policy_select" onchange="ChangePolicySeq(this);">
                </select>
			</div>
            <div class="privacyWrap">
                <asp:Literal ID="ltrPolicyContents" runat="server"></asp:Literal>
            </div>
			<div class="site_logo">	
				
				<img src="https://www.barunsoncard.com/resources/images/common/logo_barunson.png" id="imgLogo" runat="server" alt="로고"/>				
			</div>
        </div>

	<script>
		var ChangePolicySeq = function (obj) {

			policy_div = $("#hidPolicyDiv").val();
			seq = $(obj).find("option:selected").val();
			location.href = "/member/MemberPolicyHistory.aspx?div="+policy_div+"&policyseq="+seq;
		}
    </script>

    </body>
</html>
