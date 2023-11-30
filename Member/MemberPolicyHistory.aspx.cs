using BarunnIntergrationService.Common;
using BarunnIntergrationService.Common.Databases;
using BarunnIntergrationService.Common.ExtensionMethod;
using BarunnIntergrationService.Common.ResultModel;
using BarunnIntergrationService.Common.Utillity;
using BarunnIntergrationService.Master;
using BarunnIntergrationService.Service;
using BarunnIntergrationService.Service.Member;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using static System.Net.WebRequestMethods;

namespace BarunnIntergrationService.Member
{
    public partial class MemberPolicyHistory : System.Web.UI.Page
    {
        protected string PolicyDiv = string.Empty;
        protected string strPolicySeq = string.Empty;
        protected int intPolicySeq = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContextUtility.SetNoCache();    

            string sRefererSite = ApplicationContext.G().REFERER_SITE;
            string CompanySeq = ApplicationContext.G().IS_REFERER_COMPANYSEQ(sRefererSite);
            Member.SignInForCertification.FamilySiteInformationList familySiteInformationList = new Member.SignInForCertification.FamilySiteInformationList();
            int index = familySiteInformationList.FindFamilySiteFromDomainShortName(sRefererSite, 0);
            Member.SignInForCertification.FamilySiteInformation familySiteInformation = familySiteInformationList.familySiteInformationList[index];
            
            string SiteCode = familySiteInformation.SiteCode;

            if (!IsPostBack)
            {

                PolicyDiv = Request["div"];
                strPolicySeq = Request["policyseq"];
                             

                if (string.IsNullOrEmpty(PolicyDiv))
                {
                    PolicyDiv = "P";
                }

                if (string.IsNullOrEmpty(strPolicySeq))
                {
                    intPolicySeq = 0;
                }
                else
                {
                    intPolicySeq = Convert.ToInt32(strPolicySeq);
                }                    

                var hisList = PolicyTermsUtility.GetPolicyInfoHistoryList(SiteCode, CompanySeq, PolicyDiv);
                foreach (var item in hisList)
                {
                    policyseq.Items.Add(new ListItem(string.Format("{0}  시행", item.StartDate.Replace("-", ". ")), item.Seq.ToString()));                    
                }

                if (intPolicySeq == 0 && policyseq.Items.Count > 0)
                {
                    intPolicySeq = Convert.ToInt32(policyseq.Items[0].Value);                    
                }

                if (policyseq.Items.Count > 0)
                {
                    try
                    {
                        policyseq.Items.FindByValue(intPolicySeq.ToString()).Selected = true;
                    }
                    catch { }
                }
            }

            //--P:개인정보처리방침,U:이용약관
            if (PolicyDiv == "P")
            {
                ltrPolicyName.Text = "개인정보 보호방침";
            }
            else
            {
                ltrPolicyName.Text = "이용약관";
            }

            hidPolicyDiv.Value = PolicyDiv;

            if (intPolicySeq>0)
            {
                var policyItem = PolicyTermsUtility.GetPolicyInfo(SiteCode, CompanySeq, PolicyDiv, intPolicySeq);
                ltrPolicyContents.Text = policyItem.Contents.ToString();
            }
            
            
            //--브랜드 로고 출력부분
            switch(familySiteInformation.DomainShortName)
            {
                case "barunsoncard": 
                    imgLogo.Src = "https://www.barunsoncard.com/resources/images/common/logo_barunson.png";
                    break;
                case "barunsonmall":
                    imgLogo.Src = "https://www.barunsonmall.com/resources/images/common/main_new/logo.png";
                    break;
                case "premierpaper":
                    imgLogo.Src = "https://www.premierpaper.co.kr/assets/images/common/logo_bk.svg";
					imgLogo.Width = 210;
					imgLogo.Height = 24;
					break;
                case "barunsonmcard":
					imgLogo.Src = "https://www.barunsonmcard.com/img/common/logo_b.svg";
                    imgLogo.Width = 210;
                    imgLogo.Height = 24;					
					break;
				default: break;

            }
        }      
        
    }
}