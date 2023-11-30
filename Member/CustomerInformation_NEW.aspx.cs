using BarunnIntergrationService.Common;
using BarunnIntergrationService.Common.Databases;
using BarunnIntergrationService.Common.ExtensionMethod;
using BarunnIntergrationService.Common.ResultModel;
using BarunnIntergrationService.Common.Utillity;
using BarunnIntergrationService.Service;
using BarunnIntergrationService.Service.Member;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace BarunnIntergrationService.Member
{
    public partial class CustomerInformation_NEW : System.Web.UI.Page
    {
		string sDupInfo = string.Empty;
		string sUrlReferer;
        string sSelectSiteCode;
		protected List<BannerImage> BannerImages = null;

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

            SetAgreement(ApplicationContext.G().REFERER_SITE);

			
			string domainSite = ApplicationContext.G().REFERER_SITE_DOMAIN(ApplicationContext.G().REFERER_SITE);
            if (domainSite == "barunsonmall")
            {

                if (Request.IsMobileDevice())
                {
                    BannerImages = MDChoiceBannerUtility.GetMDChoiceBannerImages(1049);
                }
                else
                {
                    BannerImages = MDChoiceBannerUtility.GetMDChoiceBannerImages(1050);
                }
            }
            else if (domainSite == "barunsoncard")
            {
				if (Request.IsMobileDevice())
				{
					BannerImages = MDChoiceBannerUtility.GetMDChoiceBannerImages(1046);
				}
				else
				{
					BannerImages = MDChoiceBannerUtility.GetMDChoiceBannerImages(1045);
				}
			}
            else if (domainSite == "premierpaper")
            {
                if (Request.IsMobileDevice())
                {
                    BannerImages = MDChoiceBannerUtility.GetMDChoiceBannerImages(1052);
                }
                else
                {
                    BannerImages = MDChoiceBannerUtility.GetMDChoiceBannerImages(1051);
                }
            }
        }        

        private Boolean firstPageLoad()
        {
                  
			string certID = Request.Value("certID");
            if (string.IsNullOrEmpty(certID))
            {
                return false;
            }

            UserCertificationLog dbResult = UserCertificationLogUtility.GetUserCertificationLog(certID);
            if (dbResult == null)
            {
                return false;
            }

			sDupInfo = dbResult.DupInfo;

            NiceCPCResponseData certData;
            try
            {
                var decJsonData = AesUtility.Decrypt(dbResult.CertData);
                certData = Newtonsoft.Json.JsonConvert.DeserializeObject<NiceCPCResponseData>(decJsonData);
            }
            catch
            {
                certData = null;
            }

            if (certData == null)
			{
				return false;
			}
                        
			SelectUserInfoIntergrationProcesor selectProcessor = new SelectUserInfoIntergrationProcesor();
			selectProcessor.execute("", "", sDupInfo);
			SelectUserInfoResult selectResult = selectProcessor.getResult();			

            //--신규가입자만 접근가능
			if(selectResult.getRowCount()>0)
            {
                return false;
            }

			hidCertID.Value = certID;
            hidAuthModuleType.Value = dbResult.CertType;
            hidDupInfo.Value = sDupInfo;
            hidAuthType.Value = certData.authtype;

			UserCertificationInfo userCertificationInfo = new UserCertificationInfo();
            Member.SignInForCertification.FamilySiteInformation familySiteInformation = GetFamilySiteInformation(CookieUtility.GetCookieValue("REFERER_SITE"));

            hidRefererSite.Value = familySiteInformation.SiteName;
			hidSelectSiteCode.Value = familySiteInformation.SiteCode;
			sSelectSiteCode = familySiteInformation.SiteCode;

			if (String.IsNullOrEmpty(sSelectSiteCode))
            {
                hidSelectSiteCode.Value = familySiteInformation.SiteCode;
                sSelectSiteCode = familySiteInformation.SiteCode;
            }

			
            //--휴대폰 인증 Only
			if (dbResult.CertType.ToUpper() != "CPCLIENT")
            {
                return false;
            }

			userCertificationInfo.update(certData);
			InitNewMember(userCertificationInfo);

            //--이용약관
            var usepolicyItem = PolicyTermsUtility.GetPolicyInfo(familySiteInformation.SiteCode, ApplicationContext.G().IS_REFERER_COMPANYSEQ(CookieUtility.GetCookieValue("REFERER_SITE")), "U", 0);
            ltrUsePolicyContents.Text = usepolicyItem==null?"":usepolicyItem.Contents.ToString();

            //--개인정보 수집 이용약관
            var privacypolicyItem = PolicyTermsUtility.GetPolicyInfo(familySiteInformation.SiteCode, ApplicationContext.G().IS_REFERER_COMPANYSEQ(CookieUtility.GetCookieValue("REFERER_SITE")), "P", 0);
            ltrPrivacyPolicyContents.Text = privacypolicyItem == null ? "" : privacypolicyItem.Contents.ToString();

            return true;
        }

        public void SetAgreement(String sRefererSite)
        {            
            bool isVisibleAddTermsAgreement = true;

            if (sRefererSite.ToUpper().Contains("SHINHAN"))
            {
                isVisibleAddTermsAgreement = false;
            }

            wrapThirdPartyAgreementTelecom.Visible = isVisibleAddTermsAgreement;
            wrapLGAgreement.Visible = isVisibleAddTermsAgreement; // 엘지전자 동의            
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

                txtAddress.Style["width"] = "300px";
                txtAddressDetail.Style["width"] = "300px";
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
            
            string sSelectSiteCode = hidSelectSiteCode.Value;
            SelectUserInfoRow userInfo = new SelectUserInfoRow();
            
            userInfo.AUTH_CODE = hidDupInfo.Value;
            userInfo.AUTH_VNO = hidConnInfo.Value;
            userInfo.AUTH_TYPE = hidAuthType.Value;           

            LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "Customer Information - Save Click", "기존회원(dupinfo가 있는 회원) 일 경우 회원 정보를 다시 가져옴 - 끝");

            //입력받은 데이터 정보 Set
            userInfo.USER_NAME = txtUserName.Value;
            userInfo.USER_ID = txtID.Value.Trim();
            userInfo.ZIPCODE = txtZipCode1.Value + txtZipCode2.Value + txtZipCode3.Value + txtZipCode4.Value + txtZipCode5.Value;
            userInfo.ADDRESS = txtAddress.Value;
            userInfo.ADDRESS_DETAIL = txtAddressDetail.Value;
            userInfo.ALLOWSMS = chkSMSEMailYorN.Checked;
            userInfo.ALLOWMAILING = chkSMSEMailYorN.Checked;
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

               
                userData.CHOICE_AGREEMENT_FOR_THIRDPARTY = chkChoiceAgreementForThirdParty.Checked;
                
                // 엘지데이터
                userData.CHOICE_AGREEMENT_FOR_LG_MEMBERSHIP = chkChoiceAgreementForLGMembership.Checked;
                userData.CHOICE_AGREEMENT_FOR_LG_CHOICE_PERSONAL_DATA = chkChoiceAgreementForLGChoicePersonalData.Checked;

                //쿠쿠데이터
                userData.CHOICE_AGREEMENT_FOR_CUCKOO_MEMBERSHIP = false;

                //까사미아
                userData.CHOICE_AGREEMENT_FOR_CASAMIA_MEMBERSHIP = chkChoiceAgreementForCasamiaMembership.Checked;

                //KT
                userData.CHOICE_AGREEMENT_FOR_KT_MEMBERSHIP = false;

                //롯데묘미 추가
                userData.CHOICE_AGREEMENT_FOR_MYOMEE_MEMBERSHIP = false;

                // 일룸 추가
                userData.CHOICE_AGREEMENT_FOR_ILOOM_MEMBERSHIP = false;
                userData.CHOICE_AGREEMENT_FOR_ILOOM_CHOICE_PERSONAL_DATA = false;
                userData.CHOICE_AGREEMENT_FOR_ILOOM_THIRDPARTY = false;

                userData.CHOICE_AGREEMENT_FOR_HYUNDAI_MEMBERSHIP = false;
              

                LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "Customer Information - Save Click", "기존회원(dupinfo가 있는 회원) 일 경우 회원정보 업데이트 - 끝");
				string isIntergrationSuccess = "";
				if (isSuccess)
                {
                    //회원정보 생성로직
                    try
                    {
                        InsertUserInfoIntergrationProcessor insertProcessor = new InsertUserInfoIntergrationProcessor();
                        insertProcessor.execute(userData);
                        InsertUserInfoResult InserResult = insertProcessor.getResult();
                        isSuccess = InserResult.Success;
						isIntergrationSuccess = InserResult.Message;
						
					}
                    catch (Exception ex)
                    {
                        LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "Customer Information - Save Click", "InsertUserInfoIntergrationProcessor Error " + ex.ToString());
                    }

                    LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "Customer Information - Save Click", "회원 인서트 - 끝");

                    if (isIntergrationSuccess.ToUpper().Equals("FAIL"))
                    {
						ClientScriptUtility.ClientScriptAlert(Page, "통합 회원 가입도중 오류가 발생 하였습니다. 다시 시도해 주십시오");
					}
                    else
                    {
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


                                sUrlReferer = ApplicationContext.G().REFERER_SITE;
                                string sCompanySeq = ApplicationContext.G().IS_REFERER_COMPANYSEQ(sUrlReferer);

                                //알림톡 발송
                                SendBizTalkProcessor SendBizTalkProcessor = new SendBizTalkProcessor();
                                SendBizTalkProcessor.SendBizTalk(sSelectSiteCode, sCompanySeq, userInfo.USER_NAME, userInfo.CELLPHONE);

                                LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "신규 가입자 이벤트 sCompanySeq --> " + sCompanySeq, "신규회원 가입자 이벤트 실행 완료");
                                
                                //쿠폰 발급, 발급프로시져에서 처리 하고, 동의 여부 상관 없이 호출. 
                                var inMemRegistGiftProcessor = new InMemRegistGiftProcessor();
                                inMemRegistGiftProcessor.InsertMemRegistGift(sCompanySeq, txtID.Value.Trim(), "0");

                                LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "신규 가입자 이벤트 실행 완료!!", "신규회원 가입자 이벤트 실행 완료");

                            }
                            catch (Exception ex)
                            {
                                LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "Customer Information - Save Click", "ExecuteIntergrationProcessor Error " + ex.ToString());
                            }


                            LogUtility.LogWrite(hidDupInfo.Value, txtID.Value, "Customer Information - Save Click", "통합회원 전환 - 끝");



                            if (result.Success)
                            {
                                if (CookieUtility.GetCookieValue("REFERER_SITE").Contains("premierpaper"))
                                {
                                    Response.Redirect("/Member/PremierForRegistrationComplete.aspx?USER_ID=" + txtID.Value);
                                }
                                else
                                {
                                    string redirectUrl = "/Member/BarunsonForRegistrationComplete.aspx?USER_ID=" + txtID.Value + "&CERT_ID=" + hidCertID.Value;
                                    Response.Redirect(redirectUrl);
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

        //BizTalk
        public class SendBizTalkProcessor : AbstractIntergrationProcessor
        {
            public void SendBizTalk(String salesGubun, String companySeq, String memberName, String memberHphone)
            {
                initConnector();
                beginTrans();
                try
                {
                    m_shopConnector.Execute(ShopDatabaseFactory.SendBizTalk(salesGubun, companySeq, memberName, memberHphone));
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


        public class CouponResult : IDatabaseResultModel
        {
            private string resultCode = "9999";
            private string resultMessage = "쿠폰발행이 정상적으로 발행되지 않았습니다.";

            public void update(SqlDataReader reader)
            {
                if (reader.HasRows)
                {
                    if (reader.Read())
                    {
                        resultCode = reader.GetString(0);
                        resultMessage = reader.GetString(1);
                    }
                }
            }

            public string GetResultCode()
            {
                return resultCode;
            }

            public string GetResultMessage()
            {
                return resultMessage;
            }
        }


    }
}