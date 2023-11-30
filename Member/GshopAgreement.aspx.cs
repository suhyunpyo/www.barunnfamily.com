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
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace BarunnIntergrationService.Member
{
    public partial class GshopAgreement : System.Web.UI.Page
    {
        string sRefererSite = "";
        // string DomainSite = "";
        //20210419 표수현 - DomainSite 변수를 퍼블릭으로 변경
        public string DomainSite = "";
        string sUrlReferer = "";

        protected void Page_Load(object sender, EventArgs e)
        {

            SetCookie();
          
            InitDeviceBranchProcessing();
            InitCPClient();
        }

        public void InitCPClient()
        {
            String NextStepUrl = "";

            NextStepUrl = "/Member/GshopForCustomerInformation.aspx";

			NiceCPClientUtility CPClientUtility = new NiceCPClientUtility();

			CPClientUtility.authType = "M";
			CPClientUtility.returnUrl = ApplicationContext.G().CPCLIENT_RETURN_URL_V2;
			CPClientUtility.nextStepUrl = NextStepUrl;
			CPClientUtility.urlReferer = ApplicationContext.G().REFERER_SITE;

			CPClientUtility.ExecuteDataEncoding();

			((Literal)Master.FindControl("ltrMasterPageCPClientRequestForm")).Text = CPClientUtility.GetCPClientRequestFormTag(ApplicationContext.G().CPCLIENT_REQUEST_FORM_NAME);
			((Literal)Master.FindControl("ltrMasterPageCPClientResponseForm")).Text = CPClientUtility.GetCPClientResponseFormTag(ApplicationContext.G().CPCLIENT_RESPONSE_FORM_NAME);

        }
        public void InitDeviceBranchProcessing()
        {
            if (Request.IsMobileDevice() )
            {
                ((HtmlGenericControl)Master.FindControl("MasterBody")).Attributes["class"] = "form_p";
            }
            else
            {
                ((HtmlGenericControl)Master.FindControl("MasterBody")).Attributes["class"] = "";
            }
        }

        private void SetCookie()
        {
            HttpContextUtility.SetNoCache();
            sUrlReferer = "gsauth"; // ApplicationContext.G().REFERER_SITE;
            CookieUtility.SetCookie("REFERER_SITE", sUrlReferer);
            DomainSite = "gsauth"; // ApplicationContext.G().REFERER_SITE_DOMAIN(sUrlReferer);
        }



    }
}