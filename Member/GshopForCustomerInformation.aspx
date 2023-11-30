<%@ Page Title="" Language="C#" MasterPageFile="~/Master/GShop_SiteOne.Master" AutoEventWireup="true" CodeBehind="GshopForCustomerInformation.aspx.cs" Inherits="BarunnIntergrationService.Member.GshopForCustomerInformation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <script type="text/javascript" src="/resources/js/common_ux.js"></script><!--  publish JS 정의 -->
    <link href="/resources/css/jquery-ui-1.10.1.css" rel="stylesheet">
    <link href="/resources/css/melon.datepicker.css" rel="stylesheet">
    <link href="/resources/css/Member/BarunsonForCustomerInformation.css" rel="stylesheet">
    
    <script src="/resources/js/jquery-ui-1.10.1.min.js"></script>

    
    <script type="text/javascript" src="/resources/js/jquery.postcode.js"></script>
    <script type="text/javascript" src="/Resources/js/Member/BarunsonForCustomerInformation.js"></script>
	<style type="text/css">
	/*.cont_a_in.check_all_area.step01{padding-top:0px;padding-bottom: 100px;}
	#wrap {background: #f7f8f9;}
	#wrap .header {position: static; border-bottom: 1px solid #aaa; padding: 40px 0; background: #fff;}
	#wrap .header h1 {position: static; float: none; margin: 0 auto; text-align: center;}
	#wrap .header h1 a {background:url(../img/common/logo_b.svg) no-repeat center; }
	.wp100{width:100%}
	.btn_wrap .btn{display:inline-block;padding:24px 0;box-sizing: border-box;text-align: center;}
	.btn_wrap .btn.type01 {background: #7988f8; color:#fff;  border:1px solid #7988f8;}*/
	/** top title **/
    
