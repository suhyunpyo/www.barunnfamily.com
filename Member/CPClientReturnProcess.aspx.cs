using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BarunnIntergrationService.Common.ExtensionMethod;
using BarunnIntergrationService.Common;
using System.Collections;
using BarunnIntergrationService.Common.Utillity;
using BarunnIntergrationService.Service.Member;

namespace BarunnIntergrationService.Member
{
    public partial class CPClientReturnProcess : System.Web.UI.Page
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
            if(CPClientUtility.respDecData == null)
            {
				Response.Clear();
				Response.Write(CPClientUtility.GetCPClientErrorResultScript("인증정보 복호화실패"));
				Response.End();
			}

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

            if (processor.getResult().getRowCount() > 0 && processor.getResult().getRow()[0].IS_INTERGRATION_MEMBER)
            {
                actionPageUrl = "/Member/SignInForRegistrationCompleteForExistingMember.aspx";
            }
            else if (processor.getResult().getRowCount() > 0)
            {
                actionPageUrl = "/Member/SignInForExistingMember.aspx";
            }
            else
            {
                actionPageUrl = "/Member/SignInForTermsAgreement.aspx";
            }

            LogUtility.LogWrite(CPClientUtility.respDecData.di, "", " 인증 단계 actionPageUrl", actionPageUrl);

            Response.Clear();
            Response.Write(CPClientUtility.GetCPClientResultScript(certID,ApplicationContext.G().CPCLIENT_RESPONSE_FORM_NAME, actionPageUrl));
            Response.End();

        }
    }
}