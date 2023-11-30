using BarunnIntergrationService.Common;
using BarunnIntergrationService.Common.ExtensionMethod;
using BarunnIntergrationService.Common.Utillity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BarunnIntergrationService.Master
{
    public partial class Site : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContextUtility.SetNoCache();

            try
            {
                string sUrlReferer = ApplicationContext.G().REFERER_SITE;

                if (ApplicationContext.G().IS_REFERER_FAMILY_SITE(sUrlReferer))
                {
                    CookieUtility.SetCookie("REFERER_SITE", sUrlReferer);
                }

                initializeRefererLogo(sUrlReferer);
                initializeMasterPage();
            }
            catch
            { }
        }

        public void initializeRefererLogo(string sRefererSite)
        {
            
            Member.SignInForCertification.FamilySiteInformationList familySiteInformationList = new Member.SignInForCertification.FamilySiteInformationList();
            int index = familySiteInformationList.FindFamilySiteFromDomainShortName(sRefererSite, 0);
            Member.SignInForCertification.FamilySiteInformation familySiteInformation = familySiteInformationList.familySiteInformationList[index];

            //Response.Write("<br >" + sRefererSite + "<br >");
            //Response.Write("<br >" + index.ToString() + "<br >");

            ltrRefererLogo.Text = "<a href='" + familySiteInformation.FullUrl + "' target='_blank'><img src='" + familySiteInformation.LogoImageUrl + "' alt='" + familySiteInformation.SiteName + "'></a>";

            if (String.IsNullOrEmpty(familySiteInformation.BizSpringLoggerServiceNumber) == false)
            {
                ltrBizSpringLoggerScript.Text = Common.LoggerScript.BizSpringLoggerScript.GetDefaultScript(familySiteInformation.BizSpringLoggerServiceNumber, familySiteInformation.BizSpringLoggerServiceDomain);
            }

        }

        public void initializeMasterPage()
        {
            ltrMasterPageMetaTag.Text = createMasterPageMetaTag();
            ltrMasterPageStyleSheet.Text = createMasterPageStyleSheet();
        }

        public String createMasterPageMetaTag()
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine(@"<meta http-equiv=""Content-Type"" content=""text/html; charset=utf-8"">");
            sb.AppendLine(@"<meta http-equiv=""X-UA-Compatible"" content=""IE=edge,chrome=1"">");
            if (Request.IsMobileDevice() )
            {
                sb.AppendLine(@"<meta name=""viewport"" content=""width=device-width"">");
            }
            else
            {
                sb.AppendLine(@"<meta name=""viewport"" content=""width=1100"" />");
            }
            return sb.ToString();
        }

        public String createMasterPageStyleSheet()
        {
            StringBuilder sb = new StringBuilder();
            if (Request.IsMobileDevice())
            {
                sb.AppendLine(@"<link rel=""stylesheet"" type=""text/css"" href=""/resources/css/layout_mobile_origin.css"">");
            }
            return sb.ToString();
        }


    }
}