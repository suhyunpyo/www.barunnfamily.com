using BarunnIntergrationService.Common;
using BarunnIntergrationService.Common.Databases;
using BarunnIntergrationService.Common.ExtensionMethod;
using BarunnIntergrationService.Common.ResultModel;
using BarunnIntergrationService.Common.Utillity;
using BarunnIntergrationService.Service;
using BarunnIntergrationService.Service.Member;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Sockets;

namespace BarunnIntergrationService.Member
{
    public partial class BhandsForCustomerInformation : System.Web.UI.Page
    {
        string sUrlReferer = string.Empty;
        string sAuthModuleType = string.Empty;
		string sCertID = string.Empty;     
        string sDupInfo = string.Empty;
		string sAuthType = string.Empty;
		string sConnInfo = string.Empty;
		string sSelectSiteCode = string.Empty;
		string sSelectCustomUserId = string.Empty;
		bool checkProcess = false;

        protected override void OnInit(EventArgs e)
        {
            selBirthDateForYear.Items.Clear();
            for (int i = 0; i < 120; i++)
            {
                int iYear = 1900 + i;
                ListItem item = new ListItem();
                item.Text = iYear.ToString();
                item.Value = iYear.ToString();
                if (iYear == 1980)
                    item.Selected = true;
                selBirthDateForYear.Items.Add(item);

            }

            selBirthDateForMonth.Items.Clear();
            for (int i = 0; i < 12; i++)
            {
                ListItem item = new ListItem();
                item.Text = ("0" + (i + 1).ToString()).Right(2);
                item.Value = ("0" + (i + 1).ToString()).Right(2);
                selBirthDateForMonth.Items.Add(item);
            }

            selBirthDateForDay.Items.Clear();
            for (int i = 0; i < 31; i++)
            {
                ListItem item = new ListItem();
                item.Text = ("0" + (i + 1).ToString()).Right(2);
                item.Value = ("0" + (i + 1).ToString()).Right(2);
                selBirthDateForDay.Items.Add(item);
            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {

            HttpContextUtility.SetNoCache();
            Session["JOIN_STEP"] = "2";
            //Session["SiteGB"] = ApplicationContext.G().REFERER_SITE;

            InitDeviceBranchProcessing();

            Boolean boolPassed = true;
            if (IsPostBack == false)
            {
                boolPassed = firstPageLoad();
            }

            if (boolPassed == false)
            {
                Response.RedirectForReferer();
                Response.End();
            }

            /*
            if (Session["companySeq"] == null || Session["saleGubun"] == null)
            {
                Response.RedirectForReferer();
                Response.End();
            }
            else
            {
                if (string.IsNullOrWhiteSpace(Session["companySeq"].ToString()) || string.IsNullOrWhiteSpace(Session["saleGubun"].ToString()))
                {
                    Response.RedirectForReferer();
                    Response.End();
                }

            }
            */

            SetAgreement(ApplicationContext.G().REFERER_SITE);

            if (Request.IsMobileDevice())
            {
                ltShinhanImg.Text = "<img src=\"../Resources/member/shinhan_mo.jpg\" style=\"width:100%;\"/>";
            }
            else
            {
                ltShinhanImg.Text = "<img src=\"../Resources/member/shinhan_p_bhands.jpg\" style=\"width:100%;\"/>";
            }
        }

        private Boolean firstPageLoad()
        {

			sCertID = Request.Value("certID");
			if (string.IsNullOrEmpty(sCertID))
			{
                return false;
			}

			var dbResult = UserCertificationLogUtility.GetUserCertificationLog(sCertID);
			if (dbResult == null)
			{
                return false;
			}


			sAuthModuleType = dbResult.CertType;
            sDupInfo = dbResult.DupInfo;         

			NiceCPCResponseData certData = null;
			NiceIPINResponseData certIPinData = null;
			var decJsonData = AesUtility.Decrypt(dbResult.CertData);
			if (sAuthModuleType.ToUpper() == "CPCLIENT")
			{
				certData = Newtonsoft.Json.JsonConvert.DeserializeObject<NiceCPCResponseData>(decJsonData);
				sDupInfo = certData.di;
				sConnInfo = certData.ci;
                sAuthType = certData.authtype;

			}
			else if (sAuthModuleType.ToUpper() == "IPIN")
			{
				certIPinData = Newtonsoft.Json.JsonConvert.DeserializeObject<NiceIPINResponseData>(decJsonData);
				sDupInfo = certIPinData.dupinfo;
				sConnInfo = certIPinData.coinfo1;
                sAuthType = "I";
			}
            else 
            { 
                return false; 
            }

			checkProcess = true;

			//이미기존에 등록된 아이디가 있을경우.
			sSelectSiteCode = Request.Value("rdoSelectSiteCode");
            sSelectCustomUserId = Request.Value("SelectCustomUserId");

            hidCertID.Value = sCertID;
            hidAuthModuleType.Value = sAuthModuleType;
            hidDupInfo.Value = sDupInfo;
            hidAuthType.Value = sAuthType;
            hidSelectSiteCode.Value = sSelectSiteCode;

            UserCertificationInfo userCertificationInfo = new UserCertificationInfo();
            Member.SignInForCertification.FamilySiteInformation familySiteInformation = GetFamilySiteInformation(CookieUtility.GetCookieValue("REFERER_SITE"));

            hidRefererSite.Value = familySiteInformation.SiteName;

            if (String.IsNullOrEmpty(sSelectSiteCode))
            {
                hidSelectSiteCode.Value = familySiteInformation.SiteCode;
                sSelectSiteCode = familySiteInformation.SiteCode;
            }

            if (checkProcess)
            {
                if (sAuthModuleType.ToUpper() == "IPIN" || sAuthModuleType.ToUpper() == "CPCLIENT")
                {
                    if (sAuthModuleType.ToUpper() == "IPIN")
                    {
                        userCertificationInfo.update(certIPinData);
                    }
                    else
                    {
                        userCertificationInfo.update(certData);

					}
                    InitNewMember(userCertificationInfo);
                }
                else
                {
                    //txtID.Disabled = true;
                    SelectUserInfoIntergrationProcesor processor = new SelectUserInfoIntergrationProcesor();
                    processor.execute("", "", sDupInfo);
                    SelectUserInfoResult result = processor.getResult();
                    InitExistingMember(result, sSelectSiteCode);
                }
            }


            return true;
        }

        public void SetAgreement(String sRefererSite)
        {
            SelectUserInfoIntergrationProcesor processor = new SelectUserInfoIntergrationProcesor();
            processor.execute("", "", sDupInfo);
            SelectUserInfoResult result = processor.getResult();

            bool isVisibleAddTermsAgreement = true;

            if (sRefererSite.ToUpper().Contains("SHINHAN"))
            {
                isVisibleAddTermsAgreement = false;
            }

            /* 기존 회원 가입 */
            if (result.getRowCount() > 0)
            {
                isVisibleAddTermsAgreement = false;
            }


            wrapThirdPartyAgreement.Visible = isVisibleAddTermsAgreement;
            wrapThirdPartyAgreementTelecom.Visible = isVisibleAddTermsAgreement;
            wrapSamsungAgreement.Visible = isVisibleAddTermsAgreement;
            wrapLGAgreement.Visible = isVisibleAddTermsAgreement; // 엘지전자 동의
            //wrapCuckooAgreement.Visible = isVisibleAddTermsAgreement;   //쿠쿠

        }

        public static Member.SignInForCertification.FamilySiteInformation GetFamilySiteInformation(string sRefererSite)
        {
            Member.SignInForCertification.FamilySiteInformation result = new SignInForCertification.FamilySiteInformation();
            Member.SignInForCertification.FamilySiteInformationList familySiteInformationList = new Member.SignInForCertification.FamilySiteInformationList();
            int index = familySiteInformationList.FindFamilySiteFromDomainShortName(sRefererSite, 0);
            result = familySiteInformationList.familySiteInformationList[index];
            return result;
        }

        public void InitDeviceBranchProcessing()
        {
            if (Request.IsMobileDevice() )
            {
                ((HtmlGenericControl)Master.FindControl("MasterBody")).Attributes["class"] = "form_p";
                dlName.Attributes["class"] = "space name";
                dlBirthDate.Attributes["class"] = "space birth";
                dlUserId.Attributes["class"] = "space id";
                dlPassword.Attributes["class"] = "space pw";
                dlPasswordConfirm.Attributes["class"] = "space2 pw2";
                dlAddress.Attributes["class"] = "space addr";
                dlPhone.Attributes["class"] = "space phone";
                dlHphone.Attributes["class"] = "space cphone";
                dlEmail.Attributes["class"] = "space email";
                dlWeddingDayField.Attributes["class"] = "space cerem";
                ltrHphoneNbspField.Text = "";

                //txtAddress.Style["width"] = "340px";
                //txtAddressDetail.Style["width"] = "340px";
            }
            else
            {
                ((HtmlGenericControl)Master.FindControl("MasterBody")).Attributes["class"] = "";
                dlName.Attributes["class"] = "space";
                dlBirthDate.Attributes["class"] = "space";
                dlUserId.Attributes["class"] = "space";
                dlPassword.Attributes["class"] = "space";
                dlPasswordConfirm.Attributes["class"] = "space2";
                dlAddress.Attributes["class"] = "space";
                dlPhone.Attributes["class"] = "space";
                dlHphone.Attributes["class"] = "space";
                dlEmail.Attributes["class"] = "space";
                dlWeddingDayField.Attributes["class"] = "space";
                ltrHphoneNbspField.Text = "&nbsp;&nbsp;";

                //txtAddress.Style["width"] = "700px";
                //txtAddressDetail.Style["width"] = "700px";
            }
        }

        public void InitNewMember(UserCertificationInfo pUserInfo)
        {
            txtUserName.Value = pUserInfo.NAME;
            // ltrUserName.Text = pUserInfo.NAME;
            hidConnInfo.Value = pUserInfo.CONN_INFO;
            hidAuthType.Value = pUserInfo.AUTH_INFO;
            selBirthDateForYear.Value = pUserInfo.BIRTH_DATE.Substring(0, 4);
            selBirthDateForMonth.Value = pUserInfo.BIRTH_DATE.Substring(4, 2);
            selBirthDateForDay.Value = pUserInfo.BIRTH_DATE.Substring(6, 2);
            hidGender.Value = pUserInfo.GENDER_CODE;
            hidNationalInfo.Value = pUserInfo.NATIONAL_INFO;
            hidBirthDate.Value = pUserInfo.BIRTH_DATE;

            if (pUserInfo.MOBILE_NO.Length == 10)
            {

                txtHPhone1.Value = pUserInfo.MOBILE_NO.Substring(0, 3);
                txtHPhone2.Value = pUserInfo.MOBILE_NO.Substring(3, 3);
                txtHPhone3.Value = pUserInfo.MOBILE_NO.Substring(6, 4);

            }
            else
            {
                txtHPhone1.Value = pUserInfo.MOBILE_NO.Substring(0, 3);
                txtHPhone2.Value = pUserInfo.MOBILE_NO.Substring(3, 4);
                txtHPhone3.Value = pUserInfo.MOBILE_NO.Substring(7, 4);

            }
            rdoSolar.Checked = true;
        }

        public void InitExistingMember(SelectUserInfoResult pUserInfom, string pSelectSiteCode)
        {
            SelectUserInfoRow row = FindSelectUserInfoRowForSelectSite(pUserInfom, pSelectSiteCode);
            Dictionary<String, String> extractPhone = StringExtractUtillity.extractShopPhone(row.PHONE);
            Dictionary<String, String> extractCellPhone = StringExtractUtillity.extractShopPhone(row.CELLPHONE);
            Dictionary<String, String> extractBirthDate = StringExtractUtillity.extractShopPhone(row.BIRTH_DATE);

            txtUserName.Value = row.USER_NAME;
            // ltrUserName.Text = row.USER_NAME;

            txtID.Value = row.USER_ID;
            txtID.Style.Add("display", "none");
            ltrID.Text = row.USER_ID;

            if (String.IsNullOrEmpty(sSelectCustomUserId) == false)
            {
                txtID.Value = sSelectCustomUserId;
                ltrID.Text = sSelectCustomUserId;
            }

            selBirthDateForYear.Value = extractBirthDate["head"];
            selBirthDateForMonth.Value = extractBirthDate["middle"];
            selBirthDateForDay.Value = extractBirthDate["foot"];

            rdoSolar.Checked = row.BIRTH_DATE_TYPE == "S" ? true : (row.BIRTH_DATE_TYPE == "L") ? false : true;
            rdoLunar.Checked = row.BIRTH_DATE_TYPE == "L";

            if (row.ZIPCODE.Length == 5 && row.ZIPCODE.All(Char.IsDigit))
            {
                txtZipCode1.Value = row.ZIPCODE.Substring(0, 1);
                txtZipCode2.Value = row.ZIPCODE.Substring(1, 1);
                txtZipCode3.Value = row.ZIPCODE.Substring(2, 1);
                txtZipCode4.Value = row.ZIPCODE.Substring(3, 1);
                txtZipCode5.Value = row.ZIPCODE.Substring(4, 1);
            }
            else
            {
                txtZipCode1.Value = "";
                txtZipCode2.Value = "";
                txtZipCode3.Value = "";
                txtZipCode4.Value = "";
                txtZipCode5.Value = "";
            }
            txtAddress.Value = row.ADDRESS;
            txtAddressDetail.Value = row.ADDRESS_DETAIL;

            txtPhone1.Value = extractPhone["head"];
            txtPhone2.Value = extractPhone["middle"];
            txtPhone3.Value = extractPhone["foot"];

            txtHPhone1.Value = extractCellPhone["head"];
            txtHPhone2.Value = extractCellPhone["middle"];
            txtHPhone3.Value = extractCellPhone["foot"];

            txtWeddingDay.Value = row.WEDDING_DAY;
            txtWeddName.Value = row.WEDD_NAME;

            txtEMailHeader.Value = row.USER_EMAIL.Split('@')[0];
            txtEMailFooter.Value = row.USER_EMAIL.Split('@')[1];
            chkSMSYorN.Checked = row.ALLOWSMS;
            chkMailServiceYorN.Checked = row.ALLOWMAILING;
            selEMailFooter.Value = row.USER_EMAIL.Split('@')[row.USER_EMAIL.Split('@').Length - 1];

            txtEMailFooter.Attributes.Remove("readonly");
            if (selEMailFooter.Value != "")
                txtEMailFooter.Attributes.Add("readonly", "readonly");

            txtWeddingDay.Value = row.WEDDING_DAY;

            switch (row.WEDDING_HALL)
            {
                case "W":
                    rdoWeddingHall_W.Checked = true;
                    break;
                case "H":
                    rdoWeddingHall_H.Checked = true;
                    break;
                case "C":
                    rdoWeddingHall_C.Checked = true;
                    break;
                case "M":
                    rdoWeddingHall_M.Checked = true;
                    break;
                case "E":
                    rdoWeddingHall_E.Checked = true;
                    break;
            }

        }

        public SelectUserInfoRow FindSelectUserInfoRowForSelectSite(SelectUserInfoResult pUserInfo, string pSelectSiteCode)
        {
            int idxUserInfo = 0;
            foreach (SelectUserInfoRow row in pUserInfo.getRow())
            {
                if (String.IsNullOrEmpty(pSelectSiteCode) == false && pSelectSiteCode == row.SITE_CODE)
                {
                    idxUserInfo = pUserInfo.getRow().IndexOf(row);
                    break;
                }
            }
            return pUserInfo.getRow()[idxUserInfo];
        }

  
        protected void btnSave_Click(object sender, EventArgs e)
        {
            LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "Customer Information - Save Click", "시작");

            int registrationNumber = 0;
            string sSelectSiteCode = hidSelectSiteCode.Value;
            SelectUserInfoRow userInfo = new SelectUserInfoRow();

            if (hidAuthModuleType.Value == "")
            {
                try
                {
                    SelectUserInfoIntergrationProcesor selectProcessor = new SelectUserInfoIntergrationProcesor();
                    selectProcessor.execute("", "", hidDupInfo.Value);
                    SelectUserInfoResult selectResult = selectProcessor.getResult();
                    userInfo = FindSelectUserInfoRowForSelectSite(selectResult, sSelectSiteCode);
                    registrationNumber = selectResult.getRowCount();
                }

                catch (Exception ex)
                {
                    LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "Customer Information - Save Click", "SelectUserInfoIntergrationProcesor Error " + ex.ToString());
                }
            }
            else
            {
                userInfo.AUTH_CODE = hidDupInfo.Value;
                userInfo.AUTH_VNO = hidConnInfo.Value;
                userInfo.AUTH_TYPE = hidAuthType.Value;
            }

            LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "Customer Information - Save Click", "기존회원(dupinfo가 있는 회원) 일 경우 회원 정보를 다시 가져옴 - 끝");

