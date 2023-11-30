using BarunnIntergrationService.Common;
using BarunnIntergrationService.Common.ExtensionMethod;
using BarunnIntergrationService.Common.Utillity;
using BarunnIntergrationService.Service.Member;
using Newtonsoft.Json;
using System;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;


namespace BarunnIntergrationService.Member
{
    public partial class Agreement_NEW : System.Web.UI.Page
    {
        string sRefererSite = "";
        // string DomainSite = "";
        //20210419 표수현 - DomainSite 변수를 퍼블릭으로 변경
        protected string DomainSite = "";
        string sUrlReferer = "";                       
        

        protected void Page_Load(object sender, EventArgs e)
        {
            SetCookie();

            SetFormAction();

            SetFamilySiteInfomation();            

            InitDeviceBranchProcessing();           

            LiteralCellPhone.Text = "";

            //선물코드 초기화
            if (HttpContext.Current.Session["freeGift"] == null)
            {
                HttpContext.Current.Session["freeGift"] = "37429";
            }

            InitCPClient();
            InitCompanySeq();
           
            //룰렛이벤트
            string bizCode = Request.Params["biz_code"];
            string eventCode = Request.Params["event_code"];
            string key = Request.Params["key"];
                  

            CookieUtility.SetCookie("BizCode", bizCode);
            CookieUtility.SetCookie("RouletteKey", key);
            CookieUtility.SetCookie("EventCode", eventCode);
        }

        private void SetCookie()
        {
            HttpContextUtility.SetNoCache();
            sUrlReferer = ApplicationContext.G().REFERER_SITE;
            CookieUtility.SetCookie("REFERER_SITE", sUrlReferer);
            DomainSite = ApplicationContext.G().REFERER_SITE_DOMAIN(sUrlReferer);
        }

        private void SetFormAction()
        {
            ((HtmlGenericControl)Master.FindControl("MasterBody")).Attributes["class"] = "term_p";
            string actionUrl = ApplicationContext.G().IS_REFERER_FORM_ACTION(DomainSite);
            ((HtmlForm)Master.FindControl(ApplicationContext.G().MAIN_FORM_ID)).Attributes["action"] = actionUrl;
            //((HtmlForm)Master.FindControl(ApplicationContext.G().MAIN_FORM_ID)).Attributes["action"] = "";
        }

        private void SetFamilySiteInfomation()
        {
            sRefererSite = CookieUtility.GetCookieValue("REFERER_SITE");
            Session["JOIN_STEP"] = "1";

            Member.SignInForCertification.FamilySiteInformationList familySiteInformationList = new Member.SignInForCertification.FamilySiteInformationList();
            int index = familySiteInformationList.FindFamilySiteFromDomainShortName(sRefererSite, 0);
            Member.SignInForCertification.FamilySiteInformation familySiteInformation = familySiteInformationList.familySiteInformationList[index];
        }


        public void InitCPClient()
        {
            String NextStepUrl = "";
            if (DomainSite == "barunsoncard" || DomainSite == "barunsonmall" || DomainSite == "premierpaper")
            {
                NextStepUrl = "/Member/CustomerInformation_NEW.aspx";
            }
            else if (DomainSite == "barunsonmcard")
            {
                NextStepUrl = "/Member/BarunsonMcardForCustomerInformation.aspx";
            }
            
            NiceCPClientUtility CPClientUtility = new NiceCPClientUtility();

            CPClientUtility.authType = "M";
            CPClientUtility.returnUrl = ApplicationContext.G().CPCLIENT_RETURN_URL_V2;
            CPClientUtility.nextStepUrl = NextStepUrl;
            CPClientUtility.urlReferer = ApplicationContext.G().REFERER_SITE;

            CPClientUtility.ExecuteDataEncoding();

            ((Literal)Master.FindControl("ltrMasterPageCPClientRequestForm")).Text = CPClientUtility.GetCPClientRequestFormTag(ApplicationContext.G().CPCLIENT_REQUEST_FORM_NAME);
            ((Literal)Master.FindControl("ltrMasterPageCPClientResponseForm")).Text = CPClientUtility.GetCPClientResponseFormTag(ApplicationContext.G().CPCLIENT_RESPONSE_FORM_NAME);
        }

        public void InitCompanySeq()
        {
            if (DomainSite == "barunsoncard")
            {
                Session.Add("companySeq", "5001");
                Session.Add("saleGubun", "SB");
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
            else if (DomainSite == "barunsonmcard")
            {
                Session.Add("companySeq", "8029");
                Session.Add("saleGubun", "BM");
            }
        }

        public void InitDeviceBranchProcessing()
        {
            if (Request.IsMobileDevice())
            {
                ((HtmlGenericControl)Master.FindControl("MasterBody")).Attributes["class"] = "form_p";
            }
            else
            {
                ((HtmlGenericControl)Master.FindControl("MasterBody")).Attributes["class"] = "";
            }
        }

        [WebMethod(EnableSession = true)]
        public static String SetUserFreeGift(String giftCode)
        {
            RequestResult result = new RequestResult();
            try
            {
                HttpContext.Current.Session["freeGift"] = giftCode;

                result.RESULT = true;
            }
            catch (Exception ex)
            {
                result.RESULT = false;
                result.VALUE = ex.Message;
            }

            return JsonConvert.SerializeObject(result);
        }

    }
}