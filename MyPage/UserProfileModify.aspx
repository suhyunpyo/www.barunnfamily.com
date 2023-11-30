<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Site.Master" AutoEventWireup="true" CodeBehind="UserProfileModify.aspx.cs" Inherits="BarunnIntergrationService.MyPage.UserProfileModify" ClientIDMode="Static" %>

<asp:Content ID="cphStyleSheet" ContentPlaceHolderID="cphStyleSheet" runat="server">
    <link rel="stylesheet" type="text/css" href="/resources/css/common.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/layout_mypage.css">
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="/resources/css/jquery-ui-1.10.1.css" rel="stylesheet">
    <link href="/resources/css/melon.datepicker.css" rel="stylesheet">
    <script src="/resources/js/jquery-ui-1.10.1.min.js"></script>
    <script type="text/javascript" src="/resources/js/jquery.postcode.js"></script>
    <script type="text/javascript">

        $(document).ready(function () {

            $("body").attr("class", "mmodi_p");

            $(".datepicker").datepicker({
                inline: true,
                showOtherMonths: true,
                dateFormat: "yy-mm-dd"
            })
            .datepicker('widget').wrap('<div class="ll-skin-melon"/>');

            $(".btnCalendarIcon").click(function () {
                var visible = $(".datepicker").datepicker("widget").is(":visible");
                $(".datepicker").datepicker(visible ? "hide" : "show");
            })

            $(".btnClose").click(function () {
           
                window.close();
    
            })

            $("#selEMailFooter").change(function () {
                //var sEMailAddress = $("#txtEMail").val();
                //var sEMailHeader = "";
                var sEMailFooter = $(this).val();
                //for (i = 0; i < sEMailAddress.split("@").length - 1; i++) {
                //    sEMailHeader += sEMailAddress.split("@")[i];
                //}
                //if ($.trim(sEMailHeader) == "") {
                //    sEMailHeader = sEMailAddress;
                //}
                //sEMailAddress = sEMailHeader + "@" + sEMailFooter;
                //$("#txtEMail").val(sEMailAddress);
                $("#txtEMailFooter").val(sEMailFooter);

                if (sEMailFooter == "")
                    $("#txtEMailFooter").removeAttr("readonly");
                else
                    $("#txtEMailFooter").attr("readonly", "readonly");
            })

            $("#txtID").keyup(function () {
                var AvaliableID = CheckAvailableUserID(true);
                var notiMessage = (AvaliableID == false ? "이미 사용중인 아이디 입니다." : "");
                if ($.trim($("#txtID").val()) == "")
                    notiMessage = "";

                $(this).parent().find(".noti").text(notiMessage);
            })


            // Password Confirm
            $("#txtPasswordConfirm").focusin(function () {
                $("#txtPasswordConfirm").parent().find(".noti").text("");
            })

            $("#txtPasswordConfirm").focusout(function () {
                var txtPassword = $("#txtPassword").val();
                var txtPasswordConfirm = $("#txtPasswordConfirm").val();

                if (txtPassword != txtPasswordConfirm) {
                    $("#txtPasswordConfirm").parent().find(".noti").text("동일하지 않습니다");
                } else {
                    $("#txtPasswordConfirm").parent().find(".noti").text("");
                }
            })    

        })

        // 영문자로 시작하는 6 ~ 16자의 영문 + 숫자 조합
        var PasswordCheck = function (value) {
            var result = /^[A-Za-z][A-Za-z0-9_.!@#$%^&*]{5,15}$/;
            var returnValue = result.test(value);

            if (returnValue) {
                result = /[0-9]/;
                returnValue = result.test(value);
            }

            return returnValue;
        }

        var isRunningSubmit = false;
        var ValidationCheck = function () {

            if (isRunningSubmit)
                return false;
            isRunningSubmit = true;

            var isValidation = true;
            var errorMessage = "";
            //var txtBirthDateForYear = $("#txtBirthDateForYear").val();
            //var txtBirthDateForMonth = $("#txtBirthDateForMonth").val();
            //var txtBirthDateForDay = $("#txtBirthDateForDay").val();
            //if (   ($.isNumeric(txtBirthDateForYear) == false || $.trim(txtBirthDateForYear) == "")
            //    || ($.isNumeric(txtBirthDateForMonth) == false || $.trim(txtBirthDateForMonth) == "")
            //    || ($.isNumeric(txtBirthDateForDay) == false || $.trim(txtBirthDateForDay) == "")
            //    ) {
            //    $("#txtBirthDateForYear").val("").focus();
            //    errorMessage = "생년 월일을 입력해 주세요";
            //    isValidation = false;
            //}

            //var rdoSolarOrLunar = $("#rdoSolar").is(":checked") ? $("#rdoSolar").val() : ($("#rdoLunar").is(":checked") ? $("#rdoLunar").val() : "");
            //if (isValidation && (rdoSolarOrLunar != "Y" && rdoSolarOrLunar !="N")) {
            //    errorMessage = "양력 또는 음력을 선택해 주세요";
            //    isValidation = false;
            //}

            var txtPassword = $("#txtPassword").val();
            if (isValidation && $.trim(txtPassword) == "") {
                $("#txtPassword").focus();
                errorMessage = "비밀번호를 입력해주세요";
                isValidation = false;
            }
            if (isValidation && PasswordCheck(txtPassword) == false) {
                $("#txtPassword").focus();
                errorMessage = "비밀번호는 영문자로 시작하는 6~16자의 영문, 숫자, _.!@#$%^&*의 특수문자의 조합이여야 합니다.";
                isValidation = false;
            }

            var txtPasswordConfirm = $("#txtPasswordConfirm").val();
            if (isValidation && $.trim(txtPasswordConfirm) == "") {
                $("#txtPasswordConfirm").focus();
                $("#txtPasswordConfirm").parent().find(".noti").text("비밀번호를 입력해주세요");
                errorMessage = "";
                isValidation = false;
            } else {
                $("#txtPasswordConfirm").parent().find(".noti").text("");
            }

            if (isValidation && txtPassword != txtPasswordConfirm) {
                $("#txtPasswordConfirm").focus();
                $("#txtPasswordConfirm").parent().find(".noti").text("동일하지 않습니다");
                errorMessage = "입력하신 비밀번호와 일치하지 않습니다.";
                isValidation = false;
            } else {
                $("#txtPasswordConfirm").parent().find(".noti").text("");
            }

            var txtZipCode = $("#txtZipCode1").val() + $("#txtZipCode2").val() + $("#txtZipCode3").val() + $("#txtZipCode4").val() + $("#txtZipCode5").val();
            if (isValidation && $.trim(txtZipCode) == "") {
                $(".post-submit").focus();
                errorMessage = "우편번호 및 주소를 입력해 주세요";
                isValidation = false;
            }

            var txtAddressDetail = $("#txtAddressDetail").val();
            if (isValidation && $.trim(txtAddressDetail) == "") {
                $("#txtAddressDetail").focus();
                errorMessage = "상세 주소를 입력해 주세요";
                isValidation = false;
            }

            var txtPhone1 = $("#txtPhone1").val();
            var txtPhone2 = $("#txtPhone2").val();
            var txtPhone3 = $("#txtPhone3").val();

            /*
            if (isValidation && (
                   ($.isNumeric(txtPhone1) == false || $.trim(txtPhone1) == "")
                || ($.isNumeric(txtPhone2) == false || $.trim(txtPhone2) == "")
                || ($.isNumeric(txtPhone3) == false || $.trim(txtPhone3) == "")
                )) {
                $("#txtPhone1").focus();
                errorMessage = "전화번호를 입력해 주세요";
                isValidation = false;
            }
            */

            var txtHPhone1 = $("#txtHPhone1").val();
            var txtHPhone2 = $("#txtHPhone2").val();
            var txtHPhone3 = $("#txtHPhone3").val();
            if (isValidation && (
                   ($.isNumeric(txtHPhone1) == false || $.trim(txtHPhone1) == "")
                || ($.isNumeric(txtHPhone2) == false || $.trim(txtHPhone2) == "")
                || ($.isNumeric(txtHPhone3) == false || $.trim(txtHPhone3) == "")
                )) {
                $("#txtHPhone1").focus();
                errorMessage = "휴대폰 번호를 입력해 주세요";
                isValidation = false;
            }
            
            var txtEMailHeader = $("#txtEMailHeader").val();
            if (isValidation && ($.trim(txtEMailHeader) == "")) {
                $("#txtEMailHeader").focus();
                errorMessage = "이메일 주소를 입력해 주세요";
                isValidation = false;
            }

            var txtEMailFooter = $("#txtEMailFooter").val();
            if (isValidation && ($.trim(txtEMailFooter) == "")) {
                $("#txtEMailFooter").focus();
                errorMessage = "이메일 주소를 입력해 주세요";
                isValidation = false;
            }

            isRunningSubmit = false;
            if (isValidation == false) {
                if (errorMessage != "")
                    alert(errorMessage);
                event.preventDefault();
                return false;
            }

            if (isValidation) {
                isValidation = confirm("수정된 내용을 저장하시겠습니까?");
            }

            return isValidation;
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <input type="hidden" name="hidDupInfo" id="hidDupInfo" runat="server" />
    <input type="hidden" name="hidReturnUrl" id="hidReturnUrl" runat="server" />

    <!-- Step -->
	<div class="step_a">
		<div class="step_a_in">
			<div class="tit"><img src="/resources/mypage/tit_member_modify.png" alt="바른 ONE 아이디 개인정보수정"></div>
		</div>
	</div>
	<!-- Step -->	
	<!-- contents -->
	<div class="cont_a">
		<div class="cont_a_in">
			<ul class="b_noti01">
				<li>서비스 제공과 상품 발송을 위해 정확한 정보입력을 부탁 드립니다.</li>
				<li>바른컴퍼니는 고객님의 개인정보를 소중히 생각하며, 개인정보 관련법령을 철저히 준수합니다.</li>
			</ul>
			<div class="noti_mark">표시는 필수 항목입니다</div>
			<!-- table -->
			<div class="b_dtable_1">
				<dl id="dlName" runat="server">
					<dt class="mark"><p>이 름</p></dt>
					<dd><asp:Literal ID="ltrUserName" runat="server"></asp:Literal> </dd>
				</dl>
				<dl id="dlJoinDate" runat="server">
					<dt class="mark"><p>바른 ONE 가입일</p></dt>
					<dd><asp:Literal ID="ltrRegDate" runat="server"></asp:Literal></dd>
				</dl>
				<dl id="dlBirthDate" runat="server">
					<dt class="mark"><p>생년월일</p></dt>
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
						<div class="input_b size_sm type2"><input type="radio" name="rdoSolarOrLunar" id="rdoSolar" value="Y" runat="server"><label for="rdoSolar">양력</label></div>
						<div class="input_b size_sm type2"><input type="radio" name="rdoSolarOrLunar" id="rdoLunar" value="N" runat="server"><label for="rdoLunar">음력</label></div>
					</dd>
				</dl>
				<dl id="dlUserId" runat="server">
					<dt class="mark"><p>아이디</p></dt>
					<dd><asp:Literal ID="ltrUserId" runat="server"></asp:Literal></dd>
				</dl>
				<dl id="dlPassword" runat="server">
					<dt class="mark"><p>비밀번호</p></dt>
					<dd><input type="password" name="txtPassword" id="txtPassword" runat="server" style="width:340px;" title="비밀번호를 넣어주세요" placeholder="영문으로 시작하는 6~16자의 영문+숫자 조합" maxlength="16"></dd>
				</dl>
				<dl id="dlPasswordConfirm" runat="server">
					<dt class="mark"><p>비밀번호 확인</p></dt>
					<dd><input type="password" name="txtPasswordConfirm" id="txtPasswordConfirm" runat="server" style="width:340px;" title="비밀번호를 한번 더 넣어주세요" placeholder="한번 더 넣어주세요" maxlength="16"><span class="noti"></span></dd>
				</dl>
				<dl id="dlAddress" runat="server">
					<dt class="mark"><p>주 소</p></dt>
					<dd>
						<div class="row">
						<input type="text" name="txtZipCode1" id="txtZipCode1" class="b_talign_c post-postcode1" style="width:35px;" runat="server" maxlength="1" title="우편번호" readonly="readonly">
						<input type="text" name="txtZipCode2" id="txtZipCode2" class="b_talign_c post-postcode2" style="width:35px;" runat="server" maxlength="1" title="우편번호" readonly="readonly">
						<input type="text" name="txtZipCode3" id="txtZipCode3" class="b_talign_c post-postcode3" style="width:35px;" runat="server" maxlength="1" title="우편번호" readonly="readonly">
						<input type="text" name="txtZipCode4" id="txtZipCode4" class="b_talign_c post-postcode4" style="width:35px;" runat="server" maxlength="1" title="우편번호" readonly="readonly">
						<input type="text" name="txtZipCode5" id="txtZipCode5" class="b_talign_c post-postcode5" style="width:35px;" runat="server" maxlength="1" title="우편번호" readonly="readonly">
						<button class="b_btn type3 post-submit" postcode-index="0" postcode-type="zonecode" postcode-input-cnt="5"><span>우편번호 검색</span></button>
						</div>
						<div class="row"><input type="text" name="txtAddress" id="txtAddress" runat="server" class="post-address" style="width:700px;" title="주소를 넣어주세요" placeholder="동,면,읍 이상" readonly="readonly"></div>
						<div class="row"><input type="text" name="txtAddressDetail" id="txtAddressDetail" runat="server" style="width:700px;" title="나머지 주소를 넣어주세요" placeholder="나머지 주소(직접입력)" maxlenth="50"></div>
					</dd>
				</dl>
				<dl id="dlPhone" runat="server">
					<dt><p>전화번호</p></dt>
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
						<input type="text" name="txtPhone2" id="txtPhone2" runat="server" class="b_talign_c" style="width:120px;" title="전화번호 중간자리">&nbsp;&nbsp;-&nbsp;&nbsp;
						<input type="text" name="txtPhone3" id="txtPhone3" runat="server" class="b_talign_c" style="width:120px;" title="전화번호 끝자리">
					</dd>
				</dl>
				<dl id="dlHphone" runat="server">
					<dt class="mark"><p>휴대폰번호</p></dt>
					<dd>
						<div class="b_sel_line" style="width:120px;">
                            <select name="txtHPhone1" id="txtHPhone1" runat="server" title="국번을 넣어주세요" style="width:120px;">
                                <option value="010">010</option>
                                <option value="011">011</option>
                                <option value="016">016</option>
                                <option value="017">017</option>
                                <option value="018">018</option>
                                <option value="019">019</option>
                            </select>
                        </div>&nbsp;&nbsp;-&nbsp;&nbsp;
						<input type="text" name="txtHPhone2" id="txtHPhone2" runat="server" class="b_talign_c" style="width:120px;" title="핸드폰 번호 중간자리">&nbsp;&nbsp;-&nbsp;&nbsp;
						<input type="text" name="txtHPhone3" id="txtHPhone3" runat="server" class="b_talign_c" style="width:120px;" title="핸드폰 번호 끝자리">
						&nbsp;&nbsp;<div class="input_b size_sm type2"><input type="checkbox" name="chkSMSYorN" id="chkSMSYorN" runat="server" checked><label for="chkSMSYorN">SMS수신설정</label></div>
					</dd>
				</dl>
				<dl id="dlEmail" runat="server">
					<dt class="mark"><p>이메일</p></dt>
					<dd>
						<input type="text" name="txtEMailHeader" id="txtEMailHeader" runat="server" style="width:220px;" title="이메일을 넣어주세요"> @
                        <input type="text" name="txtEMailFooter" id="txtEMailFooter" runat="server" style="width:120px;" title="이메일을 넣어주세요">&nbsp;&nbsp;&nbsp;&nbsp;
						<div class="b_sel_line" style="width:128px;">
							<select title="이메일선택" name="selEMailFooter" id="selEMailFooter" runat="server" style="width:128px;">
								<option value="" selected>직접입력</option>
								<option value="naver.com">naver.com</option>
                                <option value="nate.com">nate.com</option>
                                <option value="hotmail.com">hotmail.com</option>
                                <option value="hanmail.net">hanmail.net</option>
                                <option value="daum.net">daum.net</option>
                                <option value="gmail.com">gmail.com</option>
							</select>
						</div>
						<div class="row noti_email">
							<div class="input_b size_sm type2"><input type="checkbox" name="chkMailServiceYorN" id="chkMailServiceYorN" runat="server" checked><label for="chkMailServiceYorN" ><strong>뉴스레터 및 안내메일 수신설정</strong></label></div>
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
					<dt class="mark"><p>예식장</p></dt>
					<dd>
						<div class="input_b size_sm type2"><input type="radio" name="rdoWeddingHall" id="rdoWeddingHall_W" value="W" runat="server"><label for="rdoWeddingHall_W">예식홀</label></div>
						<div class="input_b size_sm type2"><input type="radio" name="rdoWeddingHall" id="rdoWeddingHall_H" value="H" runat="server"><label for="rdoWeddingHall_H">호텔</label></div>
						<div class="input_b size_sm type2"><input type="radio" name="rdoWeddingHall" id="rdoWeddingHall_C" value="C" runat="server"><label for="rdoWeddingHall_C">종교장소</label></div>
						<div class="input_b size_sm type2"><input type="radio" name="rdoWeddingHall" id="rdoWeddingHall_M" value="M" runat="server"><label for="rdoWeddingHall_M">군관련기업</label></div>
						<div class="input_b size_sm type2"><input type="radio" name="rdoWeddingHall" id="rdoWeddingHall_E" value="E" runat="server"><label for="rdoWeddingHall_E">기타</label></div>																		
					</dd>
				</dl>

			</div>
			<!-- / table -->
			<!-- 하단버튼 -->
			<div class="b_btn_a">
                <asp:LinkButton ID="btnSave" CssClass="b_btn type2 right" runat="server" OnClick="btnSave_Click" OnClientClick="return ValidationCheck();"><span>완료하기</span></asp:LinkButton>
				<a href="javascript:;" class="b_btn type2 dim btnClose"><span>취소하기</span></a>
			</div>
			<!-- / 하단버튼 -->
		</div>
        <script>
            var Sitegubun = "<%=sitegubun%>"
            if (Sitegubun == "GS") {
                $(".head_a .head_a_in .bi").html("<a href=\"https://barunsongshop.com\" target=\"_blank\"><img src=\"/resources/img_inc/logo_barunsoncard.png\" srcset=\"https://gsauth.barunsoncard.com/img/common/barunsongshop.svg\" alt=\"바른손G샵\" width=\"142px\" height=\"30px;\"></a>")

            }
        </script>
	</div>
	<!-- / contents -->

</asp:Content>
