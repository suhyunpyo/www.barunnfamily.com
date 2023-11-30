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

namespace BarunnIntergrationService.Member
{
    public partial class SignInForEnterCustomerInformation : System.Web.UI.Page
    {
        string sCertID;        
        string sDupInfo;        
        string sChkChoiceAgreementForThirdParty;
        string sChkChoiceAgreementForThirdPartyTelecom;
        string schkChoiceAgreementForThirdPartyTelecomALL;
        string schkChoiceAgreementForThirdPartyShinhan;
        string sChkChoiceAgreementForThirdPartyInsurance1;
        //string sChkChoiceAgreementForThirdPartyInsurance2;
        string sChkChoiceAgreementForThirdPartyHealth;
        string sChkChoiceAgreementForThirdPartyDrink;
        string sChkChoiceAgreementForSamSungMembership;
        string sChkChoiceAgreementForSamSungChoicePersonalData;
        string sChkChoiceAgreementForSamSungThirdParty;
        string sChkChoiceAgreementForSamSungYearData;
        string sChkChoiceAgreementForMyomeeMembership;
        string sChkChoiceAgreementForCasamiaMembership;
        string sChkChoiceAgreementForKtMembership;

        string sChkChoiceAgreementForLGMembership;
        string sChkChoiceAgreementForLGChoicePersonalData;

        string sSelectSiteCode;
        string sSelectCustomUserId;

        string DomainSite = "";
        string sUrlReferer = "";

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


        private void SetCookie()
        {
            HttpContextUtility.SetNoCache();
            sUrlReferer = ApplicationContext.G().REFERER_SITE;
            CookieUtility.SetCookie("REFERER_SITE", sUrlReferer);
            DomainSite = ApplicationContext.G().REFERER_SITE_DOMAIN(sUrlReferer);

        }

