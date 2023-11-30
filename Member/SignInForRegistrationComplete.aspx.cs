using BarunnIntergrationService.Common;
using BarunnIntergrationService.Common.Databases;
using BarunnIntergrationService.Common.ExtensionMethod;
using BarunnIntergrationService.Common.Utillity;
using BarunnIntergrationService.Service;
using System;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace BarunnIntergrationService.Member
{
    public partial class SignInForRegistrationComplete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ((HtmlGenericControl)Master.FindControl("MasterBody")).Attributes["class"] = "apcom_p";

            string sUserId = Request.Value("USER_ID");
            string celemoUrl = "http://www.celemo.co.kr/member_process/callback_regist_by_intergration";
            string getData = "userid=" + sUserId;
            WebRequestUtility.HTTP_GET(celemoUrl, getData);

            string sRefererSite = CookieUtility.GetCookieValue("REFERER_SITE");
            Member.SignInForCertification.FamilySiteInformationList familySiteInformationList = new Member.SignInForCertification.FamilySiteInformationList();
            int index = familySiteInformationList.FindFamilySiteFromDomainShortName(sRefererSite, 0);
            Member.SignInForCertification.FamilySiteInformation familySiteInformation = familySiteInformationList.familySiteInformationList[index];
            if (Request.IsMobileDevice())
            {
                btnGoLogin.HRef = familySiteInformation.FullUrlMobile + familySiteInformation.LoginUrlMobile;
            }
            else
            {
                btnGoLogin.HRef = familySiteInformation.FullUrl + familySiteInformation.LoginUrl;
            }

            string strMailingForm = Common.Utillity.FileUtility.FileReadToEnd(Server.MapPath("~/Mail/Template/RegistrationComplete.html"));
            strMailingForm = strMailingForm.Replace("[::USER_ID::]", sUserId);
            strMailingForm = strMailingForm.Replace("[::LOGO_IMAGE_URL::]", "https://www.barunnfamily.com" + familySiteInformation.LogoImageUrl);
            strMailingForm = strMailingForm.Replace("[::CS_CENTER_PHONE::]", familySiteInformation.CsCenterNumber);
            string strMailingTitle = "[" + familySiteInformation.SiteName + "] 회원이 되신것을 환영합니다.";

            InsertUserSecessionComment InsertUserSecessionComment = new InsertUserSecessionComment();
            InsertUserSecessionComment.execute(ShopDatabaseFactory.createCommandInsertTneoQueue("[RegistrationComplete]", familySiteInformation.SiteName, "no-reply@barunn.net", "", "", strMailingTitle, strMailingForm, sUserId));

            string sUrlReferer = ApplicationContext.G().REFERER_SITE;
            divAffiliated.Visible = (ApplicationContext.G().IS_REFERER_FAMILY_SITE_FOR_JEHU(sUrlReferer) == false);

            // 히든처리 -  임시 요청
            divAffiliated.Visible = false;

            // Biz Spring Logger 비즈 스프링 로거
            if (String.IsNullOrEmpty(familySiteInformation.BizSpringLoggerServiceNumber) == false)
            {
                ((Literal)Master.FindControl("ltrBizSpringLoggerScriptForRegistrationComplete")).Text = Common.LoggerScript.BizSpringLoggerScript.GetSignUpScript();
            }
        }
    }

    public class InsertUserSecessionComment : AbstractIntergrationProcessor
    {
        public Boolean Success { get; set; }
        public void execute(ProcedureCallCommand pcc)
        {
            initConnector();

            try
            {
                insertTneoQueue(pcc);
                Success = true;
            }
            catch (Exception ex)
            {
                Console.Write(ex.Message);
                Success = false;
                rollBack();
            }
            finally
            {
                commit();
            }

            closeConnector();
        }

        private void insertTneoQueue(ProcedureCallCommand pcc)
        {
            ProcedureCallCommand command = pcc;
            m_shopConnector.Execute(command);
        }
    }
}