/***** 회원가입 *****/
#wrap {background: #f7f8f9; height: 100vh;}
#wrap .header {position: static; border-bottom: 1px solid #aaa; padding: 40px 0; background: #fff;}
#wrap .header h1 {position: static; float: none; margin: 0 auto; text-align: center;}
#wrap .header h1 a {background:url(/Resources/img_inc/barunsongshop.svg) no-repeat center; }
.header h1 a {display:inline-block;width: 201px;height:24px;background:url(../img/common/logo_b.svg) no-repeat center;text-indent: -99999px;}
	.title_box {text-align: center;}
	.register h2 {font-size:30px; line-height: 30px; color:#333; font-weight: bold; margin-bottom: 60px;}

	
	/* 단계 */
	.step_view {margin-bottom: 70px;}
	.step_view ol {position: relative; display: inline-block; z-index: 1;}
	.step_view ol::after {content:""; position: absolute; width: 90%; height: 1px; top:14px; right: 50%; transform: translateX(50%); background: #ccc; z-index: -1;}
	.step_view li {display: inline-block; margin-right: 60px;}
	.step_view li:last-child {margin-right: 0;}
	.step_view li span {display: inline-block; width: 28px; height: 28px; line-height: 28px; background: #ccc; border-radius: 50%; font-size: 12px; font-weight: bold; color: #fff;}
	.step_view li p {font-size: 14px; color: #ccc; margin-top: 10px; font-weight: 500;}
	.step_view li p strong {color: inherit;}

	.step_view li.on span {background: #98A3F4;}
	.step_view li.on p {color: #333;}

	/** register contents **/
	.register {max-width: 1200px; margin: 0 auto; padding:60px 0 30px; transition: all 0.3s ease-in;}
	.register_box {background: #fff; border:1px solid #ebebeb; padding:54px 3.5%;}

	.step_view li {margin-right: 114px;}
	.register .step_view li:last-child{margin-right: 0;}
	.register .step_view li p {font-size: 15px;}
/*
	.register_text_wrap {text-align: center; margin:90px 0 80px;}
	.register_text_wrap .register_text {font-size: 22px; line-height: 34px; color: #708bff;}
	.register_text_wrap .sub_text {font-size:16px; line-height: 24px; color:#757575; font-weight: 300; letter-spacing: -0; margin-top: 20px;}*/

	/*.register*/ /*.step_view li {margin-right: 114px;}
	.register .step_view li:last-child{margin-right: 0;}
	.register .step_view li p {font-size: 15px;}

	.register_text_wrap {text-align: center; margin:90px 0 80px;}
	.register_text_wrap .register_text {font-size: 22px; line-height: 34px; color: #708bff;}
	.register_text_wrap .sub_text {font-size:16px; line-height: 24px; color:#757575; font-weight: 300; letter-spacing: -0; margin-top: 20px;}

	.register .btn_wrap.bottom {max-width: 400px; text-align: center; margin:0 auto;}
	.register .btn_wrap.bottom .btn {font-size: 18px; height: 66px;}

	.register input[type="text"],
	.register input[type="password"] {display:block; height:64px; color:#333; padding-left: 28px; width:calc(100% - 32px);}
	.register input[type="text"] {margin-bottom: -1px;}
	.register input[type="text"]::placeholder {color:#aaa;}*/

	/* IE */
	.register input[type="text"]:-ms-input-placeholder {color:#aaa;}


	</style>

            <%--	<link rel="stylesheet" href="/Resources/css/gshop/reset.css">--%>
	<link rel="stylesheet" href="//unpkg.com/swiper/swiper-bundle.min.css" />
	<link rel="preconnect" href="//fonts.gstatic.com">
	<link href="//fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600&display=swap" rel="stylesheet">
	<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css' rel='stylesheet' type='text/css'>
	<%--<link rel="stylesheet" href="/Resources/css/gshop/common.css">--%>
<%--	<link rel="stylesheet" href="/Resources/css/gshop/register.css">--%>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <input type="hidden" name="hidCertID" id="hidCertID" runat="server" />
    <input type="hidden" name="hidDupInfo" id="hidDupInfo" runat="server" />
    <input type="hidden" name="hidConnInfo" id="hidConnInfo" runat="server" />
    <input type="hidden" name="hidAuthType" id="hidAuthType" runat="server" />
    <input type="hidden" name="hidAuthModuleType" id="hidAuthModuleType" runat="server" />
    <input type="hidden" name="hidGender" id="hidGender" runat="server" />
    <input type="hidden" name="hidNationalInfo" id="hidNationalInfo" runat="server" />
    <input type="hidden" name="hidBirthDate" id="hidBirthDate" runat="server" />
    <input type="hidden" name="hidSelectSiteCode" id="hidSelectSiteCode" runat="server" />
    <input type="hidden" name="hidRegistrationNumber" id="hidRegistrationNumber" runat="server" />
    <input type="hidden" name="hidRefererSite" id="hidRefererSite" runat="server" />
    <script>
        var hidRefererSite_ = $("#hidRefererSite").val();
		$(document).ready(function () {

            if (hidRefererSite_ == "바른손몰") {
                $('#bt_info_').show();
            }
            $(".step_view ol li").eq(1).addClass("on");


        });
    </script>

					<!-- 회원가입 컨텐츠 -->
					<div class="register_contents">
						<!-- 기본 정보입력 -->
		<div class="cont_a_in">
			<h3 class="b_talign_l b_mt40" style="padding-left:10px;">기본정보</h3>
			<!-- table -->
			<div class="b_dtable_1 information_wrap">
				<dl id="dlName" runat="server" >
					<dt class="mark"><p>이 름</p></dt>
					<dd>
						<%--<input name="txtUserName" id="txtUserName"  runat="server" style="width:270px;" placeholder="휴대폰 인증 시 자동입력됩니다" maxlength="25" readonly="readonly" />--%>
                         <input type="hidden" name="txtUserName" id="txtUserName" runat="server" style="width:270px;" placeholder="휴대폰 인증 시 자동입력됩니다" maxlength="25" readonly="readonly" />
                        <asp:Literal ID="ltrUserName" runat="server"></asp:Literal>
					</dd>
				</dl>
				<dl id="dlBirthDate" runat="server" >
				  <dt class="mark">
					<p>생년월일</p>
				  </dt>
				  <dd>
                    <div class="b_sel_line" style="width:120px;">
                        <select id="selBirthDateForYear" runat="server" style="width:120px;"></select>
                    </div><label for="select_big1_1">년</label>
                    <div class="b_sel_line" style="width:120px;">
                        <select id="selBirthDateForMonth" runat="server" style="width:120px;"></select>
                    </div><label for="select_big1_1">월</label>
                    <div class="b_sel_line" style="width:120px;">
                        <select id="selBirthDateForDay" runat="server" style="width:120px;"></select>
                    </div><label for="select_big1_1">일</label>
                    <div class="input_b size_sm type2">
					  <div class="ez-radio ez-selected">
						<input value="Y" name="rdoSolarOrLunar" runat="server" type="radio" id="rdoSolar" checked class="ez-hide">
					  </div>
					  <label for="rdoSolar">양력</label>
					</div>
					<div class="input_b size_sm type2">
					  <div class="ez-radio">
						<input value="N" name="rdoSolarOrLunar" runat="server" type="radio" id="rdoLunar" class="ez-hide">
					  </div>
					  <label for="rdoLunar">음력</label>
					</div>
				  </dd>

				</dl>
				<dl id="dlUserId" runat="server">
					<dt class="mark"><p>아이디</p></dt>
					<dd>
						<input name="txtID" type="text" id="txtID" runat="server" style="width:340px;" title="아이디를 넣어주세요" placeholder="공백 없는 영문, 숫자 포함 6~16자" class="jtxtoff"><span class="noti"></span>
                        <asp:Literal ID="ltrID" runat="server"></asp:Literal>
					</dd>
				</dl>
				<dl id="dlPassword" runat="server">
					<dt class="mark"><p>비밀번호</p></dt>
					<dd><input name="txtPassword" type="password" id="txtPassword" runat="server" style="width:340px; " title="비밀번호를 넣어주세요" placeholder="영문으로 시작하는 6~16자의 영문+숫자 조합" maxlength="16" class="jtxtoff"></dd>
				</dl>
				<dl id="dlPasswordConfirm" runat="server">
					<dt class="mark"><p>비밀번호 확인</p></dt>
					<dd><input name="txtPasswordConfirm" type="password" id="txtPasswordConfirm" runat="server" style="width:340px;" title="비밀번호를 한번 더 넣어주세요" placeholder="한번 더 넣어주세요" maxlength="16"><span class="noti"></span></dd>
				</dl>
				<dl id="dlAddress" runat="server">
					<dt class="mark"><p>주 소</p></dt>
					<dd>
						<div>
							<input name="txtZipCode1" type="text" id="txtZipCode1" runat="server" class="b_talign_c post-postcode1" style="width:20px;" maxlength="1" title="우편번호" readonly="readonly">
							<input name="txtZipCode2" type="text" id="txtZipCode2" runat="server" class="b_talign_c post-postcode2" style="width:20px;" maxlength="1" title="우편번호" readonly="readonly">
							<input name="txtZipCode3" type="text" id="txtZipCode3" runat="server" class="b_talign_c post-postcode3" style="width:20px;" maxlength="1" title="우편번호" readonly="readonly">
							<input name="txtZipCode4" type="text" id="txtZipCode4" runat="server" class="b_talign_c post-postcode4" style="width:20px;" maxlength="1" title="우편번호" readonly="readonly">
							<input name="txtZipCode5" type="text" id="txtZipCode5" runat="server" class="b_talign_c post-postcode5" style="width:20px;" maxlength="1" title="우편번호" readonly="readonly">
							<button class="b_btn type3 post-submit" postcode-index="0" postcode-type="zonecode" postcode-input-cnt="5"><span>우편번호 검색</span></button>
						</div>
						<div id="wrapPostCode" style="display:none;border:1px solid;width:340px;height:300px;margin:5px 0;position:relative">
							<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
						</div>
						<input name="txtAddress" type="text" id="txtAddress" runat="server" class="post-address" title="주소를 넣어주세요" placeholder="동,면,읍 이상" readonly="readonly" style="width:340px;">
						<br>
						<input name="txtAddressDetail" type="text" id="txtAddressDetail" runat="server" title="나머지 주소를 넣어주세요" placeholder="나머지 주소(직접입력)" maxlenth="50" style="width:340px;">
					</dd>
				</dl>
				<dl id="dlPhone" runat="server">
				  <dt>
					<p>전화번호</p>
				  </dt>
				  <dd>
					<div class="b_sel_line" style="width:120px;">
                        <select name="txtPhone1" id="txtPhone1" runat="server" title="국번을 넣어주세요" style="width:120px;">
                            <option value="02">02</option>
                            <option value="031">031</option>
                            <option value="032">032</option>
                            <option value="033">033</option>
                            <option value="041">041</option>
                            <option value="042">042</option>
                            <option value="043">043</option>
                            <option value="044">044</option>
                            <option value="051">051</option>
                            <option value="052">052</option>
                            <option value="053">053</option>
                            <option value="054">054</option>
                            <option value="055">055</option>
                            <option value="061">061</option>
                            <option value="062">062</option>
                            <option value="063">063</option>
                            <option value="064">064</option>
                            <option value="070">070</option>
                            <option value="080">080</option>
                            <option value="0130">0130</option>
                            <option value="0502">0502</option>
                            <option value="0504">0504</option>
                            <option value="0505">0505</option>
                            <option value="0506">0506</option>
                            <option value="0507">0507</option>
                        </select>
                    </div>&nbsp;&nbsp;-&nbsp;&nbsp;
					<input name="txtPhone2" type="text" id="txtPhone2" runat="server" class="b_talign_c" style="width:120px;" title="전화번호 중간자리" maxlength="4">
					&nbsp;&nbsp;-&nbsp;&nbsp;
					<input name="txtPhone3" type="text" id="txtPhone3" runat="server" class="b_talign_c" style="width:120px;" title="전화번호 끝자리" maxlength="4">
				  </dd>
				</dl>
				<dl id="dlHphone" runat="server">
				  <dt class="mark">
					<p>휴대폰번호</p>
				  </dt>
				  <dd>
					<div class="b_sel_line" style="width:120px;">
                            <select name="txtHPhone1" id="txtHPhone1" runat="server" title="국번을 넣어주세요" style="width:120px;" disabled>
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="017">017</option>
                                <option value="018">018</option>
                                <option value="019">019</option>
                            </select>
                        </div>&nbsp;&nbsp;-&nbsp;&nbsp;
					<input name="txtHPhone2" type="text" id="txtHPhone2" runat="server" class="b_talign_c" style="width:120px;" title="핸드폰 번호 중간자리" maxlength="4" readonly>
					&nbsp;&nbsp;-&nbsp;&nbsp;
					<input name="txtHPhone3" type="text" id="txtHPhone3" runat="server" class="b_talign_c" style="width:120px;" title="핸드폰 번호 끝자리" maxlength="4" readonly>
                    <asp:Literal ID="ltrHphoneNbspField" runat="server"></asp:Literal>
					&nbsp;&nbsp;
					<div class="input_b size_sm type2">
					  <div class="ez-checkbox ez-checked">
						<input name="chkSMSYorN" type="checkbox" id="chkSMSYorN" runat="server" checked class="ez-hide">
					  </div>
					  <label for="chkSMSYorN">SMS수신설정</label>
					</div>
				  </dd>
				</dl>
				<dl id="dlEmail" runat="server">
				  <dt class="mark">
					<p>이메일</p>
				  </dt>
				  <dd>
					<input name="txtEMailHeader" type="text" id="txtEMailHeader" runat="server" style="width:220px;" title="이메일을 넣어주세요">
					@
					<input name="txtEMailFooter" type="text" id="txtEMailFooter" runat="server" style="width:120px;" title="이메일을 넣어주세요" class="jtxtoff">
					&nbsp;&nbsp;&nbsp;&nbsp;
                    <div class="b_sel_line" style="width:128px;">
                        <select title="이메일선택" name="selEMailFooter" id="selEMailFooter" runat="server" style="width:128px;">
                            <option value="" selected>직접입력</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="naver.com">naver.com</option>
                            <option value="daum.net">daum.net</option>
                            <option value="nate.com">nate.com</option>
                            <option value="hanmail.net">hanmail.net</option>
                            <option value="hotmail.com">hotmail.com</option>
                        </select>
                    </div>
					<div class="row noti_email">
					  <div class="input_b size_sm type2">
						<div class="ez-checkbox ez-checked">
						  <input name="chkMailServiceYorN" type="checkbox" id="chkMailServiceYorN" runat="server" checked class="ez-hide">
						</div>
						<label for="chkMailServiceYorN"><strong>뉴스레터 및 안내메일 수신설정</strong></label>
					  </div>
					  <p>카드주문 시 진행상황을 이메일과 SMS로 전달해드리므로 정확히 입력 바랍니다.</p>
					</div>
				  </dd>
				</dl>


   				<dl id="dlWeddingDayField" runat="server">
					<dt class="mark"><p>예식일</p></dt>
					<dd>
                        <div class="input-group date">
						    <input type="text" name="txtWeddingDay" id="txtWeddingDay" runat="server" class="b_talign_c datepicker" style="width:268px;" title="예식일을 넣어주세요" readonly="readonly">
						    <a href="javascript:;" class="input-group-addon btnCalendarIcon"><img src="/resources/img_inc/icon_calender.png" alt="달력버튼"></a>
                        </div>
					</dd>
				</dl>


				<dl id="dlWeddingHallField" class="whall" runat="server">
				  <dt class="mark">
					<p>예식장</p>
				  </dt>
				  <dd>
					<div class="input_b size_sm type2">
					  <div class="ez-radio">
						<input value="W" name="rdoWeddingHall" type="radio" id="rdoWeddingHall_W" runat="server">
					  </div>
					  <label for="rdoWeddingHall_W">예식홀</label>
					</div>
					<div class="input_b size_sm type2">
					  <div class="ez-radio">
						<input value="H" name="rdoWeddingHall" type="radio" id="rdoWeddingHall_H"  runat="server">
					  </div>
					  <label for="rdoWeddingHall_H">호텔</label>
					</div>
					<div class="input_b size_sm type2">
					  <div class="ez-radio">
						<input value="C" name="rdoWeddingHall" type="radio" id="rdoWeddingHall_C" runat="server">
					  </div>
					  <label for="rdoWeddingHall_C">종교장소</label>
					</div>
					<div class="input_b size_sm type2">
					  <div class="ez-radio">
						<input value="M" name="rdoWeddingHall" type="radio" id="rdoWeddingHall_M" runat="server">
					  </div>
					  <label for="rdoWeddingHall_M">군관련기업</label>
					</div>
					<div class="input_b size_sm type2">
					  <div class="ez-radio">
						<input value="E" name="rdoWeddingHall" type="radio" id="rdoWeddingHall_E" runat="server">
					  </div>
					  <label for="rdoWeddingHall_E">기타</label>
					</div>
				  </dd>
				</dl>
			</div>			

            
		    <div class="b_dtable_1 agreement_wrap check_all_area">
			    <div class="agreeall_a clearfix" style="text-align:left;">
				    
                    <div class="input_b size_sm type1" style="float: inherit;">
                        <div class="ez-checkbox" style="margin: 0;"><input type="checkbox" name="checkbox_big1" class="check_all ez-hide" id="checkbox_big1_all"></div>
					    <label for="checkbox_big1_all"><strong>전체 동의</strong></label>
				    </div>
                    

                    <!-- 만 14세 이상 가입동의 -->
				    <div class="term_b" style="width:100%; margin: 15px 0 0 0;">
    			        <h2><div class="input_b size_sm type1"><div class="ez-checkbox"><input type="checkbox" name="chkAgeAgreement" id="chkAgeAgreement" value="Y" class="ez-hide"></div><label for="chkAgeAgreement" runat="server">만 14세 이상 입니다. <span>(필수)</span></label></div></h2>
                    </div> 
			    </div>

			    <!-- 바른손 동의 -->
			    <div class="term_s barun_s"  style="margin: 2px 0 0 0;">
                   
				    <!-- 바른컴퍼니 바른 ONE 서비스 이용약관동의 -->
				    <div class="term_b" style="width:100%;">
					    <h2><div class="input_b size_sm type1"><div class="ez-checkbox"><input type="checkbox" name="chkEssentialAgreement" id="chkEssentialAgreement" value="Y" class="ez-hide"></div><label for="chkEssentialAgreement" runat="server">이용약관 동의 <span>(필수)</span></label></div></h2>

					    <!-- 약관box -->
					    <div class="txt_a">
						    <!-- policy영역 -->
						    <div class="policy_a">
							    <h3>[총칙]</h3>
							    <div>
								    <p>개인정보란 생존하는 개인에 관한 정보로서 당해 정보에 포함되어 있는 성명, 생년월일 등의 사항에 의하여 당해 개인을 식별할 수 있는 정보(당해 정보만으로는 특정 개인을 식별할 수 없더라도 다른 정보와 용이하게 결합하여 식별할 수 있는 것을 포함합니다)를 말합니다.</p>
								    <p>㈜바른컴퍼니(이하 회사)가 제공하는 바른 ONE 서비스는 귀하의 개인정보보호를 매우 중요시하며, 『정보통신망 이용촉진 및 정보보호에관한법률』 상의 개인정보보호규정 및 정보통신부가 제정한 『개인정보보호지침』을 준수하고 있습니다. 회사는 개인정보보호정책을 통하여 귀하께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.</p>
								    <p>회사는 개인정보보호정책을 홈페이지 첫 화면에 공개함으로써 귀하께서 언제나 용이하게 열람하실 수 있도록 조치하고 있습니다.</p>
								    <p>회사는 개인정보보호정책의 지속적인 개선을 위하여 개인정보보호정책을 개정하는데 필요한 절차를 정하고 있습니다. 그리고 개인정보보호정책을 개정하는 경우 버전번호 등을 부여하여 개정된 사항을 귀하께서 쉽게 알아볼 수 있도록 하고 있습니다.</p>
							    </div>
							    <h3>[개인정보의 수집범위]</h3>
							    <div>
								    <p>바른 컴퍼니의 패밀리 사이트 이용자는 별도의 회원가입 절차 없이 대부분의 컨텐츠에 자유롭게 접근할 수 있습니다. </p>
								    <p>바른 ONE  서비스에 가입하시고자 할 경우 다음의 정보를 입력해주셔야 하며 선택항목을 입력하지 않는 경우에도 서비스 이용에 제한은 없습니다.</p>
								    <ul class="type_-">
									    <li>- 회원 가입 시 수집하는 개인정보의 범위</li>
									    <li>- 필수항목 : 가입자 이름, 생년월일, 아이디, 비밀번호, 주소, 휴대폰번호, 유선 전화번호, 이메일, 예식일자, 예식장</li>
									    <li>- 선택항목 : 신랑이름, 신부이름, 양가부모이름, 인사말 등 청첩장 제작 시 기입정보 (답례품 제작을 위해 업체에서 요구하는 추가 정보, 비웨딩 고객은 모바일초대장 제작시 기입해야 하는 정보)</li>
								    </ul>
							    </div>
							
							    <h3>[개인정보 수집에 대한 동의]</h3>
							    <div><p>회사는 귀하께서 바른 ONE  서비스의 개인정보보호방침 또는 이용약관의 내용에 대해 「동의함」버튼 또는 「동의안함」버튼을 클릭할 수 있는 절차를 마련하여, 「동의함」버튼을 클릭하면 개인정보 수집에 동의한 것으로 간주합니다.</p></div>
							
							    <h3>[상품의 제작 환불]</h3>
							    <div>
								    <ul class="type_num">
									    <li>1. 환불 또는 재제작
										    <ul class="type_abc">
											    <li>A. 고객 검수완료 후, 인쇄가 잘못된 경우 카드의 불량, 잉크번짐, 글자누락, 오타인 경우 환불 또는 다시 제작해 드립니다</li>
											    <li>B. 첩장이나 구매 상품이 파손된 경우 환불 또는 다시 제작해드립니다.</li>
											    <li>C. 청첩장 및 봉투, 커스텀 제품의 수량이 부족한 경우 다시 제작해드립니다.</li>
											    <li>D. 답례품의 수량이 주문보다 부족한 경우 필요한 수량만큼 추가 발송해 드립니다.</li>
											    <li>E. 택배를 받지 못한 경우 환불, 재발송 또는 다시 제작해드립니다.</li>
											    <li>F. 초안과 인쇄된 카드가 상이한 경우 환불 또는 다시 제작해드립니다.</li>
											    <li>G. 주문한 카드와 받으신 카드가 다를 경우,  실 구매한 제품과 수령한 제품이 다를 경우  환불, 재발송 또는 다시 제작해드립니다.</li>
										    </ul>
									    </li>
									    <li>2. 고객의 실비부담
										    <ul class="type_abc">
											    <li>A. 인쇄 컨펌 후 오타(약도, 인사말문구, 장소, 일시 등)에 의한 문제 발생시</li>
											    <li>B. 주문 시 잘못된 정보 제공으로 인한 문제 발생시(주소, 전화번호, 이름 등의 오류)</li>
											    <li>C. 물건을 받아 본 후 약도 및 인사말에 대해 고객님의 변심으로 인한 재인쇄 요구 시</li>
											    <li>D. 초안확인 및 인쇄 후, 고객의 변심에 의한 경우</li>
										    </ul>
									    </li>
									    <li>3. 기타
										    <ul class="type_abc">
											    <li>A. 회사의 명백한 과실인 경우 환불 또는 다시 제작해드립니다.</li>
										    </ul>
									    </li>
									    <li>4. 교환/환불 정책
										    <p>회사에서 상품이나 용역을 제공받은 고객은 다음과 같은 경우에 한하여 상품을 제공받은 날로부터 7일 이내에 구매취소를 요구할 수 있습니다.</p>
										    <ul class="type_abc">
											    <li>A. 고객에게 인도될 당시 당해 상품이 훼손된 경우</li>
											    <li>B. 배송이나 용역이 약관에 표시된 기간을 초과한 경우 단, 아래와 같은 경우 교환/환불이 불가능합니다.</li>
										    </ul>
										    <ul class="type_star">
											    <li>＊고객의 초안 확인이 끝난 인쇄상품의 인쇄내용의 변동을 원할 시</li>
											    <li>＊고객의 단순 변심에 의한 구매 취소 요구 시</li>
											    <li>＊고객은 규정에 의하여 상품이나 용역의 구매를 취소할 경우, 이미 제공받은 상품을 반환해야 하며 회사는 이미 지급 받은 상품의 대금을 상품을 반환 받은 날을 기준으로 10일 이내에 환불 송금해야 합니다. 규정에 의한 상품 취소의 경우 그것의 반환에 필요한 일체의 비용은 회사가 부담하는 것을 기본으로 합니다.</li>
											    <li>＊환불기준 : 전주 수요일~화요일까지 금요일에 환불처리</li>
										    </ul>
									    </li>
									    <li>5. 할인율 안내
										    <ul class="type_abc">
											    <li>A. 각 제품별 제품 상세화면 내에 할인율을 기재합니다.</li>
											    <li>B. 할인율은 프로모션이나, 이벤트 진행 시 차이가 있을 수 있습니다.</li>
										    </ul>
									    </li>
									    <li>6. 운송비 및 배송정책
										    <ul class="type_abc">
											    <li>A. 청첩장: 배송은 택배를 원칙으로 하며, 기본 배송료는 무료입니다. 배송지가 두 곳인 경우 혹은 추가 배송지가 있을 시 비용이 발생됩니다. 샘플배송은 무료 및 우편발송을 원칙으로 하며 특정상황에서 비용이 발생할 수 있습니다.</li>
											    <li>B. 답례품: 배송은 택배를 원칙으로 하며, 제품에 따라 배송정책에 의거하여 택배비를 추가로 책정할 수 있습니다. </li>
											    <li>C. 택배배송 소요일 (영업일 기준 / 공휴일 제외)
												    <ul class="type_star">
													    <li>* 평균배송기간 : 2~3일 (제주, 도서산간 지역 : 3~5일)</li>
													    <li>* 주문폭주 및 일시품절상품의 주문제작, 맞춤상품의 배송과 명절, 폭설, 폭우등의 천재지변에 의한 특별기간에는 배송기간이 다소 지연될 수 있습니다. 인쇄 등 추가 서비스 절차를 요구하는 상품 및 서비스의 경우 1~2일 상품 및 서비스에 따라 추가 소요기간이 발생될 수 있습니다. 추가 소요기간과 비용은 각 상품 및 서비스 상세페이지에 기재합니다.</li>
												    </ul>
											    </li>
										    </ul>
									    </li>
								    </ul>
							    </div>

                                <!--160913 추가-->
                                <h3>[게시물의 관리]</h3>
							    <div>
								    <ul class="type_num">
									    <li>1. 회사는 다음에 해당하는 게시물이나 자료를 사전통지 없이 삭제, 이동, 등록 거부 할 수 있습니다.
										    <ul class="type_abc">
											    <li>A. 회사, 다른 회원, 제 3자에게 심한 모욕을 주거나 명예를 손상시키는 내용인 경우</li>
											    <li>B. 공공질서 및 미풍양속에 위반되는 내용을 유포하거나 링크시키는 경우</li>
											    <li>C. 회사에서 규정한 게시물 원칙에 어긋나거나, 게시판 성격에 부합하지 않는 경우</li>
											    <li>D. 불법복제 또는 해킹을 조장하는 내용인 경우</li>
											    <li>E. 영리를 목적으로 하는 광고일 경우</li>
											    <li>F. 범죄와 결부된다고 객관적으로 인정되는 내용일 경우</li>
											    <li>G. 다른 이용자 또는 제 3자의 저작권 등 기타 권리를 침해하는 내용인 경우</li>
                                                <li>H. 정보통신망법 및 저작권법 등 기타 관계법령에 위배된다고 판단되는 경우 </li>
										    </ul>
									    </li>
                                     </ul>
							    </div>
                                        
                                <h3>[게시물의 저작권 및 책임]</h3>
							    <div>
								    <ul class="type_num">
									    <li>이용자가 서비스 내에 게시한 게시물의 저작권은 저작권법에 의해 보호를 받습니다. 회사가 작성한 저작물에 대한 저작권 및 기타 지적재산권은 회사에 귀속합니다.</li>
                                        <li>이용자는 자신이 게시한 게시물을 회사가 국내외에서 다음 각 호의 목적으로 사용하는 것을 허락합니다. 
                                    	    <ul class="type_abc">
											    <li>A. 서비스 내에서 이용자 게시물의 복제, 전송, 전시, 배포 및 우수 게시물을 서비스 화면에 노출하기 위하여 이용자  게시물의 크기를 변화하거나 단순화하는 등의 방식으로 수정하는 것</li>
											    <li>B. 회사의 서비스를 홍보하기 위한 목적으로 미디어, 통신사 등에게 이용자의 게시물 내용을 보도, 방영하게 하는 것. 단 이 경우 회사는 회원의 개별 동의 없이 미디어, 통신사 등에게 개인정보를 제공하지 않습니다.</li>
											    <li>C. 서비스 내에서 작성한 게시물은 바른컴퍼니의 패밀리 사이트(바른손카드, 비핸즈카드, 더카드, 프리미어페이퍼)에  사용될 수 있습니다.</li>
										    </ul>
                                        </li>
                                        <li>회원은 고객센터 또는 1:1문의를 통해 작성한 게시물에 대한 삭제, 검색결과 제외, 비공개 등의 조치를 취할 수 있습니다. <br>단, 베스트 이용후기나 프로모션 당첨 등을 통하여 고객이 회사로부터 이득을 취한 경우, 혜택발생 시점 이후의 게시물 삭제 요청은 회사의 판단에 의하여 보류될 수 있습니다.   </li>
                                        <li>회원이 게시한 게시물에 대하여 정보통신망법 및 저작권법 등 관련법에 위배되거나 문제 발생시, 모든 책임은 게시물을 게시한 회원 본인에게 있습니다.</li>
                                        <li>회원은 서비스를 이용하여 취득한 정보를 임의 가공, 판매하는 행위 등 서비스에 게재된 자료를 상업적으로 사용할 수 없습니다.</li>
                                     </ul>
							    </div>
                                <!--/160913 추가-->

							    <h3>[고지의 의무]</h3>
							    <div>
								    <p>현 이용약관은 2013년 02월에 제정되었으며 정부의 정책 또는 보안기술의 변경에 따라 내용의 추가ㆍ삭제 및 수정이 있을 시에는 개정 후 시행 최소 7일 전부터 홈페이지의 '공지'란을 통해 고지할 것입니다.</p>
							    </div>
						    </div>
						    <!-- / policy영역 -->
					    </div>
					    <!-- / 약관box -->
				    </div>
				    <!-- / 바른컴퍼니 바른 ONE 서비스 이용약관동의 -->
				
				    <!-- 개인정보 수집 이용 동의 -->
				    <div class="term_b" style="width:100%;">
					    <h2><div class="input_b size_sm type1"><div class="ez-checkbox"><input type="checkbox" name="chkEssentialAgreementPurpose" id="chkEssentialAgreementPurpose" value="Y" class="ez-hide"></div><label for="chkEssentialAgreementPurpose">개인정보 수집 이용 동의 <span>(필수)</span></label></div></h2>

					    <!-- 약관box -->
					    <div class="txt_a">
						    <!-- policy영역 -->
						    <div class="policy_a">
							    <h3>[총칙]</h3>
							    <div>
								    <ul class="type_num">									
									    <li>1. ㈜바른컴퍼니(이하 회사)는 회원 및 비회원 여러분들께 상품 구매 및 기타 다양한 서비스 제공을 목적으로 아래와 같이 개인정보를 수집 및 활용합니다.</li>
									    <li>2. 본 수집-이용동의서 상의 용어 정의는 '(주)바른컴퍼니 개인정보처리방침'에서 준용합니다.</li>
								    </ul>
							    </div>
							    <h3>[개인정보 수집에 대한 동의]</h3>
							    <div>
								    <p>회사는 귀하께서 개인정보처리방침 또는 이용약관의 내용에 대해 「동의함」버튼 또는 「동의안함」버튼을 클릭할 수 있는 절차를 마련하여, 「동의함」버튼을 클릭하면 개인정보 수집에 동의한 것으로 간주합니다.</p>
							    </div>
							    <h3>[개인정보 수집목적 및 이용목적]</h3>
							    <div>
								    <ul class="type_num">									
									    <li>1. 회사는 다음과 같은 목적을 위하여 아래 항목의 개인정보를 수집하고 있습니다.
										    <ul class="type_abc">
											    <li>A. 성명, 아이디, 비밀번호: 회원제 서비스 이용에 따른 본인 식별 절차에 이용</li>
											    <li>B. 이메일주소, 전화번호(일반 및 휴대전화): 고지사항 전달, 본인 의사 확인, 불만 처리 등 원활한 의사소통 경로의 확보, 새로운 서비스/신상품이나 이벤트 정보의 안내</li>
											    <li>C. 은행계좌정보 및 신용카드정보(입력): 구매대금 결제</li>
											    <li>D. 주소, 전화번호: 상품배송, 청구서, 경품과 쇼핑 물품배송에 대한 정확한 배송지확보</li>
											    <li>E. 생년월일, 주소: 인구통계학적 분석 자료(이용장의 연령별, 성별, 지역별 통계분석)</li>
											    <li>F. IP Address, 방문 일시, 서비스 이용기록(자동으로 생성되는 개인정보) : 부정이용방지, 비인가 사용방지, 분쟁조정 해결을 위한 기록보존 등</li>
											    <li>G. 그 외 선택항목: 개인맞춤 서비스를 제공하기 위한 자료<br>
											    단, 이용자의 기본적 인권 침해의 우려가 있는 민감한 개인정보(인종 및 민족, 사상 및 신조, 출신지 및 본적지, 정치적 성향 및 범죄기록, 건강상태 및 성생활 등)는 수집하지 않습니다.</li>
										    </ul>
									    </li>
								    </ul>
							    </div>
							    <h3>[개인정보의 수집항목]</h3>
							    <div>
								    <p>바른 컴퍼니의 패밀리 사이트 이용자는 별도의 회원가입 절차 없이 대부분의 컨텐츠에 자유롭게 접근할 수 있습니다. 회사의 회원제 서비스를 이용하시고자 할 경우 다음의 정보를 입력해주셔야 하며 선택항목을 입력하시지 않았다 하여 서비스 이용에 제한은 없습니다.</p>
								    <ul class="type_num">									
									    <li>1.회원 가입 시 수집하는 개인정보의 범위
										    <ul class="type_abc">
											    <li>A. 필수항목 : 가입자 이름, 생년월일, 아이디, 비밀번호, 주소, 휴대폰번호, 유선 전화번호, 이메일, 예식일자, 예식장</li>
											    <li>B. 선택항목 : 신랑이름, 신부이름, 양가부모이름, 인사말 등 청첩장 제작 시 기입정보<br>
											    (답례품 제작을 위해 업체에서 요구하는 추가 정보, 비웨딩 고객은 모바일초대장 제작시 기입해야 하는 정보)
											    </li>
										    </ul>									
									    </li>
								    </ul>
							    </div>
							    <h3>[개인정보 수집방법]</h3>
							    <div>
								    <ul class="type_num">									
									    <li>1. 상기 항목에 명시된 개인정보 항목은 전적으로 회사의 서비스를 이용하고자 하는 고객에 의한 작성을 통해 수집 됩니다.</li>
									    <li>2. 사이트 회원가입 절차, 상담절차, 이벤트나 경품 행사, 영업업무 위탁사 또는 제휴사 등으로부터의 수집, 이동 전화 및 유-무선 인터넷 서비스 사용시 생성정보 수집 툴을 통한 방법(쿠키) 등으로 개인 정보를 수집합니다.</li>
								    </ul>
							    </div>
							    <h3>[개인정보 보유 및 이용기간]</h3>
							    <div>
								    <ul class="type_num">									
									    <li>1. 귀하의 개인정보는 다음과 같이 개인정보의 수집목적 또는 제공받은 목적이 달성되면 파기됩니다. 단, 상법 등 관련법령의 규정에 의하여 다음과 같이 거래 관련 권리 의무 관계의 확인 등을 이유로 일정기간 보유하여야 할 필요가 있을 경우에는 일정기간 보유합니다. </li>
									    <li>2. 회원가입정보의 경우, 회원을 탈퇴하거나 회원에서 제명된 경우 등 사전 보유목적, 기간 및 보유하는 개인정보 항목을 명시하여 동의를 구합니다.
										    <ul class="type_abc">
											    <li>A. 계약 또는 청약철회 등에 관한 기록: 5년</li>
											    <li>B. 대금결제 및 재화 등의 공급에 관한 기록: 5년</li>
											    <li>C. 소비자의 불만 또는 분쟁처리에 관한 기록: 3년</li>
										    </ul>
									    </li>
									    <li>3. 귀하의 동의를 받아 보유하고 있는 거래정보 등을 귀하가 열람을 요구하는 경우 회사는 귀하의 정보를 열람ㆍ확인 할 수 있도록 조치합니다.</li>
								    </ul>
							    </div>
						    </div>
						    <!-- / policy영역 -->
					    </div>
					    <!-- / 약관box -->
				    </div>
				    <!-- / 개인정보 수집 이용 동의 -->
					
			        <!-- 삼성전자 동의 -->
                    <div class="term_b samsung_s">
			            <div class="samsung_s" id="wrapSamsungAgreement" runat="server">

                            <h2 style="overflow: hidden;text-align: left;	margin: 19px 0 1px 1px;">
                                <div class="input_b size_sm type1">
                                    <div class="ez-checkbox">
                                        <input type="checkbox" name="chkChoiceAgreementForSamSungMembershipALL" id="chkChoiceAgreementForSamSungMembershipALL" runat="server" value="Y" class="ez-hide agreement-samsung_main">
                                    </div>
                                    <label for="chkChoiceAgreementForSamSungMembershipALL" style="position:absolute; margin-left:1px;">삼성전자 멤버십 전체 이용 약관 동의<span>(선택)</span></label>
                                </div>
				            </h2>

                            <!-- / 삼성전자 전체 동의 그룹-->
				            <div style=" margin: 0 auto; border: 1px solid #ddd; background: #f9f9f8; height: 85px; overflow-y: scroll; overflow-x: hidden;">
				                <!-- 삼성전자 멤버십 회원 이용 약관 -->
				                <div class="term_b" style="float:left; width:100%;">
					                <h2>
                                        <div class="input_b size_sm type1" style="margin: 10px 0 0px 0px;">
                                            <div class="ez-checkbox">
                                                <input type="checkbox" name="chkChoiceAgreementForSamSungMembership" id="chkChoiceAgreementForSamSungMembership" runat="server" value="Y" class="ez-hide agreement-samsung"  onclick="checkSelectAll(this);">
                                            </div>
                                            <label for="chkChoiceAgreementForSamSungMembership" style="font-size: 14px;">삼성전자 멤버십 회원 이용약관 <span>(선택)</span></label>
                                        </div>
				                    </h2>

                                
                                    <!-- 약관box -->
					                <div class="txt_a txt_a_new" style="width: 94%; border:1px solid #f9f9f8; ">
						                <!-- policy영역 -->
						                <div class="policy_a">
							                    <h3 style="padding: 14px 0px 0px 0;">제1장 총칙</h3>
							                    <h3 style="padding: 7px 0 7px 0;">제1조 (목적)</h3>
							                    본 약관은 삼성전자 멤버십을 이용함에 있어 삼성전자 멤버십 회원과 삼성전자 주식회사(이하 "삼성전자"라 합니다)의 제반 권리, 의무 및 관련절차 등을 규정하는데 그 목적이 있습니다.
							                    <h3>제2조 (정의)</h3>
							                    <ol>
								                    <li>"삼성전자 멤버십"(이하 "멤버십"이라 합니다)이란, 삼성전자 멤버십 회원을 위해 삼성전자가 제공하는 서비스입니다.</li>
								                    <li>"삼성전자 멤버십 회원"(이하 "회원"이라 합니다)이라 함은 회원가입 절차를 통하여 정상적으로 회원고유번호를 발급받고, 멤버십 서비스를 이용할 수 있는 고객을 말합니다.</li>
								                    <li>"멤버십 서비스"란 삼성전자, 삼성전자 멤버십 지정매장, 제휴사 및 제휴가맹점이 별도로 정한 기준 및 조건에 따라 제공하는 고객 혜택을 의미합니다. 구체적인 내용은 본 약관 제4장에서 규정합니다.</li>
								                    <li>"삼성전자 멤버십 홈페이지"(이하 "홈페이지"라 합니다)란, 삼성전자가 회원에게 효율적인 멤버십 서비스 및 멤버십 관련 정보 제공 등을 위하여 운영하는 인터넷 사이트를 말하며, 이에 관한 구체적인 내용은 본 약관 제7장에서 규정합니다.</li>
								                    <li>"제휴사 및 제휴가맹점"이란 삼성전자와 계약을 체결하여 고객에게 멤버십 가입, 제휴 멤버십카드 발급, 삼성전자 포인트 적립 및 사용 등의 서비스를 제공하는 자를 말합니다.</li>
								                    <li>"삼성전자 멤버십 지정매장"(이하 "지정매장")이란 삼성전자 제품 및 서비스를 판매하는 매장 중 삼성전자가 지정하는 매장으로서 고객이 멤버십 가입, 멤버십카드 발급, 삼성전자 포인트 적립 및 사용 등을 할 수 있는 곳을 말합니다. 지정매장은 홈페이지를 통해 확인하실 수 있으며, 사정에 따라 일부 매장이 제외, 추가 및 변경될 수 있습니다.</li>
								                    <li>지정매장, 제휴사 및 제휴가맹점은 각 매장 및 사업장의 환경 및 정책, 특성에 따라 멤버십의 운영 방식과 서비스의 범위에 차이가 있을 수 있습니다. 또한 일부 지정매장과 제휴사 및 제휴가맹점에서는 멤버십 가입, 멤버십카드 발급, 삼성전자 포인트 적립 및 사용에 제한이 있을 수 있습니다. </li>
								                    <li>"삼성전자 포인트"란 회원에게 삼성전자, 제휴사 및 제휴가맹점이 별도로 정한 기준 및 조건에 따라 적립되고, 삼성전자, 지정매장, 제휴사 및 제휴가맹점에서 사용할 수 있는 서비스 상의 가상 데이터를 의미합니다. 삼성전자 포인트는 전자금융거래법의 선불전자지급수단으로서 이에 관한 구체적인 내용은 본 약관 제5장에서 규정합니다.</li>
							                    </ol>
							                    <h3>제3조 (약관 개정)</h3>
							                    <ol>
								                    <li>본 약관은 관계 법령이 정하는 바에 따라 수시로 개정될 수 있으며, 약관을 개정하고자 할 경우 삼성전자는 개정된 약관을 적용하고자 하는 날(이하 "효력 발생일")로부터 1개월 이전에 약관이 개정된다는 사실과 개정된 내용, 개정 사유 등을 홈페이지에 게시하고, 다음 각 호에서 규정한 제1호에서 제6호 중 1가지 이상의 방법으로 회원에게 고지하여 드립니다. 이 경우 개정 전 내용과 개정 후 내용을 명확하게 비교하여 회원이 알기 쉽도록 표시합니다. 만약, 법령의 개정으로 인하여 긴급하게 약관을 변경하는 경우에는 효력 발생일 직전에 고지하여 드리고, 변경된 약관을 홈페이지에 1개월 이상 게시합니다.
									                    <ol>
										                    <li>전자우편(E-MAIL)</li>
										                    <li>서면</li>
										                    <li>SMS, LMS 등 휴대전화 메시지</li>
										                    <li>전화</li>
										                    <li>홈페이지 또는 어플리케이션 내 게시</li>
										                    <li>제휴사 및 제휴가맹점 내 게시</li>
									                    </ol>
								                    </li>
								                    <li>삼성전자가 E-MAIL 또는 서면을 통해 본 약관이 개정된 사실 및 개정된 내용을 회원에게 고지하는 경우에는 회원이 삼성전자에 제공한 E-MAIL address나 주소지 중 가장 최근에 제공된 E-MAIL address나 주소지로 통보합니다. </li>
								                    <li>본 조의 규정에 의하여 개정된 약관(이하 "개정약관" 이라 한다)은 원칙적으로 그 효력 발생일로부터 유효합니다. 본 약관의 개정과 관련하여 이의가 있는 회원은 회원탈퇴를 할 수 있습니다. 단, 이의가 있음에도 불구하고 회원이 당사의 고지가 있은 후 효력 발생일까지 아무런 이의를 제기하지 않았을 경우에는 개정된 약관을 승인한 것으로 간주합니다.</li>
							                    </ol>
							                    <h3>제2장 회원가입 및 탈회</h3>
							                    <h3>제4조 (회원자격 및 가입)</h3>
							                    <ol>
								                    <li>회원으로 가입하기 위해서는 삼성전자, 지정매장, 제휴사 및 제휴가맹점이 제시한 방식을 통해 본인인증기관으로부터의 인증결과값(CI:Connecting Information)의 확인이 가능한 개인고객이어야 합니다. 만 14세 미만의 고객이 회원이 되기 위해서는 법정대리인(부모 등)의 동의가 필요하며, 이 경우 법률에 의거 또는 제휴사의 정책에 따라 법정대리인의 동의 여부와 관계없이 가입을 제한하거나 일부 서비스 제공이 불가능 할 수 있습니다. 삼성전자, 지정매장, 제휴사 및 제휴가맹점의 특성에 따라 법정대리인의 동의 확인이 불가능하다고 판단되면, 만 14세 미만 고객의 가입신청이 거부될 수 있습니다.</li>
								                    <li>멤버십 가입 신청은 삼성전자, 지정매장, 제휴사 및 제휴가맹점에서 가능합니다. 회원으로 가입하고자 하는 고객은 삼성전자, 지정매장, 제휴사 및 제휴가맹점이 정한 절차에 따라 신청자의 필수 정보를 기입한 후, 본 약관 및 별도의 '개인정보 수집ㆍ이용 동의서' 및 '개인정보 제3자 제공 동의서'에 동의한다는 의사표시를 함으로써 회원 가입신청을 할 수 있습니다.</li>
								                    <li>멤버십 가입 신청이 가능한 지정매장, 제휴사 및 제휴가맹점은 삼성전자와 지정매장, 제휴사 및 제휴가맹점의 상호 협의에 따라 변경될 수 있으며, 일부 지정매장, 제휴사 및 제휴가맹점에서는 회원가입이 제한 될 수 있습니다. 멤버십 가입 신청에 관한 구체적인 내용은 홈페이지에서 확인할 수 있습니다. </li>
								                    <li>제2항의 회원 가입신청이 있더라도 삼성전자는 다음 각 호의 사유가 있는 경우에는 회원 가입을 승낙하지 않습니다.
									                    <ol>
										                    <li>회원가입신청자의 CI로 이미 회원가입이 되어 있는 경우</li>
										                    <li>회원가입신청자의 필수 정보사항 및 각종 동의서 상에 허위 기재, 중요 정보의 누락, 식별 불가, 또는 오기가 있는 경우</li>
										                    <li>회원가입신청자가 동 약관 5조 2항에 의하여 이전에 회원의 자격을 상실한 적이 있는 경우. 단, 삼성전자가 재가입을 허용하는 경우는 예외로 합니다. </li>
									                    </ol>
								                    </li>
								                    <li>회원은 회원자격을 타인에게 양도하거나 대여 또는 담보의 목적으로 이용할 수 없습니다.</li>
							                    </ol>
							                    <h3>제5조 (회원탈회 및 정지ㆍ상실)</h3>
							                    <ol>
								                    <li>회원은 콜센터(1588-3366)와의 통화 및 홈페이지, 기타 삼성전자가 정하는 방법으로 회원 탈회를 요청할 수 있으며, 삼성전자는 회원의 요청에 따라 조속히 회원탈회에 필요한 제반 절차를 수행합니다.</li>
								                    <li>회원이 다음 각 호의 사유에 해당하는 경우, 삼성전자는 즉시 해당 회원에게 부여된 회원의 지위 및 멤버십 서비스를 정지 또는 상실시킬 수 있으며, 이 경우 삼성전자는 회원의 지위 및 멤버십 서비스가 정지 또는 상실되었음을 정지ㆍ상실일로부터 1개월 이내에 서면, 전화, 전자우편(E-MAIL), SMS 등의 방법 중 1가지 이상을 통하여 회원에게 알려 드립니다. 또한 아래 사유 발생에 따라 회원자격 정지ㆍ상실된 회원은 향후 멤버십 가입이 제한될 수 있습니다. 제한 기간은 삼성전자가 별도로 정합니다.
									                    <ol>
										                    <li>회원가입 신청 시, 허위의 내용을 기재ㆍ등록한 경우</li>
										                    <li>회원이 사망한 경우<br>
											                    (이 때 회원 자격 및 기타 멤버십 서비스와 관련된 권리나 의무는 회원의 상속인에게 상속되지 않으며, 상속인에게 별도의 통보를 하지 않습니다.)</li>
										                    <li>다른 회원의 멤버십 혜택을 부당하게 방해하거나 그 정보를 도용하는 등 관련 법령을 위반하여 정보통신 이용 질서를 위협하는 경우 </li>
										                    <li>삼성전자, 지정매장, 제휴사 및 제휴가맹점에서 법령 및 본 약관에서 금지하거나 반하는 행위를 하는 경우</li>
										                    <li>구매금액 또는 삼성전자 포인트를 부정적립 또는 부정사용 하는 경우 및 멤버십카드를 부정 사용한 경우 <br>
											                    - 부정적립이란 회원이 실제로 상품이나 서비스를 구매하지 않았음에도 불구하고 해당 회원에게 구매금액 또는 삼성전자 포인트가 적립된 경우 또는 실제 구매 금액 이상으로 포인트가 적립된 경우를 말합니다.<br>
											                    - 부정 사용이란 타 회원의 동의 없이 타 회원의 포인트 또는 멤버십카드를 수단과 방법에 관계없이 임의로 사용한 경우를 말합니다.<br>
											                    - 부정 적립 또는 부정 사용한 회원은 적립 및 사용된 포인트나 그 상당액을 반환하여야 합니다.</li>
									                    </ol>
								                    </li>
								                    <li>본 조 제2항 각 호의 사유로 자격이 정지 또는 상실된 회원은 제2항 각 호의 사유가 자신의 고의 또는 과실에 기한 것이 아님을 소명할 수 있습니다. 이 경우 삼성전자는 회원의 소명 내용을 심사하여 회원의 주장이 타당하다고 판단하는 경우 회원으로 하여금 정상적인 멤버십 서비스를 이용할 수 있도록 합니다. </li>
								                    <li>본 조 제1항에 의한 회원 탈회 또는 제2항에 의한 회원자격 정지ㆍ상실이 확정되는 시점은 다음 각 호와 같습니다.
									                    <ol>
										                    <li>사망으로 인한 자격상실의 경우에는 회원 사망일에 자격상실이 확정됩니다.</li>
										                    <li>기타의 경우에는 회원탈회 요청일 또는 삼성전자가 회원자격 정지ㆍ상실을 결정한 날 회원자격 정지ㆍ상실이 확정됩니다. </li>
									                    </ol>
								                    </li>
								                    <li>회원 탈회 시 회원의 멤버십 서비스 및 적용된 혜택은 탈회요청일 또는 자격상실일자에 소멸되며, 탈회 후 재가입 요청 시 탈회 시 소멸된 포인트는 복원되지 않습니다.</li>
								                    <li>삼성전자는 일정 기간 삼성전자 포인트의 적립 및 사용 또는 멤버십카드 사용 이력이 없는 회원을 탈회 처리할 수 있습니다. 위 기간은 5년으로 정하며, 삼성전자는 탈회를 처리하기 전에 서면, 전화, 전자우편(E-MAIL), SMS 등의 방법 중 1가지 이상을 통하여 회원에게 이를 안내합니다. </li>
							                    </ol>
							                    <h3>제3장 멤버십카드</h3>
							                    <h3>제6조 (멤버십카드의 종류 및 발급)</h3>
							                    <ol>
								                    <li>멤버십카드의 종류는 멤버십카드를 사용할 수 있는 제휴사 및 제휴가맹점에 따라 달라 질 수 있습니다. 
									                    자세한 멤버십카드의 종류는 홈페이지를 통해 확인하실 수 있으며, 사정에 따라 멤버십카드의 종류는 변경될 수 있습니다.</li>
								                    <li>멤버십카드 발급을 원하는 회원은 삼성전자, 지정매장, 제휴사 및 제휴가맹점이 정한 신청 양식에 신청자 필수 정보 사항을 기재 또는 입력하여 멤버십카드 발급을 신청할 수 있습니다.</li>
								                    <li>멤버십카드 발급은 지정매장 또는 홈페이지에서 신청하실 수 있습니다. 단, 일부 지정매장에서는 멤버십카드 발급이 제한될 수 있으며, 
									                    이는 지정매장이 소속된 타 회사 및 사업장의 자체 정책에 의한 것이므로 삼성전자가 강제할 수 없음을 알려 드립니다.</li>
								                    <li>일부 제휴 멤버십카드는 해당 제휴사 및 제휴가맹점에서도 발급받을 수 있습니다. 이 경우 회원은 제휴사 및 제휴가맹점에서 규정한 회원가입 및 카드 발급 절차를 따라야 합니다.</li>
								                    <li>멤버십카드의 형태는 플라스틱 카드, 모바일 카드, 사이버 카드가 있으며 홈페이지, 일부 지정매장과 제휴사 및 제휴가맹점에서는 플라스틱 카드가 아닌 모바일 카드 또는 사이버 카드가 발급됩니다. 모바일 카드와 사이버 카드는 삼성전자 포인트 사용 등 일부 기능이 제한될 수 있으며 모바일 카드와 사이버 카드를 발급받은 회원은 플라스틱 카드의 추가 발급을 신청할 수 있습니다.</li>
								                    <li>지정매장, 제휴사 및 제휴가맹점별 멤버십카드 발급 가능 여부 및 발급 가능한 멤버십카드 종류는 변경 될 수 있으며, 자세한 내용은 홈페이지에서 확인 할 수 있습니다. </li>
							                    </ol>
							                    <h3>제7조 (플라스틱 및 모바일 멤버십카드 분실 및 재발급)</h3>
							                    <ol>
								                    <li>멤버십카드 중 플라스틱 또는 모바일 카드를 분실한 회원은 즉시 지정매장, 콜센터(1588-3366), 홈페이지 등을 통해 해당 카드를 분실처리 하여야 합니다. 회원은 이 과정에서 본인확인 및 본인인증을 요청받을 수 있습니다.</li>
								                    <li>삼성전자는 분실처리 접수 즉시, 해당 멤버십카드의 상태를 변경하고 사용을 중지하는 등 필요한 제반 조치를 취합니다. 분실처리된 카드를 제3자가 사용할 경우 고객에게 발생하는 손해는 삼성전자가 부담하나, 본 약관에 달리 규정되어 있지 않는 한 삼성전자는 회원이 제1항에 따른 분실요청을 하기 전에 발생한 손해에 대하여는 책임지지 않습니다.</li>
							                    </ol>
							                    <h3>제8조 (멤버십카드 관리 및 손해발생시 책임)</h3>
							                    <ol>
								                    <li>회원은 선량한 관리자로서의 주의를 다하여 멤버십카드를 이용, 관리하여야 하며, 멤버십카드를 타인에게 대여하거나 양도 또는 담보의 목적으로 이용할 수 없습니다.</li>
								                    <li>삼성전자는 멤버십카드의 위조나 변조로 발생한 사고로 인하여 회원에게 손해가 발생한 경우에는 그 손해를 배상할 책임을 부담합니다. </li>
								                    <li>제2항의 규정에도 불구하고 삼성전자는 다음 각 호의 어느 하나에 해당하는 경우에는 그 책임의 전부 또는 일부를 회원이 부담하게 할 수 있습니다.
									                    <ol>
										                    <li>천재지변, 전쟁, 테러 또는 삼성전자의 귀책사유 없이 발생한 정전, 화재, 건물의 훼손 등 불가항력으로 인한 경우</li>
										                    <li>회원이 멤버십카드를 타인에게 대여하거나 사용을 위임한 경우,</li>
										                    <li>양도 또는 담보의 목적으로 제공한 경우, </li>
										                    <li>멤버십카드 관리를 소홀히 하여 타인이 이를 이용할 수 있도록 방치한 경우, </li>
										                    <li>삼성전자가 요구하는 카드에 관한 추가적인 보안조치를 정당한 사유없이 거부하여 타인이 멤버십카드를 사용하게 된 경우</li>
									                    </ol>
								                    </li>
								                    <li>삼성전자는 제2항의 규정에 따른 책임을 이행하기 위해서는 보험 또는 공제에 가입하거나 준비금을 적립하는 등 필요한 조치를 다합니다. </li>
							                    </ol>
							                    <h3>제4장 멤버십 서비스</h3>
							                    <h3>제9조 (멤버십 서비스의 운영)</h3>
							                    삼성전자는 멤버십 회원에게 다음과 같은 서비스를 제공합니다.
							                    <ol>
								                    <li>정보 제공</li>
								                    <li>이벤트 참여 기회 제공</li>
								                    <li>기타 삼성전자의 멤버십 서비스 정책에 따라 제공되는 혜택</li>
							                    </ol>
							                    <h3>제10조 (멤버십 서비스의 게시)</h3>
							                    삼성전자는 멤버십 서비스 정책의 상세 내용을 멤버십 홈페이지(http://membership.samsung.com/sec)에 게시합니다.
							                    <h3>제11조 (멤버십 서비스 제공 조건)</h3>
							                    <ol>
								                    <li>일부 서비스는 서비스 특성 또는 정책에 따라 연령∙가족관계 등 인적 자격, 지정 매장에서의 일정액 이상 구매 등 특정 요건을 충족한 경우에만 제공될 수 있습니다.</li>
								                    <li>일부 서비스는 제휴사의 사정에 따라 적용이 제한되거나 차등 제공될 수 있습니다.</li>
							                    </ol>
							                    <h3>제12조 (멤버십 서비스의 폐지, 변경 또는 중단)</h3>
							                    <ol>
								                    <li>멤버십 서비스는 서비스 유지 곤란, 운영 정책의 변경 등 삼성전자 또는 제휴사의 사정에 의하여 폐지, 변경 또는 중단될 수 있습니다.</li>
								                    <li>운영중인 멤버십 서비스를 폐지, 변경 또는 중단하고자 하는 경우 삼성전자는 그 내용을 변경기준일 [7 ]일 전에 홈페이지에 게시하여 사전 고지합니다. 그러나 부득이한 사유로 긴급하게 폐지, 변경 또는 중단하여야 하는 경우에는 효력 발생일 직전에 게시할 수 있습니다.</li>
							                    </ol>
							                    <h3>제5장 삼성전자포인트</h3>
							                    <h3>제13조 (삼성전자 포인트 적립)</h3>
							                    <ol>
								                    <li>삼성전자는 멤버십카드를 발급받고 삼성전자, 지정매장에서 제품 및 서비스(삼성전자가 정책에 따라 국내에 직접 공급한 제품 및 서비스에 한하며, 삼성전자가 아닌 타사가 공급하거나 삼성전자가 생산하였더라도 직접 공급하지 않은 제품 및 서비스는 제외됩니다.)를 구매하여 구매금액 결제 및 배송이 완료된 회원, 혹은 삼성전자가 제시한 적립 조건을 충족하는 회원에게, 구매금액×적립율(단, 퍼센트 단위 소수점이하 절사, 이하 같음), 혹은 사전에 고지한 금액의 삼성전자 포인트를 삼성전자의 정책에 따라 지정한 일자에 적립해 드립니다. <br>
									                    단, 삼성전자 포인트의 적립은 고객의 구매정보 및 구매 금액이 확인되어야만 적립 가능하며, 일부 지정 매장, 제휴사 및 제휴가맹점에서는 삼성전자 포인트 적립이 제한될 수 있습니다. 삼성전자 포인트 적립이 가능한 지정 매장, 제휴사 및 제휴가맹점은 변경 될 수 있으며, 홈페이지를 통해 구체적인 내용을 확인할 수 있습니다.</li>
								                    <li>기본적립율, 월간 또는 연간 적립한도 등의 운영 기준은 삼성전자의 정책에 의해 운영됩니다. 다만, 정책에 따라 추가로 삼성전자 포인트를 지급할 수 있으며, 이 때 적립한도 등의 기준은 별도로 적용될 수 있습니다. 삼성전자는 동일한 행사에 대해 포인트를 중복 지급하지 않으며, 삼성전자 포인트의 운영 기준은 삼성전자의 정책에 의해 변경될 수 있습니다.</li>
								                    <li>삼성전자는 하기 유형의 회원에게는 삼성전자 포인트를 적립하지 않습니다. 만일 아래 해당하는 회원이 삼성전자 포인트 적립을 받았을 경우 해당 삼성전자 포인트를 반환해야 하고, 삼성전자 포인트를 이미 사용했다면 포인트 상당 금액을 반환하여야 합니다.
									                    <ol>
										                    <li>전자제품 판매업자</li>
										                    <li>지인구매대행 회원 (단, 직계가족의 구매를 대행하는 것은 예외로 합니다.)</li>
										                    <li>사업상 제품을 구매하여 고객에게 납품하는 회원</li>
										                    <li>업무 상의 목적으로 제품을 구매한 삼성전자 임직원</li>
										                    <li>지정매장의 판매직원 (판매상담사, 세일즈프로, 매장 자체 부녀사원 등)</li>
										                    <li>실제로 삼성전자로부터 제품이나 서비스를 직접 구매한 소비자가 아니거나, 실제 구매자의 인적사항을 확인할 수 없는 회원</li>
										                    <li>기타 제1호 내지 제6호와 유사하게 영업 또는 재판매를 목적으로 제품을 구매하는 회원</li>
									                    </ol>
								                    </li>
								                    <li>삼성전자는 삼성전자 포인트 적립 및 사용에 관한 오류가 발생한 것을 확인하는 경우 이를 즉시 조사하여 처리합니다. 또한 회원은 삼성전자 포인트 적립 및 사용에 오류가 있다는 사실을 알게 된 즉시 삼성전자에 정정을 요구할 수 있습니다. 단. 이 경우 삼성전자는 삼성전자 포인트 적립의 오류 관련 조사를 위해 회원에게 자료 또는 정보 등을 요청 할 수 있습니다.</li>
								                    <li>삼성전자는 제4항 오류를 발견하거나 회원으로부터 정정을 통지 받은 후 2주 이내에 오류의 원인과 처리결과를 회원에게 알려드립니다. </li>
							                    </ol>
							                    <h3>제14조 (삼성전자 포인트 회입 및 소멸)</h3>
							                    <ol>
								                    <li>회원이 이미 제품 및 서비스의 구매를 취소하는 경우, 혹은 삼성전자 포인트의 적립 조건을 상실하였을 경우, 그로 인해 적립되었던 삼성전자 포인트는 그 적립이 취소됩니다. 만약 회원이 삼성전자 포인트를 이미 사용했다면, 삼성전자 포인트 상당 금액을 반환하거나 향후 적립되는 포인트를 통해 상계처리하셔야 합니다.</li>
								                    <li>삼성전자 포인트의 유효기간은 기본적으로 적립일 이후 24개월이며, 사전에 정의된 유효기간이 경과하면 해당 삼성전자 포인트는 자동으로 소멸됩니다. 단 특정 조건에서 적립 시에는 사전에 정의된 유효기간은 2년보다 짧을 수 있습니다. 이 경우 회원에게 사전에 정의된 유효기간을 고지합니다.</li>
							                    </ol>
							                    <h3>제15조 (삼성전자 포인트 사용)</h3>
							                    <ol>
								                    <li>회원은 삼성전자 및 지정매장, 제휴사 및 제휴가맹점에서 제품 또는 서비스(삼성전자가 정책에 따라 국내에 직접 공급한 제품 및 서비스에 한하며, 삼성전자가 아닌 타사가 공급하거나 삼성전자가 생산하였더라도 직접 공급하지 않은 제품 및 서비스는 제외됩니다.) 대금을 결제하는 경우, 삼성전자가 정한 절차에 따라 삼성전자 포인트를 사용할 수 있습니다. 단, 일부 지정 매장, 제휴사 및 제휴가맹점에서는 삼성전자 포인트 사용이 제한될 수 있으며 사용이 가능한 지정 매장, 제휴사 및 제휴가맹점은 홈페이지를 통해 확인할 수 있습니다.</li>
								                    <li>회원은 삼성전자 포인트를 사용하기 위해 플라스틱 또는 모바일 카드를 제시하거나 카드번호 및 비밀번호를 입력하여야 하고, 필요 시 추가 비밀번호 입력 또는 본인확인 및 인증을 통해 본인이 보유한 삼성전자 포인트를 사용한다는 사실을 입증할 수 있어야 합니다. 회원이 비밀번호 관리를 소홀히 하여 타인에게 노출된 경우 또는 카드의 도난, 분실 기타 사고로 인한 삼성전자 포인트 손실에 대하여 삼성전자는 책임을 지지 않습니다. </li>
								                    <li>삼성전자 포인트는 5,000포인트 이상부터 1포인트 단위로 사용이 가능하며, 1포인트는 1원의 교환 가치를 가집니다. 다만, 제휴사 또는 제휴가맹점에서는 삼성전자 포인트를 사용할 수 있는 최대금액 등의 제한이 있을 수 있으며, 이는 변경될 수 있습니다.</li>
								                    <li>삼성전자 포인트는 사전에 부여된 유효기간이 짧은 포인트 또는 적립 시점이 앞선 포인트부터 사용됩니다.</li>
							                    </ol>
							                    <h3>제16조 (양도 등 금지)</h3>
							                    <ol>
								                    <li>삼성전자 포인트는 양도, 상속 기타 거래의 대상이 될 수 없습니다.</li>
								                    <li>삼성전자는 삼성전자의 정책에 따라 삼성전자 포인트의 양도를 일부 허용할 수 있습니다. 이 경우 허용 조건 및 범위 등은 멤버십 홈페이지에 게시합니다.</li>
								                    <li>본 약관 제12조 제2항은 본 조에 준용됩니다.</li>
							                    </ol>
							                    <h3>제17조(삼성전자 포인트 적립 및 사용 등 기록의 보존 및 자료 등의 제공)</h3>
							                    <ol>
								                    <li>삼성전자는 삼성전자 포인트 적립 및 사용 등의 기록을 5년간 유지, 보존합니다.</li>
								                    <li>삼성전자는 회원의 요청이 있을 경우 다른 법률에 저촉되지 않는 범위 내에서 삼성전자가 보존․관리하고 있는 삼성전자 포인트 적립 및 사용 등의 관련 기록․자료를 요청을 받은 날부터 2주 이내에 회원에 제공합니다.</li>
							                    </ol>
							                    <h3>제18조(비밀보장의무) </h3>
							                    삼성전자는 법령에 정한 경우를 제외하고는 멤버십포인트 관련 업무를 수행함에 있어서 알게 된 회원 관련 정보를 본인의 동의 없이는 다른 사람에게 제공하지 않습니다. 다만, 삼성전자의 관리소홀로 인한 회원 관련 정보 도난 및 유출 시에는 삼성전자가 책임을 부담합니다.<br>
							                    <h3>제6장 개인정보 보호</h3>
							                    <h3>제19조 (개인정보 수집ㆍ이용)</h3>
							                    <ol>
								                    <li>삼성전자는 회원이 작성한 '개인정보 수집ㆍ이용 동의' 및 제품 및 서비스 이용 중 회원으로부터 추가로 획득한 동의에 따라 회원의 개인정보를 수집ㆍ이용할 수 있습니다.</li>
								                    <li>회원은 삼성전자에 제공한 개인정보와 관련하여 변경사항이 있는 경우 지체 없이 삼성전자에 그 변경사실을 통지하여야 합니다. 회원이 변경사실의 통지를 태만히 함으로써 삼성전자로부터의 연락, 통지 또는 문서 등이 연착하거나 도착하지 않아 발생한 손해는 회원이 부담하여야 합니다. </li>
								                    <li>개인정보의 수집ㆍ이용에 관한 내용은 삼성전자, 지정매장, 제휴사 및 제휴가맹점의 사정에 따라 변경 될 수 있습니다. 이 경우 삼성전자는 제3조 1항에 명시한 방식에 의거하여, 변경 내역을 고지합니다.</li>
							                    </ol>
							                    <h3>제20조 (마케팅활용을 위한 위탁 및 제3자 제공)</h3>
							                    <ol>
								                    <li>삼성전자는 '마케팅활용을 위한 위탁 동의' '개인정보 제3자 제공 동의'에 따라 회원의 개인정보를 위탁하거나 제공할 수 있습니다. 회원은 이를 원치 않을 경우 거부하실 수 있으며, 거부로 인해 일부 멤버십 서비스에 제한이 있을 수 있습니다.</li>
								                    <li>개인정보의 제공 등에 관한 내용은 삼성전자, 지정매장, 제휴사 및 제휴가맹점의 사정에 따라 변경될 수 있습니다. 이 경우 삼성전자는 제3조 1항에 명시한 방식에 의거하여, 변경 내역을 고지합니다.</li>
								                    <li>삼성전자는 아래의 경우에는 회원의 동의를 얻지 아니하고 제3자에게 개인정보를 제공할 수 있습니다.
									                    <ol>
										                    <li>회원으로부터 개인정보 수집이용동의서를 통해 사전 동의를 받은 경우</li>
										                    <li>관련법령에 따라 국가, 공공기관 등의 요청이 있는 경우</li>
										                    <li>통계작성을 위하여, 특정 개인을 식별할 수 없는 형태로 제공되어 제공하는 경우</li>
									                    </ol>
								                    </li>
							                    </ol>
							                    <h3>제21조 (개인정보 보유 및 이용기간)</h3>
							                    <ol>
								                    <li>삼성전자는 수집된 회원의 개인정보를 해당 회원이 회원 자격을 유지하는 기간 내 보유하고 이용할 수 있습니다. 다만, 회원이 탈퇴하거나 자격을 상실할 경우 삼성전자는 이후 고객이 불만 제기 및 서비스 요청할 경우를 대비하여 회원 탈퇴 또는 자격 상실 후 5년 간 개인정보를 삭제하지 아니합니다. 위 기간이 경과하면 회원의 별도 요청이 없을 경우라도 수집된 회원정보를 삭제 및 파기합니다. </li>
								                    <li>본 조 제1항에도 불구하고 상법 등 관련 법령의 규정에 의하여 거래 관련 권리의무 관계의 확인 등을 이유로 일정기간 보유해야 할 필요가 있을 경우에는 삼성전자는 관련법령이 정한 기간 또는 다음 각 호의 기간동안 개인정보를 보유할 수 있습니다.
									                    <ol>
										                    <li>계약 또는 청약철회 등에 관한 기록 : 5년 </li>
										                    <li>대금결제 및 재화 등의 공급에 관한 기록 : 5년 </li>
										                    <li>소비자의 불만 또는 분쟁처리에 관한 기록 : 5년</li>
										                    <li>삼성전자 포인트 적립 및 사용 등에 관한 기록 : 5년 또는 1년</li>
										                    <li>기타 개별적으로 이용자의 동의를 받는 경우 : 해지가 처리된 시점까지</li>
									                    </ol>
								                    </li>
							                    </ol>
							                    <h3>제22조 (개인정보보호를 위한 회원의 권리)</h3>
							                    <ol>
								                    <li>회원 또는 그 법정대리인은 개인정보의 수집, 이용, 제공에 대해 회원이 동의한 내용을 철회할 수 있으며, 자신의 개인정보를 열람하거나 정정할 수 있습니다. </li>
								                    <li>회원은 다음과 같은 방법으로 본 조 제1항에 기재된 회원 개인정보의 열람 또는 정정을 청구 할 수 있습니다. <br>
									                    - 콜센터(1588-3366)와 통화 <br>
									                    - 홈페이지를 통해 요청 <br>
									                    - 지정매장에 방문하여 요청 (단, 해당 지정매장의 회원으로 등록된 경우에 한하며, 지정매장의 정책 및 환경에 따라 일부 지정매장에서는 불가할 수 있습니다.)</li>
								                    <li>삼성전자는 회원으로부터 동의 철회, 열람 및 정정 요구를 받은 경우에는 수집된 개인정보를 파기 및 정정하는 등의 조치를 취하고 지체 없이 그 결과를 회원에게 통지합니다.</li>
							                    </ol>
							                    <h3>제23조 (개인정보위탁)</h3>
							                    삼성전자는 수집된 개인정보의 취급 및 관리 등의 업무를 스스로 수행함을 원칙으로 하나, 원활한 업무 처리를 위해 필요한 경우 업무의 일부 또는 전부를 삼성전자가 선정한 업체에 위탁할 수 있으며 이를 사전에 회원에게 고지합니다.
							                    <h3>제24조(개인정보보호책임자)</h3>
							                    <ol>
								                    <li>삼성전자는 수집된 회원의 개인정보 관리를 위해 개인정보보호책임자의 성명과 연락처를 홈페이지에 공지합니다.</li>
								                    <li>개인정보보호책임자는 삼성전자의 사정에 따라 변경될 수 있습니다. 이 경우 변경사항을 본 약관 제3조 제1항에 규정된 통지방법을 준용하여 회원에게 알려 드리며, 별도의 약관 변경 절차는 생략합니다.</li>
							                    </ol>
							                    <h3>제7장 홈페이지</h3>
							                    <h3>제25조(홈페이지 운영)</h3>
							                    <ol>
								                    <li>삼성전자는 홈페이지 운영과 관련하여 관계 법령과 이 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며, 이 약관이 정하는 바에 따라 지속적이고 안정적으로 서비스를 제공하는 데 최선을 다합니다.</li>
								                    <li>삼성전자는 홈페이지를 통하여 다음과 같은 업무를 수행합니다.
									                    <ol>
										                    <li>회원에게 멤버십 관련 제반 정보의 제공 </li>
										                    <li>회원정보 등록, 변경, 조회 등</li>
										                    <li>삼성전자 포인트 및 혜택의 신청, 조회 등</li>
										                    <li>회원대상 삼성전자 및 제휴 프로모션 </li>
										                    <li>기타 삼성전자가 정한 업무</li>
									                    </ol>
								                    </li>
								                    <li>삼성전자는 컴퓨터 등 정보통신설비의 점검, 보수, 교체 및 고장, 통신의 두절 등의 사유가 발생한 경우에는 홈페이지 서비스의 제공을 일시적으로 중단할 수 있습니다. 위의 사유로 홈페이지 서비스를 중단하고자 할 경우 삼성전자는 e-mail 또는 홈페이지에 게시하는 방법으로 회원에게 홈페이지 서비스 중단 사실을 알려 드립니다. </li>
							                    </ol>
							                    <h3>제26조(홈페이지에 관한 회원의 의무)</h3>
							                    <ol>
								                    <li>회원은 홈페이지 서비스 이용과 관련하여 다음 각 호의 행위를 해서는 아니됩니다.
									                    <ol>
										                    <li>홈페이지 서비스 이용을 위한 제반 사항 신청 또는 변경 시 허위내용 기재 행위</li>
										                    <li>홈페이지에 게시된 각종 정보의 무단 변경, 삭제 등 훼손 행위</li>
										                    <li>삼성전자가 허용한 정보 이외의 다른 정보(컴퓨터 프로그램 및 광고 등)를 송신하거나 게시하는 행위</li>
										                    <li>외설 또는 폭력적인 정보를 홈페이지에 공개하거나 게시하는 행위</li>
										                    <li>삼성전자 홈페이지를 이용함으로써 얻은 정보를 삼성전자의 사전 승낙없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리목적으로 이용하거나 제 3자에게 이용하게 하는 행위</li>
									                    </ol>
								                    </li>
							                    </ol>
							                    <h3>제8장 기타</h3>
							                    <h3>제27조 (멤버십의 종료 및 변경)</h3>
							                    <ol>
								                    <li>관련 법령의 제ㆍ개정, 감독기관의 구속력 있는 명령 기타의 사유로 부득이 서비스를 변경ㆍ종료(이하 "변경"이라 합니다)하고자 할 경우, 삼성전자는 서비스 변경 예정일로부터 1개월 이전에 본 약관 제3조 제1항에 규정된 통지방법 중 1가지 이상의 방법으로 회원에게 알려 드립니다.</li>
								                    <li>제1항에도 불구하고, 서비스 제공과 관련된 제휴사 및 제휴가맹점의 일방적 제휴조건 변경ㆍ도산, 천재지변, 금융환경의 급변 등의 경영위기 및 그 밖에 이에 준하는 사유에 따른 불가피한 경우, 삼성전자는 서비스를 변경 또는 중단할 수 있습니다. 이 경우 삼성전자는 해당 서비스가 변경되었음을 서비스 변경일로부터 7영업일 이내에 본 약관 제3조 제1항에 규정된 통지방법 중 1가지 이상의 방법으로 회원에게 알려 드립니다. 제1항과 제2항에 의거하여 멤버십이 종료되는 당일, 잔여 삼성전자 포인트 및 혜택이 자동으로 소멸됩니다.</li>
							                    </ol>
							                    <h3>제28조 (약관 위반시의 책임)</h3>
							                    회원은 본 약관을 위반함으로써 발생하는 모든 책임을 부담하며, 이로 인하여 삼성전자에게 손해를 입힌 경우에는 배상하여야 합니다.
							                    <h3>제29조 (회원에 대한 통지)</h3>
							                    <ol>
								                    <li>삼성전자가 회원에 대한 통지를 하는 경우 본 약관에 다른 규정이 없는 한 삼성전자는 본 약관 제3조 제1항 각호의 규정된 1가지 이상의 방법에 따라 통지할 수 있습니다.</li>
								                    <li>삼성전자가 서면으로 통지했을 때에는 천재지변 등 불가항력적인 경우 외에는 보통의 우송기간이 지났을 때 도달한 것으로 추정합니다.</li>
								                    <li>회원이 회원정보 변경을 게을리함에 따라 제2항에 의하여 발송한 서면통지가 회원에게 연착하거나 도달하지 아니한 때에는 보통의 우송기간이 경과한 때에 도달한 것으로 간주합니다.</li>
							                    </ol>
							                    <h3>제30조 (분쟁의 해결 등)</h3>
							                    본 약관에 의한 멤버십 포인트 이용과 관련하여 분쟁이 발생한 경우 회원은 삼성전자의 고객센터 및 기타 분쟁처리절차를 통해 그 해결을 요구하거나 금융감독원 금융분쟁조정위원회, 한국소비자보호원 소비자분쟁조정위원회 등을 통하여 분쟁조정을 신청할 수 있으며, 본 약관에서 정하지 아니한 사항과 약관의 해석에 관하여는 관계 법령 또는 상관례를 따릅니다.
							                    <h3>제31조 (관할법원)</h3>
							                    본 약관에 따른 거래에 관한 소송은 회원의 주소지 또는 영업소 소재지를 관할하는 법원으로 하되, 회원의 주소지를 알 수 없거나 주소지가 분명하지 아니한 경우에는 민사소송법상의 관할 법원으로 합니다.<br>
							                    <br>
							                    <h3>부칙</h3>
							                    <h3>제1조 (시행일)</h3>
							                    본 약관은 2017년 1월 1일부터 시행됩니다.
						                    </div>
						                <!-- / policy영역 -->
					                </div>
					                <!-- / 약관box -->
					
				                </div>
				                <!-- / 삼성전자 멤버십 회원 이용 약관 -->
                            
				                <!-- 삼성전자 개인정보 수집 이용 동의 -->
				                <div class="term_b" >
					                <h2>삼성전자 멤버십 개인정보 수집</h2>

					                <!-- 약관box -->
					                <div class="txt_a txt_a_new" style="width: 95%;border: 0;">
						                <!-- policy영역 -->
						                <div class="policy_a">
                                                <h4><div class="input_b size_sm type1"><div class="ez-checkbox"><input type="checkbox" name="chkChoiceAgreementForSamSungPersonalData" id="chkChoiceAgreementForSamSungPersonalData" class="ez-hide agreement-samsung" runat="server"  onclick="checkSelectAll(this);"></div><label for="chkChoiceAgreementForSamSungPersonalData">필수적인 개인정보 수집 이용 동의 <span>(선택)</span></label></div></h4>
							                    <!--<h3>필수적인 개인정보 수집 이용 동의</h3>-->
							                    삼성전자 주식회사(이하 '삼성전자'라 합니다)는 최초 회원 가입 또는 서비스 이용 시 이용자로부터 아래와 같은 개인정보를 수집하고 있습니다. 개인정보 처리에 대한 상세한 사항은 삼성닷컴(https://www.samsung.com/sec/)에 공개한 '개인정보 처리방침'을 참조하십시오. 다만, 본 동의서 내용과 상충되는 부분은 본 동의서의 내용이 우선합니다. 귀하께서는 필수항목 수집·이용에 대한 동의를 거부하실 수 있으나, 이는 서비스 제공에 필수적으로 제공되어야 하는 정보이므로, 동의를 거부하실 경우 회원 가입 및 서비스 이용 등이 제한됩니다.
						
							                    <ol>
								                    <li>
									                    <h3>1) 수집항목:</h3>
									                    <h3>가) 멤버십 가입에 필요한 정보</h3>
									                    <ol>
										                    <li>이메일 주소, 전화번호, 우편번호, 주소, 비밀번호, 성명, 성별, 생년월일, 중복가입 확인정보(DI), 암호화된 동일인 식별정보(CI), 만 14세 미만 아동의 경우 법정대리인 정보(법정대리인의 이름, 생년월일, DI, CI)</li>
									                    </ol>
									                    <h3>나) 삼성전자 멤버십 제휴처 통해 가입 시 필요한 정보</h3>
									                    <ol>
										                    <li>결혼 관련 정보 [결혼(예식)예정일, 예식장정보, 구매예정제품], 이사 관련 정보 [이사예정일, 이사예정평수, 구매예정제품, 이벤트신청일], 출산 관련 정보 [출산예정일, 임신 개월수, 자녀 수, 자녀 나이, 구매예정 및 관심제품, 이벤트 신청일], 전역 관련 정보 [전역예정일, 군구분(사병/간부/군무원)]<br>
			                    ※ 단, 결혼/이사/출산/전역 관련 제휴처에서 가입하는 고객에 한하여 수집합니다.</li>
									                    </ol>
									                    <h3>다) 멤버십 이용 과정에서 필요한 정보</h3>
									                    <ol>
										                    <li>※ 멤버십 이용 과정에서 필요한 필수정보는 서비스 제공 단계에 따라 필요한 범위 내에서 수집 됩니다.</li>
										                    <li>재화ㆍ용역 구매정보 [구매모델ㆍ서비스명, 구입처, 구입일시, 구입가격/수량, 결제수단정보, 결제카드정보, 제조번호, 상담내역]</li>
										                    <li>포인트거래정보 [포인트적립·사용액, 적립·사용내역, 적립·사용일시, 적립·사용처]</li>
										                    <li>서비스 수리 관련정보[수리모델명, 수리일자, 수리내용, 수리비용, 결제수단정보, 결제카드정보, 제조번호, 수리결과, 상담내역]<br>
										                    • 배송ㆍ이전설치 관련정보[배송ㆍ이전설치모델명, 배송ㆍ이전설치일자, 구매자명, 구매자 (휴대)전화번호, 구매자 주소, 인수자 (휴대)전화번호, 인수자 주소, 배송ㆍ이전 설치 내용, 배송ㆍ이전 설치결과, 배송ㆍ이전설치결제비용, 결제수단정보, 결제카드정보, 제조번호]<br>
										                    ※ 배송ㆍ이전설치 관련 인수자 개인정보는 이용자가 인수자로부터 적법하게 수집하여 삼성전자에 제공함에 대한 동의를 받았음을 전제로 합니다.<br>
										                    • 폐가전 관련정보 [폐가전 회수일시, 회수품목, 회수대수]<br>
										                    • 콜센터 상담 내역 및 상담 결과 [문의 일시, 내용 및 아웃바운드 TM 접촉, 내용]<br>
										                    • 플러스 페이 결제일, 플러스 페이 신용카드 종류<br>
										                    • 멤버십 무상SVC연장 대상 여부, 무상SVC연장 만료월, 무상SVC부족구매기한, 부족액<br>
										                    • 로열블루 등급, 내년상위등급, 구매기한, 부족액<br>
										                    • 추가 멤버십 포인트 제공 제휴업체의 서비스 가입 정보<br>
										                    [제휴업체명(㈜대명스테이션(대명라이프웨이 상조 서비스), ㈜홀리스트, ㈜케이티씨에스, ㈜LG유플러스(IPTV), ㈜청호나이스(정수기)), 가입여부 및 가입일]</li>
									                    </ol>
								                    </li>
								                    <li>수집목적</li>
								                    <table border="0" cellspacing="0" cellpadding="0" class="header_h">
									                    <colgroup>
										                    <col style="width:30%">
										                    <col style="width:70%">
									                    </colgroup>
									                    <tbody><tr>
										                    <td><p align="center">구분</p></td>
										                    <td><p align="center">자세한내용</p></td>
									                    </tr>
									                    <tr>
										                    <td><p align="left">① 회원관리 및 본인확인</p></td>
										                    <td><p align="left">
			                    -	본인 확인, 연령 확인, 만 14세 미만 아동 개인정보 수집 시 법정 대리인 동의여부 확인, 불만 처리 등 민원처리, 고지사항 전달, 혜택 제공 및 안내, 불량회원의 부정이용 방지와 비인가 사용방지<br>
			                    -	회원제 상품 구매 및 서비스 이용에 따른 본인확인<br>
			                    -	개인정보 처리 및 정보주체의 개인정보 열람, 정정, 삭제, 처리정지 요구 시 본인확인, 개인식별
										                    </p></td>
									                    </tr>
									                    <tr>
										                    <td><p align="left">② 서비스 제공에 관한 계약이행 및 서비스 제공에 따른 요금 정산<br>삼성전자 멤버십 서비스 제공</p></td>
										                    <td><p align="left">
			                    -	상품, 멤버십 서비스 제공, 구매 및 결제, 상품 배송<br>
			                    -	사용자에 최적화된 서비스, 편의제공 및 기능 개선<br>
			                    -	이용자가 구매한 상품에 대한 A/S 및 업데이트 정보 등 제공<br>
			                    -	멤버십 혜택 제공 (포인트 적립 및 사용, 프리미엄 등급 혜택)
										                    </p></td>
									                    </tr>
								                    </tbody></table>
												
								                    <li>보유 및 이용 기간:</li>
								                    회원의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다.<br><br>
								                    다만, 삼성전자는 관련법령의 규정에 의하여 개인정보를 보유할 필요가 있는 경우, 해당 법령에서 정한 바에 의하여 아래와 같이 개인정보를 보유할 수 있습니다.
							
								                    <table border="0" cellspacing="0" cellpadding="0" class="header_h">
									                    <colgroup>
										                    <col style="width:33%">
										                    <col style="width:13%">
										                    <col style="width:53%">
									                    </colgroup>
									                    <tbody><tr>
										                    <td><p align="center">보유 항목</p></td>
										                    <td><p align="center">보유 기간</p></td>
										                    <td><p align="center">법적 근거</p></td>
									                    </tr>
									                    <tr>
										                    <td><p align="left">이용자의 포인트 내역</p></td>
										                    <td><p align="left">5년</p></td>
										                    <td><p align="left">상법</p></td>
									                    </tr>
									                    <tr>
										                    <td><p align="left">계약 또는 청약철회 등에 관련 기록</p></td>
										                    <td><p align="left">5년</p></td>
										                    <td><p align="left">전자상거래 등에서의 소비자보호에 관한 법률</p></td>
									                    </tr>
									                    <tr>
										                    <td><p align="left">대금결제 및 재화 등의 공급에 관한 기록</p></td>
										                    <td><p align="left">5년</p></td>
										                    <td><p align="left">전자상거래 등에서의 소비자보호에 관한 법률</p></td>
									                    </tr>
									                    <tr>
										                    <td><p align="left">소비자의 불만 또는 분쟁처리에 관한 기록</p></td>
										                    <td><p align="left">3년</p></td>
										                    <td><p align="left">전자상거래 등에서의 소비자보호에 관한 법률</p></td>
									                    </tr>
									                    <tr>
										                    <td><p align="left">신용정보의 수집/처리 및 이용 등에 관한 기록</p></td>
										                    <td><p align="left">3년</p></td>
										                    <td><p align="left">신용정보의 이용 및 보호에 관한 법률</p></td>
									                    </tr>
									                    <tr>
										                    <td><p align="left">표시/광고에 관한 기록</p></td>
										                    <td><p align="left">6개월</p></td>
										                    <td><p align="left">전자상거래 등에서의 소비자보호에 관한 법률</p></td>
									                    </tr>
									                    <tr>
										                    <td><p align="left">이용자의 인터넷 등 로그기록/ 이용자의 접속지 추적자료<br>그 외의 통신사실 확인 자료</p></td>
										                    <td><p align="left">3개월<br>12개월</p></td>
										                    <td><p align="left">통신비밀보호법</p></td>
									                    </tr>
								                    </tbody></table>
							                    </ol>	
                                                <h4><div class="input_b size_sm type1"><div class="ez-checkbox"><input type="checkbox" name="chkChoiceAgreementForSamSungPersonalData2" id="Checkbox6" class="ez-hide agreement-samsung" runat="server"  onclick="checkSelectAll(this);"></div><label for="chkChoiceAgreementForSamSungPersonalData2">선택적인 개인정보 수집 이용 동의 <span>(선택)</span></label></div></h4>
							                    <!--<h3>선택적인 개인정보 수집 이용 동의</h3>-->
							                    삼성전자 주식회사(이하 ‘삼성전자’라 합니다)는 최초 회원 가입 또는 서비스 이용 시 이용자로부터 아래와 같은 개인정보를 수집하고 있습니다. 귀하께서는 선택항목 수집·이용에 대한 동의를 거부하실 수 있으며, 이는 서비스 제공에 필수적으로 제공되어야 하는 정보가 아니므로 동의를 거부하시더라도 회원 가입, 서비스 이용, 홈페이지 이용 등이 가능합니다. 다만 선택항목 수집·이용에 대하여 동의하지 않으실 경우, 이벤트 참여 및 판촉 안내 등 서비스에 제한이 있을 수 있습니다.
                                                <ol>
								                    <li>
									                    <h3>1) 수집항목</h3>
									                    <ol>
										                    <li>• 위 필수 수집항목</li>
										                    <li>• 직업[직장 전화번호], 결혼여부, 선호 매장</li>
										                    <li>• 가구정보 [가구원 수, 자택 전화번호, 반려동물 동거 여부 및 종류.</li>
										                    <li>• 마케팅 활동ㆍ이벤트 관련 정보[마케팅활동 내용 및 결과, 이벤트참여 내용 및 결과]</li>
										                    <li>• 쿠폰/이벤트코드 보유 및 사용, 경품선택/수령결과</li>
										                    <li>• 제휴사 및 제휴가맹점 관련정보 [제휴사명, 제휴사 회원번호, 제휴사 회원가입일, 이벤트 참여일, 제휴사 관련 혜택 및 마케팅활동 정보]</li>
										                    <li>※ 제휴사는 회사와 고객에 대한 상품 및 서비스 안내 등과 관련하여 제휴 계약을 체결한 자를 의미합니다.</li>
										                    <li>• 관심 제품 고객 조사 결과</li>
									                    </ol>
                                                    </li>
								                    <li><h3>2) 수집목적</h3></li>
								                    <table border="0" cellspacing="0" cellpadding="0" class="header_h">
									                    <colgroup>
										                    <col style="width:30%">
										                    <col style="width:70%">
									                    </colgroup>
									                    <tbody><tr>
										                    <td><p align="center">구분</p></td>
										                    <td><p align="center">자세한내용</p></td>
									                    </tr>
									                    <tr>
										                    <td><p align="left">마케팅에 활용</p></td>
										                    <td><p align="left">
			                                                -	당사 및 제휴사의 상품ㆍ서비스, 사은ㆍ판촉행사, 이벤트 등의 마케팅 활동 안내 및 이용권유 (SMS·DM·TM·Email, Push-mail, 푸쉬메시지 발송)<br>
			                                                -	고객에 대한 맞춤형 서비스, 편의 제공 및 이벤트 경품배송<br>
			                                                -	시장조사, 고객만족도조사, 상품ㆍ서비스 개발연구, 고객별 통계분석자료 활용
										                    </p></td>
									                    </tr>

                                                        </tbody>
								                    </table>
								                    <li><h3>3) 보유 및 이용 기간</h3></li>
								                    회원의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다.<br><br>
								                    다만, 삼성전자는 관련법령의 규정에 의하여 개인정보를 보유할 필요가 있는 경우, 해당 법령에서 정한 바에 의하여 아래와 같이 개인정보를 보유할 수 있습니다.
							
								                    <table border="0" cellspacing="0" cellpadding="0" class="header_h">
									                    <colgroup>
										                    <col style="width:33%">
										                    <col style="width:13%">
										                    <col style="width:53%">
									                    </colgroup>
									                    <tbody><tr>
										                    <td><p align="center">보유 항목</p></td>
										                    <td><p align="center">보유 기간</p></td>
										                    <td><p align="center">법적 근거</p></td>
									                    </tr>
									                    <tr>
										                    <td><p align="left">계약 또는 청약철회 등에 관련 기록</p></td>
										                    <td><p align="left">5년</p></td>
										                    <td><p align="left">전자상거래 등에서의 소비자보호에 관한 법률</p></td>
									                    </tr>
									                    <tr>
										                    <td><p align="left">대금결제 및 재화 등의 공급에 관한 기록</p></td>
										                    <td><p align="left">5년</p></td>
										                    <td><p align="left">전자상거래 등에서의 소비자보호에 관한 법률</p></td>
									                    </tr>
									                    <tr>
										                    <td><p align="left">소비자의 불만 또는 분쟁처리에 관한 기록</p></td>
										                    <td><p align="left">3년</p></td>
										                    <td><p align="left">전자상거래 등에서의 소비자보호에 관한 법률</p></td>
									                    </tr>
									                    <tr>
										                    <td><p align="left">신용정보의 수집/처리 및 이용 등에 관한 기록</p></td>
										                    <td><p align="left">3년</p></td>
										                    <td><p align="left">신용정보의 이용 및 보호에 관한 법률</p></td>
									                    </tr>
									                    <tr>
										                    <td><p align="left">표시/광고에 관한 기록</p></td>
										                    <td><p align="left">6개월</p></td>
										                    <td><p align="left">전자상거래 등에서의 소비자보호에 관한 법률</p></td>
									                    </tr>
									                    <tr>
										                    <td><p align="left">이용자의 인터넷 등 로그기록/ 이용자의 접속지 추적자료<br>그 외의 통신사실 확인 자료</p></td>
										                    <td><p align="left">3개월<br>12개월</p></td>
										                    <td><p align="left">통신비밀보호법</p></td>
									                    </tr>

                                                        </tbody>
                                                    </table>
                                                </ol>
                                            
						                    </div>
						                <!-- / policy영역 -->
					                </div>
					                <!-- / 약관box -->
				                </div>
				                <!-- / 삼성전자 개인정보 수집 이용 동의 -->
				
				                <!-- 삼성전자 선택적인 개인정보 수집 이용 동의 -->
				                <div class="term_b" style="float:left; width:100%;">
					                <h2><div class="input_b size_sm type1"><div class="ez-checkbox"><input type="checkbox" name="chkChoiceAgreementForSamSungChoicePersonalData" id="chkChoiceAgreementForSamSungChoicePersonalData" value="Y" class="ez-hide agreement-samsung"  runat="server"  onclick="checkSelectAll(this);"></div><label for="chkChoiceAgreementForSamSungChoicePersonalData">삼성전자 멤버십 마케팅 정보 수신 <span>(선택)</span></label></div></h2>

					                <!-- 약관box -->
					                <div class="txt_a txt_a_new"  style="width: 94%;border: 0;">
						                <!-- policy영역 -->
						                <div class="policy_a">
						
						                    <h3>마케팅 정보 수신 동의</h3>
							                    <div>특별한 제안, 멤버십 혜택, 뉴스레터를 받아 보려면 이 옵션을 실행하세요.<br><br>
							                    삼성전자는 아래와 같이 개인정보 처리 업무를 외부 전문업체에 위탁하여 처리하고 있습니다. 마케팅 정보를 받는 데 동의하면 아래와 같이 마케팅 활동 관련 업무를 수탁업체에 위탁하는 것에 대해서도 동의한 것으로 간주합니다. 마케팅 활동 및 관련 업무를 위한 위탁에 동의하지 않으시는 경우, 신제품 안내, 이벤트 소식 안내 및 참여, 혜택 적용 등이 제한됩니다.<br>
							                    </div>
							                    <!-- 160902 수정1 -->
							                    <table border="0" cellspacing="0" cellpadding="0" class="header_h">
								                    <colgroup>
									                    <col style="width:33%">
									                    <col style="width:33%">
									                    <col style="width:33%">
								                    </colgroup>
								                    <tbody><tr>
									                    <td><p align="center">구분</p></td>
									                    <td><p align="center">수탁업체의 명칭</p></td>
									                    <td><p align="center">위탁하는 업무의 내용</p></td>
								                    </tr>
								                    <tr>
									                    <td rowspan="2"><p align="left">마케팅 및<br>마케팅 관련 활동을 위한 업무위탁</p></td>
									                    <td><p align="left">㈜한국리서치, 마크로밀엠브레인</p></td>
									                    <td><p align="left">제품 소비자 만족도 및 사용행태 조사</p></td>
								                    </tr>
								                    <tr>
									                    <td width="500px;"><p align="left">제일기획㈜ 및 협력사<a href="http://membership.samsung.com/sec/PopCheillInfo" onclick="window.open(this.href, 'mywin','left=20,top=20,width=480,height=500,esizable=no,status=no,scrollbars=no,menubar=no'); return false;">(목록보기)</a>, (주)데이타존, 대성전산(주), 빌포스트(주), 인포뱅크(주), ㈜케이디뱅크, 주식회사 제3채널, ADOBE SOFTWARE TRADING COMPANY LTD, 주식회사 디메이크, 입소스 주식회사 (IPSOS), 삼성전자판매(주) 재수탁사 </p></td>
									                    <td><p align="left">이벤트 대행 및 이벤트 문의 처리, 이벤트 관련 고지, 경품배송, DM발송, TM, 프로모션 대행 업무, 제세공과금처리, 메시지(이메일)발송업무대행</p></td>
								                    </tr>						
							                    </tbody></table>
                                    <div>
                                        일부 개인정보의 경우 서비스 제공 및 이용자 편의 증진 등을 위하여 국외 업체에 위탁, 보관하고 있습니다.<br /><br />

                                        ○ 이전받는 업체명 및 연락처 : Adobe Systems Software Ireland Limited<br />
                                                                      02-530-8000(한국 오피스)<br />
                                        ○ 이전되는 국가 : 싱가폴/호주/ <br />
                                        ○ 이전 일시 및 방법 : 데이터 업데이트 할 때마다 네트워크를 통해 전송<br />
                                        ○ 이전되는 개인정보 항목 : 암호화된 이메일 주소, 해시된 이메일 주소,
                                        쿠키 기반의 웹 사이트의 사용 및 탐색을 위한 행동 정보<br />
                                        ○ 이전받는 자의 이용 목적 및 보유∙이용 기간 : 광고•타겟팅 활용
                                        목적으로 사용 <br />
                                        - 이메일 : 정보 미보유 및 메일 발송 정보로 이용 후 삭제<br />
                                          - 쿠키 데이터 : 최장 180일 <br />
                                          - 업로드된 고객 정보 데이터 : 최장 24개월 <br />

                                    </div>

							                    <!-- / 160902 수정1 -->	
						
							                    <p><br>삼성전자 주식회사(이하 '삼성전자'라 합니다)는 최초 회원 가입 또는 서비스 이용 시 이용자로부터 아래와 같은 개인정보를 수집하고 있습니다. 귀하께서는 선택항목 수집·이용에 대한 동의를 거부하실 수 있으며, 이는 서비스 제공에 필수적으로 제공되어야 하는 정보가 아니므로 동의를 거부하시더라도 회원 가입, 서비스 이용, 홈페이지 이용 등이 가능합니다. 다만 선택항목 수집·이용에 대하여 동의하지 않으실 경우, 이벤트 참여 및 판촉 안내 등 서비스에 제한이 있을 수 있습니다.</p>
							                    <div>
								                    <ol>
									                    <li>
									                    <h3>수집항목</h3>
									                    • 가입사유, 직업<br>
									                    • 가구정보 [배우자 성명, 배우자 생년월일, 자녀 성명, 자녀 성별, 자녀 생년월일]<br>
									                    ※ 배우자 및 자녀의 개인정보는 이용자가 적법하게 이를 수집하였다는 것을 전제로 합니다.<br>
									                    • 마케팅 활동ㆍ이벤트 관련 정보[마케팅활동 내용 및 결과, 이벤트참여 내용 및 결과]<br>
									                    • 쿠폰/이벤트코드 보유 및 사용, 경품선택/수령결과<br>
									                    • 제휴사 및 제휴가맹점 관련정보 [제휴사명, 제휴사 회원번호, 제휴사 회원가입일, 이벤트 참여일, 제휴사 관련 혜택 및 마케팅활동 정보]<br>
									                    ※ 제휴사는 삼성전자와 고객에 대한 상품 및 서비스 안내 등과 관련하여 제휴 계약을 체결한 자를 의미합니다.<br>
									                    </li>
									                    <li>
									                    <h3>수집목적</h3>
									                    <table border="0" cellspacing="0" cellpadding="0" class="header_h">
										                    <colgroup>
											                    <col style="width:50%">
											                    <col style="width:50%">
										                    </colgroup>
										                    <tbody><tr>
											                    <td><p align="center">구분</p></td>
											                    <td><p align="center">자세한내용</p></td>
										                    </tr>
										                    <tr>
											                    <td><p align="center">⑤ 마케팅에 활용<br>(선택항목에 한함)</p></td>
											                    <td><p align="left">• 당사 및 제휴사의 상품ㆍ서비스, 사은ㆍ판촉행사, 이벤트 등의 마케팅 활동 안내 및 이용권유 (SMS·DM·TM·Email, Push-mail, 푸쉬메시지 발송)<br>
											                    • 고객에 대한 맞춤형 서비스, 편의 제공 및 이벤트 경품배송<br>
											                    • 시장조사, 고객만족도조사, 상품ㆍ서비스 개발연구, 고객별 통계분석자료 활용<br>
											                    </p></td>
										                    </tr>
									                    </tbody></table>
									                    </li>
						
									                    <li>
									                    <h3>보유 및 이용 기간</h3>
									                    회원의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다.<br>
									                    다만, 삼성전자는 관련법령의 규정에 의하여 개인정보를 보유할 필요가 있는 경우, 해당 법령에서 정한 바에 의하여 아래와 같이 개인정보를 보유할 수 있습니다.
									                    <table border="0" cellspacing="0" cellpadding="0" class="header_h">
										                    <colgroup>
											                    <col style="width:33%">
											                    <col style="width:13%">
											                    <col style="width:54%">
										                    </colgroup>
										                    <tbody><tr>
											                    <td><p align="center">보유 항목</p></td>
											                    <td><p align="center">보유기간</p></td>
											                    <td><p align="center">법적 근거</p></td>
										                    </tr>
										                    <tr>
											                    <td><p align="left">계약 또는 청약철회 등에 관련 기록</p></td>
											                    <td><p align="left">5년</p></td>
											                    <td><p align="left">전자상거래 등에서의 소비자보호에 관한 법률</p></td>
										                    </tr>
										                    <tr>
											                    <td><p align="left">대금결제 및 재화 등의 공급에 관한 기록</p></td>
											                    <td><p align="left">5년</p></td>
											                    <td><p align="left">전자상거래 등에서의 소비자보호에 관한 법률</p></td>
										                    </tr>
										                    <tr>
											                    <td><p align="left">소비자의 불만 또는 분쟁처리에 관한 기록</p></td>
											                    <td><p align="left">3년</p></td>
											                    <td><p align="left">전자상거래 등에서의 소비자보호에 관한 법률</p></td>
										                    </tr>
										                    <tr>
											                    <td><p align="left">신용정보의 수집/처리 및 이용 등에 관한 기록</p></td>
											                    <td><p align="left">3년</p></td>
											                    <td><p align="left">신용정보의 이용 및 보호에 관한 법률</p></td>
										                    </tr>
										                    <tr>
											                    <td><p align="left">표시/광고에 관한 기록</p></td>
											                    <td><p align="left">6개월</p></td>
											                    <td><p align="left">전자상거래 등에서의 소비자보호에 관한 법률</p></td>
										                    </tr>
										                    <tr>
											                    <td><p align="left">이용자의 인터넷 등 로그기록/ 이용자의 접속지 추적자료<br>그 외의 통신사실 확인 자료</p></td>
											                    <td><p align="left">3개월<br>12개월</p></td>
											                    <td><p align="left">통신비밀보호법</p></td>
										                    </tr>
									                    </tbody></table>
									                    </li>
                                                        <li>
                                                            <style>
                                                            .container{
                                                              position:relative;
                                                              display:block;

                                                            }
                                                            .cover{
                                                              width:100%;
                                                              height:100%;
                                                              background:transparent;
                                                              position:absolute;
                                                              z-index:2;
                                                              top:0;
                                                              left:0;
                                                              display:none;

                                                            }

                                                            .container.disable-checkbox .cover{
                                                              display:block;
                                                            }
                                                            </style>
                                                            (선택입력) 개인정보 유효기간 별도지정 요청<br /> 
                                                            정보통신망법 제29조 및 동법 시행령 제16조에서는, 정보통신망 서비스를 1년 동안 이용하지 않는 이용자의 개인정보를 파기 또는 분리저장ㆍ관리하도록 규정하고 있습니다. <br />
                                                            하지만 이용자는 수집된 개인정보를 파기 또는 분리저장ㆍ관리하여야 하는 개인정보 유효기간을 1년이 아니라 달리 설정할 것을 요청할 수 있습니다. <br />
                                                            <br/>개인정보 유효기간을<br/>
                                                            <div class="input_b size_sm type1" style="margin: 10px 0 0px 21px;">
										                        <div class="ez-checkbox">
											                        <div class="ez-checkbox"><div class="ez-checkbox"><input name="chkChoiceAgreementForSamSungChoiceYearlData" type="checkbox" id="Checkbox1" value="Y" class="ez-hide agreement-samsung" runat="server"  onclick="checkSelectAll(this);"></div></div>
										                        </div>
										                        <label for="chkChoiceAgreementForSamSungChoiceYearlData" style="font-size: 14px;">삼성전자멤버십 탈퇴 시까지</label>
                                                                  <span class="container disable-checkbox"><div class="cover"></div><input type="checkbox" id="Checkbox2"  class="ez-hide" runat="server" disabled="disabled">5년  <input type="checkbox" id="Checkbox3"  class="ez-hide" runat="server">3년  <input type="checkbox" id="Checkbox4" class="ez-hide" runat="server">1년 으로 요청합니다.</span>
									                        </div>
                                                        </li>

								                    </ol>
							                    </div>
							
						                    </div>
						                <!-- / policy영역 -->
					                </div>
					                <!-- / 약관box -->
				                </div>
				                <!-- / 삼성전자 선택적인 개인정보 수집 이용 동의 -->

				                <!-- 삼성전자 개인정보 제3자 제공 동의 -->
				                <div class="term_b">
					                <h2><div class="input_b size_sm type1"><div class="ez-checkbox"><input type="checkbox" name="chkChoiceAgreementForSamSungThirdParty" id="chkChoiceAgreementForSamSungThirdParty" value="Y" class="ez-hide agreement-samsung"  runat="server"  onclick="checkSelectAll(this);"></div><label for="chkChoiceAgreementForSamSungThirdParty">삼성전자 멤버십 개인정보 제3자 제공 <span>(선택)</span></label></div></h2>

					                <!-- 약관box -->
					                <div class="txt_a txt_a_new" style="width: 95%;border: 0;">
						                <!-- policy영역 -->
						                <div class="policy_a">
							                    <h3>개인정보 제3자 제공 동의</h3>
							                    <br>삼성전자는 수집된 개인정보를 이용자의 동의가 있는 경우에 한하여 아래와 같이 제3자에 제공하고 있습니다. 귀하께서는 귀하의 개인정보를 제3자에게 제공하는 것에 대한 동의를 거부하실 수 있으나, 동의를 거부하실 경우 이벤트 소식 안내 및 참여, 혜택 적용, 판촉 안내 등 서비스에 제한이 있을 수 있습니다.<br>
							                    <table border="0" cellspacing="0" cellpadding="0" class="header_h">
								                    <colgroup>
									                    <col style="width:20%">
									                    <col style="width:40%">
									                    <col style="width:20%">
									                    <col style="width:20%">
								                    </colgroup>
								                    <tbody><tr>
									                    <td><p><strong>제공받는 자의 명칭 </strong></p></td>
									                    <td><p><strong>제공되는 개인정보 </strong></p></td>
									                    <td><p><strong>제공받는 자의 이용목적 </strong></p></td>
									                    <td><p><strong>보유 및 이용기간 </strong></p></td>
								                    </tr>
								                    <tr>
									                    <td><p align="left">-&nbsp; 삼성전자판매㈜, 삼성전자 대리점 <br>
											                    &nbsp;&nbsp;(<a href="http://www.samsung.com/sec/support/location/supportServiceLocation.do?page=SHOP.LOCATION" target="_blank" title="새창띄움">목록보기</a>) </p>
										                    <ul>
											                    <li>※ 대리점 리스트가 추가 또는 변경되는 경우, 목록보기에 반영됩니다. (삼성판매 및 대리점의 경우, 고객께서 해당 매장에서 멤버십카드 발급, 구매상담, 제품 구입한 경우에 한하여 고객의 개인정보가 제공됩니다.)</li>
										                    </ul>
										                    <p align="left">-&nbsp; 홈플러스주식회사, 홈플러스테스코주식회사, 이마트, 백화점 (롯데, 현대, 신세계, 갤러리아, AK, 동아, 대구 등), 홈쇼핑, 온라인쇼핑몰 등 제휴 거래선</p>
										                    <p align="left">※ 삼성전자 지정매장은 신규 또는 해지 등 계약 변경에 따라 변경될 수 있으며, 멤버십홈페이지 등을 통해 확인할 수 있습니다.</p>
										                    </td>
									                    <td><p align="left">ㆍ이름, 본인인증기관으로부터의 인증결과값<br>
											                    (CI:Connecting Information), 이메일주소(ID), 생년월일, 성별, 우편번호, 주소, 휴대전화번호<br>
											                    ㆍ결혼 관련 정보 [결혼(예식)예정일, 예식장정보, 구매예정제품], 이사 관련 정보 [이사예정일, 이사예정평수, 구매예정제품, 이벤트신청일], 출산 관련 정보 [출산예정일, 임신 개월수, 자녀 수, 자녀 나이, 구매예정 및 관심제품, 이벤트 신청일]<br>
											                    ※ 단, 결혼/이사/출산 관련 제휴처에서 가입하는 고객에 한하여 제공합니다.<br>
											                    ㆍ재화ㆍ용역 구매정보 [구매품목 및 모델ㆍ서비스명, 구입처, 구입일시, 구입가격/수량, 제조번호, 상담내역]<br>
											                    ㆍ포인트거래정보 [포인트카드정보, 포인트적립·사용액, 적립·사용내역, 적립·사용일시, 적립·사용처]<br>
											                    ㆍ플러스 페이 결제일, 플러스 페이 신용카드 종류, 결제카드정보<br>
											                    ※ 단, 플러스 페이 신청 고객에 한하여 제공합니다.<br>
											                    ㆍ멤버십 무상SVC연장 대상 여부, 무상SVC연장 만료월, 무상SVC부족구매기한, 부족액<br>
											                    ㆍ프리미엄 등급, 예상상위등급, 구매기한, 부족액<br>
											                    ㆍ콜센터 상담 내역 및 상담 결과 [문의 일시, 내용 및 아웃바운드 TM 접촉, 내용]<br>
											                    ㆍ서비스 수리 관련정보[수리모델명, 수리일자, 수리내용, 수리비용, 제조번호, 수리결과, 상담내역 ]<br>
											                    ㆍ배송ㆍ이전설치 관련정보 [배송ㆍ이전설치모델명, 배송ㆍ이전 설치일자, 구매자명, 구매자(휴대)전화번호, 구매자 주소, 인수자 (휴대)전화번호, 인수자 주소, 배송ㆍ이전 설치 내용, 배송ㆍ이전설치결과, 제조번호<br>
											                    ㆍ폐가전 관련정보 [폐가전 회수일시, 회수품목, 회수대수]<br>
											                    ㆍ콜센터 상담 내역 및 상담 결과 [문의 일시, 내용 및 아웃바운드 TM 접촉, 내용]<br>
											                    ㆍ가구정보 [자택전화번호, 반려동물 동거 여부 및 종류]<br>
											                    ㆍ직업 [직장 전화번호, 결혼여부, 선호 매장]<br>
											                    ㆍ관심 제품 고객 조사 결과<br>
											                    ㆍ마케팅 활동ㆍ이벤트 관련 정보 [마케팅활동 내용 및 결과, 이벤트참여 내용 및 결과]<br>
											                    ㆍ제휴사 및 제휴가맹점 관련정보 [제휴사명,  제휴사 회원번호, 제휴사 회원가입일, 이벤트 참여일, 제휴사 관련 혜택 및 마케팅활동 정보]<br>
											                    ※ 제휴사는 삼성전자와 고객에 대한 상품 및 서비스 안내 등과 관련하여 제휴 계약을 체결한 자를 의미합니다.</p></td>
									                    <td><p>ㆍ 상품·서비스, 사은·판촉행사, 이벤트 등의 마케팅 활동 안내 및 이용권유<br>
											                    ㆍ 시장조사, 고객만족도조사, 상품·서비스 개발연구, 고객별 통계분석자료 활용<br>
											                    ㆍ 회원유치, 통신판매, 전화권유판매, 전화상담업무, SMS·DM·TM·E-mail·Push-mail 발송<br>
											                    ㆍ TM·SMS·DM·E-mail·Push-mail 등을 통한 사은행사 안내</p></td>
									                    <td><p>제공 동의일로부터 개인정보의 제공 목적을 달성할 때까지</p></td>
								                    </tr>
								                    <tr>
									                    <td><p align="left">-&nbsp;고객이 사용하는<br>
											                    &nbsp;&nbsp;카드사<a href="http://membership.samsung.com/sec/lnc/KoJointMemAgreementPop" onclick="window.open(this.href, 'mywin','left=20,top=20,width=800,height=350,toolbar=1,resizable=0'); return false;">(목록보기)</a> </p></td>
									                    <td><p align="left">ㆍ 구입일시, 구입가격, 결제수단정보, 결제카드정보 <br>
											                    ※ 고객이 결제카드의 금융혜택 신청 시, 신청 건에 한하여 해당 결제 카드사에만 제공합니다.</p></td>
									                    <td><p>ㆍ 금융 프로그램 적용 </p></td>
									                    <td><p>제공 동의일로부터 개인정보의 제공 목적을 달성할 때까지 </p></td>
								                    </tr>
								                    <tr>
									                    <td valign="top"><p align="left">-&nbsp;㈜홀리스트, ㈜케이티씨에스, ㈜LG유플러스, ㈜청호나이스</p></td>
									                    <td valign="top"><p align="left">ㆍ 이름, 주소, 휴대전화번호, 제휴업체의 서비스 신청상품명, 설치 요청일, 본인인증기관으로부터의 인증결과값<br>
											                    &nbsp;&nbsp;(CI:Connecting Information)</p></td>
									                    <td valign="top"><p align="left">ㆍ 제휴업체의 서비스 가입시 추가 포인트 제공</p></td>
									                    <td valign="top"><p align="left">이용 목적 달성시까지</p></td>
								                    </tr>
							                    </tbody></table>
							
						                    </div>
						                <!-- / policy영역 -->
					                </div>
					                <!-- / 약관box -->
				                </div>
				                <!-- / 삼성전자 개인정보 제3자 제공 동의 -->
                            </div>

			            </div>
                    </div>
			        <!-- / 삼성전자 동의 -->

                    <!--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     20200702 회원약관 LG 추가     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-->

					 <!-- LG 전자 동의 -->
					 <div id="wrapLGAgreement" class="samsung_s" runat="server">

							<h2 style="overflow: hidden;text-align: left;	margin: 19px 0 13px 5px;">
								<div class="input_b size_sm type1">
									<div class="ez-checkbox">
										<div class="ez-checkbox"><div class="ez-checkbox"><input name="chkChoiceAgreementForLGMembershipALL" type="checkbox" id="chkChoiceAgreementForLGMembershipALL" value="Y" class="ez-hide agreement-lg"  runat="server"></div></div>
									</div>
									<label for="chkChoiceAgreementForLGMembershipALL" style="position:absolute;margin: 0 0 0 2px;">LG전자 멤버십 전체 이용 약관 동의<span>(선택)</span></label>
								</div>
							</h2>
	
							<!-- / LG전자 전체 동의 그룹-->
							<div style="width: 99%; margin: 0 auto; border: 1px solid #ddd; background: #f9f9f8; height: 85px; overflow-y: scroll; overflow-x: hidden;">
	
								<!-- LG전자 멤버십 회원 이용 약관 -->
								<div class="term_b" style="float:left; width:100%;">
									<div class="input_b size_sm type1" style="margin: 10px 0 -6px 0px;">
										<div class="ez-checkbox">
											<div class="ez-checkbox"><div class="ez-checkbox"><input name="chkChoiceAgreementForLGMembership" type="checkbox" id="chkChoiceAgreementForLGMembership" value="Y" class="ez-hide agreement-lg"  runat="server"></div></div>
										</div>
										<label for="chkChoiceAgreementForLGMembership" style="font-size: 14px;">LG전자 멤버십 회원 이용약관 <span>(선택)</span></label>
									</div>
									<!-- 약관box -->
									<div class="txt_a txt_a_new" style="width: 94%; border:1px solid #f9f9f8; ">
										<!-- policy영역 -->
										<div class="policy_a">
												<h3 style="padding: 7px 0 7px 0;">제1조 (목적)</h3>
												본 약관은 엘지전자 주식회사(이하 '회사')가 운영하는 LG전자 멤버십 서비스의 이용과 관련한 제반 사항을 명확히 규정함으로써, 회원에 대한 고객서비스의 증진과 회원의 제반 권리 · 의무 및 관련 절차 등을 규정하는데 그 목적이 있습니다. 
												<h3>제2조 (용어의 정의)</h3>
												<ol>
													<li>본 약관에서 사용하는 용어의 정의는 다음과 같습니다.</li>
													<li>1. “LG전자 멤버십 서비스”(이하 ‘멤버십 서비스’)란 회원이 제품 구매 시 회사에서 규정한 기준에 따라 일정액을 멤버십 포인트로 환산하여 적립하며, 제품구매, 케어솔루션 요금 납부, A/S 비용 납부 등의 각종 서비스를 제공 받을 수 있도록 하는 포인트 서비스를 말합니다.</li>
													<li>2. “LG전자 멤버십 회원”(이하 '회원')이란 만14세 이상이며, 회사에게 회원 가입의사를 밝히고, 회사가 이를 승인하여 멤버십 카드를 발급함으로써 멤버십 서비스에 가입한 개인을 말합니다.</li>
													<li>3. “멤버십 서비스 가맹점”(이하 '가맹점')이란 회사와 적법한 방법과 절차에 따라 멤버십 서비스 가맹계약을 체결하여 제반 서비스를 공동으로 운영하기로 합의한 사업자를 의미합니다.</li>
													<li>
														<table border="0" cellspacing="0" cellpadding="0" class="header_h">
															<colgroup>
																<col style="width:30%">
																<col style="width:70%">
															</colgroup>
															<tbody>
																<tr>
																	<td><p align="center">구분</p></td>
																	<td><p align="center">멤버십 서비스 가맹점</p></td>
																</tr>
																<tr>
																	<td><p align="center">오프라인 매장</p></td>
																	<td><p align="center">베스트샵 등</p></td>
																</tr>
																<tr>
																	<td><p align="left">온라인몰</p></td>
																	<td><p align="left">LG전자 베스트샵 온라인몰 (www.lgbestshopmall.co.kr)</p></td>
																</tr>
															</tbody>
														</table>
													</li>
													<li>구체적인 가맹점 현황은 회사 및 가맹점의 사정에 따라 변경될 수 있으며, 회사는 현황 및 변경 사항을 회사의 대표사이트(www.lge.co.kr)를 통하여 공개합니다.</li>
													<li>4.“ 멤버십 포인트”란 회원이 가맹점에서 상품 구매 시 회사가 정한 기준에 따라 적법하게 부여 받은 포인트를 말합니다.</li>
												</ol>


												<h3>제 3 조 (이용계약의 성립)</h3>
												<ol>
													<li>1. 이용계약은 회원이 가맹점에서의 회원 가입신청서 작성 및 회사 대표사이트에서의 회원가입 시 본 약관 동의를 통해 가입신청의사를 밝힌 후 회사가 이를 승낙함으로써 성립합니다.</li>
													<li>2. 회사는 가입신청자의 신청에 대하여 서비스 이용을 승낙함을 원칙으로 합니다. 다만, 회사는 다음 각 호에 해당하는 신청에 대하여는 승낙을 하지 않거나 사후에 다음 각 호의 사유가 발생된 경우 회원에 대한 통지로 이용계약을 해지할 수 있습니다.</li>
													<li>① 가입신청자가 본 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우. 다만, 회원자격 상실 후 1년이 경과한 자로서 회사의 회원 재가입 승낙을 얻은 경우에는 예외로 함.</li>
													<li>② 회원가입시에 실명이 아니거나 타인의 명의를 이용한 경우</li>
													<li>③ 회원가입시에 허위의 정보를 기재하거나, 회사가 제시하는 내용을 기재하지 않은 경우</li>
													<li>④ 가입신청자가 만 14세 미만의 아동인 경우</li>
													<li>⑤ 이용자의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우</li>
													<li>3. 회사는 회원가입 시 본인확인과 기존 가입여부 확인을 위해 휴대폰 인증 등의 방법으로 실명확인 또는 본인인증을 요청할 수 있습니다.</li>
													<li>4. 회사는 회원에 대해 회사정책에 따라 등급별로 구분하여 서비스 내용에 차등을 둘 수 있습니다. 회원 등급에 따른 서비스 내용은 대표사이트에(www.lge.co.kr) 별도 안내할 예정입니다.</li>
												</ol>


												<h3>제 4 조 (회원정보의 변경)</h3>
												<ol>
													<li>1. 회원은 언제든지 서면, 전자우편, 전화(1544-7777), 대표사이트(www.lge.co.kr), 기타 개인정보 처리방침에 기재된 방법 등을 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다.</li>
													<li>2. 회원은 회원가입신청 시 기재한 사항이 변경되었을 경우 전항의 방법으로 회사에게 통지하여야 하며, 통지하지 아니하여 발생하는 불이익에 대해서는 회사가 책임을 지지 않습니다.</li>
												</ol>

												<h3>제 5 조 (회원의 의무)</h3>
												<ol>
													<li>1. 회원은 본 약관에서 규정하는 사항과 이용안내 또는 공지사항 등을 통하여 회사가 공지하는 사항을 준수하여야 하며, 회사의 업무에 방해되는 행위를 하여서는 안됩니다.</li>
													<li>2. 회원은 회사가 제공한 멤버십 서비스, 멤버십 포인트, 기타 멤버십 서비스가 제공하는 혜택을 이용하여 영업 활동을 할 수 없습니다.</li>
													<li>3. 회원은 멤버십 서비스의 이용권한, 보유하고 있는 멤버십 포인트, 기타 이용 계약상 지위를 타인에게 양도 또는 증여할 수 없으며, 이를 담보로 제공할 수 없습니다. 단, 포인트 선물하기 서비스를 이용하는 경우는 제외합니다.</li>
													<li>4. 회원이 전항을 위반한 경우 양도∙증여∙담보 제공한 멤버십 포인트는 소멸 처리되고, 회원은 멤버십 서비스에 따라 제공받은 혜택을 반환하여야 합니다.</li>
												</ol>

												<h3>제 6 조 (멤버십 포인트의 적립)</h3>
												<ol>
													<li>1. 회원은 가맹점에서 상품을 구매하거나 서비스를 이용할 경우 멤버십 카드를 제시하여 대금결제금액에 따라 정해진 멤버십 포인트를 적립 받을 수 있습니다. 단, 온라인몰 구매는 ‘LG전자 베스트샵 온라인몰 (www.lgbestshopmall.co.kr)’ 구매에 한해서만 적용됩니다. 이외의 온라인 구매 건 및 납품판매 건은 적립대상에서 제외됩니다.</li>
													<li>2. 회원은 멤버십 모바일 앱의 포인트 선물하기 기능을 사용하여 멤버십 회원간 합의에 따라 선물이 가능한 보유 포인트 내에서 1,000포인트 단위 또는 보유 포인트 전체를 주고 받을 수 있습니다.</li>
													<li>멤버십 포인트는 회원이 상품대금 결제 후 상품 배송이 완료된 때로부터 7일이 경과된 날에 적립됩니다. 단, 포인트 선물하기 서비스로 선물 받은 멤버십 포인트는 즉시 적립됩니다.</li>
													<li>회원이 구입한 상품의 구매를 취소한 경우 해당 멤버십 포인트의 적립은 취소되며, 만일 회원이 적립된 멤버십 포인트를 이미 사용하였거나 포인트 선물하기 서비스로 선물한 경우에는 사용 또는 선물한 멤버십 포인트에 상당하는 금원을 별도로 회사에 지급하여야 합니다.</li>
													<li>3. 멤버십 포인트 적립은 월 100만원, 년 200만원을 한도로 하며, 동일 행사 및 동일 모델에 대해서는 1건을 초과하여 적립할 수 없습니다.</li>
													<li>포인트 선물하기 서비스를 통한 멤버십 포인트 선물하기, 선물받기는 각 월 2회로 한정하며 금액에는 한도가 없습니다.</li>
													<li>4. 회사는 멤버십 포인트의 운영기준 및 적립률을 회사 대표사이트에 게시합니다. 적립률은 회사와 가맹점의 사정에 따라 조정될 수 있으며, 조정 시 본 약관 제15조 제1항의 방법에 의해 고지됩니다.</li>
												</ol>

												<h3>제 7 조 (멤버십 포인트의 사용)</h3>
												<ol>
													<li>1. 회원은 가맹점에서 상품 구매시 구매대금의 일부 또는 전부를 적립된 멤버십 포인트로 결제하거나, 회원이 회사와 케어솔루션 계약 또는 케어십 서비스 계약을 체결한 경우에는 케어솔루션 요금 또는 서비스 비용을 적립된 멤버십 포인트로 결제할 수 있습니다. 단, 멤버십 포인트 사용분에 대해서는 멤버십 포인트가 재적립되지 않습니다.</li>
													<li>멤버십 모바일 앱의 포인트 선물하기 기능을 사용하여 멤버십 회원간 합의에 따라 선물이 가능한 보유 포인트 내에서 1,000포인트 단위 또는 보유 포인트 전체를 주고 받을 수 있습니다</li>
													<li>2. 회원이 멤버십 포인트 사용 시 1멤버십 포인트는 1원으로 환산됩니다. 단, 회사는 환산비율을 변경할 수 있으며 변경 시에는 본 약관 제15조제1항의 방법으로 고지합니다.</li>
													<li>3. 회원은 가맹점에서 멤버십카드 제시 시 회사와 가맹점 사이에 체결한 계약 또는 업무협약에 따라 별도의 혜택을 받을 수 있습니다.</li>
												</ol>

												<h3>제 8 조 (멤버십 포인트의 정정, 취소 및 소멸)</h3>
												<ol>
													<li>1. 멤버십 포인트의 적립 및 사용에 오류가 있을 경우, 회원은 오류발생 시점부터 90일 이내에 회사에 정정 신청을 하여야 하며, 회사는 회원의 정정 신청일로부터 3개월 이내에 조정할 수 있습니다. 단, 회원은 오류를 증명할 수 있는 영수증 등 해당 자료를 회사에 제시하여야 합니다.</li>
													<li>2. 전항의 정정신청이 정당한 것으로 판명된 경우 회사는 오류 포인트를 정정하고 그 결과를 회원에게 통보합니다.</li>
													<li>3. 회원이 부당한 방법으로 멤버십 포인트를 적립, 사용한 경우 회사는 해당 멤버십 포인트의 적립을 취소할 수 있으며, 부당 사용부분에 대해서는 부당이득 반환 청구 또는 손해배상 청구를 할 수 있습니다.</li>
													<li>제2항에 따라 멤버십 포인트 적립 취소를 통보하는 경우 회원은 통보를 받은 날로부터 90일 이내에 서면으로 이의를 제기할 수 있으며, 기한 내에 이의가 없는 경우에는 회원이 멤버십 포인트 적립 취소에 동의한 것으로 봅니다.</li>
													<li>4. 대금 결제 또는 회사에서 운영하는 이벤트에 의해 적립된 멤버십 포인트의 사용기간은 적립일로부터 3년이며, 이 기간 내에 사용하지 않은 멤버십 포인트는 3년이 경과한 시점에 순차적으로 자동 소멸됩니다. 단, 회원의 자격은 계속 유지 됩니다.</li>
													<li>5. 회원간 합의에 의해 포인트 선물하기 기능을 통해 적립된 포인트의 사용기간은 본래 가지고 있던 포인트의 잔여 소멸기간에 상관없이 3년이며, 이 기간 내에 사용하지 않은 멤버십 포인트는 3년이 경과한 시점에 순차적으로 자동 소멸 됩니다. (단, 회원의 자격은 계속 유지됩니다)</li>
												</ol>
												
												<h3>제 9 조 (멤버십카드의 이용 및 관리)</h3>
												<ol>
													<li>1. 멤버십카드는 회원 본인이 직접 사용하여야 하며, 타인에게 대여하거나 양도 또는 담보의 목적으로 이용할 수 없습니다.</li>
													<li>2. 멤버십카드는 회원 스스로의 책임하에 관리하여야 하며, 회원의 고의 또는 과실로 멤버십카드가 훼손, 분실, 도단 등의 사고가 발생한 경우, 회원은 즉시 그 사실을 회사에 통지하여야 합니다.</li>
													<li>3. 회원으로부터 전항에 따른 통지를 받은 경우, 회사는 즉시 사고 등록 및 당해 멤버십카드의 사용을 중지하는 등의 필요한 제반 조치를 취합니다. 단, 회사는 당해 회원이 전항에 따른 통지를 한 시점 이전에 발생한 손해에 대해서는 회사의 고의∙과실이 없는 경우 어떠한 책임도 지지 않습니다.</li>
												</ol>

												<h3>제 10 조 (멤버십 서비스 중지 및 종료)</h3>
												<ol>
													<li>1. 회사는 본 약관에서 정하는 바에 따라 계속적이고 안정적인 멤버십 서비스의 제공을 위하여 지속적으로 노력하며, 설비에 장애가 생기거나 멸실 된 때에는 지체 없이 이를 수리 복구하여야 합니다. 다만, 천재지변, 비상사태 또는 그 밖에 부득이한 경우에는 멤버십 서비스를 일시 중지하거나 종료할 수 있습니다.</li>
													<li>2. 멤버십 서비스를 종료하고자 할 경우 회사는 멤버십 서비스를 종료하고자 하는 날로부터 3개월 이전에 본 약관 제15조 제1항에 규정된 통지방법을 준용하여 회원에게 알려드립니다.</li>
													<li>3. 서비스 종료일까지 사용하지 않은 멤버십 포인트는 자동으로 소멸됩니다.</li>
												</ol>

												<h3>제 11 조 (LG전자 VIP회원)</h3>
												<ol>
													<li>1. 회사는 회사가 정한 기준에 따라 매년 LG전자 VIP회원(이하 “VIP회원”)을 선정하며, VIP회원으로 선정된 회원은 당해 년도에 한해 VIP카드와 함께 회사가 제공하는 각종 VIP 서비스를 제공받을 수 있습니다.</li>
													<li>2. VIP회원의 선정기준은 회사의 내부 기준에 따라 매년 변경되며, VIP회원 선정 기준, 등록방법 및 카드 교체방법은 본 약관 제15조 제1항에 규정된 통지방법을 준용하여 회원에게 알려드립니다.</li>
													<li>3. VIP회원에 대한 혜택은 본 약관 제15조 제1항에 규정된 통지방법을 준용하여 통지되며, 본 혜택은 회사 사정에 따라 변경될 수 있습니다.</li>
												</ol>

												<h3>제 12 조 (회원탈퇴 및 자격상실/계약해지)</h3>
												<ol>
													<li>1. 회원은 언제든지 서면, E-MAIL, 전화, 대표사이트, 기타 회사가 정하는 방법으로 회원탈퇴를 요청할 수 있으며, 회사는 회원의 요청에 따라 조속히 회원 탈퇴에 필요한 제반절차를 수행합니다. 단, 회사 대표사이트를 통하여 회원으로 가입한 경우, 회사 대표사이트 내 회원 탈퇴는 별도로 회사 대표사이트에서 직접 탈퇴신청을 하여야 탈퇴절차가 완료됩니다.</li>
													<li>2. 회원이 다음 각 호의 사유에 해당하는 경우, 회사는 당해 회원에 대한 통보로서 회원의 자격을 상실(또는 계약 해지)시킬 수 있습니다.</li>
													<li>① 회원이 멤버십카드 가입 신청 시에 허위의 내용을 등록한 경우</li>
													<li>② 회원이 본 약관 제5조의 회원의 의무를 위반했을 경우</li>
													<li>③ 회원이 회사가 정하지 않은 방법으로 멤버십카드를 부정 발급하거나, 멤버십카드서비스와 포인트를 부정한 방법으로 사용 및 적립한 경우</li>
													<li>3. 회원이 사망한 경우에는 별도의 통보 없이 자격이 상실됩니다.</li>
													<li>4. 본 조 제2항의 사유로 회원 자격이 상실된 회원은 본 조 제2항 각호의 사유가 자신의 고의 또는 과실에 기한 것이 아님을 소명할 수 있습니다. 이 경우 회사는 회원의 소명 내용을 심사하여 회원의 주장이 타당하다고 판단하는 경우 회원으로 하여금 정상적으로 멤버십 서비스를 이용할 수 있도록 할 수 있습니다.</li>
													<li>5. 회원탈퇴 또는 자격의 상실이 확정될 경우, 그 때까지 사용하지 않은 잔여 멤버십 포인트는 함께 소멸됩니다.</li>
												</ol>


												<h3>제 13 조 (손해배상)</h3>
												<ol>
													<li>1. 회사와 회원은 본 약관의 규정을 위반함으로 인하여 상대방에게 손해가 발생한 경우, 발생한 모든 손해를 배상하여야 합니다.</li>
													<li>2. 회원이 멤버십 서비스를 이용함에 있어 행한 불법행위나 본 약관 위배행위로 인하여 회사가 회원 이외의 제3자로부터 손해배상 청구 또는 소송을 비롯한 각종 이의제기를 받은 경우 회원은 자신의 책임과 비용으로 회사를 면책시켜야 하며, 회사가 면책되지 못한 경우 당해 회원은 그로 인하여 회사에 발생한 모든 손해를 배상하여야 합니다.
												</ol>

												<h3>제 14 조 (면책사항)</h3>
												<ol>
													<li>1. 회사는 천재지변 또는 이에 준하는 불가항력으로 인하여 멤버십 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.</li>
													<li>2. 회사는 회원의 귀책사유로 인한 서비스 이용의 장애에 대하여 책임을 지지 않습니다.</li>
													<li>3. 회사는 회원이 서비스를 이용하여 기대하는 수익을 상실한 것이나 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않습니다.</li>
													<li>4. 회사는 서비스 이용과 관련하여 회원에게 발생한 손해 가운데 회원의 고의, 과실에 의한 손해에 대하여 책임을 지지 않습니다.</li>
													<li>포인트 선물하기 서비스는 LG전자 멤버십 서비스를 이용하시는 회원님께 다양한 혜택을 드리기 위하여 제공하는 서비스로 시스템 오류를 제외한 포인트 선물하기에 따른 회원간 분쟁 또는 잘못된 정보 입력에 따른 선물하기 오류에 대해서는 책임을 지지 않습니다.</li>
												</ol>

												<h3>제 15 조 (서비스의 변경 및 약관개정)</h3>
												<ol>
													<li>1. 멤버십 서비스의 내용이 변경되거나 본 약관을 개정하고자 할 경우 회사는 변경된 서비스 또는 개정된 약관을 적용하고자 하는 날(이하“효력발생일”)로부터 7일 이전에 약관이 개정된다는 사실과 개정된 내용 등을 E-MAIL, 서면, 가맹점 내 게시, SMS 통지, 회사 인터넷 홈페이지 게시 중 1가지 이상의 방법으로 회원에게 고지하여 드립니다. 다만, 회원에게 불리하게 약관내용을 변경하는 경우에는 최소한 30일 이상의 사전 유예기간을 두고 공지합니다.</li>
													<li>2. 회사가 E-MAIL 통보 또는 서면통보의 방법으로 본 약관이 개정된 사실 및 개정된 내용을 회원에게 고지하는 경우에는 회원이 회사에 기 제공한 E-MAIL이나 주소지 중 가장 최근에 제공된 E-MAIL 또는 주소지로 통보합니다.</li>
													<li>3. 본 조의 규정에 의하여 개정된 약관(이하“개정약관”)은 원칙적으로 그 효력 발생일로부터 장래를 향하여 유효합니다.</li>
													<li>4. 본 약관의 개정과 관련하여 이의가 있는 회원은 회원탈퇴를 할 수 있습니다. 단, 이의가 있음에도 불구하고 본 조 제1항 내지 제2항에 정해진 바에 따른 회사의 고지가 있은 후 30일 이내에 회원탈퇴를 하지 않은 회원은 개정 약관에 동의한 것으로 봅니다.</li>
													<li>5. 회원이 개정약관의 적용에 동의하지 않는 경우 회사는 개정 약관의 내용을 적용할 수 없으며, 이 경우 회사 및 회원은 이용계약을 해지할 수 있습니다.</li>
												</ol>

												<h3>제 16 조 (약관에서 정하지 아니한 사항)</h3>
												<ol>
													<li>본 약관에서 정하지 아니한 사항과 본 약관의 해석에 관하여는 관계법령 및 상관례에 따릅니다.</li>
												</ol>
												
												<h3>제 17 조 (관할법원)</h3>
												<ol>
													<li>본 약관에 따른 분쟁의 해결은 회원과 회사가 상호 협의하여 결정하며, 합의가 이루어지지 않을 경우 대한민국 민사소송법의 관할조항에 의한 관할법원에서 해결합니다.</li>
												</ol>

												<h3>[부칙]</h3>
												<ol>
													<li>본 약관은 2020년 4월 20일부터 시행합니다.</li>
												</ol>
											</div>
										<!-- / policy영역 -->
									</div>
									<!-- / 약관box -->
						
								</div>
								<!-- / LG전자 멤버십 회원 이용 약관 -->
								
								<!-- LG전자 개인정보 수집 이용 동의 -->
								<div class="term_b">
									<h2><div class="input_b size_sm type1"><div class="ez-checkbox"><div class="ez-checkbox"><div class="ez-checkbox"><input name="chkChoiceAgreementForLGChoicePersonalData" type="checkbox" id="chkChoiceAgreementForLGChoicePersonalData" class="ez-hide agreement-lg"  runat="server"></div></div></div><label for="chkChoiceAgreementForLGChoicePersonalData">LG전자 멤버십 개인정보 처리방침<span>(선택)</span></label></div></h2>
	
									<!-- 약관box -->
									<div class="txt_a txt_a_new" style="/* background: #fff; */width: 95%;border: 0;">
										<!-- policy영역 -->
										<div class="policy_a">
											LG전자(이하“회사”라 함)은 「정보통신망이용촉진 및 정보보호 등에 관한 법률」 및 「개인정보보호법」을 비롯한 모든 개인정보보호 관련 법률 및 규정을 준수하고 있으며 회사의 개인정보 처리방침을 별도로 제정하고 이를 준수함으로써 고객의 개인정보를 보호하고 있습니다. 회사는 개인정보 처리방침을 통하여 고객님의 개인정보가 어떠한 목적과 방식으로 수집ㆍ이용되고 있으며, 고객님의 개인정보보호를 위해 회사가 어떠한 조치를 취하고 있는지 알려드립니다.
											본 개인정보 처리 방침은 관련 법령의 개정이나 회사의 정책에 의해 변경될 수 있으므로 회사의 멤버십 사이트(https://www.lge.co.kr/lgekr/membership)나 매장 방문 이용 시에 수시로 확인하여 주시기 바랍니다.	
											<ol>
												<li>
													<h3>1. 처리하는 개인정보의 항목</h3>
													<h3>가. 수집하는 개인정보 항목</h3>
													<ol>
														<li>• 제품 구매계약서(고객주문서 또는 판매전표 등)</li>
														<li>- 계약자 수집 필수 항목 : 성명, 연락처(유선/휴대폰), 주소</li>
														<li>- 인수자 수집 필수 항목 : 성명, 연락처(유선/휴대폰), 주소</li>
													</ol>
													<ol>
														<li>• LG전자 멤버십 가입 신청서</li>
														<li>- 필수항목 :성명, 주소, 전화번호, 휴대폰번호, 성별, 내/외국인 구분, 통신사, 본인확인정보(CI/DI), 멤버십ID, 멤버십 카드번호, 멤버십 포인트</li>
														<li>- 선택항목 :고객관심활동, 결혼여부, 고객구분</li>
													</ol>
													<ol>
														<li>• 모바일 LG전자 멤버십 가입 신청</li>
														<li>- 필수 항목 : 성명, 주소, 휴대폰번호, 생년월일, 성별, 내/외국인 구분, 통신사, 본인확인정보(CI/DI), 멤버십ID, 멤버십 카드번호, 멤버십 포인트</li>
														<li>- 선택 항목 : 고객구분</li>
														<li>※ LG전자 멤버십 앱 이용시 : "단말모델정보"</li>
													</ol>
													<ol>
														<li>• BEST SHOP 매장 상담 신청</li>
														<li>- 필수 항목 : 성명, 휴대폰번호</li>
													</ol>
													<ol>
														<li>• 웨딩클럽 모바일 멤버십 가입 신청</li>
														<li>- 필수 항목 : 성명, 주소, 휴대폰번호, 생년월일, 성별, 내/외국인 구분, 통신사, 본인확인정보(CI/DI), 결혼예정일, 멤버십ID, 멤버십 카드번호, 멤버십 포인트</li>
													</ol>
													<ol>
														<li>• 케어솔루션 계약서</li>
														<li>- 필수 항목 : 임차인 수집 항목: 성명, 연락처, 주소, 우편번호, 이메일, 신용카드/결제정보, 고유식별Key값, 본인확인정보(CI/DI) 인수자 수집 항목: 성명, 연락처(유선/휴대폰), 설치처 주소 제품</li>
													</ol>
													<ol>
														<li>• 구매/결제 또는 케어솔루션 계약 체결시 아래와 같은 결제정보들이 수집될 수 있습니다. (필수 항목)</li>
														<li>- 신용카드 결제 시: 카드사명, 카드번호, 유효기간</li>
														<li>- 계좌이체시: 은행명, 계좌번호, 정기출금일</li>
														<li>- 사은품 이용시: 주소, 전화번호</li>
													</ol>
													<ol>
														<li>• 제품구매 시 유료 서비스 이용 과정에서 아래와 같은 결재 정보들이 수집될 수 있습니다. (필수 항목)</li>
														<li>- 신용카드 결제 시: 카드사명, 카드번호, 카드소유자명, 유효기간</li>
														<li>- 휴대전화 결제 시: 이동전화번호, 통신사, 가입자 이름, 결제승인번호</li>
														<li>- 계좌이체 시: 은행명, 계좌번호, 예금주명, 정기출금일</li>
														<li>- 사은품 이용 시: 주소, 전화번호, 성명</li>
													</ol>
													<ol>
														<li>• VIP 멤버십 가입 신청서</li>
														<li>- 필수 항목 : 성명, 전화번호, 핸드폰, 주소, 생년월일</li>
													</ol>
													<ol>
														<li>• 경품/이벤트 응모권</li> 
														<li>- 필수 항목 : 성명, 주소, 전화번호, 휴대폰번호</li>
													</ol>
													<ol>
														<li>• LG전자 멤버십 가입 기간 내 BEST SHOP 매장에서의 제품 구매 정보, 멤버십 포인트의 적립/사용/소멸에 관한 정보, 사은품/캐시백 지급 정보, 판촉 실행 및 결과 정보</li>
														<li>※ 개인정보 수집 시 필수 항목의 수집ㆍ이용에 대한 동의를 거부하실 수 있으며, 동의를 거부하실 경우 서비스 이용이 제한 될 수 있습니다. 선택 항목의 수집ㆍ이용 동의를 거부 하실 경우에는 서비스 이용은 제한되지 않습니다.</li>
													</ol>

													<h3>나. 개인정보 수집방법 </h3>
													<ol>
														<li>서면양식, 전화, 팩스, 웹사이트, 모바일, 이벤트 참여를 통한 수집, 로그 분석 프로그램을 통한 자동 로그 수집, 제휴사로부터의 제공 등 이용자의 개인정보 수집은 적법하고 공정한 방법에 의해서만 수집되며 회사의 업무 서비스 제공 外, 기타 업무 목적으로는 수집ㆍ이용하지 않습니다.</li>
													</ol>	
												</li>
												<li>
													<h3>2. 처리하는 개인정보의 목적</h3>
													<ol>
														<li>회사는 구매계약, 서비스 계약, 회원 확인, 케어솔루션 계약 체결 및 유지판단 여부를 위한 신용정보조회 및 신용판단, 제품배송/설치, 유지보수, 콜센터 상담운영, 자동납부 및 요금정산업무, 이용대금 결제, 제품 마케팅/판촉업무(신상품, 이벤트 안 내, 경품 배송) 및 통계 분석을 통한 마케팅 자료로써 고객의 취향에 맞는 최적의 서비스를 제공하기 위한 목적으로 필요한 최소한의 고객 개인정보만을 수집 이용하고 있습니다. 수집하는 개인정보 항목에 따른 구체적인 처리 목적은 다음과 같습니다.</li>
														<h3>개인정보 수집 및 이용 목적 안내사항</h3>
														<table border="0" cellspacing="0" cellpadding="0" class="header_h">
															<colgroup>
																<col style="width:30%">
																<col style="width:70%">
															</colgroup>
															<tbody>
																<tr>
																	<td><p align="center">처리 정보</p></td>
																	<td><p align="center">처리 목적</p></td>
																</tr>
																<tr>
																	<td><p align="left">성 명</p></td>
																	<td><p align="left">제품배송, 제품설치 및 회수, 고객상담, 접수 등 계약 이행을 위한 제반업무, 멤버십 회원제 서비스 제공, 케어솔루션 서비스계약 체결에 따른 본인 확인, 케어솔루션 청약 시 신용정보 조회, 고객지향적 마케팅 각종 판촉행사 행사 제 품안내</p></td>
																</tr>
																<tr>
																	<td><p align="left">주소, 우편번호,전화번호, 핸드폰번호성별, 생년월일</p></td>
																	<td><p align="left">제품배송, 제품설치 및 회수, 콜센터 상담운영, 접수 등 계약 이행을 위한 제반 업무, 민원처리, 케어솔루션 정기 유지관리 방문서비스, 본인 실명 확인, 케어솔루션 신규 서비스 및 신상품/이벤트 안내, 고객지향적 마케팅, 각종 판촉 행사 및 경품배송, 행사 제품안내, 고객만족도 조사 </p></td>
																</tr>
																<tr>
																	<td><p align="left">이메일</p></td>
																	<td><p align="left">회사 개인정보처리방침/약관 변경사항 고지, 신규 서비스 및 신상품/이벤트 안내, 마케팅/광고 활용, 전자세금계산서 발행</p></td>
																</tr>
																<tr>
																	<td><p align="left">신용카드번호,카드사명,카드소유자명,유효기간, 계좌번호,은행명,예금주명,정기출금일, 이동전화번호,통신사,가입자이름,결제승인번호</p></td>
																	<td><p align="left">결제 정보 처리, 케어솔루션 요금 수납/이체</p></td>
																</tr>
																<tr>
																	<td><p align="left">본인확인정보(CI/DI)</p></td>
																	<td><p align="left">본인확인을 위한 암호화된 식별 코드</p></td>
																</tr>
																<tr>
																	<td><p align="left">고객구분</p></td>
																	<td><p align="left">타겟 판촉 시 고객을 구분하기 위함/ 고객지향적 마케팅 각종 판촉 행사 제품안내</p></td>
																</tr>
																<tr>
																	<td><p align="left">멤버십ID, 멤버십 카드번호, 멤버십 포인트</p></td>
																	<td><p align="left">LG전자 LG페이 서비스를 위한 멤버십 정보 제공</p></td>
																</tr>
																<tr>
																	<td><p align="left">단말모델정보(멤버십 앱 이용시)</p></td>
																	<td><p align="left">고객지향적 마케팅 및 각종 판촉업무(신상품, 이벤트 안내)</p></td>
																</tr>
																<tr>
																	<td><p align="left">제품 구매정보</p></td>
																	<td><p align="left">이용 정보 분석에 활용 (서비스 제공, 서비스 품질 개선, 신규 서비스 개발 및 고객 지향적 서비스/제품 등의 정보 제공을 위한 서비스 이용에 대한 통계적 분석)</p></td>
																</tr>
															</tbody>
														</table>
													</ol>
												</li>
												<li>
													<h3>3. 개인정보의 처리 및 보유기간</h3>
													<ol>
														<li>회사는 법령에 따른 개인정보 보유ㆍ이용기간 또는 개인정보 수집 시에 동의 받은 개인정보 보유.이용기간 내에서 개인정보를 처리.보유 하며, 동의철회 요구 시 지체없이 삭제 합니다. 고객의 정보 조회, 수정 또는 동의철회를 위해서는 제품을 구매하신 매장 또는 개인정보보호 책임자에게 연락하여 주십시오. 다만, 처리목적 또는 제공 받은 목적이 달성된 경우에도 상법 등 법령의 규정에 의하여 보존할 필요성이 있는 경우에는 고객의 개인정보를 보존할 수 있습니다.</li>
														<li>- 상법 등 법령의 규정에 의하여 보존할 필요성이 있는 경우</li>
														<li>- 대금결제 및 재화 등의 공급에 관한 기록: 5년</li>
														<li>- 납세 증거에 관한 기록: 5년</li>
														<li>- 개별적으로 고객의 동의를 받은 경우</li>
														<li>- 계약 또는 청약철회 등에 관한 기록: 5년</li>
														<li>- 소비자 불만 또는 분쟁처리에 관한 기록: 3년</li>
														<li>- 정당한 절차에 따라 보유기간을 미리 고객에게 고지하거나 명시한 경우</li>
														<li>- 표시/광고에 의한 기록 : 6개월</li>
														<li>- 신용정보의 수집처리 및 이용등에 관한 기록 3년</li>
													</ol>

													<h3>4. 개인정보 파기에 관한 사항</h3>
													<h3>가. 파기절차</h3>
													<ol>
														<li>고객이 제공한 개인정보는 목적이 달성된 후 별도의 데이터베이스시스템으로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 따라(3. 개인정보의 처리 및 보유기간 참조) 일정 기간 저장된 후 파기됩니다. 동 개인 정보는 법률에 의한 경우가 아니고서는 다른 목적으로 이용되지 않습니다.</li>
													</ol>
													<h3>나. 파기방법</h3>
													<ol>
														<li>종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.</li>
														<li>전자적 파일 형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.</li>
													</ol>
													<h3>5. 개인정보 제3자 제공에 관한 사항</h3>
													<ol>
														<li>회사는 이용자의 동의가 있거나 관련 법령의 규정에 의한 경우를 제외하고는 어떠한 경우에도 「개인정보의 수집항목 및 수집목적」, 「개인정보의 처리목적」에서 고지한 범위를 넘어 이용자의 개인정보를 이용하거나 제3자에게 제공하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.</li>
														<li>- 사전에 제3자 제공에 동의한 경우</li>
														<li>- 서비스 제공에 따른 요금정산을 위해 필요한 경우</li>
														<li>- 계약 이행을 위해 필요한 경우(배송/서비스 등)</li>
														<li>- 타인에게 정신적, 물질적 피해를 줌으로써 그에 대한 법적 조치를 취하기 위해 고객정보를 공개해야 한다고 판단되는 충분한 근거가 있는 경우</li>
														<li>- 통계작성, 마케팅분석 또는 시장조사를 위해 필요한 경우로 특정 개인을 식별할 수 없는 형태로 가공하여 외부 기관 또는 단체 등에 제공하는 경우</li>
														<li>- 서비스의 제공에 관한 계약의 이행을 위하여 필요한 개인정보로서 경제적/기술적인 사유로 통상의 동의를 받는 것이 현저히 곤란한 경우</li>
													</ol>
												</li>
												<li>
													<h3>6. 개인정보의 위탁에 관한 사항</h3>
													<ol>
														<li>회사는 서비스 향상을 위해서 아래와 같이 개인정보를 위탁하고 있으며, 관계 법령에 따라 위탁계약 시 개인정VXC              보가 안전하게 관리될 수 있도록 필요한 사항을 규정하고 있습니다. 회사의 개인정보 위탁처리 기관 및 위탁업무 내용은 아래와 같습니다.</li>
													</ol>
													<h3>개인정보 위탁업체와 위탁업무 대한 표</h3>
													<table border="0" cellspacing="0" cellpadding="0" class="header_h">
														<colgroup>
															<col style="width:30%">
															<col style="width:70%">
														</colgroup>
														<tbody>
															<tr>
																<td><p align="center">위탁 업체(수탁자)</p></td>
																<td><p align="center">위탁업무 내용</p></td>
															</tr>
															<tr>
																<td><p align="left">㈜하이프라자, LG전자 전문점 ㈜LG CNS</p></td>
																<td><p align="left">제품판매, 고객관리, 마케팅/판촉, 멤버십 카드 발급/포인트 적립, 케어솔루션 청약관리, 신상품/이벤트 안내(TM/DM/SMS 등), 경품배송</p></td>
															</tr>
															<tr>
																<td><p align="left">LG전자 서비스센터 [전체보기]</p></td>
																<td><p align="left">LG전자 및 기타 계약 제품 A/S, 부품 판매</p></td>
															</tr>
															<tr>
																<td><p align="left">㈜LG CNS</p></td>
																<td><p align="left">시스템 운영/유지 보수, 이벤트 당첨자 상품 배송을 위한 고객정보 추출, 제품/기업 및 이벤트 홍보 메일 전송을 위한 고객정보 추출, 모바일 상품권 발송 관리, 오프 라인 멤버십/케어솔루션 계약서 스캔, 고객DM 업무 대행</p></td>
															</tr>
															<tr>
																<td><p align="left">㈜범한판토스</p></td>
																<td><p align="left">제품 구매에 따른 물품 배송 및 제품설치, 케어솔루션 계약 신청 대행</p></td>
															</tr>
															<tr>
																<td><p align="left">하이엠솔루텍㈜ | 헬스케어 매니저</p></td>
																<td><p align="left">본인확인을 위한 암호화된 식별 코드</p></td>
															</tr>
															<tr>
																<td><p align="left">하이텔레서비스㈜</p></td>
																<td><p align="left">콜센터 상담업무(배송/설치관련 고객문의응대), 만족도 조사(제품구매,배송설치,서비스) 및 해피콜</p></td>
															</tr>
															<tr>
																<td><p align="left">NICE 평가정보㈜, ㈜LG유플러스</p></td>
																<td><p align="left">본인 실명확인, 케어솔루션 청약시 신용정보 조회, 케어솔루션 계약 체결 및 유지판단 여부 </p></td>
															</tr>
															<tr>
																<td><p align="left">미래신용정보㈜</p></td>
																<td><p align="left">케어설계약 후 채무불이행 시 채권추심 활동</p></td>
															</tr>
															<tr>
																<td><p align="left">㈜LG유플러스/금융결제원</p></td>
																<td><p align="left">케어솔루션 요금 수납/이체, SMS/MMS/LMS 발송 대행</p></td>
															</tr>
															<tr>
																<td><p align="left">㈜디제이커뮤니케이션즈</p></td>
																<td><p align="left">DDM발송/수납정보 안내</p></td>
															</tr>
															<tr>
																<td><p align="left">㈜리서치 랩, 한국리서치, 닐슨컴퍼니코리아(유), ㈜비엔알아이</p></td>
																<td><p align="left">만족도 조사(제품구매,배송설치,서비스)</p></td>
															</tr>
															<tr>
																<td><p align="left">CJ대한통운㈜/한진택배㈜/우체국택배</p></td>
																<td><p align="left">제품 및 상품 배송</p></td>
															</tr>
															<tr>
																<td><p align="left">㈜HS애드/누리원기획</p></td>
																<td><p align="left">온라인 광고,캠페인 업무 대행, 이벤트 판촉 사은품 제공</p></td>
															</tr>
															<tr>
																<td><p align="left">㈜유비피에스</p></td>
																<td><p align="left">LG전자 멤버십/케어솔루션 계약서 스캔 및 보관업무</p></td>
															</tr>
															<tr>
																<td><p align="left">㈜이마트/㈜겔럭시아커뮤니케이션즈</p></td>
																<td><p align="left">모바일 상품권 발송</p></td>
															</tr>
															<tr>
																<td><p align="left">㈜서브원, ㈜건영물류시스템, ㈜원은</p></td>
																<td><p align="left">경품/사은품 배송 대행</p></td>
															</tr>
															<tr>
																<td><p align="left">㈜인터비즈시스템</p></td>
																<td><p align="left">제세공과금 처리</p></td>
															</tr>
															<tr>
																<td><p align="left">㈜에버텍교역, ㈜뜨레상사, ㈜다온비즈, ㈜신풍, ㈜이엠케이</p></td>
																<td><p align="left">소형 제품 설치 및 배송 대행</p></td>
															</tr>
															<tr>
																<td><p align="left">㈜유세스파트너스</p></td>
																<td><p align="left">TM 및 고객응대</p></td>
															</tr>
														</tbody>
													</table>
												</li>
												<li>
													<h3>7. 개인정보 자동 수집의 목적 및 거부에 관한 사항</h3>
													<ol>
														<li>가. 쿠키등 사용 목적</li>
														<li>- 이용자의 접속빈도 또는 머문 시간 등을 분석하여 이용자의 취향과 관심분야를 파악하여 서비스개선에 활용</li>
														<li>- 웹사이트 방문 품목들에 대한 정보와 관심 있게 둘러본 품목들에 대한 자취를 추적하여 다음 번 웹사이트 방문 때 제품 정보를 제공</li>
														<li>나. 쿠키 설정 거부 방법</li>
														<li>- 이용자는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서, 쿠키 설정을 거부하는 방법으로는 사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다.</li>
														<li>- 설정방법의 예시(웹 브라우저의 경우) : 웹 브라우저 상단의 도구 > 인터넷 옵션 > 개인정보에서 변경. 단, 이용자께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다.</li>
														<li>- 처리중인 개인정보가 인터넷 홈페이지, P2P, 공유설정 등을 통하여 권한이 없는 자에게 공개되지 않도록 개인정보처리 시스템 및 개인정보처리자의 PC를 설정합니다.</li>
														<li>- 개인정보 수집, 활용 및 파기 시 그에 대한 법률이 권고하는 기준(정보통신망 이용촉진 및 정보보호 등에 관한 법률 및 개인정보보호법 등 관련 법령)에 따라 수집한 근거를 남기도록 하고 있으며, 이와 관련하여 내부 정책과 프로세스를 규정하 고 교육을 실시합니다.</li>
														<li>- ActiveX 설정 거부 방법</li>
														<li>- 설정방법의 예시(웹 브라우저의 경우) : 웹 브라우저 상단의 도구 > 인터넷 옵션 > 개인정보에서 변경. 단, 이용자께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다.</li>
														<li>A. 이용자는 ActiveX 설치에 대한 선택권을 가지고 있습니다. ActiveX 설정을 거부하는 방법은 다음과 같습니다.</li>
														<li>1) 웹 브라우저 상단의 도구 > 인터넷 옵션 > 보안 탭 클릭하여 하단의 사용자 지정수준 클릭 > ActiveX 컨트롤 및 플러그 인 항목에서 아래와 같이 체크함 </li>
														<li>- 바이너리 및 스크립트 동작 => 사용안함</li>
														<li>- 서명 된 ActiveX 컨트롤 다운로드 => 사용안함</li>
														<li>- 스크립팅하기 안전하지 않은 것으로 표시된 ActiveX 컨트롤 초기화 및 스크립팅 => 사용안함</li>
														<li>- 스크립팅하기 안전한 것으로 표시된 ActiveX 컨트롤 스크립트 => 사용안함</li>
														<li>- ActiveX 컨트롤 및 플러그인 실행 => 사용안함</li>
														<li>- ActiveX 컨트롤을 자동으로 사용자에게 확인 => 사용안함</li>
														<li>2) 새 웹 브라우저 창을 여신 후, 다시 접속해 주시기 바랍니다. 접속이 원활하게 되지 않을 경우에는 바이러스 및 악성 코드 제거 프로그램으로 바이러스와 악성코드를 제거 후에 다시 시도해 주시기 바랍니다.</li>
														<li>LG전자 웹사이트에 광고를 게재하는 배너에서도 광고주나 마케팅회사에 의해 쿠키가 사용되는 경우도 있음을 알려드립니다. 이 경우 당해 쿠키는 시스템 관리와 광고주에게 제공할 통계 집계 등을 위하여 이용자들의 IP 주소를 모으기도 합니다. 당해 쿠키가 수집하는 개인정보에 관한 사항은 광고주나 마케팅회사의 개인정보보호방침에 따릅니다.</li>
														<li>8. 개인정보의 안전성 확보조치에 관한 사항</li>
														<li>회사는 고객의 개인정보를 처리함에 있어 개인정보가 분실, 도난, 유출, 변조 또는 훼손되지 않도록 안전성 확보를 위하여 다음과 같은 기술적/관리적 대책을 강구하고 있습니다.</li>
														<li>가. 해킹 등에 대비한 대책</li>
														<li>회사는 해킹이나 컴퓨터 바이러스 등에 의해 고객의 개인정보가 유출되거나 훼손되는 것을 막기 위해 최선을 다하고 있습니다. 개인정보의 훼손에 대비해서 자료를 수시로 백업하고 있고, 최신 백신프로그램을 이용하여 고객들의 개인정보나 자료 가 유출되거나 손상되지 않도록 방지하고 있으며, 암호화통신 등을 통하여 네트워크상에서 개인정보를 안전하게 전송할 수 있도록 하고 있습니다. 그리고 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있으며, 기타 시스템적으로 보 안성을 확보하기 위한 가능한 모든 기술적 장치를 갖추려 노력하고 있습니다.</li>
														<li>나. 처리 직원의 최소화 및 교육</li>
														<li>회사의 개인정보관련 처리 직원은 담당자에 한정시키고 있고 이를 위한 별도의 비밀번호를 부여하여 정기적으로 갱신하고 있으며, 담당자에 대한 수시 교육을 통하여 개인 정보 처리방침의 준수를 강조하고 있습니다.</li>
														<li>9. 정보주체의 권리, 의무 및 그 행사방법에 관한 사항</li>
														<li>고객은 언제든지 등록되어 있는 자신의 개인정보를 조회하거나 수정할 수 있으며 멤버십 등의 가입 해지를 요청할 수도 있습니다. 고객의 개인정보 조회, 수정을 위해서는 '개인 정보변경'(또는'고객정보 수정' 등)을, 멤버십 등의 가입 해지(동의철회)를 위해서는 “회원탈퇴”를 요청하여 본인 확인 절차를 거치신 후 직접 열람, 정정 또는 탈퇴가 가능합니다. 혹은 개인정보보호 책임자에게 서면, 전화 또는 이메일로 연락하시면 지 체 없이 조치하겠습니다. 고객이 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3 자에게 이미 제공한 경우에는 정정 처리 결과를 제3자에게 지 체 없이 통지하여 정정이 이루어지도록 하겠습니다.</li>
														<li>회사는 고객 혹은 법정 대리인의 요청에 의해 해지 또는 삭제된 개인정보는 “개인정보의 보유 및 이용기간”에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.</li>
														<li>10. 개인정보의 열람청구를 접수, 처리하는 부서 및 개인정보보호 책임자</li>
														<li>고객은 회사의 서비스를 이용하면서 개인정보침해에 대한 신고 상담이 필요하신 경우에는 개인정보보호 책임자에게 전화 또는 이메일 등을 통해 연락을 주시면 신속히 처리해 드릴 수 있도록 하겠습니다.</li>
														<li>[개인정보보호책임자 신고 연락처]</li>
														<li>- 개인정보보호 책임자 : 개인정보 Compliance 팀장</li>
														<li>- 개인정보 운영책임자: B2C판촉CRM팀 팀장[B2C전문점], 하이프라자 CRM파트장 [하이프라자 지점]</li>
														<li>- 전화번호: 02-2673-0695[B2C전문점], 02-2164-0868[하이프라자 지점]</li>
														<li>- E-mail주소 : privacy@lge.com</li>
														<li>기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다</li>
														<li>- 개인정보 침해신고센터 : (국번없이)118 (http://privacy.kisa.or.kr)</li>
														<li>- 개인정보 분쟁조정위원회 :1833-6972 (http://www.kopico.go.kr)</li>
														<li>- 대검찰청 사이버수사과 : (국번없이)1301, cid@spo.go.kr (http://spo.go.kr)</li>
														<li>- 경찰청 사이버안전국 : (국번없이)182 (http://cyberbureau.police.go.kr)</li>
														<li>11. 고지의 의무</li>
														<li>현 개인정보처리방침 내용 추가, 삭제 및 수정이 있을 시에는 개정 최소 7일 전부터 이메일 또는 대표사이트(www.lge.co.kr)의 '공지사항'을 통하여 고지할 것입니다. 단, 개인정보의 제3자 제공, 수집ㆍ이용 목적 변경, 보유기간 변경 등 중요한 사항이 변경되는 경우에는 고객의 동의를 얻도록 하겠습니다.</li>
														<li>시행일자 : 2020년 4월 20일</li>
													</ol>
												</li>
											</ol>
										</div>
										<!-- / policy영역 -->
									</div>
									<!-- / 약관box -->
								</div>
								<!-- / LG전자 개인정보 수집 이용 동의 -->
							</div>
						</div>
			        
			        <!-- / LG전자 동의 -->
					<!--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   20200702 회원약관 LG 추가   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%-->



				    <!-- 통신서비스 마케팅 활용 동의 -->
				    <div class="term_b" style="float:left; width:50%;"  id="wrapThirdPartyAgreementTelecom" runat="server">
					    <h2 style="float:left;">
                            <div class="input_b size_sm type1 thirdparty">
                                <div class="ez-checkbox">
                                    <input type="checkbox" name="chkChoiceAgreementForThirdPartyTelecomALL" id="chkChoiceAgreementForThirdPartyTelecomALL" value="Y" class="ez-hide thirdparty-parent" runat="server">

                                </div>
                                <label for="chkChoiceAgreementForThirdPartyTelecomALL">제3자 마케팅 활용동의 <span>(선택)</span></label>  
					        </div>                                
					    </h2>

                        <h2 style="float:right;">
							<div class="input_b size_sm type1 thirdparty">
                                <div class="ez-checkbox">
                                    <input type="checkbox" name="chkChoiceAgreementForThirdPartyShinhan" id="chkChoiceAgreementForThirdPartyShinhan" value="119006" class="ez-hide thirdparty-child" runat="server">

                                </div>
                                <label for="chkChoiceAgreementForThirdPartyShinhan">금융</label>


							</div>
						</h2>

                        <h2 style="float:right;">
						<div class="input_b size_sm type1 thirdparty">
							<div class="ez-checkbox">
								<div class="ez-checkbox"><input name="chkChoiceAgreementForThirdPartyTelecom" type="checkbox" id="chkChoiceAgreementForThirdPartyTelecom" value="119001" class="ez-hide thirdparty-child"  runat="server"></div></div>
								<label for="chkChoiceAgreementForThirdPartyTelecom">통신</label>
							</div>
						</h2>
                        
                        <!-- 약관box -->
					    <div class="txt_a" style="clear:both;">
						    <!-- policy영역 -->
						    <div class="policy_a">
							    <div>
								    <h3>통신서비스 개인정보 제3자 제공</h3>
								    <br>
								    <span>개인정보를 제공받는자 : SK브로드밴드㈜, 브로드밴드TS㈜, ㈜티시스아이티, ㈜유컴패니온, ㈜유베이스</span><br>
								    <span>개인정보 제공 항목 : 성명,휴대폰번호,생년월일,성별,주소,이메일,예식일,참여일시,참여매체</span><br>
								    <span>개인정보 제공목적 : 전화,문자,이메일을 이용한 SK브로드밴드 통신상품 안내 및 SK텔레콤 스마트홈 상품 </span><br>
                                    <span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;위탁판매</span><br>
								    <span>보유 및 이용기간 : 제공동의일로부터 1년 (고객동의 철회 시 지체없이 파기)</span><br>
								    <span>※ 동의를 거부하실 수 있으나, 이 경우 상품 안내 및 이벤트 참여가 제한됩니다. </span><br>
								    <span>※ 본 통신서비스에 동의하신 고객정보의 보호를 위해 파트너사(제공받는자)는 관련법령을 준수한 개인정보보호 시스템을 구축하여 동의고객 정보를 안전하게 보호 및 파기할 의무를 가지고 있으며, 파트너사는 캠페인 진행에 따른 광고비용을 지급하고 있습니다.</span>
							    </div>

                                <div>
								    <h3>금융서비스 개인정보 제3자 제공</h3>
								    <br>
								    <span>개인정보를 제공받는자 : 신한라이프생명보험㈜, 신한라이프와 모집위탁 계약을 체결한 자</span><br>
								    <span>개인정보 제공 항목 : 성명,생년월일,성별,휴대폰번호,이메일,참여일,참여매체,예식일 정보</span><br>
								    <span>개인정보 제공목적 :  보험상품 판매를 위한 마케팅(전화, 문자) 자료활용 및 경품발송(문자)</span><br>
								    <span>보유 및 이용기간 : 제공동의일로부터 1년 (고객동의 철회시 지체없이 파기) </span><br>
								    <span>※ 동의를 거부하실 수 있으나, 이 경우 상품 안내 및 이벤트 참여가 제한됩니다. </span><br>
								    <span>※ 본 통신서비스에 동의하신 고객정보의 보호를 위해 파트너사(제공받는자)는 관련법령을 준수한 개인정보보호 시스템을 구축하여 동의고객 정보를 안전하게 보호 및 파기할 의무를 가지고 있으며, 파트너사는 캠페인 진행에 따른 광고비용을 지급하고 있습니다.</span>
							    </div>

						    </div>  
						    <!-- / policy영역 -->
					    </div>
					    <!-- / 약관box -->
				    </div>
				    <!-- / 통신서비스 마케팅 활용 동의 -->

				    <!-- 개인정보 취급위탁동의 -->
				    <div class="term_b"  id="wrapThirdPartyAgreement" runat="server" >
					    <h2><div class="input_b size_sm type1"><div class="ez-checkbox"><input type="checkbox" name="chkChoiceAgreementForThirdParty" id="chkChoiceAgreementForThirdParty" value="Y" class="ez-hide agreement-thirdparty" runat="server"></div><label for="chkChoiceAgreementForThirdParty">개인정보 처리 위탁 <span>(선택)</span></label></div></h2>

					    <!-- 약관box -->
					    <div class="txt_a">
						    <!-- policy영역 -->
						    <div class="policy_a">
							    <div>
								    <br>
								    수탁자 : ㈜멤플러스<br>
								    수탁업무 : 분야별 마케팅활용 동의회원 개인정보 처리 및 바른라이프(금융,통신,멤버십 등) 제휴상품 추천,안내
                                    <br>
								    ※ 동의를 거부하실 수 있으나 , 이 경우 분야별 제휴혜택 안내 및 이벤트 참여가 제한됩니다.<br>
							    </div>
						    </div>
						    <!-- / policy영역 -->
					    </div>
					    <!-- / 약관box -->
				    </div>

				    <!-- / 개인정보 취급위탁동의 -->
			    </div>
			    <!-- / 바른손 동의 -->

                <asp:Literal ID="LiteralEventText" runat="server"></asp:Literal>

                <!-- 하단 유의사항 추가영역-->
				<style>
					.bt_info {text-align:left; margin: 20px 10px 0px 10px;}
					.bt_info h3 {font-size:14px; margin:10px 0;color: #000;}
					.bt_info ul {color:#868686; line-height:140%;}
					.bt_info li {font-size:13px;}

					/*모바일 환경 최적화 필요할경우 사용*/
					@media (max-width:640px) {
						.bt_info ul {display:none;}
					}
				</style>

				<div class="bt_info" style="display:none" id="bt_info_">
					<!--<h3>※ 약관 전체 동의(선택 동의 포함) 시, <span style="color:#2e96ff">청첩장 1만원 할인쿠폰</span>이 발급됩니다.</h3>-->
					<h3>※ 약관 전체 동의 시, 할인쿠폰이 발급됩니다. <span style="color:#2e96ff">(청첩장 1만원 할인 쿠폰, 감사장 15%할인 쿠폰)</span></h3>
					<ul>
						<li>- 할인쿠폰은 고객님의 마이페이지 > 쿠폰보관함에서 확인 가능합니다.</li>
					</ul>
				</div>
				<!-- 하단 유의사항 추가영역-->

                <!--200330 수정영역-->
				<p style="padding:32px 0 0 7px; text-align:left; display:none" >
                    <asp:Literal ID="ltShinhanImg" runat="server"></asp:Literal>
				</p>
				<!--200330 수정영역-->

            
            </div>

			<!-- / table -->
			<!-- 하단버튼 -->
			<div class="b_btn_a">
                <asp:LinkButton ID="LinkButton1" CssClass="b_btn type2 right" runat="server" OnClick="btnSave_Click" OnClientClick="return Information.ValidationCheck();"><span>가입완료하기</span></asp:LinkButton>
			</div>
			<!-- / 하단버튼 -->
		</div>
		<!-- / 기본 정보입력 -->
					</div>
					<!-- //회원가입 컨텐츠 -->
	
	<%--<div class="cont_a">
		<!-- / 본인인증 -->
		
		
	</div>--%>
	<!-- / contents -->

     <input type="hidden" name="hidsamsungFlg" id="hidsamsungFlg" value="N" runat="server" />
    <input type="hidden" name="hidlgFlg" id="hidlgFlg" value="N" runat="server" />


</asp:Content>