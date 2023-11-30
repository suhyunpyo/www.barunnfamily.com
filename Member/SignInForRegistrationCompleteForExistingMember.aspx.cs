using BarunnIntergrationService.Common;
using BarunnIntergrationService.Common.Databases;
using BarunnIntergrationService.Common.ExtensionMethod;
using BarunnIntergrationService.Common.Utillity;
using BarunnIntergrationService.Service.Member;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace BarunnIntergrationService.Member
{
    public partial class SignInForRegistrationCompleteForExistingMember : System.Web.UI.Page
    {	
		protected void Page_Load(object sender, EventArgs e)
        {
            ((HtmlGenericControl)Master.FindControl("MasterBody")).Attributes["class"] = "apcom_p member_c";

			string CertID  = Request.Value("certID");
			if (string.IsNullOrEmpty(CertID))
			{
				Response.RedirectForReferer();
				Response.End(); ;
			}

			var dbResult = UserCertificationLogUtility.GetUserCertificationLog(CertID);
			if (dbResult == null)
			{
				Response.RedirectForReferer();
				Response.End();
			}

		

			SelectUserInfoIntergrationProcesor processor = new SelectUserInfoIntergrationProcesor();
            processor.execute("", "", dbResult.DupInfo);
            SelectUserInfoResult result = processor.getResult();

            if (result.getRowCount() == 0)
            {
                Response.RedirectForReferer();
                Response.End();
            }

            ltrUserID.Text = result.getRow()[0].USER_ID;

            string sRefererSite = CookieUtility.GetCookieValue("REFERER_SITE");
            Member.SignInForCertification.FamilySiteInformationList familySiteInformationList = new Member.SignInForCertification.FamilySiteInformationList();
            int index = familySiteInformationList.FindFamilySiteFromDomainShortName(sRefererSite, 0);
            Member.SignInForCertification.FamilySiteInformation familySiteInformation = familySiteInformationList.familySiteInformationList[index];
            if (Request.IsMobileDevice())
            {
                btnGoLogin.HRef = familySiteInformation.FullUrlMobile + familySiteInformation.LoginUrlMobile;
                btnGoFindPassword.HRef = familySiteInformation.FullUrlMobile + familySiteInformation.FindPasswordUrlMobile;
            }
            else
            {
                btnGoLogin.HRef = familySiteInformation.FullUrl + familySiteInformation.LoginUrl;
                btnGoFindPassword.HRef = familySiteInformation.FullUrl + familySiteInformation.FindPasswordUrl;
            }

            //string strMailingForm = Common.Utillity.FileUtility.FileReadToEnd(Server.MapPath("~/Mail/Template/RegistrationComplete.html"));
            //strMailingForm = strMailingForm.Replace("[::USER_ID::]", result.getRow()[0].USER_ID);
            //strMailingForm = strMailingForm.Replace("[::LOGO_IMAGE_URL::]", "http://www.barunnfamily.com" + familySiteInformation.LogoImageUrl);
            //strMailingForm = strMailingForm.Replace("[::CS_CENTER_PHONE::]", familySiteInformation.CsCenterNumber);
            //string strMailingTitle = "[" + familySiteInformation.SiteName + "] 회원이 되신것을 환영합니다.";
            
            //InsertUserSecessionComment InsertUserSecessionComment = new InsertUserSecessionComment();
            //InsertUserSecessionComment.execute(ShopDatabaseFactory.createCommandInsertTneoQueue("[RegistrationComplete]", familySiteInformation.SiteName, "no-reply@barunn.com", "", "", strMailingTitle, strMailingForm, result.getRow()[0].USER_ID));

            string sUrlReferer = ApplicationContext.G().REFERER_SITE;
            divAffiliated.Visible = (ApplicationContext.G().IS_REFERER_FAMILY_SITE_FOR_JEHU(sUrlReferer) == false);

            // 히든처리 -  임시 요청
            divAffiliated.Visible = false;
        }
    }
}