            //입력받은 데이터 정보 Set
            userInfo.USER_NAME = txtUserName.Value;
            userInfo.USER_ID = txtID.Value.Trim();
            userInfo.ZIPCODE = txtZipCode1.Value + txtZipCode2.Value + txtZipCode3.Value + txtZipCode4.Value + txtZipCode5.Value;
            userInfo.ADDRESS = txtAddress.Value;
            userInfo.ADDRESS_DETAIL = txtAddressDetail.Value;
            userInfo.ALLOWSMS = chkSMSYorN.Checked;
            userInfo.ALLOWMAILING = chkMailServiceYorN.Checked;
            userInfo.PHONE = txtPhone1.Value + "-" + txtPhone2.Value + "-" + txtPhone3.Value;
            userInfo.CELLPHONE = txtHPhone1.Value + "-" + txtHPhone2.Value + "-" + txtHPhone3.Value;
            userInfo.USER_EMAIL = txtEMailHeader.Value + "@" + txtEMailFooter.Value;

            userInfo.GENDER = hidGender.Value;
            userInfo.ORI_BIRTH_DATE = hidBirthDate.Value;
            userInfo.NATIONAL_INFO = hidNationalInfo.Value;           
            userInfo.AUTH_MODULE_TYPE = hidAuthModuleType.Value;

