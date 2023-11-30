using BarunnIntergrationService.Common;
using BarunnIntergrationService.Common.ExtensionMethod;
using BarunnIntergrationService.Common.Utillity;
using BarunnIntergrationService.Service.Member;
using System;
using System.Text;

namespace BarunnIntergrationService.Member
{
    public partial class CPClientReturnProcessOnly : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContextUtility.SetNoCache();

			NiceCPClientUtility CPClientUtility = new NiceCPClientUtility();

            CPClientUtility.encData = Request.Value("enc_data");
			CPClientUtility.integrityValue = Request.Value("integrity_value");
			CPClientUtility.tokenVersionId = Request.Value("token_version_id");			
            CPClientUtility.nextStepUrl = ApplicationContext.G().CERTIFICATION_NEXT_STEP_URL;
            CPClientUtility.urlReferer = ApplicationContext.G().REFERER_SITE;
            
            CPClientUtility.ExecuteDataDecoding();
			if (CPClientUtility.respDecData == null)
			{
				Response.Clear();
				Response.Write(CPClientUtility.GetCPClientErrorResultScript("인증정보 복호화 실패"));
				Response.End();
			}

			string BirthDate = CPClientUtility.respDecData.birthdate;                                                         
                                                         

            BirthUtility BirthChk = new BirthUtility();
            int year = Convert.ToInt32(BirthDate.Substring(0, 4).ToString());
            int month = Convert.ToInt32(BirthDate.Substring(4, 2).ToString());
            int day = Convert.ToInt32(BirthDate.Substring(6, 2).ToString());

            bool bChk = BirthChk.IsBelow14(year, month, day);

            if (bChk) //14세 미만이 맞다 
            {
                StringBuilder sbError = new StringBuilder();
                sbError.AppendLine("<script type='text/javascript'>");
                sbError.AppendLine("alert('14세 미만은 회원가입이 불가능합니다');");
                sbError.AppendLine("window.close();");
                sbError.AppendLine("</script>");
                Response.Write(sbError.ToString());
                Response.End();
                return;
            }
            //가입정보 체크 로직
            SelectUserInfoIntergrationProcesor processor = new SelectUserInfoIntergrationProcesor();
            processor.execute("", "", CPClientUtility.respDecData.di);
            SelectUserInfoResult result = processor.getResult();

            LogUtility.LogWrite(CPClientUtility.respDecData.di, "", " 인증 단계 ", CPClientUtility.respDecData.name);

            //--인증정보 DB 저장
            string encCertData = AesUtility.Encrypt(CPClientUtility.respDecJson);
			var certID = UserCertificationLogUtility.InsertUserCertificationLog("CPCLIENT", CPClientUtility.respDecData.di, encCertData);
			if (string.IsNullOrEmpty(certID))
			{
				Response.Clear();
				Response.Write(CPClientUtility.GetCPClientErrorResultScript("본인인증 실패 다시 시도해 주세요"));
				Response.End();
				return;
			}

			string actionPageUrl = "";

            LogUtility.LogWrite("CPClientReturnProcessOnly", "namTest", "CPClientReturnProcessOnly --> [ " + CPClientUtility.respDecData.name + " ] " + CookieUtility.GetCookieValue("REFERER_SITE"), CookieUtility.GetCookieValue("REFERER_SITE"));

            var refSite = CookieUtility.GetCookieValue("REFERER_SITE").ToLower();
            if (processor.getResult().getRowCount() > 0 && processor.getResult().getRow()[0].IS_INTERGRATION_MEMBER)
            {
                switch (refSite)
                {
                    case "premierpaper":
                        actionPageUrl = "/Member/PremierCompleteForExistingMember.aspx";
                        break;
                    case "barunsonmall":
                        actionPageUrl = "/Member/BarunsonmallCompleteForExistingMember.aspx";
                        break;
                    case "barunsonmcard":
                        actionPageUrl = "/Member/BarunsonMcardCompleteForExistingMember.aspx";
                        break;
                    case "gsauth":
                        actionPageUrl = "/Member/gsCompleteForExistingMember.aspx";
                        break;
                    default:
                        actionPageUrl = "/Member/CompleteForExistingMember.aspx";
                        break;
                }
            }
            else if (processor.getResult().getRowCount() > 0)
            {
                actionPageUrl = "/Member/SignInForExistingMember.aspx";
            }
            else
            {
                switch (refSite)
                {
                    case "barunsonmcard":
                        actionPageUrl = "/Member/BarunsonMcardForCustomerInformation.aspx";
                        break;
                    case "gsauth":
                        actionPageUrl = "/Member/GshopForCustomerInformation.aspx";
                        break;
                    default:
                        actionPageUrl = "/Member/CustomerInformation_NEW.aspx";
                        break;
                }
            }

            LogUtility.LogWrite(CPClientUtility.respDecData.di, "", " 인증 단계 actionPageUrl", actionPageUrl);            

			var responseString = CPClientUtility.GetCPClientResultScript(certID, ApplicationContext.G().CPCLIENT_RESPONSE_FORM_NAME, actionPageUrl);
            
            Response.Clear();
            Response.Write(responseString);
            Response.End();

        }
    }
}