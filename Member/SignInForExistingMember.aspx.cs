using BarunnIntergrationService.Common;
using BarunnIntergrationService.Common.ExtensionMethod;
using BarunnIntergrationService.Common.Utillity;
using BarunnIntergrationService.Service.Member;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace BarunnIntergrationService.Member
{
    public partial class SignInForExistingMember : System.Web.UI.Page
    {
        public string CertID = string.Empty;
        string sDupInfo = string.Empty;        

		protected void Page_Load(object sender, EventArgs e)
        {
            ((HtmlGenericControl)Master.FindControl("MasterBody")).Attributes["class"] = "auth_p";
			
			CertID = Request.Value("certID");
			sDupInfo = Server.UrlDecode(Request.Value("DupInfo")); //--구 연동 방식 사용시


			if (string.IsNullOrEmpty(CertID) && string.IsNullOrEmpty(sDupInfo))
			{
				Response.RedirectForReferer();
				Response.End(); ;
			}

			//--구 연동 방식을 사용하지 않는 경우 certid로 체크
			if (string.IsNullOrEmpty(sDupInfo))
            {
                var dbResult = UserCertificationLogUtility.GetUserCertificationLog(CertID);
                if (dbResult == null)
                {
                    Response.RedirectForReferer();
                    Response.End();
                }

                sDupInfo = dbResult.DupInfo;				
            }

			SelectUserInfoIntergrationProcesor processor = new SelectUserInfoIntergrationProcesor();
            processor.execute("", "", sDupInfo);
            SelectUserInfoResult result = processor.getResult();

            if (result.getRowCount() == 0)
            {
                Response.RedirectForReferer();
				Response.End();
			}

            if (result.getRowCount() == 1)
            {
                ltrInformationMessage.Text = "'<span>" + result.getRow()[0].SITE_KR_NAME + "</span>'의 아이디로 회원에 가입됩니다.<input type=\"hidden\" name=\"rdoSelectSiteCode\" id=\"rdoSelectSiteCode\" value=\"" + result.getRow()[0].SITE_CODE + "\" checked>";
            }
            else
            {
                ltrInformationMessage.Text = "사용을 원하는 아이디를 선택해 주세요.";
            }

            ltrUserName.Text = result.getRow()[0].USER_NAME;
            ltrRegisteredSiteInformation.Text = CreateRegisteredSiteInformationTag(result);
            
            string sActionPageUrl; 

            sActionPageUrl = "/Member/SignInForTermsAgreement.aspx";
            
            ((HtmlForm)Master.FindControl(ApplicationContext.G().MAIN_FORM_ID)).Attributes["action"] = sActionPageUrl;

            ltrHiddenField.Text = CreateHiddenField();
        }

        public string CreateHiddenField()
        {
            StringBuilder sb = new StringBuilder();
            
            sb.AppendLine("<input type=\"hidden\" name=\"CertID\"  id=\"CertID\"     value=\"" + CertID + "\" />");			
			sb.AppendLine("<input type=\"hidden\" name=\"DupInfo\"                  id=\"DupInfo\"        value=\"" + Server.UrlEncode(sDupInfo) + "\" />");
            sb.AppendLine("<input type=\"hidden\" name=\"SelectCustomUserId\"       id=\"SelectCustomUserId\"        value=\"\" />");


			return sb.ToString();
        }

        public string CreateRegisteredSiteInformationTag(SelectUserInfoResult pUserList)
        {
            Regex regex = new Regex(@"^[A-Za-z0-9][A-Z|a-z|0-9|_.\-]{3,15}$");
            bool isRegex = false;
            StringBuilder sb = new StringBuilder();
            bool isOnlyOneRegisteredSite = pUserList.getRowCount() == 1;

            sb.AppendLine(" <div class=\"id_list" + (isOnlyOneRegisteredSite ? " oneid" : "") + "\">");
            foreach (SelectUserInfoRow row in pUserList.getRow())
            {
                isRegex = regex.IsMatch(row.USER_ID);

                sb.AppendLine();
                sb.AppendLine(" <dl " + (row.IS_AVAILABLE && isRegex ? "" : "class=\"not\"") + ">");
                
				sb.AppendLine("	    <dt IsAvailableYorN=\"" + (row.IS_AVAILABLE && isRegex ? "Y" : "N") + "\" >");
                sb.AppendLine("		    <input type=\"hidden\" name=\"SelectUserID\" value=\"" + row.USER_ID + "\" />");
                sb.AppendLine("		    <input type=\"hidden\" name=\"SelectUserSiteDiv\" value=\"" + row.SITE_CODE + "\" />");

                if (isOnlyOneRegisteredSite)
                {
                    sb.AppendLine("     <label>" + row.SITE_KR_NAME + "</label>");
                }
                else
                {
                    sb.AppendLine("     <div class=\"input_b size_sm type2\">");
                    sb.Append("             <input type=\"radio\" name=\"rdoSelectSiteCode\" id=\"rdoSelectSiteCode\" value=\"" + row.SITE_CODE + "\" " + (pUserList.getRow().IndexOf(row) == 0 ? " checked " : "") + ">");
                    sb.AppendLine("             <label for=\"radio_sm2_2\" class=\"lblSiteName\">" + row.SITE_KR_NAME + "</label>");
                    sb.AppendLine("     </div>");
                }
                
                sb.AppendLine("	    </dt>");
                sb.AppendLine("	    <dd class=\"date\">" + row.REG_DATE.Left(10) + "</dd>");
                sb.AppendLine("	    <dd class=\"id\">ID : <strong>" + row.USER_ID + "</strong></dd>");

                if (row.IS_AVAILABLE == false || isRegex == false)
                {
                    sb.AppendLine("     <div class=\"anotherid_a\" style=\"display:none\">");

                    if (row.IS_AVAILABLE == false)
                    {
                        sb.AppendLine("	        <p class=\"txt\">선택하신 아이디는<strong>이미 사용 중으로 사용이 불가능</strong> 합니다.<br>다른 아이디를 입력해주세요.</p>");
                    }
                    else
                    {
                        sb.AppendLine("	        <p class=\"txt\">선택하신 아이디는<strong>사용할 수 없는 아이디</strong> 입니다.<br>다른 아이디를 입력해주세요.</p>");
                    }

                    sb.AppendLine("	        <div>");
                    sb.AppendLine("		        <input name=\"CustomUserId\" type=\"text\" style=\"width:270px;\" title=\"아이디를 넣어주세요\" placeholder=\"공백 없는 영문, 숫자 포함 최대 16자\">");
                    sb.AppendLine("             <span class=\"noti\"></span>");
                    sb.AppendLine("	        </div>");
                    sb.AppendLine("     </div>");
                }

                sb.AppendLine(" </dl>");
            }
            sb.AppendLine("</div>");

            return sb.ToString();
        }
    }
}