        protected void Page_Load(object sender, EventArgs e)
        {
			string decJsonData = string.Empty;

			SetCookie();

            InitDeviceBranchProcessing();

            if (DomainSite == null || sUrlReferer == null )
            {
                Response.Redirect("~/Member/SignInForCertification.aspx");
                Response.End();
            }


            if (IsPostBack == false)
            {

                sChkChoiceAgreementForThirdParty = Request.Value("chkChoiceAgreementForThirdParty");

                sChkChoiceAgreementForThirdPartyTelecom = Request.Value("chkChoiceAgreementForThirdPartyTelecom");
                sChkChoiceAgreementForThirdPartyInsurance1 = Request.Value("chkChoiceAgreementForThirdPartyInsurance1");
                sChkChoiceAgreementForThirdPartyHealth = Request.Value("chkChoiceAgreementForThirdPartyHealth");
                sChkChoiceAgreementForThirdPartyDrink = Request.Value("chkChoiceAgreementForThirdPartyDrink");

                schkChoiceAgreementForThirdPartyTelecomALL = Request.Value("chkChoiceAgreementForThirdPartyTelecomALL");
                schkChoiceAgreementForThirdPartyShinhan = Request.Value("chkChoiceAgreementForThirdPartyShinhan");
                // Telecom : 119001 또는 Insurance1 : 119002 둘중에 하나만 체크 되면 제3자 마케팅 동의 Y
                // Request.Value("chkChoiceAgreementForThirdParty") 사용 안함
                //sChkChoiceAgreementForThirdParty = (String.IsNullOrEmpty(sChkChoiceAgreementForThirdPartyTelecom) == false || String.IsNullOrEmpty(sChkChoiceAgreementForThirdPartyInsurance1) == false || String.IsNullOrEmpty(sChkChoiceAgreementForThirdPartyDrink) == false || String.IsNullOrEmpty(sChkChoiceAgreementForThirdPartyHealth) == false) ? "Y" : "N";
                schkChoiceAgreementForThirdPartyTelecomALL = (String.IsNullOrEmpty(sChkChoiceAgreementForThirdPartyTelecom) == false || String.IsNullOrEmpty(schkChoiceAgreementForThirdPartyShinhan) == false || String.IsNullOrEmpty(sChkChoiceAgreementForThirdPartyDrink) == false || String.IsNullOrEmpty(sChkChoiceAgreementForThirdParty) == false) ? "Y" : "N";

                sChkChoiceAgreementForSamSungMembership = Request.Value("chkChoiceAgreementForSamSungMembership");
                sChkChoiceAgreementForSamSungChoicePersonalData = Request.Value("chkChoiceAgreementForSamSungChoicePersonalData");
                sChkChoiceAgreementForSamSungThirdParty = Request.Value("chkChoiceAgreementForSamSungThirdParty");
                sChkChoiceAgreementForSamSungYearData = Request.Value("chkChoiceAgreementForSamSungChoiceYearlData");
                sChkChoiceAgreementForMyomeeMembership = Request.Value("chkChoiceAgreementForMyomeeMembership");
                sChkChoiceAgreementForCasamiaMembership = Request.Value("chkChoiceAgreementForCasamiaMembershipALL");
                sChkChoiceAgreementForKtMembership = Request.Value("chkChoiceAgreementForKtMembership");

                sChkChoiceAgreementForLGMembership = Request.Value("chkChoiceAgreementForLGMembership");
                sChkChoiceAgreementForLGChoicePersonalData = Request.Value("chkChoiceAgreementForLGChoicePersonalData");

                sSelectSiteCode = Request.Value("rdoSelectSiteCode");
                sSelectCustomUserId = Request.Value("SelectCustomUserId");

                sDupInfo = Server.UrlDecode(Request.Value("DupInfo"));
                sCertID = Request.Value("CertID");

                if (string.IsNullOrEmpty(sCertID) && string.IsNullOrEmpty(sDupInfo))
                {
                    Response.RedirectForReferer();
                    Response.End(); ;
                }

                UserCertificationLog dbResult = null;
				NiceCPCResponseData certData = null;
				NiceIPINResponseData certIPinData = null;

				if (!string.IsNullOrEmpty(sCertID))
                { 
                    dbResult = UserCertificationLogUtility.GetUserCertificationLog(sCertID);
                    if (dbResult == null)
                    {
                        Response.RedirectForReferer();
                        Response.End();
                    }

                    sDupInfo = dbResult.DupInfo;                    

					if (dbResult.CertType.ToUpper() == "CPCLIENT")
					{
						decJsonData = AesUtility.Decrypt(dbResult.CertData);
						certData = Newtonsoft.Json.JsonConvert.DeserializeObject<NiceCPCResponseData>(decJsonData);
						hidAuthType.Value = certData.authtype;
						hidAuthModuleType.Value = dbResult.CertType;
					}
					else if (dbResult.CertType.ToUpper() == "IPIN")
					{
						decJsonData = AesUtility.Decrypt(dbResult.CertData);
						certIPinData = Newtonsoft.Json.JsonConvert.DeserializeObject<NiceIPINResponseData>(decJsonData);
						hidAuthModuleType.Value = dbResult.CertType;
						hidAuthType.Value = "I";
					}
					else
					{
						hidAuthType.Value = "";
						hidAuthModuleType.Value = "";
					}
				}
                else
                {
                    hidAuthType.Value = "";
					hidAuthModuleType.Value = "";
				}

				hidCertID.Value = sCertID;
                
                hidDupInfo.Value = sDupInfo;                
                hidChkChoiceAgreementForThirdParty.Value = sChkChoiceAgreementForThirdParty;

                hidChkChoiceAgreementForThirdPartyTelecom.Value = sChkChoiceAgreementForThirdPartyTelecom;
                hidChkChoiceAgreementForThirdPartyInsurance1.Value = sChkChoiceAgreementForThirdPartyInsurance1;
                hidChkChoiceAgreementForThirdPartyHealth.Value = sChkChoiceAgreementForThirdPartyHealth;
                hidChkChoiceAgreementForThirdPartyTelecomALL.Value = schkChoiceAgreementForThirdPartyTelecomALL;
                hidChkChoiceAgreementForThirdPartyShinhan.Value = schkChoiceAgreementForThirdPartyShinhan;

                //hidChkChoiceAgreementForThirdPartyDrink.Value = sChkChoiceAgreementForThirdPartyDrink;


                hidChkChoiceAgreementForSamSungMembership.Value = sChkChoiceAgreementForSamSungMembership;
                hidChkChoiceAgreementForSamSungChoicePersonalData.Value = sChkChoiceAgreementForSamSungChoicePersonalData;
                hidChkChoiceAgreementForSamSungThirdParty.Value = sChkChoiceAgreementForSamSungThirdParty;
                hidChkChoiceAgreementForSamSungChoiceYearlData.Value = sChkChoiceAgreementForSamSungYearData;

                //LG 추가
                hidChkChoiceAgreementForLGMembership.Value = sChkChoiceAgreementForLGMembership;
                hidChkChoiceAgreementForLGChoicePersonalData.Value = sChkChoiceAgreementForLGChoicePersonalData;

                //롯데묘미 추가
                hidChkChoiceAgreementForMyomeeMembership.Value = sChkChoiceAgreementForMyomeeMembership;

                //까사미아 추가
                hidChkChoiceAgreementForCasamiaMembershipALL.Value = sChkChoiceAgreementForCasamiaMembership;

                //KT
                hidChkChoiceAgreementForKtMembership.Value = sChkChoiceAgreementForKtMembership;


                hidSelectSiteCode.Value = sSelectSiteCode;

                UserCertificationInfo userCertificationInfo = new UserCertificationInfo();

                //string sRefererSite = CookieUtility.GetCookieValue("REFERER_SITE");
                //Member.SignInForCertification.FamilySiteInformationList familySiteInformationList = new Member.SignInForCertification.FamilySiteInformationList();
                //int index = familySiteInformationList.FindFamilySiteFromDomainShortName(sRefererSite, 0);
                //Member.SignInForCertification.FamilySiteInformation familySiteInformation = familySiteInformationList.familySiteInformationList[index];
                Member.SignInForCertification.FamilySiteInformation familySiteInformation = GetFamilySiteInformation(CookieUtility.GetCookieValue("REFERER_SITE"));

                hidRefererSite.Value = familySiteInformation.SiteName;

                if (String.IsNullOrEmpty(sSelectSiteCode))
                { 
                    hidSelectSiteCode.Value = familySiteInformation.SiteCode;
                    sSelectSiteCode = familySiteInformation.SiteCode;
                }

                //familySiteInformation.DomainShortName = "celemo";
                //sSelectSiteCode = "CE";

                bool isVisibleAddInputBox = true;

				SelectUserInfoIntergrationProcesor processor = new SelectUserInfoIntergrationProcesor();
				processor.execute("", "", sDupInfo);
				SelectUserInfoResult result = processor.getResult();

				if (result.getRowCount()==0)
                {
                    if (dbResult.CertType.ToUpper() == "IPIN") {
                        userCertificationInfo.update(certIPinData);
                    }
                    else {
                        userCertificationInfo.update(certData);;
                    }

                    InitNewMember(userCertificationInfo);

                    if (sSelectSiteCode == "CE" && familySiteInformation.DomainShortName == "celemo")
                    { 
                        isVisibleAddInputBox = false;
                    }

                    /* 비웨딩 회원 가입 (신규, 기존) */
                    /* 비웨딩 고객도 추가 입력 받도록 수정 */
                    //if (sSelectSiteCode == "BE")
                    //{
                    //    isVisibleAddInputBox = false;
                    //}
                }
                else
                {   
                    InitExistingMember(result, sSelectSiteCode);

                    /* 신규 회원 가입 - 셀레모 일 경우 */
                    if (result.getRowCount() == 0 && familySiteInformation.DomainShortName == "celemo")
                    {
                        isVisibleAddInputBox = false;
                    }

                    /* 기존 회원 가입 - 셀레모를 통해서 셀레모 아이디를 선택한 경우 */
                    if (familySiteInformation.DomainShortName == "celemo" && sSelectSiteCode == "CE")
                    {
                        isVisibleAddInputBox = false;
                    }

                    /* 비웨딩 회원 가입 (신규, 기존) */
                    /* 비웨딩 고객도 추가 입력 받도록 수정 */
                    //if (sSelectSiteCode == "BE")
                    //{
                    //    isVisibleAddInputBox = false;
                    //}
                }

                dlWeddingDayField.Visible = isVisibleAddInputBox;
                dlWeddingHallField.Visible = isVisibleAddInputBox;
            }
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
            if (Request.IsMobileDevice())
            {
                ((HtmlGenericControl)Master.FindControl("MasterBody")).Attributes["class"] = "form_p";
                dlName.Attributes["class"] = "name";
                dlBirthDate.Attributes["class"] = "birth";
                dlUserId.Attributes["class"] = "id";
                dlPassword.Attributes["class"] = "pw";
                dlPasswordConfirm.Attributes["class"] = "pw2";
                dlAddress.Attributes["class"] = "addr";
                dlPhone.Attributes["class"] = "phone";
                dlHphone.Attributes["class"] = "cphone";
                dlEmail.Attributes["class"] = "email";
                dlWeddingDayField.Attributes["class"] = "cerem";
                ltrHphoneNbspField.Text = "";

                txtAddress.Style["width"] = "340px";
                txtAddressDetail.Style["width"] = "340px";
            }
            else
            {
                ((HtmlGenericControl)Master.FindControl("MasterBody")).Attributes["class"] = "";
                dlName.Attributes["class"] = "";
                dlBirthDate.Attributes["class"] = "";
                dlUserId.Attributes["class"] = "";
                dlPassword.Attributes["class"] = "";
                dlPasswordConfirm.Attributes["class"] = "";
                dlAddress.Attributes["class"] = "";
                dlPhone.Attributes["class"] = "";
                dlHphone.Attributes["class"] = "";
                dlEmail.Attributes["class"] = "";
                dlWeddingDayField.Attributes["class"] = "";
                ltrHphoneNbspField.Text = "&nbsp;&nbsp;";

                txtAddress.Style["width"] = "700px";
                txtAddressDetail.Style["width"] = "700px";
            }
        }

