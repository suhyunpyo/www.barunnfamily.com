using BarunnIntergrationService.Common.Databases;
using BarunnIntergrationService.Common.ExtensionMethod;
using BarunnIntergrationService.Common.Utillity;
using BarunnIntergrationService.Service;
using BarunnIntergrationService.Service.Member;
using System;
using System.Web.UI.HtmlControls;

namespace BarunnIntergrationService.MyPage
{
    public partial class UserSecession : System.Web.UI.Page
    {
        public string sitegubun = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            ((HtmlGenericControl)Master.FindControl("MasterBody")).Attributes["class"] = "mleave_p";

            //InsertUserSecessionComment insertUserSecessionComment = new InsertUserSecessionComment();
            //UserSecessionData userSecessionData = new UserSecessionData();
            //userSecessionData.USER_ID = "sharniel1";
            //userSecessionData.DUP_INFO = "MC0GCCqGSIb3DQIJAyEAgQMn9E0TJmup1Yu5+Ws1cmQPM5Io02lOWvzoC0hwn0o=";
            //insertUserSecessionComment.execute(userSecessionData);


            if (IsPostBack == false)
            {
                sitegubun = Request.Value("SiteDiv");
                string sDupInfo = Request.Value("DupInfo");
				string sCertID = Request.Value("CertID");
				string sReturnUrl = Request.Value("ReturnUrl");
                string sReturnCancelUrl = Request.Value("sReturnCancelUrl");
                string sSiteDiv = Request.Value("SiteDiv");

                if (string.IsNullOrEmpty(sDupInfo) && !string.IsNullOrEmpty(sCertID))
                {
                    var dbResult = UserCertificationLogUtility.GetUserCertificationLog(sCertID);
                    if (dbResult != null)
                    {
                        sDupInfo = dbResult.DupInfo;
						
                        UserCertificationLogUtility.DeleteUserCertificationLog(sCertID);
					}
                }

				
                if (String.IsNullOrEmpty(sReturnCancelUrl))
                {
                    sReturnCancelUrl = Request.UrlReferrer == null ? "" : Request.UrlReferrer.ToString();
                }

                btnCancel.HRef = sReturnCancelUrl;
                hidDupInfo.Value = sDupInfo;
                hidReturnUrl.Value = Server.UrlEncode(sReturnUrl);
                hidSiteDiv.Value = sSiteDiv;

                SelectUserInfoIntergrationProcesor processor = new SelectUserInfoIntergrationProcesor();
                processor.execute("", "", sDupInfo);
                SelectUserInfoResult result = processor.getResult();

                bool isValidationCheck = result.getRowCount() > 0 ? result.getRow()[0].IS_INTERGRATION_MEMBER : false;
                if (isValidationCheck == false)
                {
                    Response.Redirect(sReturnUrl);
                    Response.End();
                }
            }
        }

        protected void btnSecession_Click(object sender, EventArgs e)
        {
            string sSecessionCauseCode = String.Join("|", Request.Form.GetValues("chkSecessionCause"));
            string sEtcComment = Request.Value("txtEtcComment");

            string sDupInfo = hidDupInfo.Value;
            SelectUserInfoIntergrationProcesor SelectProcessor = new SelectUserInfoIntergrationProcesor();
            SelectProcessor.execute("", "", sDupInfo);
            SelectUserInfoResult result = SelectProcessor.getResult();

            if (result.getRowCount() <= 0)
            {
                Response.Redirect(hidReturnUrl.Value);
                Response.End();
            }

            UserSecessionData userData = new UserSecessionData(sDupInfo, result.getRow()[0].USER_ID, hidSiteDiv.Value, sSecessionCauseCode, sEtcComment);
            InsertUserSecessionComment processor = new InsertUserSecessionComment();
            processor.execute(userData);

            string sReturnUrl = Server.UrlEncode(hidReturnUrl.Value);
            string sSiteDiv = hidSiteDiv.Value;
            string postData = "ReturnUrl=" + sReturnUrl + "&SiteDiv=" + sSiteDiv;
            Response.Redirect("/MyPage/UserSecessionComplete.aspx?" + postData);
            Response.End();
        }

        public class InsertUserSecessionComment : AbstractIntergrationProcessor
        {
            public Boolean Success { get; set; }
            public void execute(UserSecessionData pData)
            {
                initConnector();
                beginTrans();

                try
                {
                    // 셀레모 회원 탈퇴는 해당 URL로 대체


                    LogUtility.LogWrite("", pData.USER_ID, "회원탈퇴", "셀레모 회원 탈퇴 시작");

                    string sUserId = pData.USER_ID;
                    string celemoUrl = "http://www.celemo.co.kr/member_process/callback_withdrawal_by_intergration";
                    string getData = "userid=" + sUserId;
                    WebRequestUtility.HTTP_GET(celemoUrl, getData);

                    LogUtility.LogWrite("", sUserId, "회원탈퇴", "셀레모 회원 탈퇴 끝");

                    LogUtility.LogWrite("", sUserId, "회원탈퇴", "청첩장 사이트 회원 탈퇴 시작");

                    try
                    {
                        LogUtility.LogWrite("", sUserId, "회원탈퇴", pData.DUP_INFO + " " + pData.USER_ID + " " + pData.SITE_DIV + " " + pData.ETC_COMMENT + " " + pData.SECESSION_CAUSE_CODE);
                    }
                    catch
                    {
                        LogUtility.LogWrite("", sUserId, "회원탈퇴", "상세정보 입력 오류");
                    }

                    insertShopUserSecession(pData);

                    LogUtility.LogWrite("", sUserId, "회원탈퇴", "청첩장 사이트 회원 탈퇴 끝");

                    ////insertCelemoUserSecession(pData);
                    Success = true;
                    commit();
                }
                catch (Exception ex)
                {
                    Console.Write(ex.Message);
                    Success = false;
                    rollBack();
                }

                closeConnector();
            }

            private void insertShopUserSecession(UserSecessionData pData)
            {
                ProcedureCallCommand command = ShopDatabaseFactory.createCommandInsertUserSecession(pData.DUP_INFO, pData.SITE_DIV, pData.SECESSION_CAUSE_CODE, pData.ETC_COMMENT);
                m_shopConnector.Execute(command);
            }

            //private void insertCelemoUserSecession(UserSecessionData pData)
            //{
            //    m_celemoConnector.execute(CelemoDatabaseFactory.createQueryUserSecession(pData.DUP_INFO));
            //}
        }

        public class UserSecessionData
        {
            public String DUP_INFO;
            public String USER_ID;
            public String SITE_DIV;
            public String SECESSION_CAUSE_CODE;
            public String ETC_COMMENT;

            public UserSecessionData()
            { }

            public UserSecessionData(String pDupInfo, String pUserId, String pSiteDiv, String pSecessionCauseCode, String pEtcComment)
            {
                this.DUP_INFO = pDupInfo;
                this.USER_ID = pUserId;
                this.SITE_DIV = pSiteDiv;
                this.SECESSION_CAUSE_CODE = pSecessionCauseCode;
                this.ETC_COMMENT = pEtcComment;
            }
        }
    }
}