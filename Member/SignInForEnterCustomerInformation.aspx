<%@ Page Title="" Language="C#" MasterPageFile="~/Master/Site.Master" AutoEventWireup="true" CodeBehind="SignInForEnterCustomerInformation.aspx.cs" Inherits="BarunnIntergrationService.Member.SignInForEnterCustomerInformation" ClientIDMode="Static" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <link href="/resources/css/jquery-ui-1.10.1.css" rel="stylesheet">
    <link href="/resources/css/melon.datepicker.css" rel="stylesheet">
    
    <script src="/resources/js/jquery-ui-1.10.1.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


    <%         
        if (false)
        {
    %>
    <script type="text/javascript" src="/resources/js/jquery.postcode.js"></script>
    <%
        }
        else
        {
    %>
    <script type="text/javascript" src="/resources/js/jquery.postcode.app.js"></script>
    <%
        }
    %>

    <script type="text/javascript">
        $(document).ready(function () {

            if (window.screen.width <= 320) {
                $("#wrapPostCode").css("min-width", "200px").css("max-width", "280px").css("width", "280px");
                $("#txtAddress").css("min-width", "200px").css("max-width", "280px").css("width", "280px");
                $("#txtAddressDetail").css("min-width", "200px").css("max-width", "280px").css("width", "280px");
            }
            
            //$(".LoadingImage").hide();

            $(".datepicker").datepicker({
                inline: true,
                showOtherMonths: true,
                changeMonth: true,
                changeYear: true,
                autoclose: true,
                dateFormat: "yy-mm-dd"
            })
            .datepicker('widget').wrap('<div class="ll-skin-melon"/>');

            $(".btnCalendarIcon").click(function () {
                var visible = $(".datepicker").datepicker("widget").is(":visible");
                $(".datepicker").datepicker(visible ? "hide" : "show");
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

            /*
            $("#txtID").on('input', function () {
                $(".LoadingImage").show();
            })
            */

            $("#txtID").focusout(function () {
                var AvaliableID = CheckAvailableUserID(false);
                var notiMessage = (AvaliableID == false ? "이미 사용중인 아이디 입니다." : "");
                if ($.trim($("#txtID").val()) == "")
                    notiMessage = "";

                //$(".LoadingImage").hide();
                $(this).parent().find(".noti").text(notiMessage);
            })



            /*
            $("#txtID").focusin(function () {
                var AvaliableID = CheckAvailableUserID(false);
                var notiMessage = (AvaliableID == false ? "이미 사용중인 아이디 입니다." : "");
                if ($.trim($("#txtID").val()) == "")
                    notiMessage = "";

                $(this).parent().find(".noti").text(notiMessage);
            })
            */

            /* Celemo DB Connection 이 느려서 focusout 이벤트로 적용 (커넥션만 느림) 변경된 IDC에서만 느림 */
            /*
            $("#txtID").keyup(function () {
                var AvaliableID = CheckAvailableUserID(false);
                var notiMessage = (AvaliableID == false ? "이미 사용중인 아이디 입니다." : "");
                if ($.trim($("#txtID").val()) == "")
                    notiMessage = "";

                $(this).parent().find(".noti").text(notiMessage);
            })
            */


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

        var CheckAvailableUserID = function (pAsync) {
            var result = false;
            $.ajaxSetup({ async: pAsync });
            $.getJSON("/Service/Member/CheckAvailableUser.ashx"
                ,   {USERID : $("#txtID").val(), AUTHCODE : $("#hidDupInfo").val(), OUTPUT : "json"}
                ,   function (data) {
                        result = data.Avaliable;
                    }
            );
            return result;
        }

        var CheckUserID = function (value) {
            var result = /^[A-Za-z0-9]+[A-Za-z0-9_.\-]{3,15}$/;
            var returnValue = result.test(value);

            return returnValue;
        }

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

            // 중복 클릭 방지
            //if ($(this).is(":disabled")) {
            //    $(this).prop("disabled", false);
            //    return false;
            //} else {
            //    $(this).prop("disabled", true);
            //}

            //alert($(this).is(":disabled"));
            //return false;

            if (isRunningSubmit) {
                return false;
            }

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

            if ($("#rdoSolar").prop("checked") == false && $("#rdoLunar").prop("checked") == false) {
                errorMessage = "양력 또는 음력을 선택해 주세요.";
                isValidation = false;
            }

            if (isValidation && $.trim($("#txtID").val()) == "") {
                $("#txtID").focus();
                errorMessage = "사용하실 아이디를 입력해주세요.";
                isValidation = false;
            }

            if (isValidation && CheckAvailableUserID(false) == false) {
                errorMessage = "이미 사용중인 아이디 입니다.";
                isValidation = false;
            }

            if (CheckUserID($("#txtID").val()) == false) {
                errorMessage = "아이디는 영문자로 시작하는 6~16자의 영문 또는 숫자의 조합이여야 합니다.";
                isValidation = false;
            }

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
                $("#txtZipCode").focus();
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
            
            if ($("#dlWeddingDayField").css('display') != 'none' && $("#dlWeddingHallField").is(':visible') && $("#dlWeddingDayField").is(':visible')) {
                //if ($("#dlWeddingDayField").length > 0) {
                if ($('#txtWeddingDay').length > 0) {
                    var txtWeddingDay = $("#txtWeddingDay").val();
                    if (isValidation && $.trim(txtWeddingDay) == "") {
                        $("#txtWeddingDay").focus();
                        errorMessage = "예식일을 입력해 주세요";
                        isValidation = false;
                    }

                    var weddingDate = $("#txtWeddingDay").val();
                    var weddingDateArr = weddingDate.split('-');
                    var weddingDateCompare = new Date(weddingDateArr[0], parseInt(weddingDateArr[1]) - 1, weddingDateArr[2]);

                    var todayDate = getTodayType();
                    var todayDateArr = todayDate.split('-');
                    var todayDateCompare = new Date(todayDateArr[0], parseInt(todayDateArr[1]) - 1, todayDateArr[2]);

                   if (todayDateCompare.getTime() > weddingDateCompare.getTime()) {
                        //alert("과거일자는 선택불가합니다");
                        $("#txtWeddingDay").focus();
                        errorMessage = "과거일자는 선택불가합니다";
                        isValidation = false;
                    }
                }
            }

            if ($("#dlWeddingHallField").css('display') != 'none' && $("#dlWeddingHallField").is(':visible') && $("#dlWeddingDayField").is(':visible')) {
            //if ($("#dlWeddingHallField").length > 0) {

                if (isValidation && $("[name*=rdoWeddingHall]:checked").length <= 0) {

                    //$('#rdoWeddingHall_W').attr("checked") == false
                    //&& $('#rdoWeddingHall_H').attr("checked") == false
                    //&& $('#rdoWeddingHall_C').attr("checked") == false
                    //&& $('#rdoWeddingHall_M').attr("checked") == false
                    //&& $('#rdoWeddingHall_E').attr("checked") == false) {

                    errorMessage = "예식장을 선택해 주세요";
                    isValidation = false;
                }
            }

            isRunningSubmit = false;
            if (isValidation == false) {
                if (errorMessage != "") {
                    alert(errorMessage);
                }
                event.preventDefault();
                return false;
            }

            return isValidation;
        }

        function getTodayType() {
            var date = new Date();
            return date.getFullYear() + "-" + ("0" + (date.getMonth() + 1)).slice(-2) + "-" + ("0" + date.getDate()).slice(-2);
        }
    </script>

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
    <input type="hidden" name="hidChkChoiceAgreementForThirdParty" id="hidChkChoiceAgreementForThirdParty" runat="server" />
    <input type="hidden" name="hidChkChoiceAgreementForThirdPartyTelecom" id="hidChkChoiceAgreementForThirdPartyTelecom" runat="server" />
    <input type="hidden" name="hidChkChoiceAgreementForThirdPartyInsurance1" id="hidChkChoiceAgreementForThirdPartyInsurance1" runat="server" />
    <input type="hidden" name="hidChkChoiceAgreementForThirdPartyInsurance2" id="hidChkChoiceAgreementForThirdPartyInsurance2" runat="server" />
    <input type="hidden" name="hidChkChoiceAgreementForThirdPartyHealth" id="hidChkChoiceAgreementForThirdPartyHealth" runat="server" />
    <input type="hidden" name="hidChkChoiceAgreementForThirdPartyTelecomALL" id="hidChkChoiceAgreementForThirdPartyTelecomALL" runat="server" />
    <input type="hidden" name="hidChkChoiceAgreementForThirdPartyShinhan" id="hidChkChoiceAgreementForThirdPartyShinhan" runat="server" />
    <input type="hidden" name="hidChkChoiceAgreementForLGMembership" id="hidChkChoiceAgreementForLGMembership" runat="server" />
    <input type="hidden" name="hidChkChoiceAgreementForLGChoicePersonalData" id="hidChkChoiceAgreementForLGChoicePersonalData" runat="server" />
    <%--<input type="hidden" name="hidChkChoiceAgreementForThirdPartyDrink" id="hidChkChoiceAgreementForThirdPartyDrink" runat="server" />--%>
    <input type="hidden" name="hidChkChoiceAgreementForSamSungMembership" id="hidChkChoiceAgreementForSamSungMembership" runat="server" />
    <input type="hidden" name="hidChkChoiceAgreementForSamSungChoicePersonalData" id="hidChkChoiceAgreementForSamSungChoicePersonalData" runat="server" />
    <input type="hidden" name="hidChkChoiceAgreementForSamSungThirdParty" id="hidChkChoiceAgreementForSamSungThirdParty" runat="server" />
    <input type="hidden" name="hidChkChoiceAgreementForSamSungChoiceYearlData" id="hidChkChoiceAgreementForSamSungChoiceYearlData" runat="server" />
    <input type="hidden" name="hidChkChoiceAgreementForMyomeeMembership" id="hidChkChoiceAgreementForMyomeeMembership" runat="server" />
    <input type="hidden" name="hidChkChoiceAgreementForCasamiaMembershipALL" id="hidChkChoiceAgreementForCasamiaMembershipALL" runat="server" />
    <input type="hidden" name="hidChkChoiceAgreementForKtMembership" id="hidChkChoiceAgreementForKtMembership" runat="server" />
    <input type="hidden" name="hidSelectSiteCode" id="hidSelectSiteCode" runat="server" />
    <input type="hidden" name="hidRegistrationNumber" id="hidRegistrationNumber" runat="server" />
    <input type="hidden" name="hidRefererSite" id="hidRefererSite" runat="server" />

    <!-- Step -->
	<div class="step_a">
		<div class="step_a_in">
			<div class="tit"><img src="/resources/member/tit_barunnone_join.png" alt="바른 ONE 회원가입"></div>
			<ul>
				<li><img src="/resources/member/img_step1.png" alt="Step1 본인인증"></li>
				<li><img src="/resources/member/img_step2.png" alt="Step2 약관동의"></li>
				<li class="on"><img src="/resources/member/img_step3.png" alt="Step3 정보입력"></li>
				<li><img src="/resources/member/img_step4.png" alt="Step4 가입완료"></li>
			</ul>
		</div>
	</div>
	<!-- Step -->	
	<!-- contents -->
	<div class="cont_a">
		<div class="cont_a_in">
			<div class="noti_mark">표시는 필수 항목입니다</div>
			<!-- table -->
			<div class="b_dtable_1">
				<dl id="dlName" runat="server">
					<dt class="mark"><p>이 름</p></dt>
					<dd>
                        <input type="hidden" name="txtUserName" id="txtUserName" runat="server" style="width:270px;" title="이름을 입력해주세요" maxlength="25" readonly="readonly" />
                        <asp:Literal ID="ltrUserName" runat="server"></asp:Literal>
					</dd>
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
<%--                        
                        <div></div>
						<input type="text" name="txtBirthDateForYear" id="txtBirthDateForYear" runat="server" style="width:81px;" title="생년월일을 입력해주세요" maxlength="4">
						&nbsp;&nbsp;년&nbsp;&nbsp;
						<input type="text" name="txtBirthDateForMonth" id="txtBirthDateForMonth" runat="server" style="width:54px;" title="생년월일을 입력해주세요" maxlength="2">
						&nbsp;&nbsp;월&nbsp;&nbsp;
						<input type="text" name="txtBirthDateForDay" id="txtBirthDateForDay" runat="server" style="width:54px;" title="생년월일을 입력해주세요" maxlength="2">
                        &nbsp;&nbsp;일&nbsp;&nbsp;--%>
						<div class="input_b size_sm type2"><input type="radio" name="rdoSolarOrLunar" id="rdoSolar" value="Y" runat="server"><label for="rdoSolar">양력</label></div>
						<div class="input_b size_sm type2"><input type="radio" name="rdoSolarOrLunar" id="rdoLunar" value="N" runat="server"><label for="rdoLunar">음력</label></div>
					</dd>
				</dl>
				<dl id="dlUserId" runat="server">
					<dt class="mark"><p>아이디</p></dt>
					<dd>
                        <input type="text" name="txtID" id="txtID" runat="server" style="width:340px;" title="아이디를 넣어주세요" placeholder="공백 없는 영문, 숫자 포함 6~16자"><%--<span class="LoadingImage"><img src="/resources/img_inc/img_loading_25.gif" class="ico_loading" alt="로딩중입니다"></span>--%><span class="noti"></span>
                        <asp:Literal ID="ltrID" runat="server"></asp:Literal>
					</dd>
				</dl>
				<dl id="dlPassword" runat="server">
					<dt class="mark"><p>비밀번호</p></dt>
					<dd><input type="password" name="txtPassword" id="txtPassword" runat="server" style="width:340px; " title="비밀번호를 넣어주세요" placeholder="영문으로 시작하는 6~16자의 영문+숫자 조합" maxlength="16"></dd>
				</dl>
				<dl id="dlPasswordConfirm" runat="server">
					<dt class="mark"><p>비밀번호 확인</p></dt>
					<dd><input type="password" name="txtPasswordConfirm" id="txtPasswordConfirm" runat="server" style="width:340px;" title="비밀번호를 한번 더 넣어주세요" placeholder="한번 더 넣어주세요" maxlength="16"><span class="noti"></span></dd>
				</dl>
				<dl id="dlAddress" runat="server">
					<dt class="mark"><p>주 소</p></dt>
					<dd>
						<div>
						    <input type="text" name="txtZipCode1" id="txtZipCode1" class="b_talign_c post-postcode1" style="width:20px;" runat="server" maxlength="1" title="우편번호" readonly="readonly">
						    <input type="text" name="txtZipCode2" id="txtZipCode2" class="b_talign_c post-postcode2" style="width:20px;" runat="server" maxlength="1" title="우편번호" readonly="readonly">
						    <input type="text" name="txtZipCode3" id="txtZipCode3" class="b_talign_c post-postcode3" style="width:20px;" runat="server" maxlength="1" title="우편번호" readonly="readonly">
						    <input type="text" name="txtZipCode4" id="txtZipCode4" class="b_talign_c post-postcode4" style="width:20px;" runat="server" maxlength="1" title="우편번호" readonly="readonly">
						    <input type="text" name="txtZipCode5" id="txtZipCode5" class="b_talign_c post-postcode5" style="width:20px;" runat="server" maxlength="1" title="우편번호" readonly="readonly">
						    <button class="b_btn type3 post-submit" postcode-index="0" postcode-type="zonecode" postcode-input-cnt="5"><span>우편번호 검색</span></button>
						</div>

                        <div id="wrapPostCode" style="display:none;border:1px solid;width:340px;height:300px;margin:5px 0;position:relative">
                            <img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
                        </div>

                        
                        <input type="text" name="txtAddress" id="txtAddress" runat="server" class="post-address" title="주소를 넣어주세요" placeholder="동,면,읍 이상" readonly="readonly">
                        <br />
					    <input type="text" name="txtAddressDetail" id="txtAddressDetail" runat="server" title="나머지 주소를 넣어주세요" placeholder="나머지 주소(직접입력)" maxlenth="50">

                    </dd>
					
				</dl>
				<dl id="dlPhone" runat="server">
					<dt><p>전화번호</p></dt>
					<dd>
						<%--<input type="text" name="txtPhone1" id="txtPhone1" runat="server" class="b_talign_c" style="width:120px;" title="전화번호 앞자리">--%>
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
						<input type="text" name="txtPhone2" id="txtPhone2" runat="server" class="b_talign_c" style="width:120px;" title="전화번호 중간자리" maxlength="4">&nbsp;&nbsp;-&nbsp;&nbsp;
						<input type="text" name="txtPhone3" id="txtPhone3" runat="server" class="b_talign_c" style="width:120px;" title="전화번호 끝자리" maxlength="4">
					</dd>
				</dl>
				<dl id="dlHphone" runat="server">
					<dt class="mark"><p>휴대폰번호</p></dt>
					<dd>
						<%--<input type="text" name="txtHPhone1" id="txtHPhone1" runat="server" class="b_talign_c" style="width:120px;" title="핸드폰 번호 앞자리">--%>
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
						<input type="text" name="txtHPhone2" id="txtHPhone2" runat="server" class="b_talign_c" style="width:120px;" title="핸드폰 번호 중간자리" maxlength="4" readonly>&nbsp;&nbsp;-&nbsp;&nbsp;
						<input type="text" name="txtHPhone3" id="txtHPhone3" runat="server" class="b_talign_c" style="width:120px;" title="핸드폰 번호 끝자리" maxlength="4" readonly>
                        <asp:Literal ID="ltrHphoneNbspField" runat="server"></asp:Literal>
                        <div class="input_b size_sm type2"><input type="checkbox" name="chkSMSYorN" id="chkSMSYorN" runat="server" checked><label for="chkSMSYorN">SMS수신설정</label></div>
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
								<option value="gmail.com">gmail.com</option>
                                <option value="naver.com">naver.com</option>
                                <option value="daum.net">daum.net</option>
                                <option value="nate.com">nate.com</option>
                                <option value="hanmail.net">hanmail.net</option>
                                <option value="hotmail.com">hotmail.com</option>
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
				<a href="javascript:history.back()" class="b_btn type2 dim left"><span>이전</span></a>
                <asp:LinkButton ID="btnSave" CssClass="b_btn type2 right" runat="server" OnClick="btnSave_Click" OnClientClick="return ValidationCheck();"><span>가입완료하기</span></asp:LinkButton>
			</div>
			<!-- / 하단버튼 -->
		</div>
	</div>
	<!-- / contents -->

</asp:Content>


