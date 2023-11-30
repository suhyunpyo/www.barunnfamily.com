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
    public partial class SignInForTermsAgreement : System.Web.UI.Page
    {

        public string sCertID;
        string sDupInfo;
		public string sSelectSiteCode;
        public string sSelectCustomUserId;

        protected void Page_Load(object sender, EventArgs e)
        {
            LogUtility.LogWrite("SignInForTermsAgreement", "SignInTest", "SignInForTermsAgreement 이페이지 열렸습니다.", "페이지 확인");
            
            ((HtmlGenericControl)Master.FindControl("MasterBody")).Attributes["class"] = "term_p";
            ((HtmlForm)Master.FindControl(ApplicationContext.G().MAIN_FORM_ID)).Attributes["action"] = "/Member/SignInForEnterCustomerInformation.aspx";

            sCertID = Request.Value("CertID");
			sDupInfo = Server.UrlDecode(Request.Value("DupInfo"));
			sSelectSiteCode = Request.Value("rdoSelectSiteCode");
			sSelectCustomUserId = Request.Value("SelectCustomUserId");


			if (string.IsNullOrEmpty(sCertID) && string.IsNullOrEmpty(sDupInfo))
			{
				Response.RedirectForReferer();
				Response.End(); ;
			}

            if (string.IsNullOrEmpty(sDupInfo))
            {
                var dbResult = UserCertificationLogUtility.GetUserCertificationLog(sCertID);
                if (dbResult == null)
                {
                    Response.RedirectForReferer();
                    Response.End();
                }

                sDupInfo = dbResult.DupInfo;
            }


            if (String.IsNullOrEmpty(sDupInfo) )
            {
                Response.RedirectForReferer();
                Response.End();
            }

            string sRefererSite = CookieUtility.GetCookieValue("REFERER_SITE");
            Member.SignInForCertification.FamilySiteInformationList familySiteInformationList = new Member.SignInForCertification.FamilySiteInformationList();
            int index = familySiteInformationList.FindFamilySiteFromDomainShortName(sRefererSite, 0);
            Member.SignInForCertification.FamilySiteInformation familySiteInformation = familySiteInformationList.familySiteInformationList[index];

            SelectUserInfoIntergrationProcesor processor = new SelectUserInfoIntergrationProcesor();
            processor.execute("", "", sDupInfo);
            SelectUserInfoResult result = processor.getResult();

            bool isVisibleAddTermsAgreement = true;
            bool isVisibleTermsAgreementTitleForNewMember = true;
            
            /* 신규 회원 가입 - 셀레모 일 경우 */
            if (result.getRowCount() == 0 && familySiteInformation.DomainShortName == "celemo")
            {
                isVisibleAddTermsAgreement = false;
            }

            if (sRefererSite.ToUpper().Contains("SHINHAN"))
            {
                isVisibleAddTermsAgreement = false;
            }

            /* 기존 회원 가입 */
            if (result.getRowCount() > 0)
            {
                isVisibleAddTermsAgreement = true;
                isVisibleTermsAgreementTitleForNewMember = false;
            }

            wrapThirdPartyAgreement.Visible = isVisibleAddTermsAgreement;
            wrapThirdPartyAgreementTelecom.Visible = isVisibleAddTermsAgreement;

            wrapSamsungAgreement.Visible = isVisibleAddTermsAgreement;

            //LG전자 추가
            wrapLGAgreement.Visible = isVisibleAddTermsAgreement;

            wrapCsAgreement.Visible = isVisibleAddTermsAgreement;   // 까사미아


            /**
             * 롯데묘미 추가 2018-02-19
             * 롯데묘미 삭제 2018-07-31 이후로 삭제
             */
            DateTime dateTime = DateTime.UtcNow.Date;
            int intToday = Int32.Parse(dateTime.ToString("yyyyMMdd"));
            if (intToday > 20180731)
            {
                wrapMyomeeAgreement.Visible = false;
            }
            else
            {
                wrapMyomeeAgreement.Visible = isVisibleAddTermsAgreement;
            }


            wrapNewMember.Visible = isVisibleTermsAgreementTitleForNewMember;
            wrapExistingMember.Visible = (isVisibleTermsAgreementTitleForNewMember == false);


            ltrHiddenField.Text = CreateHiddenField();

            InitCompanySeq(CookieUtility.GetCookieValue("REFERER_SITE"));
        }

        public void InitCompanySeq(string DomainSite)
        {
            if (DomainSite == "barunsoncard")
            {
                Session.Add("companySeq", "5001");
                Session.Add("saleGubun", "SB");
            }
            else if (DomainSite == "bhandscard")
            {
                Session.Add("companySeq", "5006");
                Session.Add("saleGubun", "SA");
            }
            else if (DomainSite == "thecard")
            {
                Session.Add("companySeq", "5007");
                Session.Add("saleGubun", "ST");
            }
            else if (DomainSite == "barunsonmall")
            {
                Session.Add("companySeq", "5000");
                Session.Add("saleGubun", "B");
            }
            else if (DomainSite == "premierpaper")
            {
                Session.Add("companySeq", "5003");
                Session.Add("saleGubun", "SS");
            }
            //20210419 표수현 추가 
            else if (DomainSite == "barunsonmcard")
            {
                Session.Add("companySeq", "8029");
                Session.Add("saleGubun", "BM");
            }
        }

        public string CreateHiddenField()
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine("<input type=\"hidden\" name=\"CertID\"           id=\"CertID\" value=\"" + sCertID + "\" />");
            sb.AppendLine("<input type=\"hidden\" name=\"DupInfo\"                  id=\"DupInfo\"        value=\"" + Server.UrlEncode(sDupInfo) + "\" />");            
            sb.AppendLine("<input type=\"hidden\" name=\"rdoSelectSiteCode\"        id=\"rdoSelectSiteCode\"        value=\"" + sSelectSiteCode + "\" />");
            sb.AppendLine("<input type=\"hidden\" name=\"SelectCustomUserId\"      id=\"SelectCustomUserId\"        value=\"" + sSelectCustomUserId + "\" />");
            return sb.ToString();
        }
    }
}