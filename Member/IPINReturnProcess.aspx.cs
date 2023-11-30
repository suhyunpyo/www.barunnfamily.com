using BarunnIntergrationService.Common;
using BarunnIntergrationService.Common.ExtensionMethod;
using BarunnIntergrationService.Common.Utillity;
using BarunnIntergrationService.Service.Member;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BarunnIntergrationService.Member
{
    public partial class IPINReturnProcess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContextUtility.SetNoCache();

			NiceIPINUtility IPINUtility = new NiceIPINUtility();

			IPINUtility.encData = Request.Value("enc_data");
			IPINUtility.integrityValue = Request.Value("integrity_value");
			IPINUtility.tokenVersionId = Request.Value("token_version_id");
			IPINUtility.nextStepUrl = ApplicationContext.G().CERTIFICATION_NEXT_STEP_URL;
			IPINUtility.urlReferer = ApplicationContext.G().REFERER_SITE;

			IPINUtility.ExecuteDataDecoding();
			if (IPINUtility.respDecData == null)
			{
				Response.Clear();
				Response.Write(IPINUtility.GetErrorResultScript("인증정보 복호화 실패"));
				Response.End();
			}

            SelectUserInfoIntergrationProcesor processor = new SelectUserInfoIntergrationProcesor();
            processor.execute("", "", IPINUtility.respDecData.dupinfo);
            SelectUserInfoResult result = processor.getResult();

            LogUtility.LogWrite(IPINUtility.respDecData.dupinfo, "", " 인증 단계 ", IPINUtility.respDecData.name);

			//--인증정보 DB 저장
			string encCertData = AesUtility.Encrypt(IPINUtility.respDecJson);
			var certID = UserCertificationLogUtility.InsertUserCertificationLog("IPIN", IPINUtility.respDecData.dupinfo, encCertData);
			if (string.IsNullOrEmpty(certID))
			{

				Response.Clear();
				Response.Write(IPINUtility.GetErrorResultScript("본인인증 실패 다시 시도해 주세요."));
				Response.End();
				return;
			}

			string actionPageUrl = "";
            

            if (processor.getResult().getRowCount() > 0 && processor.getResult().getRow()[0].IS_INTERGRATION_MEMBER)
            {

                // 페이지 수정 안해도 됨
                actionPageUrl = "/Member/SignInForRegistrationCompleteForExistingMember.aspx";
            }
            else if (processor.getResult().getRowCount() > 0)
            {
                // 페이지 수정 필요
                actionPageUrl = "/Member/SignInForExistingMember.aspx";
            }
            else
            {
				actionPageUrl = "/Member/SignInForTermsAgreement.aspx";				

			}

            LogUtility.LogWrite(IPINUtility.respDecData.dupinfo, "", " 인증 단계 actionPageUrl", actionPageUrl);

            Response.Clear();
            Response.Write(IPINUtility.GetResultScript(certID,ApplicationContext.G().IPIN_RESPONSE_FORM_NAME, actionPageUrl));
            Response.End();

        }
    }
}