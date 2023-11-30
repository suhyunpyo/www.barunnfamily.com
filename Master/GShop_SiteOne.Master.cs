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
    public partial class GShop_SiteOne : System.Web.UI.MasterPage
    {
        public string DomainSite = "";
        public string JoinStep = "";
        public string sFileName = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContextUtility.SetNoCache();

            JoinStep = (Session["JOIN_STEP"] == null ? "" : Session["JOIN_STEP"].ToString());
            userId.Value = (Session["sUserId"] == null ? "" : Session["sUserId"].ToString());           

            sFileName = System.IO.Path.GetFileName(Request.Url.LocalPath);

            try
            {
                string sUrlReferer = "gsauth"; // ApplicationContext.G().REFERER_SITE;
                CookieUtility.SetCookie("REFERER_SITE", sUrlReferer);

                //if (ApplicationContext.G().IS_REFERER_FAMILY_SITE(sUrlReferer))
                //{
                //    CookieUtility.SetCookie("REFERER_SITE", sUrlReferer);
                //}


                initializeRefererLogo(sUrlReferer);
                initializeMasterPage();

            }
            catch
            { }
        }

        public void initializeMasterPage()
        {
            ltrMasterPageMetaTag.Text = createMasterPageMetaTag();
            ltrMasterPageStyleSheet.Text = createMasterPageStyleSheet();
            // ContentNavigation.Text = createMasterPageNavigation();

        }

        public String createMasterPageMetaTag()
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine(@"<meta http-equiv=""Content-Type"" content=""text/html; charset=utf-8"">");
            sb.AppendLine(@"<meta http-equiv=""X-UA-Compatible"" content=""ie=edge"">");
            if (Request.IsMobileDevice()) 
            {
                sb.AppendLine(@"<meta name=""viewport"" content=""width=device-width"">");
            }
            else
            {
                sb.AppendLine(@"<meta name=""viewport"" content=""width=1100"" />");
            }
            return sb.ToString();
        }

        public void initializeRefererLogo(string sRefererSite)
        {
            Member.SignInForCertification.FamilySiteInformationList familySiteInformationList = new Member.SignInForCertification.FamilySiteInformationList();
            int index = familySiteInformationList.FindFamilySiteFromDomainShortName(sRefererSite, 0);
            Member.SignInForCertification.FamilySiteInformation familySiteInformation = familySiteInformationList.familySiteInformationList[index];

            DomainSite = familySiteInformation.DomainShortName;
            
        }

        /// <summary>
        /// 사이트별 Style 값 처리
        /// </summary>
        /// <returns></returns>
        public String createMasterPageStyleSheet()
        {
            StringBuilder sb = new StringBuilder();

            sb.AppendLine(@"<link rel=""stylesheet"" type=""text/css"" href=""/resources/css/common.css"">");
            sb.AppendLine(@"<link rel=""stylesheet"" type=""text/css"" href=""/resources/css/layout_member.css"">");


            sb.AppendLine(@"<link rel=""stylesheet"" type=""text/css"" href=""/resources/css/layout_mobile.css"">");


            return sb.ToString();
        }

        private String getDomainName()
        {
            string result = DomainSite;

            if (sFileName.ToLower().Contains("bhands"))
            {
                result = "bhandscard";
            }
            else if (sFileName.ToLower().Contains("premier"))
            {
                result = "premierpaper";
            }
            else if (sFileName.ToLower().Contains("thecard"))
            {
                result = "thecard";
            }
            else if (sFileName.ToLower().Contains("barunson"))
            {
                result = "barunsoncard";
            }

            //20210419 표수현 추가 
            else if (sFileName.ToLower().Contains("barunsonmcard"))
            {
                result = "barunsonmcard";
            }
            else if (sFileName.ToLower().Contains("gsauth"))
            {
                result = "gsauth";
            }

            return result;
        }

        /// <summary>
        /// 사이트별 회원가입 Navi 처리 
        /// 바른손, 비핸즈, 프리미어는 각 사이트에서 띄우기로 하였음.
        /// 내부로직에서 확인하기 위한 작업
        /// </summary>
        /// <returns></returns>
        public String createMasterPageNavigation()
        {
            StringBuilder sb = new StringBuilder();
            //DomainSite = "premierpaper";


            // Response.Write(Session["JOIN_STEP"].ToString());
            sb.AppendLine("<header class=\"header\" style=\"position: static;border-bottom: 1px solid #aaa;padding: 40px 0;background: #fff;\">");
            sb.AppendLine("<div class=\"area\">");
            sb.AppendLine("<h1 style=\"position: static; float: none; margin: 0 auto; text-align: center;left:3%\">" +
                "<a href = \"//www.barunsonmcard.com\" style=\"background:url(/Resources/img_inc/logo_mcard.svg) no-repeat center;display:inline-block; width: 201px; height:24px;text-indent: -99999px;\"> barunsonMcard 로고</a></h1>");
            sb.AppendLine("</div>");
            sb.AppendLine("</header>");


            return sb.ToString();
        }
    }
}