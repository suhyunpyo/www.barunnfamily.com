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
    public partial class SignInForTermsAgreement_20170427 : System.Web.UI.Page
    {
        public string sAuthModuleType;
        public string sEncodeData;
        public string sParamR1;
        public string sParamR2;
        public string sParamR3;
        public string sConnInfo;
        public string sDupInfo;
        public string sAuthType;
        public string sSelectSiteCode;
        public string sSelectCustomUserId;

        protected void Page_Load(object sender, EventArgs e)
        {
            ((HtmlGenericControl)Master.FindControl("MasterBody")).Attributes["class"] = "term_p";
            ((HtmlForm)Master.FindControl(ApplicationContext.G().MAIN_FORM_ID)).Attributes["action"] = "/Member/SignInForEnterCustomerInformation.aspx";

            sAuthModuleType = Request.Value("AuthModuleType");
            sEncodeData = Request.Value("EncodeData");
            sParamR1 = Request.Value("param_r1");
            sParamR2 = Request.Value("param_r2");
            sParamR3 = Request.Value("param_r3");
            sConnInfo = Server.UrlDecode(Request.Value("ConnInfo"));
            sDupInfo = Server.UrlDecode(Request.Value("DupInfo"));
            sAuthType = Request.Value("AuthType");
            sSelectSiteCode = Request.Value("rdoSelectSiteCode");
            sSelectCustomUserId = Request.Value("SelectCustomUserId");

#if DEBUG
            //sDupInfo = "MC0GCCqGSIb3DQIJAyEAgQMn9E0TJmup1Yu5+Ws1cmQPM5Io02lOWvzoC0hwn0o=";
            //sEncodeData = "AgAERjU5NNdkvlKRUvedv77BqyiGCeHeBfrlvUqk3G3BaOHnyjGYzn5UQ0nlniBk3hCg/4L1tCdvP7S8ra9oPE83gR9I0Z0GZx3Hc3tUfTo/HJtuouGXyfvN+xn74nuxU4hkTp57BSlsG7rbEJrHd3/tVganxjLw22AGrJwekZVNlkNmeKOJ697lbbsVdryf5sHHQCIOhcgBCKl7sVA6/Vg3iLMcmKcYR8OV4g3MAYUtZ0ipOtqjiGN7tpn7+cG7bFqLXPeqzFlS7Gn1W2TEwfi454ChcP30gxfqR5aE94+g9ApRrL2/z4vzPJLGWbJR3SkJ3RH2juFTV4uYeBFi9dXfxSRV17DgXZNns42ihp1jsr2CPYfPdlJBGHxC3P+InPIBsUflYNbh9BqewWO7kDHHyWq6hypvgWnXz+Ki3oBORJty4BqiD+xP1llvYJIp9AOi35+Dgcc6paJjfg/S9WTnkMb63KXpKLht8wG+50omMQy4VzQ1wWg3A1567nZar7CwrAdqqA8HQeWUfTfuUUgoW81x94aV1sfjXWa/BUPjQLgsjm5iUG8BE51DGt22WiiPJpC6IPPWW3UNrTwCSHov7/nO9q287JUAHI61HsLSqst9tfjReeuEsYgxPm4EnBI6uwpSgd8SQEwPXBpKmvEQ5LwWijvcNtcoEVclvOuzXssydPG2wXBDErEYz7O2+mnCbLhoQ8ImsZWVxzRkTiILMmRzOuIddHZ9MM6GZqY9Kzyy5yekGj60J/1vJmIAfQ4qR0eVKg==";
            //sAuthModuleType = "IPIN";
#endif

            if (String.IsNullOrEmpty(sDupInfo) && String.IsNullOrEmpty(sEncodeData))
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
                isVisibleAddTermsAgreement = false;
                isVisibleTermsAgreementTitleForNewMember = false;
            }

            /* BeWedding 회원 가입 (신규, 기존(통합회원 전환하기 이전 고객)) 모두 대상 - 임시 170206 */
            /* 비웨딩 고객도 제3자 마케팅 동의 받도록 수정 - 170221 */
            //if (familySiteInformation.DomainShortName == "bewedding")
            //{
            //    isVisibleAddTermsAgreement = false;
            //}

#if DEBUG
            isVisibleAddTermsAgreement = true;
            isVisibleTermsAgreementTitleForNewMember = true;
#endif

            wrapThirdPartyAgreement.Visible = isVisibleAddTermsAgreement;
            wrapThirdPartyAgreementTelecom.Visible = isVisibleAddTermsAgreement;
            wrapThirdPartyAgreementInsurance.Visible = isVisibleAddTermsAgreement;

            wrapSamsungAgreement.Visible = isVisibleAddTermsAgreement;
            wrapNewMember.Visible = isVisibleTermsAgreementTitleForNewMember;
            wrapExistingMember.Visible = (isVisibleTermsAgreementTitleForNewMember == false);


            ltrHiddenField.Text = CreateHiddenField();
        }

        public string CreateHiddenField()
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine("<input type=\"hidden\" name=\"AuthModuleType\"           id=\"AuthModuleType\" value=\"" + sAuthModuleType + "\" />");
            sb.AppendLine("<input type=\"hidden\" name=\"EncodeData\"               id=\"EncodeData\"     value=\"" + sEncodeData + "\" />");
            sb.AppendLine("<input type=\"hidden\" name=\"param_r1\"                 id=\"param_r1\"       value=\"" + sParamR1 + "\" />");
            sb.AppendLine("<input type=\"hidden\" name=\"param_r2\"                 id=\"param_r2\"       value=\"" + sParamR2 + "\" />");
            sb.AppendLine("<input type=\"hidden\" name=\"param_r3\"                 id=\"param_r3\"       value=\"" + sParamR3 + "\" />");
            sb.AppendLine("<input type=\"hidden\" name=\"ConnInfo\"                 id=\"ConnInfo\"       value=\"" + sConnInfo + "\" />");
            sb.AppendLine("<input type=\"hidden\" name=\"DupInfo\"                  id=\"DupInfo\"        value=\"" + sDupInfo + "\" />");
            sb.AppendLine("<input type=\"hidden\" name=\"AuthType\"                 id=\"AuthType\"        value=\"" + sAuthType + "\" />");
            sb.AppendLine("<input type=\"hidden\" name=\"rdoSelectSiteCode\"        id=\"rdoSelectSiteCode\"        value=\"" + sSelectSiteCode + "\" />");
            sb.AppendLine("<input type=\"hidden\" name=\"SelectCustomUserId\"      id=\"SelectCustomUserId\"        value=\"" + sSelectCustomUserId + "\" />");
            return sb.ToString();
        }
    }
}