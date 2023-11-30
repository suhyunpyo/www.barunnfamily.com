using BarunnIntergrationService.Common;
using BarunnIntergrationService.Common.Databases;
using BarunnIntergrationService.Common.ExtensionMethod;
using BarunnIntergrationService.Common.Utillity;
using System;
using System.Text;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace BarunnIntergrationService.Member
{
    public partial class PremierForRegistrationComplete : System.Web.UI.Page
    {
        protected string MobileYN = "";
        protected string sb = "";
        protected string sUserId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.IsMobileDevice()) MobileYN = "Y";
            else MobileYN = "N";

            if (Request.IsMobileDevice())
            {
                sb = "http://m.premierpaper.co.kr";
            }
            else
            {
                sb = "http://www.premierpaper.co.kr";
            }

            HttpContextUtility.SetNoCache();
            ((HtmlGenericControl)Master.FindControl("MasterBody")).Attributes["class"] = "apcom_p";
            Session["JOIN_STEP"] = "3";
            sUserId = Request.Value("USER_ID");

#if DEBUG
            //sUserId = "yongjae030";
            //sUserDinfo = "MC0GCCqGSIb3DQIJAyEAIDmRDLoiAN/MsR/3bUalR2swCYnhImW+LPY2/F5zQH8=";
#endif

            string getData = "userid=" + sUserId;
            Session["sUserId"] = sUserId;

            //userId.Value = sUserId;
            //userDinfo.Value = sUserDinfo;
            ltrBrandUrl.Text = createBrandURL();

            //userId.Value = sUserId;
            //userPW.Value = 
            string sRefererSite = CookieUtility.GetCookieValue("REFERER_SITE");
            Member.SignInForCertification.FamilySiteInformationList familySiteInformationList = new Member.SignInForCertification.FamilySiteInformationList();
            int index = familySiteInformationList.FindFamilySiteFromDomainShortName(sRefererSite, 0);
            Member.SignInForCertification.FamilySiteInformation familySiteInformation = familySiteInformationList.familySiteInformationList[index];


            //ltrBrandName.Text = createBrandName(familySiteInformation.SiteCode);
                

            string strMailingTitle = "[" + familySiteInformation.SiteName + "] 회원이 되신것을 환영합니다.";

            InsertUserSecessionComment InsertUserSecessionComment = new InsertUserSecessionComment();
            InsertUserSecessionComment.execute(ShopDatabaseFactory.createCommandInsertTneoQueue("[RegistrationComplete]", familySiteInformation.SiteCode, "no-reply@barunn.net", "", "", strMailingTitle, "", sUserId));

            string sUrlReferer = ApplicationContext.G().REFERER_SITE;

            // Biz Spring Logger 비즈 스프링 로거
            if (String.IsNullOrEmpty(familySiteInformation.BizSpringLoggerServiceNumber) == false)
            {
                ((Literal)Master.FindControl("ltrBizSpringLoggerScriptForRegistrationComplete")).Text = Common.LoggerScript.BizSpringLoggerScript.GetSignUpScript();
            }
        }

        public String createBrandURL()
        {
            StringBuilder sb = new StringBuilder();
            //DomainSite = "thecard";

            if (Request.IsMobileDevice())
            {
                sb.AppendLine(@"<div class='b_btn_a'><a href='http://m.premierpaper.co.kr/' target='_parent' class='b_btn type2 right'><span>홈으로 가기</span></a></div>");
            }
            else
            {
                sb.AppendLine(@"<div class='b_btn_a'><a href='http://www.premierpaper.co.kr/' target='_parent' class='b_btn type2 right'><span>홈으로 가기</span></a></div>");
            }
            return sb.ToString();
        }


    }
}
