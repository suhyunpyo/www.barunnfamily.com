using BarunnIntergrationService.Common;
using BarunnIntergrationService.Common.ExtensionMethod;
using BarunnIntergrationService.Common.Utillity;
using System;
using System.Text;
using System.Web.UI.HtmlControls;

namespace BarunnIntergrationService.Member
{
    public partial class ThecardForRegistrationComplete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ((HtmlGenericControl)Master.FindControl("MasterBody")).Attributes["class"] = "apcom_p";
            Session["JOIN_STEP"] = "3";

            string sUserId = Request.Value("USER_ID");

            //userId.Value = sUserId;
            //userDinfo.Value = sUserDinfo;
            Session["sUserId"] = sUserId;


            ltrBrandUrl.Text = createBrandURL();

            string sRefererSite = CookieUtility.GetCookieValue("REFERER_SITE");
            Member.SignInForCertification.FamilySiteInformationList familySiteInformationList = new Member.SignInForCertification.FamilySiteInformationList();
            int index = familySiteInformationList.FindFamilySiteFromDomainShortName(sRefererSite, 0);
            Member.SignInForCertification.FamilySiteInformation familySiteInformation = familySiteInformationList.familySiteInformationList[index];

            string strMailingTitle = "[" + familySiteInformation.SiteName + "] 회원이 되신것을 환영합니다.";

            //InsertUserSecessionComment InsertUserSecessionComment = new InsertUserSecessionComment();
            //InsertUserSecessionComment.execute(ShopDatabaseFactory.createCommandInsertTneoQueue("[RegistrationComplete]", familySiteInformation.SiteCode, "no-reply@barunn.net", "", "", strMailingTitle, "", sUserId));

            string sUrlReferer = ApplicationContext.G().REFERER_SITE;

            //// Biz Spring Logger 비즈 스프링 로거
            //if (String.IsNullOrEmpty(familySiteInformation.BizSpringLoggerServiceNumber) == false)
            //{
            //    ((Literal)Master.FindControl("ltrBizSpringLoggerScriptForRegistrationComplete")).Text = Common.LoggerScript.BizSpringLoggerScript.GetSignUpScript();
            //}
        }


        public String createBrandURL()
        {
            StringBuilder sb = new StringBuilder();
            //DomainSite = "thecard";

            if (Request.IsMobileDevice())
            {
                sb.AppendLine(@"<div class='b_btn_a'><a href='http://m.thecard.co.kr/' target='_parent' class='b_btn type2' style=margin-left:0px !important; margin-top:0px !important;'><span>홈으로 가기</span></a></div>");
            }
            else
            {
                sb.AppendLine(@"<div class='b_btn_a'><a href='http://www.thecard.co.kr/' target='_parent' class='b_btn type2' style=margin-left:0px !important; margin-top:0px !important;'><span>홈으로 가기</span></a></div>");
            }
            return sb.ToString();
        }

    }
}