        public void InitNewMember(UserCertificationInfo pUserInfo)
        {
            txtUserName.Value = pUserInfo.NAME;
            ltrUserName.Text = pUserInfo.NAME;
            hidConnInfo.Value = pUserInfo.CONN_INFO;
            hidAuthType.Value = pUserInfo.AUTH_INFO;
            selBirthDateForYear.Value = pUserInfo.BIRTH_DATE.Substring(0, 4);
            selBirthDateForMonth.Value = pUserInfo.BIRTH_DATE.Substring(4, 2);
            selBirthDateForDay.Value = pUserInfo.BIRTH_DATE.Substring(6, 2);
            hidGender.Value = pUserInfo.GENDER_CODE;
            hidNationalInfo.Value = pUserInfo.NATIONAL_INFO;
            hidBirthDate.Value = pUserInfo.BIRTH_DATE;

            if (!string.IsNullOrEmpty(pUserInfo.MOBILE_NO))
            {

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
            }
            else
            {
                txtHPhone1.Disabled = false;
                txtHPhone2.Attributes.Remove("readonly");
				txtHPhone3.Attributes.Remove("readonly");

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
            ltrUserName.Text = row.USER_NAME;
                        
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

			SelectUserInfoIntergrationProcesor processor = new SelectUserInfoIntergrationProcesor();
			processor.execute("", "", hidDupInfo.Value);
			SelectUserInfoResult selectResult = processor.getResult();

			if (selectResult.getRowCount() > 0)
            {
                try
                {  
                    userInfo = FindSelectUserInfoRowForSelectSite(selectResult, sSelectSiteCode);
                    registrationNumber = selectResult.getRowCount();
                }

                catch(Exception ex)
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
            //userInfo.ENCODE_DATA = hidEncodeData.Value;
            userInfo.AUTH_MODULE_TYPE = hidAuthModuleType.Value;

            IntergrationUserData userData = new IntergrationUserData();
            userData.init(userInfo);
            userData.NEWPASSWORD = txtPassword.Value;
            userData.PASSWORD = txtPassword.Value;
            userData.AUTHTYPE = userInfo.AUTH_TYPE;
            userData.BIRTH_DATE = selBirthDateForYear.Value + "-" + selBirthDateForMonth.Value + "-" + selBirthDateForDay.Value;
            userData.BIRTH_DATE_TYPE = rdoSolar.Checked ? "S" : "L";
            userData.WEDDING_DAY = txtWeddingDay.Value;


            string sWeddingHall = String.Empty;
            if (rdoWeddingHall_W.Checked) sWeddingHall = rdoWeddingHall_W.Value;
            if (rdoWeddingHall_H.Checked) sWeddingHall = rdoWeddingHall_H.Value;
            if (rdoWeddingHall_C.Checked) sWeddingHall = rdoWeddingHall_C.Value;
            if (rdoWeddingHall_M.Checked) sWeddingHall = rdoWeddingHall_M.Value;
            if (rdoWeddingHall_E.Checked) sWeddingHall = rdoWeddingHall_E.Value;
            userData.WEDDING_HALL = sWeddingHall;



            LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "Customer Information - Save Click", "정보셋팅 - 끝");

            LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "Customer Information - Save Click", "WEDDING_DAY : " + userData.WEDDING_DAY + ", WEDDING_HALL : " + sWeddingHall + ", dlWeddingDayField.Visible : " + (dlWeddingDayField.Visible ? "Y" : "N") + ", USER_AGENT : " + Request.UserAgent );
            LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "Customer Information - Address Info", "ZIP_CODE: " + userInfo.ZIPCODE + ", ADDRESS: " + userInfo.ADDRESS + ", ADDRESS_DETAIL: " + userInfo.ADDRESS_DETAIL);



