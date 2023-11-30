<%@ Page Title="" Language="C#" MasterPageFile="~/Master/SiteOne.Master" AutoEventWireup="true" CodeBehind="CustomerInformation_NEW.aspx.cs" Inherits="BarunnIntergrationService.Member.CustomerInformation_NEW" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="/resources/css/jquery-ui-1.10.1.css" rel="stylesheet">
    <link href="/resources/css/melon.datepicker.css" rel="stylesheet">
	<link href="/resources/css/swiper.min.css" rel="stylesheet">
		
    <script src="/resources/js/jquery-ui-1.10.1.min.js"></script>
    <script type="text/javascript" src="/resources/js/jquery.postcode.js"></script>
    <script type="text/javascript" src="/resources/js/Member/PremierForCustomerInformation.js?ver=2.3"></script>
	<script type="text/javascript" src="/resources/js/swiper.min.js"></script>

	<style type="text/css">
	
		.cont_a h3 {
			font-size: 12px;
			border-bottom: 1px solid;
		}


		.jtxton		{background-color:#e9f3f8 !important; color:#244859; border:1px solid #94caed !important; outline:none;}
		.jtxtoff	{background-color:#f6f6f6  !important;}
        .step01 h1 {font-weight: 700;color: #333; padding: 0 0 50px 0;}
        .family_area {overflow: hidden; border: 1px solid #ddd; margin: 20px 0; padding: 28px 0;}
        .bi_inner img {padding:15px 15px 0 15px;}
        .b_btn:hover { -webkit-box-shadow: none; box-shadow: none;}
		.head_a_in, .cont_a_in, .familysite_a_in, .step_a_in { width: 900px; margin: 0 auto;}
		.cont_a { background-color: #ffffff; text-align: center;}
		.b_dtable_1 {padding:0 15px 0 0;}
		.b_btn_a {margin:0;}
		.agreement_wrap .term_s .term_b {padding:0;margin:0 0 0 13px;}
		.agreeall_a .input_b {margin:0;}
		.term_s {margin: 4px;}
		.agreement_wrap .term_s .term_b > h2 span {font-size: 12px; color: #b1b1b1;}
		.agreement_wrap .term_s .term_b .txt_a {font-size: 12px; height: 60px;margin: 0px; height: 516px; border:0; background:none;}
		.agreement_wrap .term_s .term_b .input_b {margin:7px 0; display:inline-block;}
		@media screen and (max-width: 700px){ 
			body {overflow-x:hidden;}
		}
		
		.step_a ul {width: 226px;margin: 0 auto;/* border: 1px solid red; */overflow: hidden;}
        .step_a ul li {text-align:center;float: left;text-align: center; color: #c8c8c8; font-size:19px; font-weight:bold;}
        .step_a ul li.on {color: #333;}
        .step_a ul li.on span {background:#333; color:#fff; border:1px solid #333;}
		.step_a ul li.m-line { width: 40px; height: 0; border: solid 1px #333; margin: 34px 20px 0 20px;}
        .step_a ul li span{width: 20px;height: 20px; display: block; border-radius: 20px; text-align: center; line-height: 20px; margin: 10px auto; font-weight: bold;color: #c8c8c8;border: 1px solid #c8c8c8;}

		.agreement_wrap .input_b.type1 label {font-size:14px;}		
		
		.are_wrap h3 { font-size: 15px; font-weight: 500; padding: 21px; border-bottom: 1px solid #ddd;}
		.layerPop {width:350px; height:600px; background:#fff; display:none; z-index:100; position:fixed;left:50%; top:50%; transform: translate(-50%, -50%); margin:auto;}
		.layerPop  .close{position: absolute; right: 20px;}
		#deemed {width:100%; height:100%; position:fixed; top:0; left:0; filter:Alpha(opacity=50);opacity:0.5; background:#000; z-index:1;}
		
		
		.input_b .ez-checkbox, .input_b .ez-radio {margin-right:1px;}
		@media screen and (max-width: 650px){
			.agreement_wrap .input_b.type1.thirdparty label {
				font-size: 14px;
				color: #333333;
			}
			.ar-db {display:block; float:none; width:62%; margin:0 18px; float:none;}
		}
		
		.are_li li {display:inline-block;}

		.jtxton		{background-color:#e9f3f8 !important; color:#244859; border:1px solid #94caed !important; outline:none;}
		.jtxtoff	{background-color:#f6f6f6  !important;}

		.agreement_wrap .input_b .ez-checkbox {
			background-image: url(/resources/img_inc/set_check_new.png);
			-webkit-filter: grayscale(100%);
			filter: gray;
		}
		label {
			padding-right: 0px;
		}
		</style>

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

    <!-- contents -->
    <div class="cont_a">
        <!-- 본인인증 -->
        <!-- / 본인인증 -->

        <!-- 기본 정보입력 -->
        <div class="cont_a_in">
            <h3 class="b_talign_l b_mt40"></h3>
            <!-- table -->
            <div class="b_dtable_1 information_wrap">
                <dl id="dlName" runat="server">
                    <dt class="mark"><p>이 름</p></dt>
                    <dd>
                         <input type="hidden" name="txtUserName" id="txtUserName" runat="server" style="width:270px;" placeholder="휴대폰 인증 시 자동입력됩니다" maxlength="25" readonly="readonly" />
                        <asp:Literal ID="ltrUserName" runat="server"></asp:Literal>
                    </dd>
                </dl>
                <dl id="dlBirthDate" runat="server">
                  <dt class="mark">
                    <p>생년월일</p>
                  </dt>
                  <dd>
                    <div class="b_sel_line" style="width:120px;">
                     <select name="selBirthDateForYear" id="selBirthDateForYear" runat="server" style="width:120px;" tabindex="0">
                     </select>
                    </div>
                    <label for="select_big1_1">년</label>
                    <div class="b_sel_line" style="width:120px;">
                      <select name="selBirthDateForMonth" id="selBirthDateForMonth" runat="server" style="width:120px;" tabindex="0">
                      </select>
                    </div>
                    <label for="select_big1_1">월</label>

                    <div class="b_sel_line" style="width:120px;">
                      <select name="selBirthDateForDay" id="selBirthDateForDay" runat="server" style="width:120px;" tabindex="0">
                      </select>
                    </div>
                    <label for="select_big1_1">일</label>

                    <div class="input_b size_sm type2">
                      <div class="ez-radio ez-selected">
                        <input value="Y" name="rdoSolarOrLunar" type="radio" id="rdoSolar" runat="server" checked class="ez-hide">
                      </div>
                      <label for="rdoSolar">양력</label>
                    </div>
                    <div class="input_b size_sm type2">
                      <div class="ez-radio">
                        <input value="N" name="rdoSolarOrLunar" type="radio" id="rdoLunar" runat="server" class="ez-hide">
                      </div>
                      <label for="rdoLunar">음력</label>
                    </div>
                  </dd>
                </dl>
                <dl id="dlUserId" runat="server">
                    <dt class="mark"><p>아이디</p></dt>
                    <dd>
                        <input name="txtID" type="text" id="txtID" runat="server" style="width:100%;" title="아이디를 넣어주세요" placeholder="공백 없는 영문, 숫자 포함 6~16자" class="jtxtoff"><span class="noti"></span>
                        <asp:Literal ID="ltrID" runat="server"></asp:Literal>

                    </dd>
                </dl>
                <dl id="dlPassword" runat="server">
                    <dt class="mark"><p>비밀번호</p></dt>
                    <dd><input name="txtPassword" type="password" id="txtPassword" runat="server" style="width:100%; " title="비밀번호를 넣어주세요" placeholder="영문으로 시작하는 6~16자의 영문+숫자 조합" maxlength="16" class="jtxtoff"></dd>
                </dl>
                <dl id="dlPasswordConfirm" runat="server">
                    <dt class="mark"><p>비밀번호 확인</p></dt>
                    <dd><input name="txtPasswordConfirm" type="password" id="txtPasswordConfirm" runat="server" style="width:100%;" title="비밀번호를 한번 더 넣어주세요" placeholder="한번 더 넣어주세요" maxlength="16"><span class="noti"></span></dd>
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
                        <div id="wrapPostCode" style="display:none;border:1px solid;width:100%;height:300px;margin:5px 0;position:relative;">
                            <img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
                        </div>
                        <input name="txtAddress" type="text" id="txtAddress" runat="server" class="post-address jtxtoff" title="주소를 넣어주세요" placeholder="동,면,읍 이상" readonly="readonly" style="width:100%;margin: 0 0 2px 0;">
                        <br>
                        <input name="txtAddressDetail" type="text" id="txtAddressDetail" runat="server" title="나머지 주소를 넣어주세요" placeholder="나머지 주소(직접입력)" maxlenth="50" style="width:100%;">
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
                  </dd>
                </dl>
                <dl id="dlEmail" runat="server">
                  <dt class="mark">
                    <p>이메일</p>
                  </dt>
                  <dd>
                    <input name="txtEMailHeader" type="text" id="txtEMailHeader" runat="server" style="width:200px;" title="이메일을 넣어주세요" class="jtxtoff">
                    @
                    <input name="txtEMailFooter" type="text" id="txtEMailFooter" runat="server" style="width:205px;" title="이메일을 넣어주세요" class="jtxtoff">
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
                  </dd>
                </dl>
                   <dl id="dlWeddingDayField" runat="server">
                    <dt class="mark"><p>예식일</p></dt>
                    <dd>
                        <div class="input-group date">
                            <input type="text" name="txtWeddingDay" id="txtWeddingDay" runat="server" class="b_talign_c datepicker" style="width:268px;" title="예식일을 넣어주세요" readonly="readonly">
                            <!--<a class="input-group-addon btnCalendarIcon"><img src="/resources/img_inc/icon_calender_premierpaper.png" alt="달력버튼"></a>-->
                        </div>
                    </dd>
                </dl>
                <dl id="dlWeddingHallField" runat="server">
                  <dt class="mark">
                    <p>예식장</p>
                  </dt>
                  <dd>
                    <div class="input_b size_sm type2">
                      <div class="ez-radio">
                        <input value="W" name="rdoWeddingHall" type="radio" id="rdoWeddingHall_W" class="ez-hide" runat="server">
                      </div>
                      <label for="rdoWeddingHall_W">예식홀</label>
                    </div>
                    <div class="input_b size_sm type2">
                      <div class="ez-radio">
                        <input value="H" name="rdoWeddingHall" type="radio" id="rdoWeddingHall_H" class="ez-hide" runat="server">
                      </div>
                      <label for="rdoWeddingHall_H">호텔</label>
                    </div>
                    <div class="input_b size_sm type2">
                      <div class="ez-radio">
                        <input value="C" name="rdoWeddingHall" type="radio" id="rdoWeddingHall_C" class="ez-hide" runat="server">
                      </div>
                      <label for="rdoWeddingHall_C">종교장소</label>
                    </div>
                    <div class="input_b size_sm type2">
                      <div class="ez-radio">
                        <input value="M" name="rdoWeddingHall" type="radio" id="rdoWeddingHall_M" class="ez-hide" runat="server">
                      </div>
                      <label for="rdoWeddingHall_M">군관련기업</label>
                    </div>
                    <div class="input_b size_sm type2">
                      <div class="ez-radio">
                        <input value="E" name="rdoWeddingHall" type="radio" id="rdoWeddingHall_E" class="ez-hide" runat="server">
                      </div>
                      <label for="rdoWeddingHall_E">기타</label>
                    </div>
                  </dd>
                </dl>
				<dl id="dlWeddingHallField2" class="whall">
					<dt>
					<p>예식 장소</p>
					</dt>
					<dd style="width: 75%;">
						<input type="text" name="txtWeddName" id="txtWeddName" runat="server" placeholder="Ex) 루이비스 다산홀" style="width: 95%; margin-top: 4px;" maxlenth="50">
					</dd>	
				</dl>
            </div>
            <!-- / table -->
		

			<%--신규 약관 디자인 Start--%>
            <div class="b_dtable_1 agreement_wrap check_all_area" style="padding:0 15px;">
                        <div class="agreeall_a clearfix" style="text-align:left;">
                            <div class="input_b size_sm type1" style="float: inherit; width:100%; border:1px solid #000; height:65px; line-height:65px;">
                                
								<div class="ez-checkbox" style="margin: 21px 3px 0 17px;">
									<div class="ez-checkbox">
										<input type="checkbox" name="checkbox_big1" class="check_all ez-hide" id="checkbox_big1_all" style="margin-bottom:100px;">
									</div>
								</div>
                                <label for="checkbox_big1_all"><strong>전체 동의<img src="/Resources/member/tooltip.svg" style="vertical-align: middle; padding: 0 0 0 6px;"/></strong></label>
                            </div>
                        </div>
                <!-- 바른손 동의 -->
                <div class="term_s barun_s">
                    <!-- 만 14세 이상 가입동의 -->
                    <div class="term_b" style="width:100%;/*padding-left: 15px;*/">
                        <h2>
							<div class="input_b size_sm type1">
										<div class="ez-checkbox">
											<div class="ez-checkbox">
												<input type="checkbox" name="chkAgeAgreement" id="chkAgeAgreement" value="Y" class="ez-hide">
											</div>
										</div>
										<label for="chkAgeAgreement">만 14세 이상입니다.<span> (필수)</span></label>
									</div>
						</h2>
                    </div>

                    <!-- 바른컴퍼니 바른 ONE 서비스 이용약관동의 -->
                    <div class="term_b" style="width:100% !important;/*padding-left: 15px;*/">
                               
                        <h2 style="width:100%;overflow:hidden;">
								<div class="input_b size_sm type1">
									<div class="ez-checkbox">
										<div class="ez-checkbox">
											<div class="ez-checkbox">
												<input type="checkbox" name="chkEssentialAgreement" id="chkEssentialAgreement" value="Y" class="ez-hide"/>
											</div>
										</div>
									</div>
									<label for="chkEssentialAgreement">이용약관 동의 <span>(필수)</span>
										<a href="javascript:void(0);" onclick="openLayer('layerPop')" style="padding:0 0 0 3px">
										<img src="/Resources/member/btn.svg"></a>
									</label>
								</div>
						</h2>
								
						<div id="layerPop" class="layerPop">
							<div class="are_wrap">
								<h3>이용약관 동의(필수)<a href="javascript:void(0);" onclick="closeLayer('layerPop')" class="close"><img src="/Resources/member/ico-x.svg"></a></h3>
							</div>
									
							<!-- 약관box -->
							<div class="txt_a">
								<!-- policy영역 -->
								<div class="policy_a">
									<asp:Literal ID="ltrUsePolicyContents" runat="server"></asp:Literal>
								</div>
								<!-- / policy영역 -->

								<a href="/Member/MemberPolicyHistory.aspx?div=U" class="policy_button" target="_blank"> 이전 약관 내용 보기 </a>
							</div>
							<!-- / 약관box -->
						</div>		
                    </div>
                    <!-- / 바른컴퍼니 바른 ONE 서비스 이용약관동의 -->
							
							
							
                    <!-- 개인정보 수집 이용 동의 -->
                    <div class="term_b" style="position:relative; width:100%;/*padding-left: 15px;*/">
								
						<h2>
							<div class="input_b size_sm type1">
								<div class="ez-checkbox">
									<div class="ez-checkbox"><div class="ez-checkbox">
										<input type="checkbox" name="chkEssentialAgreementPurpose" id="chkEssentialAgreementPurpose" value="Y" class="ez-hide"></div>

									</div></div><label for="chkEssentialAgreementPurpose">&nbsp;개인정보 수집 이용 동의 <span>(필수)</span>
							<a href="javascript:void(0);" onclick="openLayer('layerPop2')" class="close" style="padding:0 0 0 10px;">
							<img src="/Resources/member/btn.svg"></a></label></div></h2>
								
                        <div id="layerPop2" class="layerPop">
							<div class="are_wrap">
								<h3>개인정보 수집 이용 동의(필수)<a href="javascript:void(0);" onclick="closeLayer('layerPop2')" class="close"><img src="/Resources/member/ico-x.svg"></a></h3>
							</div>
							<!-- 약관box -->
							<div class="txt_a">
								<!-- policy영역 -->
								<div class="policy_a">
									<asp:Literal ID="ltrPrivacyPolicyContents" runat="server"></asp:Literal>

								<!-- 20220816 추가 End -->
								</div>
								<!-- / policy영역 -->

								<a href="/Member/MemberPolicyHistory.aspx?div=P" class="policy_button" target="_blank"> 이전 약관 내용 보기 </a>
							</div>
							<!-- / 약관box -->
						</div>
                                
                    </div>
                    <!-- / 개인정보 수집 이용 동의 -->				
					
					
							
                    <!-- 이벤트및 서비스안내 수신동의 -->
                    <div class="term_b" style="position:relative; width:100%;/*padding-left: 15px;*/">
								
						<h2>
							<div class="input_b size_sm type1">
								<div class="ez-checkbox">
									<div class="ez-checkbox"><div class="ez-checkbox">
										<input type="checkbox" name="chkSMSEMailYorN" id="chkSMSEMailYorN" runat="server" value="Y" class="ez-hide"></div>

									</div></div><label for="chkSMSEMailYorN">&nbsp;이벤트 및 서비스안내 수신동의 <span>(선택)</span>
							<a href="javascript:void(0);" onclick="openLayer('layerPop8')" class="close" style="padding:0 0 0 10px;">
							<img src="/Resources/member/btn.svg"></a></label></div></h2>
								
                        <div id="layerPop8" class="layerPop">
							<div class="are_wrap">
								<h3>이벤트 및 서비스안내 수신동의(선택)<a href="javascript:void(0);" onclick="closeLayer('layerPop8')" class="close"><img src="/Resources/member/ico-x.svg"></a></h3>
							</div>
							<!-- 약관box -->
							<div class="txt_a">																
								<div class="policy_a">
									<p style="line-height:18px;">															
									수신 동의 시 청첩장 할인쿠폰, 이벤트 등에 관한 혜택을 이메일, SMS 등을 통해 받으실 수 있습니다.
									</p>
								</div>
							</div>
							<!-- / 약관box -->
						</div>
                                
                    </div>
                    <!-- //이벤트및 서비스안내 수신동의 -->			
	                    
                    <!-- LG 전자 동의 -->
					<div id="wrapLGAgreement" class="term_b" style="position:relative; width:100%;/*padding-left: 15px;*/" runat="server">
							<h2>
                                <div class="input_b size_sm type1">
                                    <div class="ez-checkbox">
                                        <div class="ez-checkbox">
												<div class="ez-checkbox">
													<div class="ez-checkbox">
														<div class="ez-checkbox">
															<input name="chkChoiceAgreementForLGMembershipALL" type="checkbox" id="chkChoiceAgreementForLGMembershipALL" value="Y" 
																class="ez-hide agreement-lg">
														</div>
													</div>
												</div>
										</div>
                                    </div>
                                    <label for="chkChoiceAgreementForLGMembershipALL" style="margin: 0 0 0 -6px;">&nbsp;&nbsp;LG전자 멤버십 전체 이용 약관 동의 <span>(선택)</span>
										<a href="javascript:void(0);" onclick="openLayer('layerPop4')" class="close" style="padding:0 0 0 10px; text-decoration: none">
										<img src="/Resources/member/btn.svg"></a></label>
                                </div>
                            </h2>
							
								
						<div id="layerPop4" class="layerPop">
							<div class="are_wrap">
								<h3>LG전자 멤버십 전체 이용 약관 동의(선택)<a href="javascript:void(0);" onclick="closeLayer('layerPop4')" class="close"><img src="/Resources/member/ico-x.svg"></a></h3>
							</div>
                            <div class="txt_a">
                                <!-- LG전자 멤버십 회원 이용 약관 -->
                                <div style="float:left; width:100%;">
                                    <div class="input_b size_sm type1" style="margin: 10px 0 0px 9px;">
                                        <div class="ez-checkbox">
                                            <div class="ez-checkbox"><div class="ez-checkbox"><div class="ez-checkbox">
												<input name="chkChoiceAgreementForLGMembership" type="checkbox" id="chkChoiceAgreementForLGMembership" value="Y" class="ez-hide agreement-lg" runat="server"></div></div></div>
                                        </div>
                                        <label for="chkChoiceAgreementForLGMembership" style="font-size: 14px;">LG전자 멤버십 회원 이용약관 <span>(선택)</span></label>
                                    </div>
                                    <!-- 약관box -->
                                    <div class="txt_a_new" style="width: 94%; margin:0 auto; border:1px solid #f9f9f8; ">
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
                                                <li>
                                                    2. 회원이 멤버십 서비스를 이용함에 있어 행한 불법행위나 본 약관 위배행위로 인하여 회사가 회원 이외의 제3자로부터 손해배상 청구 또는 소송을 비롯한 각종 이의제기를 받은 경우 회원은 자신의 책임과 비용으로 회사를 면책시켜야 하며, 회사가 면책되지 못한 경우 당해 회원은 그로 인하여 회사에 발생한 모든 손해를 배상하여야 합니다.
                                                </li>
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
                                <div>

                                    <!-- 약관box -->
                                    <div class="txt_a_new" style="/* background: #fff; */width: 94%; margin:0 auto; border: 0;">
                                        <h2>
											<div class="input_b size_sm type1">
												<div class="ez-checkbox">
													<div class="ez-checkbox">
														<div class="ez-checkbox">
															<div class="ez-checkbox">
																<div class="ez-checkbox">
																	<input name="chkChoiceAgreementForLGChoicePersonalData" type="checkbox" 
																		id="chkChoiceAgreementForLGChoicePersonalData" class="ez-hide agreement-lg" runat="server">

																</div>
															</div>
														</div>
													</div>
												</div>
												<label for="chkChoiceAgreementForLGChoicePersonalData">LG전자 멤버십 개인정보 처리방침<span>(선택)</span></label>
											</div>
										</h2>

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
                                                        <li>- 설정방법의 예시(웹 브라우저의 경우) : 웹 브라우저 상단의 도구 &gt; 인터넷 옵션 &gt; 개인정보에서 변경. 단, 이용자께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다.</li>
                                                        <li>- 처리중인 개인정보가 인터넷 홈페이지, P2P, 공유설정 등을 통하여 권한이 없는 자에게 공개되지 않도록 개인정보처리 시스템 및 개인정보처리자의 PC를 설정합니다.</li>
                                                        <li>- 개인정보 수집, 활용 및 파기 시 그에 대한 법률이 권고하는 기준(정보통신망 이용촉진 및 정보보호 등에 관한 법률 및 개인정보보호법 등 관련 법령)에 따라 수집한 근거를 남기도록 하고 있으며, 이와 관련하여 내부 정책과 프로세스를 규정하 고 교육을 실시합니다.</li>
                                                        <li>- ActiveX 설정 거부 방법</li>
                                                        <li>- 설정방법의 예시(웹 브라우저의 경우) : 웹 브라우저 상단의 도구 &gt; 인터넷 옵션 &gt; 개인정보에서 변경. 단, 이용자께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다.</li>
                                                        <li>A. 이용자는 ActiveX 설치에 대한 선택권을 가지고 있습니다. ActiveX 설정을 거부하는 방법은 다음과 같습니다.</li>
                                                        <li>1) 웹 브라우저 상단의 도구 &gt; 인터넷 옵션 &gt; 보안 탭 클릭하여 하단의 사용자 지정수준 클릭 &gt; ActiveX 컨트롤 및 플러그 인 항목에서 아래와 같이 체크함 </li>
                                                        <li>- 바이너리 및 스크립트 동작 =&gt; 사용안함</li>
                                                        <li>- 서명 된 ActiveX 컨트롤 다운로드 =&gt; 사용안함</li>
                                                        <li>- 스크립팅하기 안전하지 않은 것으로 표시된 ActiveX 컨트롤 초기화 및 스크립팅 =&gt; 사용안함</li>
                                                        <li>- 스크립팅하기 안전한 것으로 표시된 ActiveX 컨트롤 스크립트 =&gt; 사용안함</li>
                                                        <li>- ActiveX 컨트롤 및 플러그인 실행 =&gt; 사용안함</li>
                                                        <li>- ActiveX 컨트롤을 자동으로 사용자에게 확인 =&gt; 사용안함</li>
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
					</div>
                    <!-- / LG전자 동의 -->
                           
							
                    <!--   -->
                    <div class="term_b" style="position:relative; width:100%;/*padding-left: 15px;*/">
								
						<h2 style="text-align: left;">
                                <div class="input_b size_sm type1">
                                    <div class="ez-checkbox">
                                        <div class="ez-checkbox">
											<div class="ez-checkbox">
												<div class="ez-checkbox">
													<div class="ez-checkbox">
														<div class="ez-checkbox">
															<input name="chkChoiceAgreementForCasamiaMembershipALL" type="checkbox" id="chkChoiceAgreementForCasamiaMembershipALL" value="Y"
																class="ez-hide agreement-casa">
														</div>
													</div>
												</div>
											</div>
										</div>
                                    </div>
                                    <label for="chkChoiceAgreementForCasamiaMembershipALL" style="position:absolute;/*margin: 0 0 0 2px;*/">&nbsp;까사미아 멤버십 전체 이용약관 동의 <span>(선택)</span>
										<a href="javascript:void(0);" onclick="openLayer('layerPop5')" class="close" style="padding:0 0 0 10px;text-decoration:none">
										<img src="/Resources/member/btn.svg"></a></label>
                                </div>
                            </h2>
								
						<div id="layerPop5" class="layerPop">
								<div class="are_wrap">
									<h3>까사미아 멤버십 전체 이용약관 동의(선택)<a href="javascript:void(0);" onclick="closeLayer('layerPop5')" class="close"><img src="/Resources/member/ico-x.svg"></a></h3>
								</div>
									
										<div class="txt_a">
											<div class="input_b size_sm type1" style="margin: 10px 0 0px 8px;">
													<div class="ez-checkbox">
														<div class="ez-checkbox"><div class="ez-checkbox"><div class="ez-checkbox"><div class="ez-checkbox">
															<div class="ez-checkbox">
															<input name="chkChoiceAgreementForCasamiaMembership" type="checkbox" id="chkChoiceAgreementForCasamiaMembership" value="Y" 
																class="ez-hide agreement-casa" runat="server"></div></div></div></div></div>
													</div>
													<label for="chkChoiceAgreementForCasamiaMembership" style="font-size: 14px;">까사미아 서비스 이용약관 <span>(선택)</span></label>
												</div>
											<!-- 약관box -->
											<div class="txt_a_new" style="width: 94%; border:1px solid #f9f9f8; margin:0 auto;">
													<!-- policy영역 -->
													<div class="policy_a">
														<h3 style="padding: 7px 0 7px 0;">제1조 (목적)</h3>
														이 약관은 ㈜ 신세계까사(이하 “당사”라고 한다)에서 운영하는 신세계까사 Guud members와 굳닷컴 (https://guudmembers.casamia.co.kr, https://www.guud.com) (이하 '사이트'이라 한다)에서 제공하는 인터넷 관련 서비스(이하 '서비스'라 한다)를 이용함에 있어 '당사'와 이용자의 권리, 의무 및 책임 사항을 규정함을 목적으로 합니다.
														<h3>제2조 (용어의 정의)</h3>
														<ol>
															<li>본 약관에서 사용하는 용어의 정의는 다음과 같습니다.</li>
															<li>① “사이트”란 당사가 재화 또는 용역(이하 '재화 등'이라 한다.)을 이용자에게 제공하기 위하여 컴퓨터, TV, 모바일 등 정보통신 설비를 이용하여 재화 등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 이를 운영하는 사업자의 의미로도 사용합니다.</li>
															<li>② “서비스”란 당사가 “사이트”를 통해 회원에게 제공하는 포인트 적립, 사용, 할인, 이벤트 참여 다양한 정보의 제공 및 상품(재화와 용역 포함)의 판매 또는 상품과 관련한 다양한 판촉행위 및, 기타 부가서비스 등의 전반적인 고객 서비스 프로그램을 말합니다.</li>
															<li>③ '이용자'란 “사이트”에 접속하여 이 약관에 따라 “사이트”가 제공하는 서비스를 이용하는 고객을 말하며, 회원과 비회원으로 구분합니다.</li>
															<li>④ '회원'이란 “사이트”에 본 약관 제6조에 정해진 가입 절차에 따라 가입하여 정상적으로 “사이트”가 제공하는 서비스를 이용할 수 있는 권한을 부여 받아 계속적으로 이용할 수 있는 고객을 말합니다.</li>
															<li>⑤ '비회원'이란 회원에 가입하지 않고 “사이트”가 제공하는 서비스를 이용하는 고객을 말합니다.</li>
															<li>⑥ “신세계까사 Guud members 카드”(이하 '카드' 또는 문맥에 따라 '멤버스 카드'라 함)란 당사가 회원에게 발급하여 “서비스”를 정상적으로 이용하도록 사용 승인한 모바일카드로 일반카드 (단순 포인트 적립 사용만 가능)는 물론 당사와 별도로 제휴카드 발급 계약을 맺은 피 계약사가 발행한 다양한 제휴 카드(신용카드를 포함하며 이하에서 “제휴 카드”라 함) 및 계열사별 별도 서비스 정책에 따라 발급된 카드를 모두 포함합니다.</li>
															<li>⑦ “Guud 포인트”(이하 '포인트'라 함)란 당사가 운영하는 “서비스”를 통한 재화/서비스 구매 또는 “서비스” 참여 활동 시 지급되는 현금성 포인트를 말하며, “서비스”에서 제공하는 소진방법에 따라 적립/사용이 가능합니다.</li>
															<li>⑧ “제휴사”(이하 '제휴사'라 함)란 당사와 “사이트” 운영과 관련하여 제휴 계약을 맺고 서비스를 공동 제공하기로 합의한 회사로서 당해 회사의 영업점포 (이하 '제휴영업점'이라 함) 및 인터넷 사이트(이하 '사이트'이라 함)를 포함합니다. 추후 제휴사는 “사이트”의 사정에 따라 추가 또는 서비스 계약 해지 될 수 있으며 신세계까사 Guud members 홈페이지(https://guudmembers.casamia.co.kr)를 통해 고지 합니다.</li>
															<li>⑨ “제휴영업점”이란 “서비스”를 제공하기 위해 “사이트”와 계약하여 “서비스”를 제공하는 자로서, 당사가 직접 운영하거나 위탁 계약을 맺고 당사 상표를 걸고 운영되는 영업점(이하 '영업점' 이라 함)을 말합니다. 단, 일부 매장은 제외 될 수 있습니다. 구체적인 제휴영업점의 내역은 “사이트”에서 확인 가능합니다</li>
														</ol>

														<h3>제3조 (약관 등의 명시와 설명 및 개정)</h3>
														<ol>
															<li>사정이 있는 경우에는 “당사”는 이용계약을 해지할 수 있습니다.</li>
															<li>① “당사”가 약관을 개정할 경우에는 그 개정 약관은 그 적용 일자 이후에 체결되는 계약에만 적용되고 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관 조항이 그대로 적용됩니다. 다만 이미 계약을 체결한 이용자가 개정 약관 조항의 적용을 받기를 원하는 뜻을 제4항에 의한 개정 약관의 공지 기간 내에 “당사”에 송신하여 “당사”의 동의를 받은 경우에는 개정 약관 조항이 적용됩니다.</li>
															<li>② 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 「전자상거래 등에서의 소비자보호에 관한 법률」, 「약관의 규제에 관한 법률」, 공정거래위원회가 정하는 전자상거래 등에서의 소비자 보호지침 및 관계 법령 또는 상관례에 따릅니다.</li>
														</ol>

														<h3>제4조 (서비스의 제공 및 변경)</h3>
														<ol>
															<li>
																① “당사”가 본 약관에 정해진 바에 따라 회원에게 제공하는 서비스는 아래와 같습니다.
																<ol>
																	<li>1. 재화 또는 용역에 대한 정보 제공 및 구매 서비스</li>
																	<li>회원은 “사이트”에서 상품 또는 서비스에 대해 정보 제공 및 구매 계약을 체결할 수 있으며, “사이트”를 통해 구매 계약이 체결된 재화 또는 용역을 배송 받을 수 있습니다.</li>
																	<li>2. 적립 서비스</li>
																	<li>회원은 “사이트”, 구입에서 상품 또는 서비스 구입 또는 이벤트 참여 등을 통해 포인트를 적립 받을 수 있습니다. 단, “사이트”의 사정에 따라 지정된 일부 상품은 제외 될 수 있습니다.</li>
																	<li>3. 사용 서비스</li>
																	<li>회원은 적립된 포인트를 사용하여 “사이트”에서 지정한 상품 또는 서비스를 구입할 수 있습니다. 단, 회원이 포인트를 사용 하기 위해서는 반드시 통합회원으로 기 가입 되어 있어야 합니다.</li>
																	<li>4. 할인 서비스</li>
																	<li>회원은 “사이트”에서 상품 또는 서비스 구입 시에 “사이트”의 정책에 따라 상품 구매액의 일부를 할인 받을 수 있습니다.</li>
																	<li>5. 통합 아이디 서비스</li>
																	<li>회원은 “사이트” ID와 비밀번호를 통합하여 이용할 수 있는 회원 인증 서비스인 통합 아이디 서비스를 이용할 수 있습니다.</li>
																	<li>6. 기타 서비스</li>
																	<li>“사이트”는 상기 각 호의 서비스 이외에도 추가적인 서비스를 개발하여 회원에게 제공할 수 있으며, 자세한 “서비스” 내용은 당사가 운영하는 “사이트”를 참조하시기 바랍니다.</li>
																</ol>
															</li>
															<li>② 회원에게 제공되는 “서비스”는 “당사”의 영업정책이나 “사이트”의 사정에 따라 변경될 수 있습니다.</li>
															<li>③ “사이트”는 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공 할 재화 또는 용역의 내용을 변경할 수 있습니다. 이 경우에는 변경된 재화 또는 용역의 내용 및 제공 일자를 명시하여 현재의 재화 또는 용역의 내용을 게시한 곳에 즉시 공지합니다.</li>
															<li>④ “사이트”가 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화 등의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 본 약관 8조에서 정한 방법 등으로 즉시 통지 합니다.</li>
															<li>⑤ 전항의 경우 “사이트”는 이로 인하여 이용자가 입은 손해를 배상합니다. 다만, “사이트”가 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.</li>
														</ol>

														<h3>제 5 조 (서비스의 중단)</h3>
														<ol>
															<li>
																① 당사는 다음 각 호에 해당하는 경우 “사이트” 서비스 제공을 전부 또는 일부를 제한하거나 중지할 수 있습니다.
																<ol>
																	<li>1. 컴퓨터 등 정보통신설비의 점검, 보수, 교체 및 고장, 통신의 두절 등의 부득이한 사유가 발생한 경우</li>
																	<li>2. 전기통신사업법에 규정된 기간통신사업자가 전기통신 서비스를 중지했을 경우</li>
																	<li>3. 정전, 제반 설비의 장애 또는 이용량의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 경우</li>
																	<li>4. “사이트” 서비스 제공업자와의 계약 종료 등과 같은 당사의 제반 사정으로 서비스를 유지할 수 없는 경우</li>
																	<li>5. 기타 국가 비상 사태 나 천재 지변 등 불가항력적 사유가 있는 경우</li>
																</ol>
															</li>
															<li>② 당사는 본 조 제①항의 규정에 의하여 서비스의 이용을 제한하거나 중지한 때에는 그 사유 및 제한기간 등을 당사는 e-mail 또는 “사이트”에 게시하는 방법으로 회원에게 서비스 중단사실을 알려드립니다.</li>
															<li>③ 당사는 본 조 제①항의 사유로 서비스 제공의 일시적 중단됨으로 인하여 이용자 또는 제3자가 입은 손해에 대하여 배상합니다. 단, “사이트”가 고의 또는 과실이 없음을 입증하는 경우에는 그러하지 아니합니다.</li>
															<li>④ 사업 종목의 전환, 사업의 포기, 업체간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “사이트”는 제8조에 정한 방법으로 이용자에게 통지하고 당초 “사이트”에서 제시한 조건에 따라 소비자에게 보상 합니다. 다만, “사이트”가 보상기준 등을 고지하지 아니한 경우에는 이용자들의 포인트 또는 적립금 등을 “사이트”에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.</li>
														</ol>

														<h3>제 6 조 (회원 가입)</h3>
														<ol>
															<li>① 회원으로 가입하고자 하는 이용자는 “사이트”가 정한 가입 양식에 정해진 사항을 기입한 후 본 약관과 ‘개인정보처리방침(‘개인정보 수집 제공 및 활용 동의’ 등)'에 동의한다는 의사를 표시 함으로써 회원가입을 신청합니다</li>
															<li>
																② “사이트”는 제1항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각호에 해당하지 않는 한 회원으로 등록합니다
															</li>
															<ol>
																<li>1. 가입 신청자가 이 약관 제7조 제3항에 의하여 이전에 회원 자격을 상실한 적이 있는 경우, 다만 제7조 제3항에 의한 회원 자격 상실 후 3년이 경과한 자로서 “사이트”의 회원 재가입 승낙을 얻은 경우에는 예외로 한다.</li>
																<li>2. 등록 내용에 허위, 기재 누락, 오기가 있는 경우</li>
																<li>3. 기타 회원으로 등록하는 것이 “사이트”의 기술상 현저히 지장이 있다고 판단되는 경우.</li>
																<li>4. 회원가입 신청일 현재 만 14세 미만인 경우</li>
															</ol>
															<li>③ 회원 가입 계약의 성립 시기는 “사이트”의 승낙이 회원에게 도달한 시점으로 합니다.</li>
															<li>④ 회원은 회원가입 시 등록 사항에 변경이 있는 경우, 상당한 기간 이내에 “사이트”에 대하여 회원정보 수정 등의 방법으로 그 변경사항을 알려야 합니다.</li>
															<li>⑤ 회원은 회원자격을 타인에게 양도하거나 대여 또는 담보의 목적으로 이용할 수 없습니다.</li>
														</ol>

														<h3>제 7 조 (회원 탈퇴 및 자격 정지 등)</h3>
														<ol>
															<li>
																① 회원은 언제든지 서면, e-mail, 전화, 기타 당사가 정하는 방법으로 회원탈퇴를 요청할 수 있으며, “사이트”는 다음 제1호의 경우 또는 본 조 제②항 경우를 제외하고는 회원의 요청에 따라 조속히 회원탈퇴에 필요한 제반 절차를 수행합니다. 단, 회원탈퇴 시 이벤트 부정 이용 방지 등을 위하여 탈퇴일로부터 30일 이내에 재가입이 불가하나, 동 기간 중 제휴카드를 발급하는 경우에는 회원탈퇴가 자동 취소되며 정상적으로 서비스 이용이 가능합니다.
																<ol>
																	<li>1. “사이트”를 통해 구매하거나 예약한 재화/서비스가 배송 중이거나 실현되지 아니한 때</li>
																</ol>
															</li>
															<li>② 포인트 사용 후 사용 된 포인트의 적립 원천이 되는 구매 행위의 취소로 인해 마이너스(-) 포인트가 발생한 회원은 별도 “당사”의 승인이나 해당 포인트에 해당하는 금액을 변제하기 전까지는 탈퇴가 불가합니다.</li>
															<li>
																③ 회원이 다음 각 호에 해당하는 경우, “사이트”는 당해 회원에 대한 통보로써 회원 자격을 상실시킬 수 있습니다. 단, 1.호의 경우에는 회원에 대한 통보 없이 자격이 상실됩니다
																<ol>
																	<li>1. 회원이 사망한 경우</li>
																	<li>2. “사이트”을 이용하여 구입한 재화 등의 대금, 기타 “사이트” 이용에 관련하여 회원이 부담하는 채무를 기일에 지급하지 않는 경우</li>
																	<li>3. 가입 신청 시 허위 내용을 등록한 경우</li>
																	<li>4. 다른 사람의 ID와 비밀번호 또는 그 개인정보를 도용하는 경우</li>
																	<li>5. 다음 각 호에 해당하는 행위를 하거나, 기타 “사이트”을 이용하여 법령 또는 이 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우</li>
																	<li>가. “사이트” 화면에 다른 사람의 명예를 훼손하거나 다른 사람의 “사이트” 이용을 방해하는 행위</li>
																	<li>나. “사이트” 화면에 음란물을 개제하거나 음란사이트를 링크하는 행위</li>
																	<li>6. 다음 각 호에 해당하는 행위를 하거나, 기타 “사이트”의 정상적인 영업활동 및 서비스 운영을 고의로 방해하는 행위를 하는 경우</li>
																	<li>가. “사이트”의 이용과정에서 “사이트”의 직원에게 폭언, 협박 또는 음란한 언행 등을 하는 행위</li>
																	<li>나. “사이트”를 통해 재화 등을 구매한 후 정당한 이유 없이 상습 또는 반복적으로 취소, 반품하여 업무를 방해하는 행위</li>
																	<li>7. 기타 본 약관이 규정하는 회원의 의무를 위반하거나, 서비스 운영을 고의로 방해하는 행위를 하는 경우</li>
																	<li>8. “사이트”의 합리적인 판단에 기하여 서비스의 제공을 거부할 필요가 있다고 인정할 경우</li>
																</ol>
															</li>
															<li>④ “사이트”가 회원 자격을 제한, 정지 시킨 후, 동일한 행위가 2회 이상 반복되거나 30일 이내에 그 사유가 시정 되지 아니하는 경우 “사이트”는 회원 자격을 상실시킬 수 있습니다</li>
															<li>⑤ “사이트”가 회원 자격을 상실시키는 경우에는 회원 등록을 말소합니다. 이 경우 회원에게 이를 통지하고, 통지를 받은 날로부터 회원 등록 말소 전에 최소한 30일 이상의 기간을 정하여 소명할 기회를 부여합니다. “사이트”는 회원의 소명 내용을 심사하여 회원의 주장이 타당하다고 판단하는 경우 회원으로 하여금 계속하여 정상적인 서비스를 이용할 수 있도록 합니다.</li>
															<li>
																⑥ 본 조 제①항에 의한 회원탈퇴 또는 제③항에 의한 회원자격상실이 확정되는 시점은 아래와 같습니다.
																<ol>
																	<li>1. 회원의 탈퇴요청의 경우에는 “사이트”가 회원탈퇴 처리의 완료를 통보하는 시점에서 탈퇴가 완료 됩니다. 다만, “사이트”는 완료 통보일로부터 30일의 유예 기간 동안 기 적립된 포인트 정보를 소멸시키지 아니하고 저장하였다가, 회원이 별도의 절차를 거쳐 재가입 요청을 하고 회사가 이를 허락하여 유예 기간 내 재가입할 경우, 모든 포인트를 재사용토록 하며, 재가입이 없이 유예기간이 지나면, 모든 포인트가 즉시 소멸됩니다.</li>
																	<li>2. 회원자격상실의 경우 통보일에 회원 자격상실이 확정됩니다. 단 사망으로 인한 자격상실의 경우에는 “사이트”의 통보여부와 상관없이 회원 사망일에 자격상실이 확정되며, 당해 회원에게 제공된 서비스와 관련된 권리나 의무 및 포인트는 당해 회원의 상속인에게 상속되지 않습니다</li>
																</ol>
															</li>
															<li>
																⑦ 본 조 제①항에 의한 회원탈퇴 또는 제③항에 의한 회원자격상실이 된 경우 회원 정보는 다음과 같이 처리 됩니다.
																<ol>
																	<li>1. 탈퇴한 회원의 정보는 본 약관 제15조에 규정하는 바에 따라 일정 기간 보유 후 삭제처리 됩니다.</li>
																	<li>2. 회원 자격이 상실된 회원의 정보는 회원 자격상실 확정 후 서비스 부정 이용 방지 및 타 회원의 추가적인 피해 방지를 위해 2년간 보유하며, 이 기간 동안 재가입 및 서비스 이용이 불가 할 수도 있습니다.</li>
																</ol>
															</li>
														</ol>

														<h3>제 8 조 (회원에 대한 통지)</h3>
														<ol>
															<li>① “사이트”가 회원에 대한 통지를 하는 경우, 회원이 “사이트”와 미리 약정하여 지정한 전자우편 주소로 할 수 있습니다.</li>
															<li>② “사이트”는 불특정 다수 회원에 대한 통지의 경우 1주일 이상 “사이트” 게시판에 게시함으로써 개별 통지에 갈음 할 수 있습니다. 다만, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별 통지를 합니다.</li>
														</ol>

														<h3>제 9 조 (구매신청)</h3>
														<ol>
															<li>
																① “사이트” 이용자는 “사이트”상에서 다음 또는 이와 유사한 방법에 의하여 구매를 신청하며, “사이트”는 이용자가 구매를 신청함에 있어서 다음의 각 내용을 알기 쉽게 제공하여야 합니다.
																<ol>
																	<li>1. 재화 등의 검색 및 선택</li>
																	<li>2. 성명, 주소, 전화번호, 전자우편주소(또는 이동전화번호) 등의 입력</li>
																	<li>3. 약관 내용, 청약철회권이 제한되는 서비스, 배송료, 설치비등의 비용 부담과 관련한 내용에 대한 확인</li>
																	<li>4. 이 약관에 동의하고 위 3호의 사항을 확인하거나 거부하는 표시(예. 마우스 클릭)</li>
																	<li>5. 재화 등의 구매 신청 및 이에 관한 확인 또는 “사이트”의 확인에 대한 동의</li>
																	<li>6. 결제 방법의 선택</li>
																	<li>7. 기타 “사이트”가 별도로 정하는 절차</li>
																</ol>
															</li>
															<li>② “사이트”가 제3자에게 구매자 개인정보를 제공•위탁할 필요가 있는 경우 실제 구매신청 시 구매자의 동의를 받아야 하며, 회원가입 시 미리 포괄적으로 동의를 받지 않습니다. 이 때 “사이트”는 제공되는 개인정보 항목, 제공받는 자, 제공받는 자의 개인정보 이용 목적 및 보유‧이용 기간 등을 구매자에게 명시하여야 합니다. 다만 「정보통신망이용촉진 및 정보보호 등에 관한 법률」 제25조 제1항에 의한 개인정보 취급위탁의 경우 등 관련 법령에 달리 정함이 있는 경우에는 그에 따릅니다.</li>
														</ol>

														<h3>제 10 조 (계약의 성립)</h3>
														<ol>
															<li>
																① “사이트”는 제9조와 같은 구매 신청에 대하여 다음 각호에 해당하면 승낙하지 않을 수 있습니다. 다만, 미성년자와 계약을 체결하는 경우에는 법정 대리인의 동의를 얻지 못하면 미성년자 본인 또는 법정대리인이 계약을 취소할 수 있다는 내용을 고지하여야 합니다.
																<ol>
																	<li>1. 신청 내용에 허위, 기재 누락, 오기가 있는 경우</li>
																	<li>2. 미성년자가 담배, 주류 등 청소년보호법에서 금지하는 재화 및 용역을 구매하는 경우</li>
																	<li>3. 상행위(재판매)를 목적으로 구매하는 거래이거나, 거래 정황상 상행위(재판매)를 목적으로 한 구매로 판단되는 경우</li>
																	<li>4. 기타 구매 신청에 승낙하는 것이 “사이트” 기술상 현저히 지장이 있다고 판단하는 경우</li>
																</ol>
															</li>
															<li>② “사이트”의 승낙이 제12조 제1항의 수신확인통지형태로 이용자에게 도달한 시점에 계약이 성립한 것으로 봅니다.</li>
															<li>③ “사이트”의 승낙의 의사 표시에는 이용자의 구매 신청에 대한 확인 및 판매 가능 여부, 구매 신청의 정정 취소 등에 관한 정보 등을 포함하여야 합니다.</li>
														</ol>

														<h3>제 11 조 (지급 방법)</h3>
														<ol>
															<li>
																① “사이트”에서 구매한 재화 또는 용역에 대한 대금 지급 방법은 다음 각호의 방법 중 가용한 방법으로 할 수 있습니다. 단, “사이트”는 이용자의 지급 방법에 대하여 재화 등의 대금에 어떠한 명목의 수수료도 추가하여 징수할 수 없습니다.
																<ol>
																	<li>1. 온라인 무통장입금, 폰뱅킹, 인터넷뱅킹, 메일 뱅킹 등의 각종 계좌 이체</li>
																	<li>2. 선불카드, 직불카드, 신용카드 등의 각종 카드 결제</li>
																	<li>3. 전자 화폐에 의한 결제</li>
																	<li>4. “사이트”가 지급한 포인트등에 의한 결제</li>
																	<li>5. “사이트”과 계약을 맺었거나 “사이트”가 인정한 상품권에 의한 결제</li>
																	<li>6. 기타 전자적 지급 방법에 의한 대금 지급 등</li>
																</ol>
															</li>
														</ol>

														<h3>제 12 조 (수신 확인 통지, 구매 신청 변경 및 취소)</h3>
														<ol>
															<li>① “사이트”는 이용자의 구매 신청이 있는 경우 이용자에게 수신 확인 통지를 합니다.</li>
															<li>② 수신 확인 통지를 받은 이용자는 의사표시의 불일치 등이 있는 경우에는 수신확인 통지를 받은 후 즉시 구매 신청 변경 및 취소를 요청할 수 있고, “사이트”는 배송 전에 이용자의 요청이 있는 경우에는 지체 없이 그 요청에 따라 처리하여야 합니다. 다만 이미 대금을 지불한 경우에는 제15조 청약 철회 등에 관한 규정에 따릅니다.</li>
														</ol>


														<h3>제 13 조 (재화 등의 공급)</h3>
														<ol>
															<li>① “사이트”는 이용자와 재화 등의 공급 시기에 관하여 별도의 약정이 없는 이상, 이용자가 청약을 한 날부터 7일 이내에 재화 등을 배송할 수 있도록 주문제작, 포장 등 기타의 필요한 조치를 취합니다. 다만 “사이트”가 이미 재화 등의 대금의 전부 또는 일부를 받은 경우에는 대금의 전부 또는 일부를 받은 날부터 3영업일 이내에 조치를 취합니다. 다만, 소비자와 “사이트”간 재화 등의 공급 시기에 관하여 별도의 약정이 있는 경우에는 그러하지 아니합니다. 이때 “사이트”는 이용자가 재화 등의 공급 절차 및 진행 사항을 확인할 수 있도록 적절한 조치를 합니다.</li>
															<li>② “사이트”는 이용자가 구매한 재화에 대해 배송 수단, 수단별 배송 비용 부담자, 수단별 배송 기간 등을 명시 합니다. 만약 “사이트”가 약정 배송 기간을 초과한 경우에는 그로 인한 이용자의 손해를 배상하여야 합니다. 다만 “사이트”가 고의, 과실이 없음을 입증한 경우에는 그러하지 아니합니다.</li>
															<li>③ “사이트”와 이용자간에 상품의 인도시기 또는 용역의 제공시기에 관하여 별도의 약정이 있는 경우에는 당해 약정이 이 약관에 우선합니다</li>
														</ol>

														<h3>제 14 조 (환급)</h3>
														<ol>
															<li>① “사이트”는 이용자가 구매 신청한 재화 등이 품절 등의 사유로 인도 또는 제공을 할 수 없을 때에는 지체 없이 그 사유를 이용자에게 통지하고 사전에 재화 등의 대금을 받은 경우에는 대금을 받은 날부터 3영업일 이내에 환급하거나 환급에 필요한 조치를 취합니다.</li>
														</ol>

														<h3>제 15 조 (청약 철회 등)</h3>
														<ol>
															<li>① “사이트”와 재화 등의 구매에 관한 계약을 체결한 이용자는 「전자상거래 등에서의 소비자보호에 관한 법률」 제13조 제2항에 따른 계약내용에 관한 서면을 받은 날(그 서면을 받은 때보다 재화 등의 공급이 늦게 이루어진 경우에는 재화 등을 공급받거나 재화 등의 공급이 시작된 날을 말합니다)부터 7일 이내에는 청약의 철회를 할 수 있습니다. 다만, 청약철회에 관하여 「전자상거래 등에서의 소비자보호에 관한 법률」에 달리 정함이 있는 경우에는 동 법 규정에 따릅니다.</li>
															<li>
																② 이용자는 재화 등을 배송 받은 경우 다음 각호의 1에 해당하는 경우에는 반품 및 교환을 할 수 없습니다.
																<ol>
																	<li>1. 이용자에게 책임 있는 사유로 재화 등이 멸실 또는 훼손된 경우 (다만 재화 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약 철회를 할 수 있음)</li>
																	<li>2. 이용자의 사용 또는 일부 소비에 의하여 재화 등의 가치가 현저히 감소한 경우</li>
																	<li>3. 시간의 경과에 의하여 재판매가 곤란할 정도로 재화 등의 가치가 현저히 감소한 경우</li>
																	<li>4. 같은 성능을 지닌 재화 등으로 복제가 가능한 경우 그 원본인 재화 등의 포장을 훼손한 경우</li>
																	<li>5. '사이트”가 특정 재화 등에 대하여 청약철회 시 회복할 수 없는 중대한 피해가 예상되어 사전에 청약철회 제한에 관하여 고지하고, 이용자의 동의가 이루어진 경우</li>
																	<li>6. 주문제작의 경우에는 당사의 고의 또는 과실이 아닌 경우</li>
																</ol>
															</li>
															<li>③ 제2항 제2호 내지 제4호의 경우에는 “사이트”가 사전에 청약 철회 등이 제한되는 사실을 소비자가 쉽게 알 수 있는 곳에 명기하거나 시용 상품을 제공하는 등의 조치를 하지 않았다면 이용자의 청약 철회 등이 제한되지 않습니다.</li>
															<li>④ 이용자는 제1항 및 제2항의 규정에도 불구하고 재화 등의 내용이 표시, 광고 내용과 다르거나 계약 내용과 다르게 이행된 때에는 당해 재화 등을 공급받은 날부터 3월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 청약 철회 등을 할 수 있습니다.</li>
														</ol>

														<h3>제 16 조 (청약 철회 등의 효과)</h3>
														<ol>
															<li>① “사이트”는 이용자로부터 재화 등을 반환 받은 경우 3영업일 이내에 이미 지급받은 재화 등의 대금을 환급 합니다. 이 경우 “사이트”가 이용자에게 재화 등의 환급을 지연한 때에는 그 지연 기간에 대하여 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」 제21조의3에서 정하는 지연 이자율을 곱하여 산정한 지연 이자(이하 '지연 배상금'이라 한다)를 지급합니다.</li>
															<li>② “사이트”는 위 대금을 환급함에 있어서 이용자가 신용카드 그밖에 대통령령이 정하는 결제 수단으로 재화 등의 대금을 지급한 때에는 지체 없이 당해 결제 수단을 제공한 사업자로 하여금 재화 등의 대금 청구를 정지 또는 취소하도록 요청합니다.</li>
															<li>③ 청약 철회 등의 경우 공급 받은 재화 등의 반환에 필요한 비용은 이용자가 부담합니다. “사이트”는 이용자에게 청약 철회 등을 이유로 위약금 또는 손해배상을 청구하지 않습니다. 다만 재화 등의 내용이 표시, 광고 내용과 다르거나 계약 내용과 다르게 이행되어 청약 철회 등을 하는 경우 재화 등의 반환에 필요한 비용은 “사이트”가 부담합니다.</li>
															<li>④ 이미 재화 등이 일부 사용 또는 일부 소비된 경우, “사이트”는 그 재화 등의 사용 또는 일부 소비에 의하여 이용자가 얻은 이익 또는 그 재화 등의 공급에 소요된 비용에 상당하는 금액으로서 「전자상거래 등에서의 소비자보호에 관한 법률 시행령」 제24조에서 정하는 범위의 금액의 지급을 이용자에게 청구할 수 있습니다.</li>
															<li>⑤ 이용자가 상품을 구매하여 포인트를 지급 받은 경우 청약철회를 하기 위해서는 이를 “사이트”에 반환해야 합니다.</li>
															<li>⑥ 이용자가 재화 등을 제공받을 때 발송비를 부담한 경우에 “사이트”는 청약 철회 시 그 비용을 누가 부담하는지를 알기 쉽도록 명확하게 표시합니다.</li>
														</ol>

														<h3>제 17 조 (포인트의 적립 및 관리)</h3>
														<ol>
															<li>
																① “사이트”는 상품을 구입하거나 서비스를 이용하고 그에 따른 대금을 결제한 회원에게 “사이트” 간에 약정 고지된 바에 따라 아래와 같은 방식으로 포인트를 산정, 부여합니다. 단, 포인트와 관련하여 발생하는 제세공과금은 회원이 부담합니다.
																포인트 = (상품/서비스의 구입/이용 실 결제 대금) X (고지된 당사와 각 제휴사의 포인트 적립률 또는 할인율)
															</li>
															<li>② 제휴사의 정책에 따라 일부 제휴 영업점에서는 포인트 적립이 불가 할 수도 있으며 제휴사 운영하는 일부 온라인 쇼핑몰의 경우 적립률이 별도로 적용 될 수 있습니다. 이 경우 해당 제휴 영업점이나 쇼핑몰에 해당 내용을 별도 표기 또는 안내 합니다.</li>
															<li>③ 포인트는 배송 완료 시점 익일 자동 일괄 적립됩니다. 일부 제휴사의 경우는 해당 제휴사가 요구하는 방법에 의해 추후 적립을 해야 합니다. 적립되는 포인트는 가용화되는 즉시부터 물품 또는 서비스 구매 시, 사용할 수 있습니다. 가용화 되어 사용 가능한 포인트는 “사이트” 또는 제휴영업점에서 확인이 가능합니다.</li>
															<li>④ 본 조 제②항에 따라 산정 부여 되거나 이벤트로 인한 추가 적립되는 포인트 중 소수점 이하의 단위는 절사되고, “사이트”, 제휴가맹점이 별도로 정한 상품/서비스를 구매하거나 현금이나 신용카드 결제가 아닌 포인트로 결제하는 경우에는 포인트가 적립되지 않습니다.</li>
															<li>⑤ 본 조 제②항의 경우 회원이 상품/서비스에 대해 현금 또는 신용 카드로 결제를 한 후 멤버스 카드와 기존 제휴사 멤버십 카드 또는 기타의 제휴카드나 할인카드를 제시하고 이중 포인트 누적 또는 이중 할인요구 등을 했을 때 “사이트”는 이를 거부할 수 있습니다. 이때 회원은 “사이트”의 요구에 따라 하나의 포인트 제도 또는 할인제도를 선택하여야 합니다. 단, “사이트”가 중복 할인 서비스 또는 적립서비스 등을 개발해 별도로 허용한 경우는 제외합니다.</li>
															<li>⑥ 포인트 적립은 상품/서비스를 구입 즉시 요청 해 적립하는 것이 원칙으로 하나 “사이트”가 공식적으로 허용한 기한이 있는 경우 회원은 본인의 구매내역에 한하여 그 기간 내 구매가 이루어진 제휴영업점에서 구매 영수증을 제시함으로써 소급하여 적립을 청구 할 수 있습니다. “사이트”는 내부정책에 따라 포인트 소급 적립 청구 기간 변경이 가능하고 경우에 따라 회원의 소급 청구를 거부 할 수 있습니다.</li>
															<li>⑦ 회원의 구매로 인해 적립되는 포인트가 아닌 “사이트”가 이벤트 등의 마케팅 활동으로 회원에게 추가로 제공한 포인트의 유효기간은 “사이트”의 정책에 따라 별도로 책정 될 수 있으며 이는 별도로 공지합니다.</li>
															<li>⑧ 포인트 적립률 및 기준은 “사이트”의 내부 방침에 따라 임의로 변경될 수 있습니다.</li>
														</ol>

														<h3>제 18 조 (포인트의 사용)</h3>
														<ol>
															<li>① 포인트를 사용하기 위해서는 회원 가입을 통해 회원의 지위를 취득해야 합니다.</li>
															<li>② 적립된 포인트 사용 순서는 회원이 보유 중인 사용 가능한 포인트 (이하 '가용포인트'라 함) 중 소멸일자가 빠른 포인트부터 우선 차감 사용합니다.</li>
															<li>③ “사이트”는 별도로 사용 가능 최저 포인트 및 포인트 사용 단위를 정하며, 이는 “사이트” 이용 홈페이지 또는 제휴 영업점 매장 내 고시(구두안내 포함) 중 1가지 이상 방법으로 고지 됩니다.</li>
															<li>* 현재 “사이트”의 포인트 는 1포인트 이상인 경우 1포인트 단위로 사용가능합니다. 제휴영업점중 직영점은 10포인트 이상인 경우 10포인트 단위로 사용가능합니다. 기타 제휴영업점 및 제휴사이트 포인트는 개별로 고시된 내용에 따릅니다.</li>
															<li>④ 회원은 “사이트” 및 제휴영업점 내에서 상품/서비스의 결제 수단으로 포인트를 현금과 동일하게 사용하는 것은 가능하나, 현금으로 환불되지 않습니다.</li>
															<li>⑤ 회원은 포인트를 타인에게 양도하거나 대여 또는 담보의 목적으로 이용할 수 없습니다.</li>
															<li>⑥ 포인트 사용 후 사용 된 포인트의 적립 원천이 되는 구매 행위의 취소로 인해 잔여 포인트가 마이너스(-)인 경우 잔여 가용포인트가 0 포인트가 되기 전까지 적립되는 포인트는 사용이 불가합니다.</li>
															<li>
																⑦ '사이트'가 기존 멤버십 회원에게 개별적으로 제공했던 기존 멤버십 포인트는
																'당사”가 정한 정책에 따라 종전과 동일하게 사용 가능합니다.
															</li>
														</ol>

														<h3>제 18 조 (포인트의 사용)</h3>
														<ol>
															<li>① 포인트를 사용하기 위해서는 회원 가입을 통해 회원의 지위를 취득해야 합니다.</li>
															<li>② 적립된 포인트 사용 순서는 회원이 보유 중인 사용 가능한 포인트 (이하 '가용포인트'라 함) 중 소멸일자가 빠른 포인트부터 우선 차감 사용합니다..</li>
															<li>③ “사이트”는 별도로 사용 가능 최저 포인트 및 포인트 사용 단위를 정하며, 이는 “사이트” 이용 홈페이지 또는 제휴 영업점 매장 내 고시(구두안내 포함) 중 1가지 이상 방법으로 고지 됩니다.</li>
															<li>* 현재 “사이트”의 포인트 는 1포인트 이상인 경우 1포인트 단위로 사용가능합니다. 제휴영업점중 직영점은 10포인트 이상인 경우 10포인트 단위로 사용가능합니다. 기타 제휴영업점 및 제휴사이트 포인트는 개별로 고시된 내용에 따릅니다.</li>
															<li>④ 회원은 “사이트” 및 제휴영업점 내에서 상품/서비스의 결제 수단으로 포인트를 현금과 동일하게 사용하는 것은 가능하나, 현금으로 환불되지 않습니다.</li>
															<li>⑤ 회원은 포인트를 타인에게 양도하거나 대여 또는 담보의 목적으로 이용할 수 없습니다.</li>
															<li>⑥ 포인트 사용 후 사용 된 포인트의 적립 원천이 되는 구매 행위의 취소로 인해 잔여 포인트가 마이너스(-)인 경우 잔여 가용포인트가 0 포인트가 되기 전까지 적립되는 포인트는 사용이 불가합니다.</li>
															<li>
																⑦ '사이트'가 기존 멤버십 회원에게 개별적으로 제공했던 기존 멤버십 포인트는
																'당사”가 정한 정책에 따라 종전과 동일하게 사용 가능합니다.
															</li>
														</ol>

														<h3>제 19 조 (포인트의 정정, 취소 및 소멸)</h3>
														<ol>
															<li>① 적립된 포인트에 오류가 있을 경우 회원은 오류발생 시점부터 60일 이내에 “사이트”에 정정 신청을 하여야 하며, “사이트”는 회원의 정정 신청일로부터 최대 30일 이내에 정정절차를 마쳐야 합니다. 단, 회원은 이를 증명할 수 있는 유효한 영수증 등의 자료를 제시하거나, 해당 제휴영업점으로부터 동의를 얻어야 합니다.</li>
															<li>② 포인트는 최초 적립된 시점부터 24개월이 지난 시점의 해당 월 말일에 먼저 적립된 포인트부터 월 단위로 자동 소멸됩니다. “사이트”는 회원이 보유한 포인트를 소멸예정일이 도래하여 소멸시키는 경우 포인트 소멸과 관련된 내용을 최소 15일전에 e-mail 등으로 발송합니다. 단, 특정 이벤트를 통해 제공된 포인트는 이벤트 진행 시 포인트 유효기간 및 소멸일을 별도로 안내하고, 소멸 안내 e-mail 발송에서는 제외될 수 있습니다. 또한, 회원이 “사이트”에서 해당 월 소멸 예정 포인트 확인이 가능하도록 조치합니다.</li>
															<li>③ 회원이 구매한 물품 등을 환불하는 경우, 적립이나 사용한 포인트는 취소 또는 복원됩니다.</li>
															<li>④ 본 약관 제7조 제①항에 정해진 방법으로 탈퇴를 하고자 하는 회원이 잔여 포인트를 사용하고자 할 경우 회원탈퇴 요청일 전까지 적립된 가용 포인트를 본 약관이 정하는 바에 따라 사용해야 합니다.</li>
															<li>⑤ 탈퇴 전까지 사용하지 않은 포인트는 제7조 제⑥항에 의거 일정한 유예기간 이후 자동으로 소멸됩니다.</li>
														</ol>

														<h3>제 20 조 (개인정보보호)</h3>
														<ol>
															<li>① “사이트”는 회원이 가입신청을 할 때 제공하거나 서비스 이용 시 발생하는 각종 개인정보뿐만 아니라 사전에 회원으로부터 동의를 얻어 회원이 다양한 서비스 이용 시 발생하는 정보를 수시로 수집 저장 할 수 있으며, 이를 분석하여 회원에게 보다 나은 서비스를 제공하고 고객 지향적인 마케팅 활동을 하기 위해 사용합니다. 개인정보수집 및 활용에 관한 자세한 내용은 “사이트”에 게재되어 있는 '개인정보처리방침'에 따릅니다. 이에 관한 자세한 내용은 “사이트”를 참고하시기 바랍니다.</li>
															<li>② “사이트”는 이용자의 개인정보 수집 시 서비스제공을 위하여 필요한 범위에서 최소한의 개인정보 수집을 위해 회원으로부터 별도 양식에 따른 '개인정보처리방침(개인정보 수집 및 활용 동의서)'을 받고 있으며, 회원은 언제든지 이를 철회할 수 있습니다.</li>
															<li>③ 회원은 “사이트”에 제공한 개인정보에 변경사항이 있는 경우에는 지체 없이 “사이트”에 그 변경사실을 통지하여야 하며, 이를 통지하지 않아 발생한 손해에 대하여 “사이트”는 어떠한 책임도 지지 않습니다.</li>
															<li>④ “사이트”는 관련 법령상 의무이행을 위하여 구매계약 이전에 본인확인이 필요한 경우에 해당하여 회원가입 시 구매계약이행에 필요한 최소한의 특정 개인정보를 미리 수집합니다.</li>
															<li>⑤ “사이트”가 이용자의 개인 정보를 수집•이용하는 때에는 반드시 당해 이용자에게 그 목적을 고지하고 동의를 받습니다.</li>
															<li>⑥ “사이트”는 수집된 개인정보를 목적 외의 용도로 이용할 수 없으며, 새로운 이용목적이 발생한 경우 또는 제3자에게 제공하는 경우에는 이용•제공단계에서 당해 이용자에게 그 목적을 고지하고 동의를 받습니다. 다만, 관련 법령에 달리 정함이 있는 경우에는 예외로 합니다.</li>
															<li>⑦ “사이트”가 제5항과 제6항에 의해 이용자의 동의를 받아야만 하는 경우에는 개인정보보호책임자의 신원(소속, 성명 및 전화번호 기타 연락처), 정보의 수집목적 및 이용목적, 제3자에 대한 정보제공 관련사항(제공받는자, 제공목적 및 제공할 정보의 내용)등 정보통신망 이용촉진 및 정보보호에 관한 법률과 개인정보보호법에서 규정한 사항을 미리 명시하거나 고지해야 하며 이용자는 언제든지 이 동의를 철회할 수 있습니다.</li>
															<li>
																⑧ “사이트”는 수집된 개인정보를 ‘개인정보처리방침’에 기재된 자에게만 제공하고 기재된 목적 범위 내에서만 활용하며 수집한 개인정보를 당해 회원의 동의없이 ‘개인정보처리방침'에 기재된 목적 범위를 넘어선 용도로 이용하거나 기재된 자 이외의 제3자에게 제공할 수 없습니다. <br> 다만, 다음의 경우에는 예외로 합니다.
																<ol>
																	<li>1. 배송업무상 배송업체에게 배송에 필요한 최소한의 회원의 정보(성명, 주소, 전화번호)를 알려주는 경우</li>
																	<li>2. 통계작성 연구 또는 마케팅 활동 등을 위하여 필요한 경우로서 특정 개인을 알아볼 수 없는 형태로 가공되어 제공하는 경우</li>
																	<li>3. 재화 등의 거래에 따른 대금정산을 위하여 필요한 경우</li>
																	<li>4. 법률의 규정 또는 법률에 의하여 필요한 불가피한 사유가 있는 경우</li>
																	<li>5. “사이트”와 관련하여 합병, 인수, 포괄적 영업양도 등이 있는 경우 합병 후 당사, 인수당사 및 영업양수인에 대하여 제공하는 경우</li>
																</ol>
															</li>
															<li>
																⑨ “사이트”는 수집된 회원의 개인정보를 수집 목적 또는 제공 받은 목적이 달성되면 지체 없이 파기함을 원칙으로 합니다. 다만, 다음 각호의 경우 일정기간 동안 예외적으로 수집한 회원정보의 전부 또는 일부를 보관할 수 있습니다.
																<ol>
																	<li>1. 고객요구사항 처리 및 A/S의 목적 : 수집한 회원정보를 회원탈퇴 후 30일간 보유</li>
																	<li>2. 기타 “사이트”가 필요에 의해 별도로 동의를 득한 경우 : 별도 동의를 받은 범위 (회원정보 및 보유 기간) 내에서 보유</li>
																</ol>
															</li>
															<li>
																⑩ 제9항에도 불구하고 상법 및 ‘전자상거래 등에서 소비자보호에 관한 법률' 등 관련 법령의 규정에 의하여 다음과 같이 일정기간 보유해야 할 필요가 있을 경우에는 관련 법령이 정한 기간 또는 다음 각 호의 기간 동안 회원정보를 보유할 수 있습니다.
																<ol>
																	<li>1. 계약 또는 청약철회 등에 관한 기록 : 5년</li>
																	<li>2. 대금결제 및 재화 등의 공급에 관한 기록 : 5년</li>
																	<li>3. 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년</li>
																</ol>
															</li>
															<li>⑪ 회원은 회원탈퇴를 통해 본 약관과 관련한 개인정보의 제공 및 활용과 관련한 동의를 철회할 수 있습니다. 그 경우에도 “사이트”는 본 조 제9항과 10항에 한하여 회원정보를 보유할 수 있습니다.</li>
															<li>⑫ 이용자는 언제든지 “사이트”가 가지고 있는 자신의 개인 정보에 대해 열람 및 오류 정정을 요구할 수 있으며 “사이트”는 이에 대해 지체 없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한 경우에는 “사이트”는 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.</li>
															<li>⑬ “사이트”는 개인정보보호를 위하여 이용자의 개인정보를 처리하는 자를 최소한으로 제한하여야 하며, 신용카드, 은행계좌 등을 포함한 이용자의 개인정보의 분실, 도난, 유출, 동의 없는 제3자 제공, 변조 등으로 인한 이용자의 손해에 대하여 모든 책임을 집니다.</li>
															<li>⑭ “사이트” 또는 그로부터 개인 정보를 제공받는 제3자는 개인정보의 수집 목적 또는 제공받은 목적을 달성한 때에는 당해 개인정보를 지체 없이 파기합니다.</li>
															<li>⑮ “사이트”는 개인정보의 수집•이용•제공에 관한 동의란을 미리 선택한 것으로 설정해두지 않습니다. 또한 개인정보의 수집•이용•제공에 관한 이용자의 동의거절 시 제한되는 서비스를 구체적으로 명시하고, 필수수집항목이 아닌 개인정보의 수집•이용•제공에 관한 이용자의 동의 거절을 이유로 회원가입 등 서비스 제공을 제한하거나 거절하지 않습니다.</li>
														</ol>

														<h3>제 21 조 (사이트의 의무)</h3>
														<ol>
															<li>① “사이트”는 본 약관에서 정한 바에 따라 계속적이고 안정적인 서비스의 제공을 위하여 지속적으로 노력하며, 설비에 장애가 생기거나 멸실 된 때에는 지체 없이 이를 수리 복구하여야 합니다. 본 약관 제5조 ①항에 근거하여 부득이한 경우에는 서비스를 일시 중단하거나 중지할 수 있습니다.</li>
															<li>② “사이트”는 회원의 개인정보 수집 및 이용에 관련 하여 ‘개인정보 처리 방침’을 준수하며, 이용자가 안전하게 인터넷 서비스를 이용할 수 있도록 이용자의 개인정보(신용정보 포함) 보호를 위한 보안 시스템을 갖추어야 합니다.</li>
															<li>③ “사이트”는 회원으로부터 소정의 절차에 의해 제기되는 의견이나 불만이 정당하다고 인정할 경우에는 적절한 절차를 거처 처리하여야 합니다. 처리 시 일정 기간이 소요될 경우 회원에게 그 사유와 처리 일정을 알려주어야 합니다.</li>
															<li>④ “사이트”가 제공하는 서비스로 인하여 회원에게 손해가 발생한 경우 그러한 손해가 “사이트”의 고의나 과실에 기해 발생한 경우에 한하여 당사에서 책임을 부담하며, 그 책임의 범위는 예측이 가능한 통상손해에 한합니다.</li>
															<li>⑤ “사이트”는 정보통신망 이용촉진 및 정보보호에 관한 법률, 통신비밀보호법, 전기통신사업법 등 서비스의 운영, 유지와 관련 있는 법규를 준수합니다.</li>
															<li>⑥ “사이트”는 이용자가 원하지 않는 영리 목적의 광고성 전자 우편을 발송하지 않으며, “사이트”가 상품이나 용역에 대하여 '표시•광고의 공정화에 관한 법률' 제3조 소정의 부당한 표시, 광고 행위를 함으로써 이용자가 손해를 입은 때에는 이를 배상할 책임을 집니다.</li>
														</ol>

														<h3>제 22 조 (톻합회원 ID 및 비밀번호에 대한 의무)</h3>
														<ol>
															<li>① 당사는 서비스를 “사이트”와 본 약관 제2조 제⑥항에 명시된 제휴사의 서비스홈페이지를 회원이 원활하게 이용 할 수 있도록 회원의 ID와 비밀번호를 통합하여 사용할 수 있는 통합아이디서비스를 제공하고 있습니다. 향후 통합아이디를 통해 사용할 수 있는 서비스 홈페이지는 “사이트”의 정책에 따라 추가/변동될 수 있습니다. 단, “사이트”를 제외한 서비스홈페이지 이용 시에는 “사이트”가 정한 정책에 따라, “사이트”의 서비스이용약관에 동의하는 등의 절차를 완료하여야 합니다.</li>
															<li>② 제18조의 경우를 제외한 회원의 ID 및 비밀번호에 관한 관리책임은 회원 본인에게 있으며 제3자에게 자신의 ID 및 비밀번호를 알려주거나 이용하게 해서는 안됩니다.</li>
															<li>③ 회원이 자신의 ID 및 비밀번호를 도용 당하거나 제3자가 사용하고 있음을 인지한 경우에는 즉시 “사이트”에 통보하여 그 안내에 따라야 합니다.</li>
															<li>④ “사이트”는 각 사의 귀책사유 없이 회원이 자신의 ID 및 비밀번호를 도용 당한 데 따른 손해에 대해서는 법적 책임을 부담하지 않습니다.</li>
														</ol>

														<h3>제 23 조 (이용자의 의무)</h3>
														<ol>
															<li>이용자는 다음 행위를 하여서는 안됩니다.</li>
															<li>1. 개인정보를 허위로 등록, 신청, 변경하는 행위</li>
															<li>2. 타인의 명의나 카드정보 등을 도용하여 물품을 구입하거나, 물품구입 등을 가장하여 “사이트”의 서비스를 이용하는 행위.</li>
															<li>3. “사이트”가 제공하는 서비스 이용방법에 의하지 아니하고 비정상적인 방법(컴퓨터 프로그램 포함)으로 서비스를 이용하거나 시스템에 접속하는 행위</li>
															<li>4. “사이트” 기타 제3자의 지적재산권을 침해하는 행위</li>
															<li>5. “사이트” 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위</li>
															<li>6. 외설 또는 폭력적인 메시지, 화상, 음성, 기타 공서양속에 반하는 정보를 “사이트”에 공개 또는 게시하는 행위</li>
														</ol>

														<h3>제 24 조 (연결 웹사이트와 피연결 웹사이트 간의 관계)</h3>
														<ol>
															<li>① 상위 웹사이트와 하위 웹사이트가 하이퍼링크(예: 하이퍼 링크의 대상에는 문자, 그림, 동화상 등이 포함됨) 방식 등으로 연결된 경우, 전자를 연결 웹사이트라고 하고 후자를 피연결 웹사이트라고 합니다.</li>
															<li>② 연결 웹사이트는 피연결 웹사이트가 독자적으로 제공하는 재화 등에 의하여 이용자와 행하는 거래에 대해서 보증 책임을 지지 않는다는 뜻을 연결 “사이트” 초기 화면 또는 연결되는 시점의 팝업 화면으로 명시한 경우에는 그 거래에 대한 보증 책임을 지지 않습니다.</li>
														</ol>

														<h3>제 25 조 (저작권의 귀속 및 이용 제한)</h3>
														<ol>
															<li>① “사이트”가 작성한 저작물에 대한 저작권 기타 지적 재산권은 “사이트”에 귀속합니다.</li>
															<li>② 이용자는 “사이트”를 이용함으로써 얻은 정보 중 “사이트”에게 지적 재산권이 귀속된 정보를 “사이트”의 사전 승낙 없이 복제, 송신, 출판, 배포, 방송 기타 방법에 의하여 영리 목적으로 이용하거나 제3자에게 이용하게 하여서는 안됩니다.</li>
															<li>③ 회원이 게시한 게시물의 내용에 대한 권리와 책임은 이용자에게 있습니다. 따라서 회원의 게시물이 타인의 저작권을 침해함으로써 발생하는 민, 형사상의 책임은 전적으로 이용자가 부담하여야 합니다.</li>
															<li>④ “사이트”는 본 약관에 따라 이용자에게 귀속된 저작권을 사용하는 경우 당해 이용자에게 통보하여야 합니다.</li>
															<li>
																⑤ “사이트”는 게시된 내용을 게시물의 동일성을 해하지 않는 범위 내에서 편집, 이동시킬 수 있는 권리를 보유하며, 다음의 경우 사전 통지 없이 삭제 할 수 있습니다.
																<ol>
																	<li>1. 본 약관에 위배되거나 상용 또는 불법, 음란, 저속하다고 판단되는 게시물을 게시한 경우</li>
																	<li>2. 다른 회원 또는 제3자를 비방하거나 중상 모략으로 명예를 손상시키는 내용인 경우</li>
																	<li>3. 당사에서 규정한 게시기간이나 용량을 초과한 경우</li>
																	<li>4. 공공질서 및 미풍양속에 위반되거나 범죄적 행위에 결부된다고 인정되는 내용일 경우</li>
																	<li>5. 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우</li>
																	<li>6. 탈퇴자가 게시한 게시물</li>
																	<li>7. 기타 관계 법령에 위배되는 경우</li>
																</ol>
															</li>
														</ol>

														<h3>제 26 조 (서비스 이용 책임)</h3>
														<ol>
															<li>① 회원은 “사이트”의 적법한 권한 있는 자로부터 구체적으로 명시적인 사전 서면 승인을 받은 경우를 제외하고는 서비스를 이용하여 상품/서비스를 판매하는 영업활동을 할 수 없으며, 특히 해킹, 돈벌이 광고, 음란 사이트 등을 통한 상업행위, 상용S/W 불법배포 등을 할 수 없습니다. 이를 어기고 발생한 영업활동의 결과 및 손실, 관계기관에 의한 구속 등 법적 조치 등에 관해서는 당사가 책임을 지지 않습니다.</li>
														</ol>

														<h3>제 27 조 (서비스 이용 관련 분쟁 해결)</h3>
														<ol>
															<li>① “사이트”는 이용자가 제기하는 정당한 의견이나 불만을 반영하고 그 피해를 보상 처리하기 위하여 피해 보상 처리 기구인 고객만족센터를 설치 운영합니다.</li>
															<li>② “사이트”는 이용자로부터 제출되는 불만 사항 및 의견은 우선적으로 그 사항을 처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리 일정을 즉시 통보합니다.</li>
															<li>③ “사이트”와 이용자간에 발생한 전자상거래 분쟁과 관련하여 이용자의 피해 구제 신청이 있는 경우에는 공정거래위원회 또는 시도지사가 의뢰하는 분쟁조정기관의 조정에 따를 수 있습니다.</li>
														</ol>

														<h3>제 28 조 (서비스 종료)</h3>
														<ol>
															<li>① 서비스를 종료하고자 할 경우, “사이트”는 서비스를 종료하고자 하는 날('서비스 종료일')로부터 3개월 이전에 본 약관 제3조에 규정된 통지방법을 준용하여 회원에게 알려드립니다.</li>
															<li>② 서비스 종료일 이후 회원은 “사이트”에서 포인트 적립 및 기타 서비스 혜택을 받지 못하며, 통지일 시점에서 기 적립된 포인트는 “사이트”가 별도 지정하는 날(이하 '포인트 소멸일')까지 본 약관과 “사이트”가 지정하는 바에 따라 사용하여야 하며, 포인트 소멸일 이후 미사용 잔여분은 소멸됩니다.</li>
														</ol>

														<h3>제 29 조 (면책조항)</h3>
														<ol>
															<li>① 당사는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.</li>
															<li>② 당사는 회원의 귀책사유로 인한 서비스 이용의 장애에 대하여 책임을 지지 않습니다.</li>
															<li>③ 당사는 회원이 서비스를 이용하여 기대하는 수익을 상실한 것이나 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않습니다.</li>
															<li>④ 당사는 회원이 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다.</li>
															<li>⑤ 당사는 서비스 이용과 관련하여 가입자에게 발생한 손해 가운데 회원의 고의, 과실에 의한 손해에 대하여 책임을 지지 않습니다.</li>
														</ol>

														<h3>제 30 조 (준거법 및 관할법원)</h3>
														<ol>
															<li>① 본 약관에서 정하지 않은 사항과 본 약관의 해석에 관하여는 대한민국 관련법령 및 상관례에 따릅니다.</li>
															<li>② “사이트”와 이용자간에 발생한 전자상거래 분쟁에 관한 소송은 제소 당시의 이용자의 주소에 의하고, 주소가 없는 경우에는 거소를 관할하는 지방 법원의 전속 관할로 합니다. 다만 제소 당시 이용자의 주소 또는 거소가 분명하지 않거나 외국 거주자의 경우에는 민사 소송법상의 관할 법원에 제기합니다.</li>
															<li>③ “사이트”와 이용자간에 제기된 전자상거래 소송에는 한국법을 적용합니다.</li>
														</ol>
														<br>
														<br>
														<br>
														<p>부칙</p>
														<h3>제1조 (약관의 효력)</h3>
														<p>이 약관은 2022년 10월 05일부터 시행합니다.</p>
													</div>
													<!-- / policy영역 -->
												</div>
											<!-- / 약관box -->
											<!-- 까사미아 위치정보서비스 활용동의 -->
											<div>
												<h2>
													<div class="input_b size_sm type1">
														<div class="ez-checkbox">
															<div class="ez-checkbox"><div class="ez-checkbox">
																<input name="chkChoiceAgreementForCasamiaMembership2" type="checkbox" id="chkChoiceAgreementForCasamiaMembership2" 
																	class="ez-hide agreement-casa"></div></div>
														</div>
														<label for="chkChoiceAgreementForCasamiaMembership2">까사미아 위치정보서비스 활용동의 <span>(선택)</span></label>
													</div>
												</h2>

												<!-- 약관box -->
												<div class="txt_a_new" style="width: 95%;border: 0; margin:0 auto;">
													<div class="policy_a">
														(주)신세계까사는 직접 위치정보를 수집하거나 위치정보사업자로부터 위치정보를 전달받아 위치기반서비스(주변매장찾기)를 제공합니다. <br>
														위치기반서비스의 이용요금은 무료입니다. 단, 무선서비스 이용시 발생하는 데이터 통신료는 별도이며, 이용자가 가입한 각 이동통신사의 정책을 따릅니다.
														<ol>
															<li>
																<h3>제１조 (목적)</h3>
																<ol>
																	<li>이 약관은 ㈜신세계까사('신세계까사 Guud members와 굳닷컴 http://guudmembers.casamia.co.kr, http://www.guud.com'이하 '당사')가 제공하는 위치기반서비스에 대해 “당사”와 위치기반서비스를 이용하는 개인위치정보주체(이하”이용자”)와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.</li>
																</ol>
															</li>
															<li>
																<h3>제２조 (약관의 효력 및 변경)</h3>
																<ol>
																	<li>① 본 약관은 이용자가 본 약관에 동의하고 당사가 정한 소정의 절차에 따라 서비스의 이용자로 등록함으로써 효력이 발생합니다.</li>
																	<li>② 당사는 법률이나 위치기반서비스의 변경사항을 반영하기 위한 목적 등으로 약관을 수정할 수 있습니다.</li>
																	<li>③ 약관이 변경되는 경우 당사는 변경사항을 최소 15일 전에 회사의 홈페이지 등 공지사항 페이지를 통해 게시합니다.</li>
																	<li>④ 단 개정되는 내용이 이용자 권리의 중대한 변경이 발생하는 경우에는 30일 전에 게시하도록 하겠습니다.</li>
																</ol>
															</li>
															<li>
																<h3>제３조 (약관 외 준칙)</h3>
																<ol>
																	<li>이 약관에 명시되지 않은 사항은 위치정보의 보호 및 이용 등에 관한 법률, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전기통신기본법, 전기통신사업법 등 관계법령과 “당사”가 정한 지침 등의 규정에 따릅니다.</li>
																</ol>
															</li>
															<li>
																<h3>제４조 (서비스 내용 및 요금)</h3>
																<ol>
																	<li>
																		① 당사는 직접 위치정보를 수집하거나 위치정보사업자로부터 위치정보를 전달받아 아래와 같은 위치기반서비스를 제공합니다.
																		<ol>
																			<li>가. 주변매장찾기 : 현재의 위치를 기반으로 하여 주변 매장의 위치 등의 정보를 제공하는 서비스</li>
																		</ol>
																	</li>
																	<li>② 제1항 위치기반서비스의 이용요금은 무료입니다. 단, 무선서비스 이용시 발생하는 데이터 통신료는 별도이며, 이용자가 가입한 각 이동통신사의 정책을 따릅니다.</li>
																</ol>
															</li>
															<li>
																<h3>제５조 (개인위치정보주체의 권리)</h3>
																<ol>
																	<li>① 이용자는 언제든지 개인위치정보의 수집•이용•제공에 대한 동의 전부 또는 일부를 유보할 수 있습니다.</li>
																	<li>
																		② 이용자는 언제든지 개인위치정보의 수집•이용•제공에 대한 동의 전부 또는 일부를 철회할 수 있습니다. <br>
																		이 경우 당사는 지체없이 철회된 범위의 개인위치정보 및 위치정보 수집•이용•제공사실 확인자료를 파기합니다.
																	</li>
																	<li>③ 이용자는 개인위치정보의 수집•이용•제공의 일시적인 중지를 요구할 수 있으며, 당사는 이를 거절할 수 없고 이를 충족하는 기술적 수단을 갖추고 있습니다.</li>
																	<li>
																		④ 이용자는 당사에 대하여 아래 자료의 열람 또는 고지를 요구할 수 있고, 당해 자료에 오류가 있는 경우에는 그 정정을 요구할 수 있습니다. 이 경우 당사는 정당한 이유 없이 요구를 거절하지 아니합니다.
																		<ol>
																			<li>1. 이용자에 대한 위치정보 수집•이용•제공사실 확인자료</li>
																			<li>2. 이용자의 개인위치정보가 위치정보의 보호 및 이용 등에 관한 법률 또는 다른 법령의 규정에 의하여 제3자에게 제공된 이유 및 내용</li>
																		</ol>
																	</li>
																	<li>⑤ 이용자는 제1항 내지 제4항의 권리행사를 고객센터를 통해 당사에 요구할 수 있습니다.</li>
																</ol>
															</li>
															<li>
																<h3>제６조 (위치정보 이용ㆍ제공사실 확인자료 보유근거 및 보유기간)</h3>
																<ol>
																	<li>당사는 위치정보의 보호 및 이용 등에 관한 법률 제16조 제2항에 근거하여 이용자에 대한 위치정보 수집•이용•제공 후 즉각 파기하며 별도로 보관하지 않습니다.</li>
																</ol>
															</li>
															<li>
																<h3>제７조 (적용제외)</h3>
																<ol>
																	<li>만 14세 미만인자는 회원 가입대상이 아니므로, 당사는 회원가입이 불가능한 만14세 미만 자의 위치정보를 수집하지 않습니다. 따라서 만14세 미만의 이용자에 대해서는 위치기반서비스와 관련한 민원 발생 등에 대해서는 책임을 지지 않습니다.</li>
																</ol>
															</li>
															<li>
																<h3>제８조 (서비스의 이용제한 및 중지)</h3>
																<ol>
																	<li>① 당사는 위치기반서비스사업자의 정책변경 등과 같이 당사의 제반 사정 또는 법률상의 이유로 위치정보서비스를 유지할 수 없는 경우, 위치기반서비스의 전부 또는 일부를 제한•변경하거나 중지할 수 있습니다.</li>
																	<li>② 제1항에 의한 위치기반서비스 중단의 경우에는 당사는 사전에 인터넷 등에 공지하거나 이용자에게 통지합니다.</li>
																</ol>
															</li>
															<li>
																<h3>제９조 (개인위치정보 이용 또는 제공)</h3>
																<ol>
																	<li>① 당사는 개인위치정보를 이용하여 위치기반서비스를 제공하는 경우 본 약관에 고지하고 동의를 받습니다.</li>
																	<li>② 당사는 이용자의 동의 없이 개인위치정보를 제3자에게 제공하지 않으며, 제3자에게 제공하는 경우에는 제공 받는 자 및 제공목적을 사전에 이용자에게 고지하고 동의를 받습니다.</li>
																	<li>
																		③ 당사는 개인위치정보를 이용자가 지정하는 제3자에게 제공하는 경우 개인위치정보를 수집한 통신단말장치로 매회 이용자에게 제공받는 자, 제공일시 및 제공목적을 즉시 통보합니다. 단, 아래 각 호에 해당하는 경우에는 이용자가 미리 특정하여 지정한 통신단말장치 또는 전자우편주소, 온라인게시 등으로 통보합니다.
																		<ol>
																			<li>1. 개인위치정보를 수집한 당해 통신단말장치가 문자, 음성 또는 영상의 수신기능을 갖추지 아니한 경우</li>
																			<li>2. 회원이 개인위치정보를 수집한 당해 통신단말장치 외의 통신단말장치 또는 전자우편주소로 통보할 것을 미리 요청한 경우</li>
																		</ol>
																	</li>
																</ol>
															</li>
															<li>
																<h3>제１０조 (손해배상)</h3>
																<ol>
																	<li>이용자는 당사의 위치정보의 보호 및 이용 등에 관한 법률 제15조 내지 26조의 규정을 위반한 행위로 손해를 입은 경우에 당사에 대하여 손해배상을 청구할 수 있습니다. 이 경우 당사는 고의 또는 과실이 없음을 입증하지 아니하면 책임을 면할 수 없습니다.</li>
																</ol>
															</li>
															<li>
																<h3>제１１조 (면책)</h3>
																<ol>
																	<li>
																		① 당사는 다음 각 호의 경우로 위치기반서비스를 제공할 수 없는 경우 이로 인하여 이용자에게 발생한 손해에 대해서는 책임을 부담하지 않습니다.
																		<ol>
																			<li>1. 천재지변 또는 이에 준하는 불가항력의 상태가 있는 경우</li>
																			<li>2. 위치기반서비스 제공을 위하여 당사와 서비스제휴계약을 체결한 제3자의 고의적인 서비스방해가 있는 경우</li>
																			<li>3. 이용자의 귀책사유로 위치기반서비스 이용에 장애가 있는 경우</li>
																			<li>4. 제1호 내지 제3호를 제외한 기타 회사의 고의•과실이 없는 사유로 인한 경우</li>
																		</ol>
																	</li>
																	<li>② 당사는 위치기반서비스 및 위치기반서비스에 게재된 정보, 자료, 사실의 신뢰도, 정확성 등에 대해서는 보증을 하지 않으며 이로 인해 발생한 이용자의 손해에 대하여는 책임을 부담하지 아니합니다.</li>
																</ol>
															</li>
															<li>
																<h3>제１２조 (분쟁의 조정)</h3>
																<ol>
																	<li>① 당사는 위치정보와 관련된 분쟁의 해결을 위해 이용자와 성실히 협의 합니다.</li>
																	<li>② 전항의 협의에서 분쟁이 해결되지 않는 경우, 회사와 이용자는 위치정보의 보호 및 이용 등에 관한 법률 제28조의 규정에 의해 방송통신위원회에 재정을 신청하거나, 개인정보보호법 제43조의 규정에 의해 개인정보 분쟁위원회에 조정을 신청할 수 있습니다.</li>
																</ol>
															</li>
															<li>
																<h3>제１３조 (회사의 주소 및 연락처)</h3>
																<ol>
																	<li>당사의 상호, 주소, 전화번호 그 밖의 연락처는 다음과 같습니다.</li>
																	<li>상호 : ㈜신세계까사</li>
																	<li>주소 : 서울시 중구 남대문시장10길 2 메사빌딩 5-6층</li>
																	<li>전화번호 : 1588-3408</li>
																	<li>이메일주소 : casacsr@shinsegae.com</li>
																</ol>
															</li>
															<li>
																<h3>부칙</h3>
																<h3>제１조 시행일</h3>
																<ol>
																	<li>본 약관은 2022년 10월 05일부터 적용됩니다.</li>
																</ol>
															</li>
															<li>
																<h3>제２조 위치정보관리 책임자 정보</h3>
																<ol>
																	<li>당사는 다음과 같이 위치정보 관리책임자를 지정하여 이용자들이 서비스 이용과정에서 발생한 민원사항 처리를 비롯하여 개인위치정보주체의 권리 보호를 위해 힘쓰고 있습니다.</li>
																	<li>위치정보 관리책임자 (개인정보보호책임자 겸직)</li>
																</ol>
															</li>
														</ol>
													</div>
												</div>
											</div>
											<!-- //까사미아 위치정보서비스 활용동의 -->
											<!-- 까사미아 개인정보 수집 이용 동의 -->
											<div>
												<h2>
													<div class="input_b size_sm type1">
														<div class="ez-checkbox">
															<div class="ez-checkbox"><div class="ez-checkbox">
																<input name="chkChoiceAgreementForCasamiaMembership3" type="checkbox" id="chkChoiceAgreementForCasamiaMembership3" 
																	class="ez-hide agreement-casa"></div></div>
														</div>
														<label for="chkChoiceAgreementForCasamiaMembership3">까사미아 개인정보 처리방침<span>(선택)</span></label>
													</div>
												</h2>

												<!-- 약관box -->
												<div class="txt_a_new" style="/* background: #fff; */width: 95%;border: 0;">
													<!-- policy영역 -->
													<div class="policy_a">
														㈜ 신세계까사(이하 '당사'라고 한다)에서 운영하는 신세계까사 Guud members와 굳닷컴 (https://guudmembers.casamia.co.kr, https://www.guud.com)는 개인정보보호법에 따라 이용자의 개인정보 보호 및 권익을 보호하고 개인정보와 관련한 이용자의 고충을 원활하게 처리할 수 있도록 다음과 같은 처리방침을 두고 있습니다. <br>
														당사는 개인정보처리방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다. <br><br>
														○ 본 방침은 2022년 10월 05일부터 시행됩니다.
														<ol>
															<li>
																<h3>제1조 총칙</h3>
																<ol>
																	<li>１. 개인정보란 생존하는 개인에 관한 정보로서 당해 정보에 포함되어 있는 성명 등의 사항에 의하여 당해 개인을 식별할 수 있는 정보(당해 정보만으로는 특정 개인을 식별할 수 없더라도 다른 정보와 용이하게 결합하여 식별할 수 있는 것을 포함)를 말합니다.</li>
																	<li>２. 당사는 회원의 개인정보를 매우 중요시하고, 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』, 『개인정보보호법』 등의 관련 법률을 준수하고 있으며, 그에 의거한 개인정보처리방침을 정하여 이용자의 권익보호에 최선을 다하고 있습니다.</li>
																	<li>３. 당사는 개인정보처리방침을 통하여 회원께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.</li>
																	<li>４. 당사는 개인정보처리방침을 홈페이지 첫 화면에 공개함으로써 회원께서 언제나 용이하게 보실 수 있도록 조치하고 있습니다.</li>
																	<li>５. 당사 회원의 개인정보보호는 당사 개인정보처리방침에 의해 이루어지며, 링크된https://guudmembers.casamia.co.kr 또는 https://www.guud.com 에서 확인 가능합니다.</li>
																</ol>
															</li>

															<li>
																<h3>제2조 개인정보 수집항목 및 이용목적</h3>
																<ol>
																	<li>
																		１. 당사는 신세계까사 Guud members 통합회원(이하 “통합회원”이라고 합니다) 및 신세계까사 Guud members 간편가입회원 (이하 “간편회원”이라고 합니다)에게 본인확인, 포인트 적립 및 결제 서비스, 다양하고 편리한 서비스를 제공하기 위해 아래의 방법을 통해 개인정보를 수집하고 있습니다. 비회원 고객 또한 당사에서 운영하는 사이트에서 상품을 구매할 수 있으며, 이 경우 아래와 같이 배송, 대금 결제, 서비스 안내 등을 위해 최소한의 개인정보만을 요청하여 동의를 구합니다.
																		<ol>
																			<li>가 당사가 제공하는 회원제 서비스에 따른 본인 확인 절차에 활용</li>
																			<li>나 마일리지 적립 및 사용, 정산, 고객센터 운영 등</li>
																			<li>다 물품 및 서비스 상품에 대한 주문 및 접수, 대금 결제, 주문상품 배송 및 회원에 대한 각종 편의 서비스 제공</li>
																			<li>라 경품 및 물품 배송에 대한 정확한 배송지 확보</li>
																			<li>마 당사가 제공하는 서비스 및 이벤트 정보 제공(SMS/전자우편/DM /TM 등)</li>
																			<li>바 당사의 제휴행사 및 서비스 홍보를 위한 마케팅 자료 활용</li>
																			<li>사 공지/불만처리 등을 위한 원활한 의사소통의 경로 확보</li>
																			<li>아 업무와 관련된 통계자료 작성 및 서비스 개발</li>
																		</ol>
																	</li>
																	<li style="margin-top: 24px;">２. 개인정보 수집항목</li>
																	<li>
																		<table border="0" cellspacing="0" cellpadding="0" class="header_h">
																			<tbody>
																				<tr>
																					<td colspan="2"><p align="center">구분</p></td>
																					<td><p align="center">수집시점</p></td>
																					<td><p align="center">수집항목</p></td>
																					<td><p align="center">이용목적</p></td>
																					<td><p align="center">보유기간</p></td>
																				</tr>
																				<tr>
																				<%--	<td rowspan="4"><p align="left">신세계포인트 통합회원</p></td>
																					<td rowspan="2"><p align="left">필수</p></td>--%>
																					<td rowspan="5"><p align="left">신세계포인트 통합회원</p></td>
																					<td rowspan="2"><p align="left">필수</p></td>

																					<td><p align="left">회원가입</p></td>
																					<td><p align="left">성명, 아이디, 비밀번호, 전자우편주소, 휴대전화번호, 주소, 본인확인에 필요한 정보(CI, DI, 생년월일, 성별) 외국인여부(외국인회원에 한함))</p></td>
																					<td><p align="left">회원제 서비스에 따른 본인확인 및 회원관리, 공지(알림)/불만처리, 고객상담, 거점기반 서비스 제공</p></td>
																					<td rowspan="2"><p align="left">회원 탈퇴 후 30일까지 또는 법정 의무 보유기간까지</p></td>
																				</tr>
																				<tr>
																					<td><p align="left">주문/결제/배송</p></td>
																					<td><p align="left">성명, 휴대전화번호, 전자우편주소, 배송정보(주문자 및 수취인주소, 수취인명, 수취인연락처), 결제정보(계좌정보, 신용카드정보, 신세계 포인트카드 번호, 환불 계좌정보)</p></td>
																					<td><p align="left">신세계포인트 적립/사용, Guud포인트적립/사용, 물품/서비스 주문, A/S, 결제, 배송, 현금영수증 발행, 청약철회시 계좌환불, 부정사용자의 식별</p></td>
																				</tr>
																				<tr>
																					<td rowspan="3"><p align="left">선택</p></td>
																					<td><p align="left">마케팅</p></td>
																					<td><p align="left">전자우편주소, 성명, 휴대전화번호, 마케팅 수신 동의여부</p></td>
																					<td><p align="left">서비스 및 이벤트 정보 제공 (SMS/전자우편)</p></td>
																					<td><p align="left">회원 탈퇴 시 또는 동의 철회 시</p></td>
																				</tr>
																				<tr>
																					<td><p align="left">클럽</p></td>
																					<td><p align="left">결혼증빙자료, 입주증빙자료, 회사증빙자료, 결혼기념일, 가족 수, 회사명, 회사소재지, 관심상품</p></td>
																					<td><p align="left">클럽 가입을 통함 서비스 및 이벤트 정보 제공(SMS/전자우편)</p></td>
																					<td><p align="left">회원 탈퇴 시 또는 목적 달성 시</p></td>
																				</tr>
																				<!-- 추가 -->
																				<tr>
																					<td><p align="left">고객의 소리</p></td>
																					<td><p align="left">아이디, 이름, 이메일 주소, 휴대폰 번호</p></td>
																					<td><p align="left">고객의 문의사항, 개선의견 및 불만접수를 처리하고, 이를 활용하여 고객에게 최적의 서비스를 제공하기 위한 목적</p></td>
																					<td><p align="left">회원 탈퇴 시 또는 목적 달성 시</p></td>
																				</tr>


																				<tr>
																					<td rowspan="5"><p align="left">신세계까사 오프라인 회원</p></td>
																					<td rowspan="2"><p align="left">필수</p></td>

																					<td><p align="left">회원가입</p></td>
																					<td><p align="left">성명, 전자우편주소, 휴대전화번호, 주소, 본인확인에 필요한 정보(CI, 생년월일, 성별) 외국인여부(외국인회원에 한함))</p></td>
																					<td><p align="left">회원제 서비스에 따른 본인확인 및 회원관리, 공지(알림)/불만처리, 고객상담, 거점기반 서비스 제공</p></td>
																					<td rowspan="2"><p align="left">회원 탈퇴 후 30일까지 또는 법정 의무 보유기간까지</p></td>
																				</tr>
																				<tr>
																					<td><p align="left">주문/결제/배송</p></td>
																					<td><p align="left">성명, 휴대전화번호, 전자우편주소, 배송정보(주문자 및 수취인주소, 수취인명, 수취인연락처), 결제정보(계좌정보, 신용카드정보, 신세계 포인트카드 번호, 환불 계좌정보, 현금영수증 발행여부)</p></td>
																					<td><p align="left">신세계포인트 적립/사용, Guud포인트적립/사용, 물품/서비스 주문, A/S, 결제, 배송, 현금영수증 발행, 청약철회 시 계좌환불, 부정사용자의 식별</p></td>
								
																				</tr>

																				<tr>
																					<td rowspan="3"><p align="left">선택</p></td>
																					<td><p align="left">마케팅</p></td>
																					<td><p align="left">전자우편주소, 성명, 휴대전화번호, 마케팅 수신 동의여부</p></td>
																					<td><p align="left">서비스 및 이벤트 정보 제공 (SMS/전자우편)</p></td>
																					<td><p align="left">회원 탈퇴 시 또는 동의 철회 시</p></td>
																				</tr>
																				<tr>
																					<td><p align="left">클럽</p></td>
																					<td><p align="left">결혼증빙자료, 입주증빙자료, 회사증빙자료, 결혼기념일, 가족 수, 회사명, 회사소재지, 관심상품</p></td>
																					<td><p align="left">클럽 가입을 통함 서비스 및 이벤트 정보 제공(SMS/전자우편)</p></td>
																					<td><p align="left">회원 탈퇴 시 또는 목적 달성 시</p></td>
																				</tr>
																				<!-- 추가 -->
																				<tr>
																					<td><p align="left">고객의 소리</p></td>
																					<td><p align="left">아이디, 이름, 이메일 주소, 휴대폰 번호</p></td>
																					<td><p align="left">고객의 문의사항, 개선의견 및 불만접수를 처리하고, 이를 활용하여 고객에게 최적의 서비스를 제공하기 위한 목적</p></td>
																					<td><p align="left">회원 탈퇴 시 또는 목적 달성 시</p></td>
																				</tr>
																					<!-- 추가 -->


																				<tr>
																					<td rowspan="5"><p align="left">간편회원</p></td>
																					<td rowspan="2"><p align="left">필수</p></td>
																					<td><p align="left">회원가입</p></td>
																					<td><p align="left">전자우편주소(아이디), 성명, 비밀번호, 휴대전화번호, 14세 이상 여부</p></td>
																					<td><p align="left">이용자 식별, 서비스이행을 위한 연락</p></td>
																					<td rowspan="2"><p align="left">회원 탈퇴 후 30일까지 또는 법정 의무 보유기간까지</p></td>
																				</tr>
																				<tr>
																					<td><p align="left">주문/결제/배송</p></td>
																					<td><p align="left">성명, 휴대전화번호, 전자우편주소, 배송정보(주문자 및 수취인주소, 수취인명, 수취인연락처 등), 결제정보(계좌정보, 신용카드정보, 신세계 포인트카드 번호, 환불 계좌정보, 현금영수증 발행여부)</p></td>
																					<td><p align="left">신세계포인트 적립/사용, 물품/서비스 주문, A/S, 결제, 배송, 불만처리시 본인 확인, 현금영수증 발행, 청약철회시 계좌환불, 부정사용자의 식별</p></td>
																				</tr>
																				<tr>
																					<td rowspan="3"><p align="left">선택</p></td>
																					<td><p align="left">가입/주문</p></td>
																					<td><p align="left">주소</p></td>
																					<td><p align="left">거점기반 서비스 제공</p></td>
																					<td rowspan="3"><p align="left">회원 탈퇴 시 또는 동의 철회 시</p></td>
																				</tr>
																				<tr>
																					<td><p align="left">마케팅</p></td>
																					<td><p align="left">전자우편주소, 성명, 휴대전화번호, 마케팅 수신 동의 여부</p></td>
																					<td><p align="left">서비스 및 이벤트 정보 제공 (SMS/전자우편)</p></td>
																				</tr>
																				<!-- 추가 -->
																				<tr>
																					<td><p align="left">클럽</p></td>
																					<td><p align="left">결혼증빙자료, 입주증빙자료, 회사증빙자료, 결혼기념일, 가족 수, 회사명, 회사소재지, 관심상품</p></td>
																					<td><p align="left">클럽 가입을 통한 서비스 및 이벤트 정보 제공(SMS/전자우편)</p></td>
																				</tr>
																				<tr>
																					<td rowspan="3"><p>SNS 간편 로그인 / 가입</p></td>
																					<td><p>카카오톡<br/>(선택)</p></td>
																					<td><p>회원가입</p></td>
																					<td><p>성별,생일</p></td>
																					<td rowspan="3"><p>굳닷컴 서비스 내 이용자 식별, 회원관리 및 서비스 제공</p></td>
																					<td rowspan="3"><p>서비스 탈퇴 시 지체없이 파기</p></td>
																				</tr>
																				<tr>
																					<td><p>네이버<br/>(필수)</p></td>
																					<td><p>회원가입</p></td>
																					<td><p>성별,생일</p></td>
																				</tr>
																				<tr>
																					<td><p>페이스북<br/>(필수)</p></td>
																					<td><p>회원가입</p></td>
																					<td><p>이름</p></td>
																				</tr>


																				<!-- 추가 -->
																				<tr>
																					<td><p align="left">비회원</p></td>
																					<td><p align="left">필수</p></td>
																					<td><p align="left">주문/결제/배송</p></td>
																					<td><p align="left">주소, 성명, 휴대전화번호, 전자우편주소, 배송정보(주문자 및 수취인주소, 수취인명, 수취인연락처 등), 결제정보(계좌정보, 신용카드정보, 신세계 포인트카드 번호, 환불 계좌정보, 현금영수증 발행여부)</p></td>
																					<td><p align="left">신세계포인트 적립/사용, 주문자 / 배송지 정보 확보, 현금영수증 발행, 불만처리 의사소통 경로 확보, 주문상품에 대한 결제 및 취소 청약철회 시 계좌환불</p></td>
																					<td><p align="left">목적 달성 시 또는 법정 의무 보유기간까지</p></td>
																				</tr>
																				<tr>
																					<td><p align="left">입점문의</p></td>
																					<td><p align="left">필수</p></td>
																					<td><p align="left">입점문의 등록 시</p></td>
																					<td><p align="left">아이디, 비밀번호, 전화번호, 주소, 계좌정보(예금주, 은행명, 계좌번호), 증빙서류(통장사본), 영업담당자정보(이름, 전화번호, 휴대폰번호, 이메일)</p></td>
																					<td><p align="left">입점 문의 접수, 상담 및 적정성 검토를 위한 담당자 정보 수집</p></td>
																					<td><p align="left">목적 달성 시 또는 법정 의무 보유기간까지</p></td>
																				</tr>
																				<tr>
																					<td><p align="left">입점신청</p></td>
																					<td><p align="left">필수</p></td>
																					<td><p align="left">입점신청 등록 시</p></td>
																					<td><p align="left">아이디, 비밀번호, 전화번호, 주소, 계좌정보(예금주, 은행명, 계좌번호), 증빙서류(통장사본), 영업담당자정보(이름, 전화번호, 휴대폰번호, 이메일)</p></td>
																					<td><p align="left">입점 문의 신청, 상담 및 적정성 검토를 위한 담당자 정보 수집</p></td>
																					<td><p align="left">목적 달성 시 또는 법정 의무 보유기간까지</p></td>
																				</tr>
																		
																				<tr>
																					<td colspan="3"><p align="left">로그인 연동 서비스</p></td>
																					<td colspan="3"><p align="left">※ 당사는 고객의 편의를 위해 SNS 연동 로그인, 지문이용 로그인 방식을 제공하고 있습니다. <br> 이와 같은 로그인시 당사가 고객의 개인정보를 추가 수집하지 않으며, 다만 임의의 인증값만 비교하고 있습니다.</p></td>
																				</tr>
																				<tr>
																					<td colspan="3"><p align="left">서비스 이용과정 및 사업 처리과정에서 수집될 수 있는 개인정보</p></td>
																					<td><p align="left">서비스 이용 및 중지기록, 접속로그, 쿠키, 접속IP정보, 결제기록, 이용정지기록, 은행 계좌정보, 신용카드정보, 포인트카드 번호, 거래정보</p></td>
																					<td rowspan="2"><p align="left">소비자보호를 위한 법적 의무 준수, 서비스 통계 분석</p></td>
																					<td rowspan="2"><p align="left">회원 탈퇴 시 또는 법정 의무 보유기간까지</p></td>
																				</tr>
																				<tr>
																					<td colspan="3"><p align="left">모바일기기 이용 시 수집될 수 있는 개인정보</p></td>
																					<td><p align="left">단말기식별번호, 단말기OS정보, 광고 식별자, 이동통신사, PUSH 수신여부</p></td>
																				</tr>
																			</tbody>
																		</table>
																		<p>※ 소득세법에 따라 경품 지급 등을 위한 제세공과금 처리 목적으로 주민등록번호, 계좌번호 등을 수집할 수 있습니다.</p>
																	</li>
																	<li>
																		3. 당사는 모바일 앱 서비스를 위하여 아래와 같이 고객의 이동통신단말기 내 정보 및 기능에 접근, 이용할 수 있습니다. 필수 접근항목은 앱 설치 시 또는 최초 실행 시 안내 및 동의를 받으며, 선택 접근항목은 해당 서비스 최초 이용 시 별도 동의를 받습니다. 선택 접근항목의 경우 OS버전에 따라 동의 받는 방법이 다를 수 있으나, 회원이 거부하더라도 기본 서비스 이용에는 제한이 없습니다.
																		<table border="0" cellspacing="0" cellpadding="0" class="header_h">
																			<tbody>
																				<tr>
																					<td><p align="center">필수여부</p></td>
																					<td><p align="center">접근항목</p></td>
																					<td><p align="center">접근목적</p></td>
																				</tr>
																				<tr>
																					<td><p align="center">필수</p></td>
																					<td><p align="center">기기 및 앱 기록 권한</p></td>
																					<td><p align="center">앱 실행 시 오류확인, 사용성 개선</p></td>
																				</tr>
																				<tr>
																					<td rowspan="3"><p align="center">선택</p></td>
																					<td><p align="center">사진/카메라</p></td>
																					<td><p align="center">포토상품평, 스캔검색, 모바일영수증, 증강현실줄자, 이미지첨부, 이미지 상품검색</p></td>
																				</tr>
																				<tr>
																					<td><p align="center">마이크</p></td>
																					<td><p align="center">음성검색</p></td>
																				</tr>
																				<tr>
																					<td><p align="center">바이오정보(지문,안면인식)</p></td>
																					<td><p align="center">바이오인증 로그인 이용</p></td>
																				</tr>
																			</tbody>
																		</table>
																		<p>
																			※ 선택적 접근권한에 동의하지 않아도 기본적인 서비스 이용은 가능합니다. <br>
																			※ 모바일 기기 및 앱의 설정기능을 통해 접근권한을 설정하실 수 있으며, 일부 OS버전에 따라 권한설정이 불가능 할 수도 있습니다.
																		</p>
																	</li>
																	<li>
																		４. 회원 탈퇴 시 필수 개인정보는 회원의 요구사항 처리, 포인트 소멸 일시 보류 등의 목적으로 30일 이내의 유예기간을 두고 파기합니다. 또한 관계 법령의 규정에 따라 귀하의 개인정보를 보존할 의무가 있는 경우에는 일정 기간 보관할 수 있습니다.
																	</li>
																	<li>
																		５. 개인정보의 수집방법
																		<ol>
																			<li>① 홈페이지, 상담게시판, 전화, 팩스, 이벤트응모, 배송 요청</li>
																			<li>② 로그 분석 프로그램을 통한 생성정보수집, '쿠키(cookie)'에 의한 정보 수집</li>
																			<li>③ 관계사 및 구매자로부터의 제공</li>
																			<li>④ 스마트폰용 어플리케이션을 통한 수집</li>
																		</ol>
																	</li>
																	<li>
																		６. 회원은 개인정보 수집 동의를 거부할 권리가 있으나, 동의 거부 시 제 2조에서 규정하고 있는 당사가 제공하는 서비스를 받을 수 없습니다
																	</li>
																	<li>
																		７. 허위 정보 입력 시 당사의 조치 <br>
																		회원은 자신의 정보에 대해 정확성 및 적법성을 보장해야 합니다. 만약 이를 위반하여 타인의 정보를 도용하는 등 각종 방법으로 허위 정보를 입력할 경우 당사는 해당 회원을 관계법령에 따라 신고 할 수 있으며 강제 탈퇴를 시킬 수도 있습니다.
																	</li>
																	<li>
																		８. 당사는 회원의 기본적 인권 침해의 우려가 있는 민감한 개인정보는 수집하지 않습니다.
																	</li>
																	<li>
																		９. 회원이 자발적으로 공개한 개인정보로 인해 회원 개인에게 발생하는 손실이나 문제는 전적으로 개인의 책임이며, 공개적인 공간에 게재되는 개인정보는 다른 사람이 수집하여 무단으로 사용할 수 있음을 인지하시어, 이로 인해 원하지 않는 피해를 입을 수 있음을 유념하시기 바랍니다.
																	</li>
																</ol>
															</li>

															<li>
																<h3>제3조 개인정보의 보유, 이용기간 및 파기</h3>
																<ol>
																	<li>
																		１. 당사는 개인정보의 수집목적 또는 제공받은 목적이 달성된 때에는 회원의 개인정보를 지체 없이 파기합니다.
																		<ol>
																			<li>가 회원가입 정보 : 회원탈퇴를 요청한 시점으로 30일 내</li>
																			<li>나 배송정보 : 물품 또는 서비스가 인도되거나 제공된 때</li>
																			<li>다 설문조사, 이벤트 등의 목적을 위하여 수집한 경우 : 당해 설문조사, 이벤트 등을 종료한 때</li>
																			<li>
																				라 본인확인정보 : 본인임을 확인 한 때 <br>
																				단, 상법 등 관련법령의 규정에 의하여 다음과 같이 거래 관련 관리 의무 관계의 확인 등을 이유로 일정기간 보유하여야 할 필요가 있을 경우에는 일정기간 보유합니다.
																			</li>
																			<li>가 계약 또는 청약철회 등에 관한 기록 : 5년</li>
																			<li>나 대금결제 및 재화 등의 공급에 관한 기록 : 5년</li>
																			<li>다 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년</li>
																			<li>라 웹사이트 방문 기록 : 3개월</li>
																		</ol>
																	</li>
																	<li>
																		２. 개인정보 파기방법은 아래와 같습니다.
																		<ol>
																			<li>가 종이에 출력된 개인정보: 분쇄기로 분쇄하거나 소각</li>
																			<li>나 전자적 파일형태로 저장된 개인정보: 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제</li>
																		</ol>
																	</li>
																	<li>
																		３. 개인정보 유효기간 제도 도입
																		<ol>
																			<li>가 당사는 장기간(1년 이상) 서비스 미 이용자의 개인정보보호를 위하여 2015년 8월 이후에는 다른 이용자의 회원정보와 분리하여 저장, 관리합니다.</li>
																			<li>나 개인정보 유효기간은 회원이 회원정보등록 또는 회원정보수정페이지를 통해 1년, 3년, 5년, 탈퇴 시 중 선택이 가능하며, 회원이 유효기간을 선택하지 않을 시 1년을 기준으로 자동 설정합니다.</li>
																			<li>다 미이용의 기간은 로그인, 주문/결제 등으로 산정하며 법령에서 정의한 기간 동안 서비스 미 이용자에 대하여 분리, 저장 관리하며, 이 경우 정보의 이용, 사용 자체를 금지합니다.</li>
																			<li>라 당사는 미 이용자 개인정보 분리/저장시점 도래 1개월 이전에 이메일 등을 통해 해당 이용자에게 관련 내용을 공지합니다.</li>
																			<li>마 분리, 저장된 미 이용자 개인정보는 관련 법령에 따라 일정기간 동안 보유하며, 해당 기간 종료 후 파기됩니다. 파기되지 않은 개인정보는 해당 이용자의 요청에 따라 서비스 이용을 재개하는 시점에 다시 제공됩니다.</li>
																			<li>바 이용자 요청에 의해 해지 또는 삭제된 개인정보는 “개인정보 보유 및 이용기간”에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.</li>
																		</ol>
																	</li>
																</ol>
															</li>

															<li>
																<h3>제4조 개인정보의 제공 및 공유</h3>
																<ol>
																	<li>１. 당사 회원으로 가입하시면 신세계까사 Guud members와 굳닷컴이 제공하는 서비스를 하나의 아이디로 이용할 수 있습니다.</li>
																	<li>２. 당사는 고객의 개인정보를 제2조(개인정보의 수집항목 및 이용목적)에서 고지한 범위 내에서 사용하며, 동 범위를 초과하여 이용하거나 사전 동의 없이 타인 또는 타기업•기관등 제3자에게 제공하지 않습니다.</li>
																	<li>３. 회원의 개인정보를 제공하거나 공유하는 경우에는 제공받는 자, 제공목적, 제공항목, 보유/이용기간 등에 대해 개별적으로 사이트, 전자우편 또는 서면, 신청서 등을 통해 고지한 후 이에 대하여 별도 동의를 구합니다.</li>
																	<li>
																		４. 다만 다음 사항은 예외적으로 동의 없이 개인정보 제공이 가능합니다.
																		<ol>
																			<li>가 수사목적으로 관계법률에서 정한 절차와 방법에 따라 수사기관이 개인정보 제공을 요구하는 경우</li>
																			<li>나 통계작성, 학술연구나 시장조사 등을 위하여 특정 개인을 식별할 수 없는 형태로 광고주, 협력사나 연구단체 등에 제공하는 경우</li>
																			<li>다 기타 관계법률의 규정에 따른 요청이 있는 경우</li>
																			<li>
																				라 서비스 제공에 따른 요금(마일리지) 정산과 사은품 배송을 위하여 필요한 경우 <br>
																				※ 회사는 영업의 양도 등에 관한 사유가 발생하여 회원의 개인정보 이전이 필요한 경우, 관계법률에서 규정한 절차와 방법에 따라 개인정보 이전에 관한 사실 등을 사전에 고지하며, 회원에게는 개인정보 이전에 관한 동의 철회권을 부여합니다.
																			</li>
																			<li>
																				５. 회원은 개인정보 제3자 제공 동의를 거부할 권리가 있으며, 제3자 제공 동의 여부와 관계 없이 회원에 가입할 수 있습니다. 단, 개인정보 제3자 제공 동의 거부 시, 상기 이용목적에 명시된 서비스를 받으실 수 없습니다.
																			</li>
																		</ol>
																	</li>
																</ol>
															</li>

															<li>
																<h3>제5조 수집한 개인정보의 처리위탁</h3>
																<ol>
																	<li>
																		１. 당사는 서비스 이행을 위해 아래와 같이 개인정보 처리 업무를 외부업체에 위탁하여 운영하고 있습니다.
																		<table border="0" cellspacing="0" cellpadding="0" class="header_h">
																			<tbody>
																				<tr>
																					<td><p align="center">수탁업무</p></td>
																					<td><p align="center">수탁자</p></td>
																				</tr>
																				<tr>
																					<td><p align="center">웨딩기프트, DM, 카다로그, 이벤트 상품 발송업체</p></td>
																					<td><p align="center">(주)KDM</p></td>
																				</tr>
																				<tr>
																					<td><p align="center">SMS, E-mail, APP PUSH 발송 시스템 유지보수</p></td>
																					<td><p align="center">CJ 올리브네트웍스</p></td>
																				</tr>
																				<tr>
																					<td><p align="center">택배발송</p></td>
																					<td><p align="center">CJ 택배</p></td>
																				</tr>
																				<tr>
																					<td><p align="center">구매이력 확인 및 사은품 발송</p></td>
																					<td><p align="center">모바일이앤앰애드</p></td>
																				</tr>
																				<tr>
																					<td><p align="center">POS, ERP, CRM, 멤버십 시스템 운영 및 유지보수</p></td>
																					<td><p align="center">(주)신세계 I&amp;C</p></td>
																				</tr>
																				<tr>
																					<td><p align="center">CS 시스템 운영 유지보수</p></td>
																					<td><p align="center">(주)크루드시스템</p></td>
																				</tr>
																				<tr>
																					<td><p align="center">C-BOOK 유지보수</p></td>
																					<td><p align="center">모비딕</p></td>
																				</tr>
																				<tr>
																					<td><p align="center">본인인증</p></td>
																					<td><p align="center">NICE 신용평가정보(주)</p></td>
																				</tr>
																				<tr>
																					<td><p align="center">본인인증</p></td>
																					<td><p align="center">KCB</p></td>
																				</tr>
																				<tr>
																					<td><p align="center">AS 기사앱 유지보수</p></td>
																					<td><p align="center">진승정보통신</p></td>
																				</tr>
																				<tr>
																					<td><p align="center">주문상품 택배발송</p></td>
																					<td><p align="center">(주)아이제이로지스틱스</p></td>
																				</tr>
																				<tr>
																					<td><p align="center">설치상품 배송대행업체</p></td>
																					<td><p align="center">티앤티, 파워테크, 제이테크, 업라인테크, 원일테크, 정도테크, 대성테크, 까사테크</p></td>
																				</tr>
																				<tr>
																					<td><p align="center">*택배사(상품 배송 업무 처리)</p></td>
																					<td><p align="center"><a href="https://guudmembers.casamia.co.kr/web/coInfo/shipCoInfo" target="_blank">[택배사 보기]</a></p></td>
																				</tr>
																				<tr>
																					<td><p align="center">*상품판매 제휴업체(입점상품 주문 확인 및 배송 업무 처리)</p></td>
																					<td><p align="center"><a href="https://guudmembers.casamia.co.kr/web/coInfo/companyCoInfo" target="_blank">[상품판매 제휴업체 보기]</a></p></td>
																				</tr>
																				<tr>
																					<td><p align="center">구매에 필요한 신용카드, 현금결제 등의 결제정보 전송</p></td>
																					<td>
																						<p align="center">
																							(주)케이지이니시스 <br>
																							NHN 한국사이버결제 주식회사 <br>
																							네이버파이낸셜(주)
																						</p>
																					</td>
																				</tr>
																				<tr>
																					<td><p align="center">쇼핑몰 주문정보 통합관리 솔루션 제공</p></td>
																					<td>
																						<p align="center">
																							(주)다우기술 <br>
																							네모커머스(주) <br>
																							(주)플레이오토
																						</p>
																					</td>
																				</tr>
																				<tr>
																					<td><p align="center">배송지키미 서비스 제공(배송위치 및 도착정보 제공)</p></td>
																					<td><p align="center">(주)굿스플로</p></td>
																				</tr>
																				<tr>
																					<td><p align="center">상품 추천 서비스 대행 업무</p></td>
																					<td><p align="center">(주)레코벨</p></td>
																				</tr>
																				<tr>
																					<td><p align="center">전산시스템 구축, 운영, 유지보수, 보안시스템 운영</p></td>
																					<td><p align="center">신세계아이앤씨</p></td>
																				</tr>
																				<tr>
																					<td><p align="center">신세계포인트 통합회원 서비스 운영 및 민원처리</p></td>
																					<td><p align="center">㈜이마트</p></td>
																				</tr>
																				<tr>
																					<td><p align="center">이벤트 사은 지급을 위한 구매 정보확인</p></td>
																					<td><p align="center">삼성전자판매 주식회사</p></td>
																				</tr>
																			</tbody>
																		</table>
																		<p>
																			※ 개인정보의 보유 및 이용 기간: 회원탈퇴 시 혹은 위탁 계약 종료 시까지 <br>
																			※ 직송 등 일부 배송형태에 따라, 전자상거래소비자보호법 제21조에 의거 판매를 의뢰한 협력사에 배송정보가 제공됩니다.
																		</p>
																	</li>
																	<li style="margin-top:14px;">
																		２. 당사는 고객이 미리 동의가 있거나, 관련 법령의 규정에 의한 경우를 제외하고는 어떠한 경우에도 본 동의서에서 명시한 범위를 넘어 고객의 개인정보를 이용하거나 타인 또는 타 기업이나 기관에 제공하지 않습니다. 단, 고객의 문의 내용이나 불만 내용이 당사 매장 내 입점한 협력업체와의 관계라고 판단될 경우에는 신속한 서비스를 위해 해당 협력업체에 고객의 개인정보 및 접수 내용을 제공할 수 있습니다.
																	</li>
																	<li>
																		３. 위탁계약 시 개인정보보호의 안전을 기하기 위하여 개인정보보호 관련 지시 엄수, 개인정보에 관한 금지 및 사고 시의 책임부담 등을 명확히 규정하고 당해 계약 내용을 서면 및 전자적으로 보관하고 있습니다. 동 업체가 변경될 경우, 당사는 변경된 업체 명을 개인정보처리방침 화면에 공지합니다
																	</li>
																</ol>
															</li>

															<li>
																<h3>제6조 개인정보의 열람, 정정 탈퇴 및 동의 철회 방법</h3>
																<ol>
																	<li>
																		１. 회원은 등록되어 있는 자신의 개인정보를 열람하거나 정정, 탈퇴할 수 있으며, 당사에 다음 각 항의 어느 사항에 대한 열람, 제공, 정정 및 탈퇴를 요구할 수 있습니다.
																		<ol>
																			<li>① 당사가 가지고 있는 회원의 개인정보</li>
																			<li>② 당사가 회원의 개인정보를 이용하거나 제3자에게 제공한 현황</li>
																			<li>③ 회원이 개인정보 수집•이용•제공 등의 동의를 한 현황</li>
																			<li>가 홈페이지 : 로그인 후 『회원정보수정』을 클릭 하여 회원정보 열람, 정정 또는 마이페이지 &gt; 회원정보관리 &gt; 회원정보수정를 통하여 탈퇴가 가능합니다.</li>
																			<li>나 까사미아 고객센터 문의 : 본인 확인 후 개인정보 열람, 정정, 탈퇴가 가능합니다.</li>
																			<li>다 개인정보보호책임자 또는 고객센터로 서면, 전화 또는 이메일을 통해 연락하시면 지체 없이 조치하겠습니다.</li>
																		</ol>
																	</li>
																	<li>２. 회원이 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다. 또한 잘못된 개인정보를 제3자에게 이미 제공한 경우에는 정정 처리 결과를 제3자에게 지체 없이 통지하여 정정이 이루어지도록 조치하겠습니다.</li>
																	<li>３. 당사는 회원의 요청에 의해 해지 또는 삭제된 개인정보는 당사가 수집하는 개인정보의 보유 및 이용 기간에 명시된 바에 따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다.</li>
																</ol>
															</li>

															<li>
																<h3>제7조 개인정보 자동수집 장치의 설치, 운영 및 거부</h3>
																<ol>
																	<li>１. 당사는 개인화된 서비스를 제공하기 위하여 ‘쿠키(cookie)’를 사용하기도 합니다. ‘쿠키(cookie)’는 HTTP서버에서 사용자의 브라우저에 보내는 아주 작은 데이터 꾸러미로서 회원의 컴퓨터 하드드라이브에 저장됩니다. 쿠키는 귀하의 컴퓨터는 식별하지만 귀하를 개인적으로 식별하지는 않습니다.</li>
																	<li>
																		당사는 다음과 같은 목적으로 쿠키를 사용합니다.
																		<ol>
																			<li>가 회원과 비회원의 접속 빈도나 방문 시간 등을 분석하고 이용자의 취향과 관심분야를 파악하여 타겟(Target) 마케팅 및 서비스 개편 등의 척도로 활용합니다.</li>
																			<li>나 당사가 진행하는 각종 이벤트에서 회원의 참여 정도 및 방문 수를 파악하여 차별적인 응모 기회를 부여하고 개인의 관심 분야에 따라 차별화된 정보를 제공하기 위한 자료로 이용됩니다.</li>
																			<li>
																				다 쇼핑한 품목들에 대한 정보와 관심 있게 둘러본 품목들에 대한 자취를 추적하여 다음 번 쇼핑 때 개인 맞춤 서비스를 제공하는데 이용합니다. 쿠키 브라우저의 종료시나 로그아웃 시 만료됩니다. 쿠키는 하루가 지나면 만료되며, 브라우저의 '쿠키삭제'시 삭제하실 수 있습니다.
																				<ol>
																					<li>* 쿠키의 설치 및 거부</li>
																					<li>- 귀하는 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서 귀하는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나, 쿠키가 저장될 때마다 확인을 거치거나, 아니면 모든 쿠키의 저장을 거부할 수도 있습니다.</li>
																					<li>- 다만, 쿠키의 저장을 거부할 경우에는 로그인이 필요한 일부 서비스 이용에 어려움이 있을 수 있습니다.</li>
																					<li>- 쿠키설정 거부방법은 다음과 같습니다.</li>
																					<li>① Internet Explorer의 경우 : 웹 브라우저 상단의 도구 메뉴 &gt; 인터넷 옵션 &gt; 개인정보 &gt; 설정</li>
																					<li>② Chrome의 경우 : 웹 브라우저 우측의 설정 메뉴 &gt; 화면 하단의 고급 설정 표시 &gt; 개인정보의 콘텐츠 설정 버튼 &gt; 쿠키</li>
																				</ol>
																			</li>
																			<li>
																				３. IP 주소 및 접속기기 정보
																				<ol>
																					<li>가 IP 주소는 인터넷 망 사업자가 인터넷에 접속하는 이용자의 PC 등 기기에 부여하는 온라인 주소정보 입니다.</li>
																					<li>나 기기정보는 기기의 구동을 위해 사용되는 S/W를 통해 확인 가능한 정보를 일컫습니다. OS(Windows, MAC OS 등), 접속한 브라우저 종류 등을 수집하며 모바일앱 접속의 경우 모바일 플랫폼 관련정보 등을 의미합니다.</li>
																				</ol>
																			</li>
																		</ol>
																	</li>
																</ol>
															</li>

															<li>
																<h3>제8조 개인정보보호책임자</h3>
																<ol>
																	<li>
																		１. 당사는 개인정보 처리에 관한 업무를 총괄해서 책임지고 회원의 개인정보를 보호하고, 개인정보처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.
																		<table border="0" cellspacing="0" cellpadding="0" class="header_h">
																			<tbody>
																				<tr>
																					<td><p align="center">구분</p></td>
																					<td><p align="center">담당</p></td>
																				</tr>
																				<tr>
																					<td><p align="center">개인정보보호책임자(CPO)</p></td>
																					<td><p align="center">김찬후 담당</p></td>
																				</tr>
																				<tr>
																					<td><p align="center">개인정보보호부서</p></td>
																					<td><p align="center">까사미아 CSR팀</p></td>
																				</tr>
																				<tr>
																					<td><p align="center">전화번호</p></td>
																					<td><p align="center">1588-3408</p></td>
																				</tr>
																				<tr>
																					<td><p align="center">전자우편주소</p></td>
																					<td><p align="center">casacsr@shinsegae.com</p></td>
																				</tr>
																			</tbody>
																		</table>
																	</li>
																	<li>２. 정보주체는 당사의 서비스를 이용하시면서 발생한 모든 개인정보보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 당사는 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.</li>
																	<li>
																		３. 기타 개인정보침해에 대한 신고 또는 상담이 필요하신 경우에는 아래 기관으로 문의하시기 바랍니다.
																		<ol>
																			<li>- 개인정보침해신고센터 (https://privacy.kisa.or.kr/ 국번없이 118)</li>
																			<li>- 개인정보분쟁조정위원회 (https://www.kopico.go.kr/ 국번없이 1833-6972)</li>
																			<li>- 대검찰청 사이버범죄 수사단 (https://www.spo.go.kr / 국번없이 1301)</li>
																			<li>- 경찰청 사이버수사국 (https://ecrm.police.go.kr / 국번없이 182)</li>
																		</ol>
																	</li>
																</ol>
															</li>

															<li>
																<h3>제9조 개인정보보호를 위한 기술적/제도적 관리</h3>
																<ol>
																	<li>
																		１. 기술적 대책 <br>
																		당사는 회원의 개인정보를 취급함에 있어 개인정보가 분실, 도난, 누출, 변도 또는 훼손되지 않도록 안정성 확보를 위하여 다음과 같은 기술적 대책을 강구하고 있습니다.
																		<ol>
																			<li>가 회원의 개인정보는 비밀번호에 의해 보호되며, 파일 및 전송 데이터를 암호화하거나 파일 잠금기능(Lock)을 사용하여 중요한 데이터는 별도의 보안기능을 통해 보호되고 있습니다.</li>
																			<li>나 당사는 백신프로그램을 이용하여 컴퓨터 바이러스에 의해 피해를 방지하기 위한 조치를 취하고 있습니다. 백신프로그램은 주기적으로 업데이트되며 갑작스런 바이러스가 출현할 경우 백신이 나오는 즉시 이를 제공함으로써 개인정보가 침해되는 것을 방지하고 있습니다.</li>
																			<li>다 당사는 암호알고리즘을 이용하여 네트워크 상의 개인정보를 안전하게 전송할 수 있는 보안장치(SSL 또는 SET)를 채택하고 있습니다.</li>
																			<li>라 해킹 등 외부 침입에 대비하여 각 서버마다 침입차단시스템 및 취약점 분석 시스템 등을 이용하여 보안에 만전을 기하고 있습니다.</li>
																		</ol>
																	</li>
																	<li>
																		２. 관리적 대책 <br>
																		당사는 회원의 개인정보에 대한 접근권한을 최소한의 인원으로 제한하고 있습니다. 그 최소한의 인원에 해당하는 자는 다음과 같습니다.
																		<ol>
																			<li>- 이용자를 직접 상대로 하여 마케팅 업무를 수행하는 자</li>
																			<li>- 개인정보보호책임자 및 담당자 등 개인정보관리업무를 수행하는 자</li>
																			<li>- 기타 업무상 개인정보의 처리가 불가피한 자</li>
																			<li>- 개인정보를 처리하는 직원을 대상으로 새로운 보안 기술 습득 및 개인정보보호의무 등에 관해 정기적인 사내 교육 및 외부 위탁교육을 실시하고 있습니다.</li>
																			<li>- 입사 시 개인정보 관련 처리자의 보안서약서를 통하여 사람에 의한 정보유출을 사전에 방지하고 개인정보보호 정책에 대한 이행사항 및 직원의 준수여부를 감시하기 위한 내부절차를 마련하고 있습니다.</li>
																			<li>- 개인정보 관련 처리자의 업무 인수인계는 보안이 유지된 상태에서 철저하게 이뤄지고 있으며 입사 및 퇴사 후 개인정보 사고에 대한 책임을 명확화하고 있습니다.</li>
																			<li>- 개인정보와 일반 데이터를 혼합하여 보관하지 않고 별도로 분리하여 보관하고 있습니다.</li>
																			<li>- 전산실 및 자료보관실 등을 특별 보호구역으로 설정하여 출입을 통제하고 있습니다</li>
																			<li>- 당사는 회원 개인의 실수나 회사의 귀책사유 없이 발생하는 개인정보관련 문제에 대해서는 책임을 지지 않습니다. 회원 개개인이 본인의 개인정보를 보호하기 위해 자신의 아이디와 비밀번호를 적절하게 관리하고 여기에 대한 책임을 져야 합니다.</li>
																			<li>- 그 외 내부 관리자의 실수나 기술관리 상의 사고로 인해 개인정보의 상실, 유출, 변조, 훼손이 유발될 경우 당사는 즉각 사실을 알리고 적절한 대책과 보상을 강구할 것입니다</li>
																		</ol>
																	</li>
																</ol>
															</li>

															<li>
																<h3>제10조 개인정보 열람청구</h3>
																<ol>
																	<li>
																		１. 회원은 자신의 개인정보에 대하여 개인정보 보호법 제35조에 따른 개인정보의 열람 청구를 아래 부서에 할 수 있습니다. 당사는 정보주체의 개인정보 열람청구가 신속하게 처리되도록 노력하겠습니다.
																		<ol>
																			<li>
																				▶ 개인정보 열람청구 접수•처리 부서 <br>
																				부서명 : 까사미아 CS팀 <br>
																				연락처 : 1588-3408 <br>
																				이메일 : casacsr@shinsegae.com
																			</li>
																		</ol>
																	</li>
																	<li>
																		２. 회원은 제1항의 열람청구 접수․처리부서 이외에, 개인정보보호위원회의 ‘개인정보보호 종합지원 포털’ 웹사이트(www.privacy.go.kr)를 통하여서도 개인정보 열람청구를 하실 수 있습니다.
																		<ol>
																			<li>▶ 개인정보보호 포털 → 민원마당 → 개인정보 열람등 요구 (본인확인을 위하여 아이핀(I-PIN)이 있어야 함)</li>
																		</ol>
																	</li>
																	<li>３. 회원이 개인정보의 오류 등에 대한 정정 또는 삭제를 요구한 경우에는 당사는 정정 또는 삭제를 완료할 때까지 당해 개인정보를 이용하거나 제공하지 않습니다.</li>
																	<li>４. 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다. 이 경우 개인정보 보호법 시행규칙 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.</li>
																	<li>
																		５. 회원님의 개인정보 권리행사 요구 거절 시 불복을 위한 이의제기 절차는 다음과 같습니다.
																		<ol>
																			<li>① 해당 부서에서 열람 등 요구에 대한 연기 또는 거절 시 요구 받은 날로부터 10일 이내에 정당한 사유 및 이의제기 방법 등을 통지</li>
																			<li>② 해당 부서에서 회원님의 이의제기 신청 및 접수(서면, 전화, 이메일) 개인정보 담당자가 내용 확인</li>
																			<li>③ 개인정보 보호책임자가 처리결과에 대해 최종 검토</li>
																			<li>④ 해당 부서에서 회원님에게 처리결과 통보</li>
																		</ol>
																	</li>
																	<li>
																		６. 당사가 이 개인정보처리방침을 지키지 않는다고 판단되시면, 위 개인정보 보호책임자 또는 개인정보 보호담당자에게 알려주십시오. 지적하신 문제를 조속히 확인하고 수정이 필요한 경우에는 최대한 빠른 시간 내에 조치하도록 노력하겠습니다. 당사는 회원님들의 개인정보와 관련하여 회원님 여러분들의 의견을 수렴하고 있으며 불만을 처리하기 위하여 모든 절차와 방법을 마련하고 있습니다.
																	</li>
																</ol>
															</li>

															<li>
																<h3>제11조 정보주체의 권익침해에 대한 구제방법</h3>
																<ol>
																	<li>
																		１. 아래의 기관은 당사와는 별개의 기관으로서, 당사의 자체적인 개인정보 불만처리, 피해구제 결과에 만족하지 못하시거나 보다 자세한 도움이 필요하시면 문의하여 주시기 바랍니다.
																		<ol>
																			<li>
																				▶ 개인정보 침해신고센터 (한국인터넷진흥원 운영) <br>
																				소관업무 : 개인정보 침해사실 신고, 상담 신청 <br>
																				홈페이지 : privacy.kisa.or.kr <br>
																				전화 : (국번없이) 118 <br>
																				주소 : (58324) 전남 나주시 진흥길 9(빛가람동 301-2) 3층 개인정보침해신고센터
																			</li>
																			<li>
																				▶ 개인정보 분쟁조정위원회 <br>
																				소관업무 : 개인정보 분쟁조정신청, 집단분쟁조정 (민사적 해결) <br>
																				홈페이지 : www.kopico.go.kr <br>
																				전화 : (국번없이) 1833-6972 <br>
																				주소 : (03171)서울특별시 종로구 세종대로 209 정부서울청사 12층
																			</li>
																			<li>▶ 대검찰청 사이버범죄수사단 : (국번없이) 1301  (www.spo.go.kr)</li>
																			<li>▶ 경찰청 사이버수사국 : (국번없이) (https://ecrm.police.go.kr)</li>
																		</ol>
																	</li>
																	<li>
																		２. 또한, 개인정보의 열람, 정정•삭제, 처리정지 등에 대한 정보주체자의 요구에 대하여 공공기관의 장이 행한 처분 또는 부작위로 인하여 권리 또는 이익을 침해 받은 자는 행정심판법이 정하는 바에 따라 행정심판을 청구할 수 있습니다.
																		<ol>
																			<li>▶ 중앙행정심판위원회(www.simpan.go.kr)의 전화번호 안내 참조</li>
																		</ol>
																	</li>
																</ol>
															</li>

															<li>
																<h3>제12조 아동의 개인정보보호</h3>
																<ol>
																	<li>당사는 법정 대리인의 동의가 필요한 만 14세 미만 아동의 회원 가입을 받고 있지 않습니다.</li>
																</ol>
															</li>

															<li>
																<h3>제13조 광고성 정보 전송</h3>
																<ol>
																	<li>
																		당사는 회원의 사전 동의를 받지 않으면 영리목적의 광고성 정보를 전송하지 않습니다. <br>
																		당사는 상품정보 안내 등 온라인 마케팅을 위해 광고성 정보를 전자우편 등으로 전송하는 경우 전자우편의 제목란 및 본문란에 다음 사항과 같이 회원께서 쉽게 알아 보실 수 있도록 조치합니다.
																	</li>
																	<li>
																		<ol>
																			<li>가 전자우편의 제목란: (광고)라는 문구를 제목란에 표시하며, 전자우편 본문란의 주요 내용을 표시합니다.</li>
																			<li>나 전자우편의 본문란: 이용자가 수신거부의 의사표시를 할 수 있는 전송자의 명칭, 전자우편 주소, 전화번호 및 주소를 명시합니다. 이용자가 수신거부의 의사를 쉽게 표시할 수 있는 방법을 한글 및 영문으로 각각 명시합니다.</li>
																		</ol>
																	</li>
																</ol>
															</li>

															<li>
																<h3>제14조 고지의 의무</h3>
																<ol>
																	<li>현 개인정보처리방침은 2022년 10월 05일에 개정되었으며 정부의 정책 또는 보안기술의 변경에 따라 내용의 추가, 삭제 및 수정이 있을 시에는 개정 최소 7일 전부터 홈페이지를 통해 고지할 것입니다.</li>
																	<li>개인정보처리방침 시행일자 : 2022년 10월 05일</li>
																</ol>
															</li>
														</ol>
													</div>
													<!-- / policy영역 -->
												</div>
												<!-- / 약관box -->
											</div>
											<!-- / 까사미아 개인정보 수집 이용 동의 -->
											<!-- 까사미아 영상정보처리기기 운영 관리 방침 -->
											<div>
												<h2>
													<div class="input_b size_sm type1">
														<div class="ez-checkbox">
															<div class="ez-checkbox"><div class="ez-checkbox"><input name="chkChoiceAgreementForCasamiaMembership4" type="checkbox" id="chkChoiceAgreementForCasamiaMembership4" class="ez-hide agreement-casa"></div></div>
														</div>
														<label for="chkChoiceAgreementForCasamiaMembership4">까사미아 영상정보처리기기 운영 관리 방침 <span>(선택)</span></label>
													</div>
												</h2>

												<!-- 약관box -->
												<div class="txt_a_new" style="width: 95%;border: 0; margin:0 auto;">
													<div class="policy_a">
														<p style="line-height:18px;">
															(주)신세계까사 (이하 당사라 함)는 영상정보처리기기 운영.관리 방침을 통해 <br>
															당사에서 처리하는 영상정보가 어떠한 용도와 방식으로 이용.관리되고 있는지 알려드립니다.
														</p>
														<ol>
															<li>
																<h3>1. 영상정보처리기기의 설치근거 및 설치목적</h3>
																<p>당사는 개인정보보호법 제25조 제1항에 따라 다음과 같은 목적으로 영상정보처리기기를 설치, 운영 합니다.</p>
																<ol>
																	<li>가. 시설안전 및 화재예방</li>
																	<li>나. 고객의 안전을 위한 범죄예방</li>
																	<li>다. 차량도난 및 파손방지</li>
																</ol>
															</li>
															<li>
																<h3>2. 설치대수, 설치위치 및 촬영범위</h3>
																<table border="0" cellspacing="0" cellpadding="0" class="header_h" style="margin-top: 4px;">
																	<tbody>
																		<tr>
																			<td><p align="center">구분</p></td>
																			<td><p align="center">설치대수</p></td>
																			<td><p align="center">설치위치 및 촬영범위</p></td>
																		</tr>
																		<tr>
																			<td><p align="center">CCTV</p></td>
																			<td><p align="center">616</p></td>
																			<td><p align="center">건물내•외곽 및 주차장 등 전 층</p></td>
																		</tr>
																		<tr>
																			<td><p align="center">차량번호인식 카메라</p></td>
																			<td><p align="center">11</p></td>
																			<td><p align="center">주차장 입•출입로</p></td>
																		</tr>
																	</tbody>
																</table>
															</li>
															<li>
																<h3>3. 관리책임자 및 접근 권한자</h3>
																<p>귀하의 영상정보를 보호하고 개인영상정보와 관련한 불만을 처리하기 위하여 아래와 같이 개인영상정보 보호책임자를 두고 있습니다.</p>
																<table border="0" cellspacing="0" cellpadding="0" class="header_h" style="margin-top: 4px;">
																	<tbody>
																		<tr>
																			<td><p align="center">구분</p></td>
																			<td><p align="center">소속</p></td>
																			<td><p align="center">직위</p></td>
																			<td><p align="center">연락처</p></td>
																		</tr>
																		<tr>
																			<td rowspan="2"><p align="center">영상정보처리기기 <br> 관리책임자</p></td>
																			<td><p align="center">본사 물류</p></td>
																			<td><p align="center">인사총무팀장</p></td>
																			<td><p align="center">02-6420-7108</p></td>
																		</tr>
																		<tr>
																			<td><p align="center">점포</p></td>
																			<td><p align="center">점포관리자</p></td>
																			<td><p align="center">홈페이지( <a href="http://www.guud.com" target="_blank">http://www.guud.com</a> ) <br> 매장안내 참조</p></td>
																		</tr>
																	</tbody>
																</table>
																<p>(대리점의 경우, 영상정보처리기기 관리책임은 각 대리점주에게 있습니다.)</p>
															</li>
															<li>
																<h3>4. 영상정보의 촬영시간, 보관기간, 보관장소 및 방법</h3>
																<table border="0" cellspacing="0" cellpadding="0" class="header_h" style="margin-top: 4px;">
																	<tbody>
																		<tr>
																			<td><p align="center">촬영시간</p></td>
																			<td><p align="center">보관기간</p></td>
																			<td><p align="center">보관장소</p></td>
																		</tr>
																		<tr>
																			<td><p align="center">24시간</p></td>
																			<td><p align="center">촬영일로부터 최대 30일 이내</p></td>
																			<td><p align="center">각 점포</p></td>
																		</tr>
																	</tbody>
																</table>
																<p>
																	<strong style="color:#000;">처리방법</strong> : 개인영상정보의 목적외 이용, 제3자 제공, 파기, 열람 등 요구에 관한 사항을 기록.관리하고,   보관기간 만료시 복원이 불가능한 방법으로 영구삭제(출력물의 경우 파쇄 또는 소각)합니다.
																</p>
															</li>
															<li>
																<h3>5. 영상정보처리기기 설치 및 관리 등의 위탁에 관한 사항</h3>
																<p>
																	당사는 아래와 같이 영상정보처리기기 설치 및 관리 등을 위탁하고 있으며, <br>
																	관계법령에 따라 위탁 계약시 개인정보가 안전하게 관리될 수 있도록 필요한 사항을 규정하고 있습니다.
																</p>
																<table border="0" cellspacing="0" cellpadding="0" class="header_h" style="margin-top: 4px;">
																	<tbody>
																		<tr>
																			<td><p align="center">수탁업체</p></td>
																			<td><p align="center">업무</p></td>
																			<td><p align="center">연락처</p></td>
																		</tr>
																		<tr>
																			<td><p align="center">에스원</p></td>
																			<td><p align="center">CCTV 유지보수</p></td>
																			<td><p align="center">1588-3112</p></td>
																		</tr>
																		<tr>
																			<td><p align="center">아마노</p></td>
																			<td><p align="center">주차</p></td>
																			<td><p align="center">02-2058-0898</p></td>
																		</tr>
																		<tr>
																			<td><p align="center">애니파킹</p></td>
																			<td><p align="center">주차</p></td>
																			<td><p align="center">1800-6715</p></td>
																		</tr>
																	</tbody>
																</table>
															</li>
															<li>
																<h3>6. 개인영상정보의 확인 방법 및 장소에 관한 사항</h3>
																<p>
																	<strong style="color:#000">확인방법 </strong> : 점포별 영상정보 접근권한자에게 미리 연락하고 점포를 방문하시면 확인 가능합니다.
																</p>
																<p>
																	<strong style="color:#000">확인장소 </strong> 확인하고자 하는 점포의 보안실 또는 주차장 상황실
																</p>
															</li>
															<li>
																<h3>7. 정보주체의 영상정보 열람 등 요구에 대한 조치</h3>
																<p>
																	귀하는 개인영상정보에 관하여 열람 또는 존재확인, 삭제를 원하는 경우 언제든지 영상정보처리기기 운영자에게 요구하실 수 있습니다. <br>
																	단, 귀하가 촬영된 개인영상정보 및 명백히 정보주체의 급박한 생명, 신체, 재산의 이익을 위하여 필요한 개인영상정보에 한정됩니다. <br>
																	당사는 개인영상정보에 관하여 열람 또는 존재확인, 삭제를 요구한 경우 지체없이 필요한 조치를 하겠습니다.
																</p>
															</li>
															<li>
																<h3>8. 영상정보의 안전성 확보조치</h3>
																<p>
																	당사는 처리하는 영상정보는 암호화 조치 등을 통하여 안전하게 관리되고 있습니다. <br>
																	또한 당사는 개인 영상정보보호를 위한 관리적 대책으로서 개인정보에 대한 접근 권한을 차등부여하고 있고, 개인 영상정보의 위.변조 방지를 위하여 개인영상정보의 생성 일시, 열람시 열람 목적.열람자.열람 일시 등을 기록하여 관리하고 있습니다.  <br>
																	이 외에도 개인영상정보의 안전한 물리적 보관을 위하여 잠금장치를 설치하고 있습니다
																</p>
															</li>
															<li>
																<h3>9. 개인정보 처리방침 변경에 관한 사항</h3>
																<p>
																	이 영상정보처리기기 운영.관리방침은 2021년 11월 2일에 제정되었으며 법령.정책 또는 보안기술의 변경에 따라 내용의 추가.삭제 및 수정이 있을 시에는 시행하기 최소 7일전에 당사 홈페이지를 통해 변경사유 및 내용 등을 공지하도록 하겠습니다.
																</p>
																<p>- 공고일자 : 2021년 11월 2일 / 시행일자 : 2021년 11월 2일 / 개정일자 : 2021년 11월 2일</p>
															</li>
														</ol>
													</div>
												</div>
											</div>
										</div>
						</div>
                    </div>



                    <!-- 통신서비스 마케팅 활용 동의 -->
                    <div id="wrapThirdPartyAgreementTelecom" class="term_b" style="position:relative; width:100%; overflow:hidden;/*padding-left: 15px;*/" runat="server">
						<div style="clear:both;">
							<ul class="are_li">
								<li>
									<h2>
										<div class="input_b size_sm type1 thirdparty">
											<div class="ez-checkbox">
												<div class="ez-checkbox"><input name="chkChoiceAgreementForThirdPartyTelecomALL" type="checkbox" id="chkChoiceAgreementForThirdPartyTelecomALL" value="Y" class="ez-hide thirdparty-parent"  runat="server"></div>
											</div>
											<label for="chkChoiceAgreementForThirdPartyTelecomALL" style="padding-right:0px;">제3자 마케팅 활용동의 <span style="font-size: 12px; color: #b1b1b1;">(선택)</span></label>
										</div>
									</h2>
								</li>
								<li>
									<h2>
										<div class="input_b size_sm type1 thirdparty">
											<div class="ez-checkbox">
												<div class="ez-checkbox"><input name="chkChoiceAgreementForThirdPartyShinhan" type="checkbox" id="chkChoiceAgreementForThirdPartyShinhan" value="119006" class="ez-hide thirdparty-child" runat="server"></div>

											</div>
											<label for="chkChoiceAgreementForThirdPartyShinhan" style="padding-right:0px;">라이프</label>
										</div>
									</h2>
								</li>
								<li>
									<h2>
										<div class="input_b size_sm type1 thirdparty">
											<div class="ez-checkbox">
												<div class="ez-checkbox"><div class="ez-checkbox"><input name="chkChoiceAgreementForThirdPartyTelecom" type="checkbox" id="chkChoiceAgreementForThirdPartyTelecom" value="119001"  runat="server" class="ez-hide thirdparty-child"></div></div>
											</div>
											<label for="chkChoiceAgreementForThirdPartyTelecom">통신<a href="javascript:void(0);" onclick="openLayer('layerPop6')" class="close" style="padding:0 0 0 3px;"><img src="/Resources/member/btn.svg"/></a></label>
										</div>
									</h2>
								</li>
							</ul> 
						</div>
						<div id="layerPop6" class="layerPop">
							<div class="are_wrap">
								<h3>제3자 마케팅 활용동의(선택)<a href="javascript:void(0);" onclick="closeLayer('layerPop6')" class="close">
									<img src="/Resources/member/ico-x.svg"></a></h3>
							</div>
							<!-- 약관box -->
							<div class="txt_a">
								<!-- policy영역 -->
								<div class="policy_a">
									<div>
										<h3>통신서비스 개인정보 제3자 제공</h3>
										<br>
										<span>개인정보를 제공받는자 : SK브로드밴드㈜, 브로드밴드TS㈜, ㈜티시스아이티, ㈜유컴패니온, ㈜유베이스, F&U신용정보㈜</span><br>
										<span>개인정보 제공 항목 : 성명,휴대폰번호,생년월일,성별,주소,이메일,예식일,참여일시,참여매체</span><br>
										<span>개인정보 제공목적 : 전화,문자,이메일을 이용한 SK브로드밴드 통신상품 안내 및 SK텔레콤 스마트홈 상품 위탁판매</span><br>
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
					</div>
                    <!-- / 통신서비스 마케팅 활용 동의 -->
                    <!-- 개인정보 취급위탁동의 숨김.. 위 동의 값에 따라 변경됨, ez-checkbox 스크립트로 인하여 형태 유지-->
					<div style="display:none;">
						<input name="chkChoiceAgreementForThirdParty" type="checkbox" id="chkChoiceAgreementForThirdParty" value="Y" runat="server">
					</div>
                    <!-- / 개인정보 취급위탁동의 -->
                    <!-- 하단 유의사항 추가영역-->
                    <style>
								.bt_info {
                                    text-align: left;
                                    margin: 28px 10px 30px 6px;
                                    display: block;
                                    overflow: hidden;
                                    border: 1px solid #fff;
                                }

                                    .bt_info h3 {
                                        font-size: 14px;
                                        margin: 0;
                                        color: #000;
                                        border: 0;
                                        padding: 0 0 15px 0;
                                    }

                                    .bt_info ul {
                                        color: #868686;
                                        line-height: 140%;
                                    }

                                    .bt_info li {
                                        font-size: 13px;
                                    }

                                /*모바일 환경 최적화 필요할경우 사용*/
                                @media (max-width:640px) {
                                    .bt_info ul {
                                        display: none;
                                    }
                                }


                    </style>

							
					<div style="margin:0 auto;">
						<div style=" overflow: hidden; width: 100%; background: #f9f9f9; padding: 20px 0; margin: 20px 0 20px 0;">
							<ul>
								<li style=" color: #d32f2f; float: left; padding:  0px 15px 0 18px;"><img src="/Resources/member/info.svg" style="vertical-align: text-bottom; padding: 0 4px 0 0;">알고 계세요
								</li>
								<li style=" font-size: 13px; padding: 2px 0 0 0; text-align:left; overflow:hidden;" <%--style=" font-size: 13px; padding: 2px 0 0 0; text-align:left; overflow:hidden;"--%> class="ar-db">청첩장 10,000원 및 감사장(15%) 할인쿠폰은 약관 전체 동의 시 발급됩니다.</li>
							</ul>
						</div>
						
						
						<div class="member_slide swiper-container">
							<ul class="swiper-wrapper">
							<% foreach (var item in BannerImages) {%> 
								   <li class="swiper-slide">
									   <%if (!string.IsNullOrEmpty(item.linkUrl)){ %>
									     <a href="<%=item.linkUrl%>" target="<%=item.linkTarget%>"><img src="<%=item.imagePath%>"></a>
									   <%}else { %>
										 <img src="<%=item.imagePath%>">
									   <%} %> 		   
									</li>								
								<% } %> 					
							</ul>
							<div class="swiper-pagination"></div>
						</div>
						
						<!-- pc, mo 공통 스타일 -->
						<style>
							.member_slide .swiper-slide img {width: 100%;}
							.member_slide .swiper-pagination-bullet-active {background: #333;}
						</style>
						<!-- //pc, mo 공통 스타일 -->

						<!-- 하단버튼 -->
						<div class="b_btn_a"  style="width:100%; height:55px; line-height:55px; background:#333; margin:20px 0 100px 0;">
							 <asp:LinkButton ID="LinkButton1" CssClass="type2 right_Page02" runat="server" OnClick="btnSave_Click" style="color:#fff;display:block" OnClientClick="return Information.ValidationCheck();"><span>가입완료</span></asp:LinkButton>
						</div>
					</div>
                </div>
                <!-- / 바른손 동의 -->
             </div>
			<input type="hidden" id="confirm_chk" value="N" />
			<%--신규 약관 디자인 End--%>

        </div>
        <!-- / 기본 정보입력 -->        
    </div>

        <!-- / 기본 정보입력 -->
        
    <!-- / contents -->

	<script type="text/javascript">

		//하단 슬라이드 배너
        $(document).ready(function(){
			if( $('.member_slide').length > 0 ){
				var memberSlide = new Swiper('.member_slide', {
					slidesPerView: 1,
					loop: true,
					autoplay: {
						delay: 2500,
						disableOnInteraction: false,
					},
					pagination: {
						el: '.swiper-pagination',
						clickable: true,
					},
				});
			}
		});

			
		$(".step_a ul li").removeClass("on").eq(2).addClass("on");

		function dEI(elementID){
			return document.getElementById(elementID);
		}

		function openLayer(IdName, tpos, lpos){
			var pop = dEI(IdName);
			pop.style.display = "block";

			var wrap = dEI("MasterBody");
			var reservation = document.createElement("div");
			reservation.setAttribute("id", "deemed");
			wrap.appendChild(reservation);
		}

		function closeLayer( IdName ){
			var pop = dEI(IdName);
			pop.style.display = "none";
			var clearEl=parent.dEI("deemed");
			var momEl = parent.dEI("MasterBody");
			momEl.removeChild(clearEl);
		}
       
    </script>

</asp:Content>
