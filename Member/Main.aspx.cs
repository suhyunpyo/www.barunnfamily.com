using BarunnIntergrationService.Common;
using BarunnIntergrationService.Common.ExtensionMethod;
using BarunnIntergrationService.Common.Utillity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace BarunnIntergrationService.Member
{
    public partial class Main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LogUtility.LogWrite("MainTest", "MainTest", "MainTest 이페이지 열렸습니다.", "페이지 확인");
            string sSubmitUrl = string.Empty;
			string sDupInfo = Server.UrlEncode(Request.Value("DupInfo"));
			string sCertID = Server.UrlEncode(Request.Value("CertID"));
                       
            //--DB애 Cert 정보가 없으면 회원가입 페이지로 이동
            if(!string.IsNullOrEmpty(sCertID))
            {
				var dbResult = UserCertificationLogUtility.GetUserCertificationLog(sCertID);
                if (dbResult == null)
                {
                    sCertID = "";
                }               
			}

			if (string.IsNullOrEmpty(sCertID) && string.IsNullOrEmpty(sDupInfo))
			{
				sSubmitUrl = "/Member/SignInForCertification.aspx";
			}
			else if (!string.IsNullOrEmpty(sCertID))
			{
				sSubmitUrl = "/Member/SignInForExistingMember.aspx";
				ltrInputDataForDupInfo.Text = "<input type='hidden' name='certID' value='" + sCertID + "' />";
			}
			else
            {
				sSubmitUrl = "/Member/SignInForExistingMember.aspx";
				ltrInputDataForDupInfo.Text = "<input type='hidden' name='DupInfo' value='" + sDupInfo + "' />";
			}
			
            ((HtmlForm)Master.FindControl(ApplicationContext.G().MAIN_FORM_ID)).Attributes["action"] = sSubmitUrl;
            
            string sUrlReferer = ApplicationContext.G().REFERER_SITE;
            divFamilySiteField.Visible = (ApplicationContext.G().IS_REFERER_FAMILY_SITE_FOR_JEHU(sUrlReferer) == false);

            //string sRefererSite = CookieUtility.GetCookieValue("REFERER_SITE");
            ltrNewMember.Visible = (string.IsNullOrEmpty(sCertID) && string.IsNullOrEmpty(sDupInfo));
            ltrExistingMember.Visible = (!string.IsNullOrEmpty(sCertID) || !string.IsNullOrEmpty(sDupInfo));

        }


    }
}