            bool IsWeddingDataConfirm = true;
            if (sSelectSiteCode != "CE")
            {
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
            }
            else
            {
                LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "Customer Information - Save Click", sSelectSiteCode + " 셀레모 - 예식일 및 예식장장 입력 필요 없음");
                IsWeddingDataConfirm = true;
            }


            if (IsWeddingDataConfirm)
            {
                bool isSuccess = true;
				if (selectResult.getRowCount() > 0) //--기회원 인경우
				{
                    //if (registrationNumber == 1 && sSelectSiteCode == "CE")
                    if (registrationNumber >= 1)
                    {
                        userData.CHOICE_AGREEMENT_FOR_THIRDPARTY = (hidChkChoiceAgreementForThirdParty.Value.ToUpper() == "Y");
                        userData.CHOICE_AGREEMENT_FOR_SAMSUNG_MEMBERSHIP = (hidChkChoiceAgreementForSamSungMembership.Value.ToUpper() == "Y");
                        userData.CHOICE_AGREEMENT_FOR_SAMSUNG_CHOICE_PERSONAL_DATA = (hidChkChoiceAgreementForSamSungChoicePersonalData.Value.ToUpper() == "Y");
                        userData.CHOICE_AGREEMENT_FOR_SAMSUNG_THIRDPARTY = (hidChkChoiceAgreementForSamSungThirdParty.Value.ToUpper() == "Y");
                        userData.SAMSUNG_MEMBERSHIP_PERIOD = hidChkChoiceAgreementForSamSungChoiceYearlData.Value;

                        //LG 추가
                        userData.CHOICE_AGREEMENT_FOR_LG_MEMBERSHIP = (hidChkChoiceAgreementForLGMembership.Value.ToUpper() == "Y");
                        userData.CHOICE_AGREEMENT_FOR_LG_CHOICE_PERSONAL_DATA = (hidChkChoiceAgreementForLGChoicePersonalData.Value.ToUpper() == "Y");
                        //롯데묘미 추가
                        userData.CHOICE_AGREEMENT_FOR_MYOMEE_MEMBERSHIP = (hidChkChoiceAgreementForMyomeeMembership.Value.ToUpper() == "Y");
                        //까사미아 추가
                        userData.CHOICE_AGREEMENT_FOR_CASAMIA_MEMBERSHIP = (hidChkChoiceAgreementForCasamiaMembershipALL.Value.ToUpper() == "Y");

                        //KT
                        userData.CHOICE_AGREEMENT_FOR_KT_MEMBERSHIP = (hidChkChoiceAgreementForKtMembership.Value.ToUpper() == "Y");

                    }

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

                // 신규 회원, 셀레모가 아닌 다른 사이트를 통해서 왔을 경우
                if (registrationNumber == 0 && sSelectSiteCode != "CE")
                {
                    userData.CHOICE_AGREEMENT_FOR_THIRDPARTY = (hidChkChoiceAgreementForThirdParty.Value.ToUpper() == "Y");
                    userData.CHOICE_AGREEMENT_FOR_SAMSUNG_MEMBERSHIP = (hidChkChoiceAgreementForSamSungMembership.Value.ToUpper() == "Y");
                    userData.CHOICE_AGREEMENT_FOR_SAMSUNG_CHOICE_PERSONAL_DATA = (hidChkChoiceAgreementForSamSungChoicePersonalData.Value.ToUpper() == "Y");
                    userData.CHOICE_AGREEMENT_FOR_SAMSUNG_THIRDPARTY = (hidChkChoiceAgreementForSamSungThirdParty.Value.ToUpper() == "Y");
                    userData.SAMSUNG_MEMBERSHIP_PERIOD = hidChkChoiceAgreementForSamSungChoiceYearlData.Value;
                    //LG 추가
                    userData.CHOICE_AGREEMENT_FOR_LG_MEMBERSHIP = (hidChkChoiceAgreementForLGMembership.Value.ToUpper() == "Y");
                    userData.CHOICE_AGREEMENT_FOR_LG_CHOICE_PERSONAL_DATA = (hidChkChoiceAgreementForLGChoicePersonalData.Value.ToUpper() == "Y");
                    //롯데묘미 추가
                    userData.CHOICE_AGREEMENT_FOR_MYOMEE_MEMBERSHIP = (hidChkChoiceAgreementForMyomeeMembership.Value.ToUpper() == "Y");

                    //까사미아 추가
                    userData.CHOICE_AGREEMENT_FOR_CASAMIA_MEMBERSHIP = (hidChkChoiceAgreementForCasamiaMembershipALL.Value.ToUpper() == "Y");

                    //KT
                    userData.CHOICE_AGREEMENT_FOR_KT_MEMBERSHIP = (hidChkChoiceAgreementForKtMembership.Value.ToUpper() == "Y");
                }



                LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "Customer Information - Save Click", "기존회원(dupinfo가 있는 회원) 일 경우 회원정보 업데이트 - 끝");



                if (isSuccess)
                {

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


                    if (registrationNumber == 0)
                    {
                        string sSaleGubun = Session["saleGubun"] != null ? Session["saleGubun"].ToString() : "";
                        string sCompanySeq = Session["companySeq"] != null ? Session["companySeq"].ToString() : "";

                        if (string.IsNullOrWhiteSpace(sCompanySeq) || string.IsNullOrWhiteSpace(sSaleGubun))
                        {
                            LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "세션 코드가 존재하지않습니다. 오류 발생", "신규 가입자 이벤트 실행 - 실패");
                        }
                        else
                        {
                            // 삼성 마케팅 동의한 경우 쿠폰 지급
                            if (hidChkChoiceAgreementForSamSungMembership.Value.ToUpper() == "Y")
                            {
                                InMemRegistSamsungCouponProcessor InMemRegistSamsungCouponProcessor = new InMemRegistSamsungCouponProcessor();
                                InMemRegistSamsungCouponProcessor.InsertCouponIssueForSamsung(sCompanySeq, txtID.Value.Trim());
                            }
                        }

                        LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "신규 가입자 이벤트 실행 완료!!", "신규회원 가입자 이벤트 실행 완료");
                    }


