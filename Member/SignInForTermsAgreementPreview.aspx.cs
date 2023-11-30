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
    public partial class SignInForTermsAgreementPreview : System.Web.UI.Page
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
            //sParamR1 = Request.Value("param_r1");
            //sParamR2 = Request.Value("param_r2");
            //sParamR3 = Request.Value("param_r3");
            sConnInfo = Server.UrlDecode(Request.Value("ConnInfo"));
            sDupInfo = Server.UrlDecode(Request.Value("DupInfo"));
            sAuthType = Request.Value("AuthType");
            sSelectSiteCode = Request.Value("rdoSelectSiteCode");
            sSelectCustomUserId = Request.Value("SelectCustomUserId");

            bool isVisibleAddTermsAgreement = true;
            bool isVisibleTermsAgreementTitleForNewMember = true;
            
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
            //sb.AppendLine("<input type=\"hidden\" name=\"param_r1\"                 id=\"param_r1\"       value=\"" + sParamR1 + "\" />");
            //sb.AppendLine("<input type=\"hidden\" name=\"param_r2\"                 id=\"param_r2\"       value=\"" + sParamR2 + "\" />");
            //sb.AppendLine("<input type=\"hidden\" name=\"param_r3\"                 id=\"param_r3\"       value=\"" + sParamR3 + "\" />");
            sb.AppendLine("<input type=\"hidden\" name=\"ConnInfo\"                 id=\"ConnInfo\"       value=\"" + sConnInfo + "\" />");
            sb.AppendLine("<input type=\"hidden\" name=\"DupInfo\"                  id=\"DupInfo\"        value=\"" + sDupInfo + "\" />");
            sb.AppendLine("<input type=\"hidden\" name=\"AuthType\"                 id=\"AuthType\"        value=\"" + sAuthType + "\" />");
            sb.AppendLine("<input type=\"hidden\" name=\"rdoSelectSiteCode\"        id=\"rdoSelectSiteCode\"        value=\"" + sSelectSiteCode + "\" />");
            sb.AppendLine("<input type=\"hidden\" name=\"SelectCustomUserId\"      id=\"SelectCustomUserId\"        value=\"" + sSelectCustomUserId + "\" />");
            return sb.ToString();
        }
    }
}