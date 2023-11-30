using BarunnIntergrationService.Common;
using BarunnIntergrationService.Common.Databases;
using BarunnIntergrationService.Common.ExtensionMethod;
using BarunnIntergrationService.Common.Utillity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BarunnIntergrationService.Member
{
    public partial class BarunsonMcardForRegistrationComplete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContextUtility.SetNoCache();
            Session["JOIN_STEP"] = "3";
            string sUserId = Request.Value("USER_ID");

            string getData = "userid=" + sUserId;

            Session["sUserId"] = sUserId;
     

            string sRefererSite = ApplicationContext.G().REFERER_SITE;
            //Response.Write(sRefererSite);
            Member.SignInForCertification.FamilySiteInformationList familySiteInformationList = new Member.SignInForCertification.FamilySiteInformationList();
            int index = familySiteInformationList.FindFamilySiteFromDomainShortName(sRefererSite, 0);
            Member.SignInForCertification.FamilySiteInformation familySiteInformation = familySiteInformationList.familySiteInformationList[index];

            //ltrBrandName.Text = createBrandName(familySiteInformation.DomainShortName);
            //ltrBrandUrl.Text = createBrandURL(familySiteInformation.DomainShortName);

            string strMailingTitle = "[" + familySiteInformation.SiteName + "] 회원이 되신것을 환영합니다.";

            InsertUserSecessionComment InsertUserSecessionComment = new InsertUserSecessionComment();
            InsertUserSecessionComment.execute(ShopDatabaseFactory.createCommandInsertTneoQueue("[RegistrationComplete]", familySiteInformation.SiteCode, "no-reply@barunn.net", "", "", strMailingTitle, "", sUserId));

            //string sUrlReferer = ApplicationContext.G().REFERER_SITE;

            // Biz Spring Logger 비즈 스프링 로거
            if (String.IsNullOrEmpty(familySiteInformation.BizSpringLoggerServiceNumber) == false)
            {
                //((Literal)Master.FindControl("ltrBizSpringLoggerScriptForRegistrationComplete")).Text = Common.LoggerScript.BizSpringLoggerScript.GetSignUpScript();
            }


        }

        public String createBrandName(string param)
        {
            StringBuilder sb = new StringBuilder();
            //DomainSite = "thecard";

            if (param == "barunsoncard")
            {
                sb.AppendLine(@"<p class='txt'>바른손카드는 <strong>감동의 순간</strong>을 위해<br/>최선을 다하겠습니다.</p>");
            }
            else
            {
                sb.AppendLine(@"<p class='txt'>바른손몰은 <strong>감동의 순간</strong>을 위해<br/>최선을 다하겠습니다.</p>");
            }
            return sb.ToString();
        }





        public String createBrandURL(string param)
        {
            //StringBuilder sb = new StringBuilder();
            ////DomainSite = "thecard";

            //if (param == "barunsoncard")
            //{
            //    if (Request.IsMobileDevice())
            //    {
            //        sb.AppendLine(@"<a href='http://m.barunsoncard.com/mypage/mypage.asp' target='_parent'><span><img style='max-width:63%' src='../resources/member/img_04.png' alt='마이페이지 바로가기'/></span></a>");
            //    }
            //    else
            //    {
            //        sb.AppendLine(@"<a href='http://www.barunsoncard.com/mypage/ord/list.asp' target='_parent'><span><img style='max-width:63%' src='../resources/member/img_04.png' alt='마이페이지 바로가기'/></span></a>");
            //    }
            //}
            //else
            //{
            //    if (Request.IsMobileDevice())
            //    {
            //        sb.AppendLine(@"<div class='b_btn_a'><a href='http://m.barunsonmall.com/' target='_parent' class='b_btn type2 right'><span>홈으로 가기</span></a></div>");
            //    }
            //    else
            //    {
            //        sb.AppendLine(@"<div class='b_btn_a'><a href='http://www.barunsonmall.com/' target='_parent' class='b_btn type2 right'><span>홈으로 가기</span></a></div>");
            //    }
            //}


            StringBuilder sb = new StringBuilder();
            //DomainSite = "thecard";

            if (param == "barunsoncard")
            {
                if (Request.IsMobileDevice())
                {
                    sb.AppendLine(@"<div class='b_btn_a'><a href='http://m.barunsoncard.com/mypage/mypage.asp' target='_parent' class='b_btn type2 right'><span>홈으로 가기</span></a></div>");
                }
                else
                {
                    sb.AppendLine(@"<div class='b_btn_a'><a href='http://www.barunsoncard.com/mypage/ord/list.asp' target='_parent' class='b_btn type2 right'><span>홈으로 가기</span></a></div>");
                }

            }
            else
            {
                if (Request.IsMobileDevice())
                {
                    sb.AppendLine(@"<div class='b_btn_a'><a href='http://m.barunsonmall.com/' target='_parent' class='b_btn type2 right'><span>홈으로 가기</span></a></div>");
                }
                else
                {
                    sb.AppendLine(@"<div class='b_btn_a'><a href='http://www.barunsonmall.com/' target='_parent' class='b_btn type2 right'><span>홈으로 가기</span></a></div>");
                }
            }
            return sb.ToString();
        }


    }
}