            IntergrationUserData userData = new IntergrationUserData();
            userData.init(userInfo);
            userData.NEWPASSWORD = txtPassword.Value;
            userData.PASSWORD = txtPassword.Value;
            userData.AUTHTYPE = userInfo.AUTH_TYPE;
            userData.BIRTH_DATE = selBirthDateForYear.Value + "-" + selBirthDateForMonth.Value + "-" + selBirthDateForDay.Value;
            userData.BIRTH_DATE_TYPE = rdoSolar.Checked ? "S" : "L";
            userData.WEDDING_DAY = txtWeddingDay.Value;
            userData.WEDD_NAME = txtWeddName.Value;


            string sWeddingHall = String.Empty;
            if (rdoWeddingHall_W.Checked) sWeddingHall = rdoWeddingHall_W.Value;
            if (rdoWeddingHall_H.Checked) sWeddingHall = rdoWeddingHall_H.Value;
            if (rdoWeddingHall_C.Checked) sWeddingHall = rdoWeddingHall_C.Value;
            if (rdoWeddingHall_M.Checked) sWeddingHall = rdoWeddingHall_M.Value;
            if (rdoWeddingHall_E.Checked) sWeddingHall = rdoWeddingHall_E.Value;
            userData.WEDDING_HALL = sWeddingHall;

            LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "Customer Information - Save Click", "정보셋팅 - 끝");
            LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "Customer Information - Save Click", "WEDDING_DAY : " + userData.WEDDING_DAY + ", WEDDING_HALL : " + sWeddingHall + ", dlWeddingDayField.Visible : " + (dlWeddingDayField.Visible ? "Y" : "N") + ", USER_AGENT : " + Request.UserAgent);
            LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "Customer Information - Address Info", "ZIP_CODE: " + userInfo.ZIPCODE + ", ADDRESS: " + userInfo.ADDRESS + ", ADDRESS_DETAIL: " + userInfo.ADDRESS_DETAIL);

            //예식일,예식장은 중요한 필수값이기 때문에 한번더체크
            bool IsWeddingDataConfirm = true;
            if (String.IsNullOrEmpty(txtWeddingDay.Value) || txtWeddingDay.Value.Replace(" ", "") == "")
            {
                LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "Customer Information - Save Click", "예식일 입력 안함");
                ClientScriptUtility.ClientScriptAlert(Page, "예식일을 입력해 주세요");
                IsWeddingDataConfirm = false;
            }

            if (sWeddingHall == "")
            {
                LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "Customer Information - Save Click", "예식장 입력 안함");
                ClientScriptUtility.ClientScriptAlert(Page, "예식장을 선택해 주세요");
                IsWeddingDataConfirm = false;
            }


            if (IsWeddingDataConfirm)
            {
                bool isSuccess = true;
                if (hidAuthModuleType.Value == "")
                {
                    //회원정보 수정로직
                    try
                    {
                        UpdateUserInfoIntergrationProcessor updateProcessor = new UpdateUserInfoIntergrationProcessor();
                        updateProcessor.execute(userData);
                        UpdateUserInfoResult updateResult = updateProcessor.getResult();
                        isSuccess = updateResult.Success;
                    }
                    catch (Exception ex)
                    {
                        LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "Customer Information - Save Click", "UpdateUserInfoIntergrationProcessor Error " + ex.ToString());
                    }
                }

                // 신규 회원일 경우
                if (registrationNumber == 0)
                {
                    userData.CHOICE_AGREEMENT_FOR_THIRDPARTY = chkChoiceAgreementForThirdParty.Checked;
                    userData.CHOICE_AGREEMENT_FOR_SAMSUNG_MEMBERSHIP = chkChoiceAgreementForSamSungMembership.Checked;
                    userData.CHOICE_AGREEMENT_FOR_SAMSUNG_CHOICE_PERSONAL_DATA = chkChoiceAgreementForSamSungChoicePersonalData.Checked;
                    userData.CHOICE_AGREEMENT_FOR_SAMSUNG_THIRDPARTY = chkChoiceAgreementForSamSungThirdParty.Checked;

                    // 엘지데이터
                    userData.CHOICE_AGREEMENT_FOR_LG_MEMBERSHIP = chkChoiceAgreementForLGMembership.Checked;
                    userData.CHOICE_AGREEMENT_FOR_LG_CHOICE_PERSONAL_DATA = chkChoiceAgreementForLGChoicePersonalData.Checked;

                    //쿠쿠데이터
                    //userData.CHOICE_AGREEMENT_FOR_CUCKOO_MEMBERSHIP = chkChoiceAgreementForCuckooMembership.Checked;
                    userData.CHOICE_AGREEMENT_FOR_CUCKOO_MEMBERSHIP = false;

                    //까사미아
                    userData.CHOICE_AGREEMENT_FOR_CASAMIA_MEMBERSHIP = chkChoiceAgreementForCasamiaMembership.Checked;

                    //롯데묘미 추가
                    userData.CHOICE_AGREEMENT_FOR_MYOMEE_MEMBERSHIP = false;

                    // 일룸 추가
                    userData.CHOICE_AGREEMENT_FOR_ILOOM_MEMBERSHIP = false;
                    userData.CHOICE_AGREEMENT_FOR_ILOOM_CHOICE_PERSONAL_DATA = false;
                    userData.CHOICE_AGREEMENT_FOR_ILOOM_THIRDPARTY = false;
                }

                LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "Customer Information - Save Click", "기존회원(dupinfo가 있는 회원) 일 경우 회원정보 업데이트 - 끝");

                if (isSuccess)
                {
                    //회원정보 생성로직
                    try
                    {
                        InsertUserInfoIntergrationProcessor insertProcessor = new InsertUserInfoIntergrationProcessor();
                        insertProcessor.execute(userData);
                        InsertUserInfoResult InserResult = insertProcessor.getResult();
                        isSuccess = InserResult.Success;
                    }
                    catch (Exception ex)
                    {
                        LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "Customer Information - Save Click", "InsertUserInfoIntergrationProcessor Error " + ex.ToString());
                    }

                    LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "Customer Information - Save Click", "회원 인서트 - 끝");

                    if (isSuccess)
                    {
                        ExecuteIntergrationResult result = new ExecuteIntergrationResult();
                        try
                        {
                            ExecuteIntergrationProcessor processor = new ExecuteIntergrationProcessor();
                            processor.execute(hidDupInfo.Value, txtID.Value, txtPassword.Value, hidRefererSite.Value, hidSelectSiteCode.Value, txtID.Value);
                            result = processor.getResult();

                            ThirdPartyMarketingAgreementProcessor thirdPartyMarketingAgreementProcessor = new ThirdPartyMarketingAgreementProcessor();

                            try
                            {
                                // 제 3자 동의 
                                string sMarketingTypeCode = "";

                                // 통신
                                if (chkChoiceAgreementForThirdPartyTelecom.Checked && String.IsNullOrEmpty(chkChoiceAgreementForThirdPartyTelecom.Value) == false)
                                {
                                    sMarketingTypeCode = chkChoiceAgreementForThirdPartyTelecom.Value;
                                }

                                // 신한 -> 금융으로 변경 (2021년 빼빼로데이)
                                if (chkChoiceAgreementForThirdPartyShinhan.Checked && String.IsNullOrEmpty(chkChoiceAgreementForThirdPartyShinhan.Value) == false)
                                {
                                    sMarketingTypeCode = sMarketingTypeCode + (String.IsNullOrEmpty(sMarketingTypeCode) ? "" : ",");
                                    sMarketingTypeCode = sMarketingTypeCode + chkChoiceAgreementForThirdPartyShinhan.Value;
                                }

                                if (String.IsNullOrEmpty(sMarketingTypeCode) == false)
                                {
                                    thirdPartyMarketingAgreementProcessor.InsertThirdPartyMarketingAgreement(txtID.Value, sMarketingTypeCode);
                                }

                                // 마케팅 동의 이력 남기기 추가.
                                string agreementData = "";

                                /*
                                if (agreementData.Length > 0) agreementData += "|";
                                agreementData = "119mem:";
                                agreementData += chkChoiceAgreementForThirdParty.Checked ? "Y" : "N";

                                if (agreementData.Length > 0) agreementData += "|";
                                agreementData += "119sam:";
                                agreementData += chkChoiceAgreementForSamSungChoicePersonalData.Checked ? "Y" : "N";

                                if (agreementData.Length > 0) agreementData += "|";
                                agreementData += "119lg:";
                                agreementData += chkChoiceAgreementForLGChoicePersonalData.Checked ? "Y" : "N"; // 엘지 
                                */

                                /*
                                if (agreementData.Length > 0) agreementData += "|";
                                agreementData += "119cuc:";
                                agreementData += chkChoiceAgreementForCuckooMembership.Checked ? "Y" : "N"; //쿠쿠
                                */

                                if (agreementData.Length > 0) agreementData += "|";
                                agreementData += "119001:";
                                agreementData += chkChoiceAgreementForThirdPartyTelecom.Checked ? "Y" : "N";


                                if (agreementData.Length > 0) agreementData += "|";
                                agreementData += "119006:";
                                agreementData += chkChoiceAgreementForThirdPartyShinhan.Checked ? "Y" : "N";

                                thirdPartyMarketingAgreementProcessor.InsertMarketingAgreementLog(userInfo.USER_ID, agreementData);
                            }
                            catch
                            { }

                            try
                            {
                                string deviceType = HttpContext.Current.Request.IsMobileDevice() ? "MOBILE" : "PC";
                                string userAgent = HttpContext.Current.Request.UserAgent;

                                InflowRouteProcessor InflowRouteProcessor = new InflowRouteProcessor();
                                InflowRouteProcessor.InsertInflowRoute(hidDupInfo.Value, deviceType, userAgent);

                            }
                            catch
                            { }


                            if (registrationNumber == 0)
                            {
                                sUrlReferer = ApplicationContext.G().REFERER_SITE;
                                string sCompanySeq = ApplicationContext.G().IS_REFERER_COMPANYSEQ(sUrlReferer);

                                LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "신규 가입자 이벤트 sCompanySeq --> " + sCompanySeq, "신규회원 가입자 이벤트 실행 완료");

                                // 삼성 마케팅 동의한 경우 쿠폰 지급
                                if (chkChoiceAgreementForSamSungMembership.Checked)
                                {
                                    InMemRegistSamsungCouponProcessor InMemRegistSamsungCouponProcessor = new InMemRegistSamsungCouponProcessor();
                                    InMemRegistSamsungCouponProcessor.InsertCouponIssueForSamsung(sCompanySeq, txtID.Value.Trim());
                                }

                                //쿠폰 발급, 발급프로시져에서 처리 하고, 동의 여부 상관 없이 호출. 
                                var inMemRegistGiftProcessor = new InMemRegistGiftProcessor();
                                inMemRegistGiftProcessor.InsertMemRegistGift(sCompanySeq, txtID.Value.Trim(), "0");

                                LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "신규 가입자 이벤트 실행 완료!!", "신규회원 가입자 이벤트 실행 완료");
                            }

                        }
                        catch (Exception ex)
                        {
                            LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "Customer Information - Save Click", "ExecuteIntergrationProcessor Error " + ex.ToString());
                        }


                        LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "Customer Information - Save Click", "통합회원 전환 - 끝");



                        if (result.Success)
                        {
                            if (CookieUtility.GetCookieValue("REFERER_SITE").Contains("bhandscard"))
                            {
                                //--인증정보 삭제
								//UserCertificationLogUtility.DeleteUserCertificationLog(hidCertID.Value);
								Response.Redirect("/Member/BhandsForRegistrationComplete.aspx?USER_ID=" + txtID.Value);
                            }
                            else if (CookieUtility.GetCookieValue("REFERER_SITE").Contains("thecard"))
                            {
								//--인증정보 삭제
								//UserCertificationLogUtility.DeleteUserCertificationLog(hidCertID.Value);
								Response.Redirect("/Member/ThecardForRegistrationComplete.aspx?USER_ID=" + txtID.Value);
                            }
                            else if (CookieUtility.GetCookieValue("REFERER_SITE").Contains("premierpaper"))
                            {
								//--인증정보 삭제
								//UserCertificationLogUtility.DeleteUserCertificationLog(hidCertID.Value);
								Response.Redirect("/Member/PremierForRegistrationComplete.aspx?USER_ID=" + txtID.Value);
                            }
                            else
                            {   
                                Response.Redirect("/Member/BarunsonForRegistrationComplete.aspx?USER_ID=" + txtID.Value + "&CERT_ID=" + hidCertID.Value);
                            }
                        }
                        else
                        {
                            LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "Customer Information - Save Click", "통합회원 전환 - 실패");
                            ClientScriptUtility.ClientScriptAlert(Page, "오류가 발생 하였습니다. 다시 시도해 주십시오");
                        }
                    }
                    else
                    {
                        LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "Customer Information - Save Click", "회원 인서트 - 실패");
                        ClientScriptUtility.ClientScriptAlert(Page, "통합 회원 가입도중 오류가 발생 하였습니다. 다시 시도해 주십시오");
                    }
                }
                else
                {
                    LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "Customer Information - Save Click", "기존회원(dupinfo가 있는 회원) 일 경우 회원정보 업데이트 - 실패");
                    ClientScriptUtility.ClientScriptAlert(Page, "회원 정보 업데이트중 오류가 발생 하였습니다. 다시 시도해 주십시오.");
                }
            }
        }



        public class ThirdPartyMarketingAgreementProcessor : AbstractIntergrationProcessor
        {
            public void InsertThirdPartyMarketingAgreement(String pID, String pMarketingTypeCode)
            {
                initConnector();
                beginTrans();
                try
                {
                    m_shopConnector.Execute(ShopDatabaseFactory.InsertS2UserInfoThirdPartyMarketingAgreement(pID, pMarketingTypeCode));
                    commit();
                }
                catch (Exception ex)
                {
                    Console.Write(ex);
                    rollBack();
                }

                closeConnector();
            }

            public void InsertMarketingAgreementLog(String uid, String agreementData)
            {
                initConnector();
                beginTrans();
                try
                {
                    m_shopConnector.Execute(ShopDatabaseFactory.InsertMarketingAgreementLog(uid, agreementData));
                    commit();
                }
                catch (Exception ex)
                {
                    Console.Write(ex);
                    rollBack();
                }

                closeConnector();
            }

        }

        public class InflowRouteProcessor : AbstractIntergrationProcessor
        {
            public void InsertInflowRoute(String pDupInfo, String pDeviceType, String pUserAgent)
            {
                initConnector();
                beginTrans();
                try
                {
                    m_shopConnector.Execute(ShopDatabaseFactory.InsertInflowRoute(pDupInfo, pDeviceType, pUserAgent));
                    commit();
                }
                catch (Exception ex)
                {
                    Console.Write(ex);
                    rollBack();
                }

                closeConnector();
            }

        }
        //InsertCouponIssueForSamsung
        public class InMemRegistSamsungCouponProcessor : AbstractIntergrationProcessor
        {
            public void InsertCouponIssueForSamsung(string companySeq, string userId)
            {
                initConnector();
                //beginTrans();
                try
                {
                    m_shopConnector.Execute(ShopDatabaseFactory.InsertCouponIssueForSamsung(companySeq, userId));
                    //commit();
                }
                catch (Exception ex)
                {
                    Console.Write(ex);
                    //rollBack();
                }

                closeConnector();
            }

        }
    }
}