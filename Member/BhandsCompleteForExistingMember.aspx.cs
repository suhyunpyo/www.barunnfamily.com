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
    public partial class BhandsCompleteForExistingMember : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ((HtmlGenericControl)Master.FindControl("MasterBody")).Attributes["class"] = "";

			string certID = Request.Value("certID");
			if (string.IsNullOrEmpty(certID))
			{
				Response.RedirectForReferer();
				Response.End(); ;
			}

			var dbResult = UserCertificationLogUtility.GetUserCertificationLog(certID);
			if (dbResult == null)
			{
				Response.RedirectForReferer();
				Response.End();
			}

			string sDupInfo = dbResult.DupInfo;

			//--인증정보 삭제
			//UserCertificationLogUtility.DeleteUserCertificationLog(certID);

			SelectUserInfoIntergrationProcesor processor = new SelectUserInfoIntergrationProcesor();
            processor.execute("", "", sDupInfo);
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
            if (Request.IsMobileDevice() )
            {
                btnGoLogin.HRef = familySiteInformation.FullUrlMobile + familySiteInformation.LoginUrlMobile;
                btnGoFindPassword.HRef = familySiteInformation.FullUrlMobile + familySiteInformation.FindPasswordUrlMobile;
            }
            else
            {
                btnGoLogin.HRef = familySiteInformation.FullUrl + familySiteInformation.LoginUrl;
                btnGoFindPassword.HRef = familySiteInformation.FullUrl + familySiteInformation.FindPasswordUrl;
            }

            string sUrlReferer = ApplicationContext.G().REFERER_SITE;
            //divAffiliated.Visible = (ApplicationContext.G().IS_REFERER_FAMILY_SITE_FOR_JEHU(sUrlReferer) == false);

            // 히든처리 -  임시 요청
            //divAffiliated.Visible = false;
        }
    }
}