                    LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "Customer Information - Save Click", "회원 인서트 - 끝");



                    if (isSuccess)
                    {
                        ExecuteIntergrationResult result = new ExecuteIntergrationResult();
                        try
                        {
                            ExecuteIntergrationProcessor processor2 = new ExecuteIntergrationProcessor();
                            processor2.execute(hidDupInfo.Value, txtID.Value, txtPassword.Value, hidRefererSite.Value, hidSelectSiteCode.Value, txtID.Value);
                            result = processor2.getResult();
                            //result.Success = isSuccess;

                            try
                            {
                                // 3자 동의 마케팅 (통신, 보험)
                                string sMarketingTypeCode = hidChkChoiceAgreementForThirdPartyTelecom.Value;
                                if (String.IsNullOrEmpty(hidChkChoiceAgreementForThirdPartyShinhan.Value) == false)
                                {
                                    sMarketingTypeCode = sMarketingTypeCode + (String.IsNullOrEmpty(sMarketingTypeCode) ? "" : ",");
                                    sMarketingTypeCode = sMarketingTypeCode + hidChkChoiceAgreementForThirdPartyShinhan.Value;
                                }

                                // 3자 동의 마케팅 건강
                                if (String.IsNullOrEmpty(hidChkChoiceAgreementForThirdParty.Value) == false)
                                {
                                    sMarketingTypeCode = sMarketingTypeCode + (String.IsNullOrEmpty(sMarketingTypeCode) ? "" : ",");
                                    sMarketingTypeCode = sMarketingTypeCode + hidChkChoiceAgreementForThirdParty.Value;
                                }

                                //if (String.IsNullOrEmpty(hidChkChoiceAgreementForThirdPartyDrink.Value) == false)
                                //{
                                //    sMarketingTypeCode = sMarketingTypeCode + (String.IsNullOrEmpty(sMarketingTypeCode) ? "" : ",");
                                //    sMarketingTypeCode = sMarketingTypeCode + hidChkChoiceAgreementForThirdPartyDrink.Value;
                                //}

                                if (String.IsNullOrEmpty(sMarketingTypeCode) == false)
                                {
                                    ThirdPartyMarketingAgreementProcessor thirdPartyMarketingAgreementProcessor = new ThirdPartyMarketingAgreementProcessor();
                                    thirdPartyMarketingAgreementProcessor.InsertThirdPartyMarketingAgreement(txtID.Value, sMarketingTypeCode);
                                }
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


                        }
                        catch (Exception ex)
                        {
                            LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "Customer Information - Save Click", "ExecuteIntergrationProcessor Error " + ex.ToString());
                        }


                        LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "Customer Information - Save Click", "통합회원 전환 - 끝");



                        if (result.Success)
                        {
                            //--인증정보 삭제
                            //UserCertificationLogUtility.DeleteUserCertificationLog(hidCertID.Value);
							Response.Redirect("/Member/SignInForRegistrationComplete.aspx?USER_ID=" + txtID.Value);
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