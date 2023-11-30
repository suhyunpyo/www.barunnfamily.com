using BarunnIntergrationService.Common;
using BarunnIntergrationService.Common.ExtensionMethod;
using BarunnIntergrationService.Common.Utillity;
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
    public partial class SignInForCertification : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ((HtmlGenericControl)Master.FindControl("MasterBody")).Attributes["class"] = "auth_p";

            InitCPClient();
            InitIPIN();

            ltrCsCenterInformation.Text = GetCsCenterInformationForRefereUrl(CookieUtility.GetCookieValue("REFERER_SITE"));
            
        }
        
        public void InitDeviceBranchProcessing()
        {
            btnCPCLIENT.Attributes["class"] = "touch";
            btnIPIN.Attributes["class"] = "touch";
        }

        public void InitCPClient()
        {

			NiceCPClientUtility CPClientUtility = new NiceCPClientUtility();

			CPClientUtility.authType = "M";
			CPClientUtility.returnUrl = ApplicationContext.G().CPCLIENT_RETURN_URL;
			CPClientUtility.nextStepUrl = ApplicationContext.G().CERTIFICATION_NEXT_STEP_URL;
			CPClientUtility.urlReferer = ApplicationContext.G().REFERER_SITE;

			CPClientUtility.ExecuteDataEncoding();
			((Literal)Master.FindControl("ltrMasterPageCPClientRequestForm")).Text = CPClientUtility.GetCPClientRequestFormTag(ApplicationContext.G().CPCLIENT_REQUEST_FORM_NAME);
			((Literal)Master.FindControl("ltrMasterPageCPClientResponseForm")).Text = CPClientUtility.GetCPClientResponseFormTag(ApplicationContext.G().CPCLIENT_RESPONSE_FORM_NAME);
                    }

        public void InitIPIN()
        {
            NiceIPINUtility IPINUtility = new NiceIPINUtility();

            IPINUtility.returnUrl = ApplicationContext.G().IPIN_RETURN_URL;			
            IPINUtility.nextStepUrl = ApplicationContext.G().CERTIFICATION_NEXT_STEP_URL;
			IPINUtility.urlReferer = ApplicationContext.G().REFERER_SITE;
			IPINUtility.ExecuteDataEncoding();

            ((Literal)Master.FindControl("ltrMasterPageIPINRequestForm")).Text = IPINUtility.GetRequestFormTag(ApplicationContext.G().IPIN_REQUEST_FORM_NAME);
            ((Literal)Master.FindControl("ltrMasterPageIPINResponseForm")).Text = IPINUtility.GetResponseFormTag(ApplicationContext.G().IPIN_RESPONSE_FORM_NAME);
        }

        public string GetCsCenterInformationForRefereUrl(String sRefererUrl)
        {
            string result = String.Empty;
            FamilySiteInformationList familySiteInformationList = new FamilySiteInformationList();
            int index = familySiteInformationList.FindFamilySiteFromDomainShortName(sRefererUrl, 0);
            FamilySiteInformation familySiteInformation = familySiteInformationList.familySiteInformationList[index];
            result = "<dd> " + familySiteInformation.SiteName + " 고객센터(" + familySiteInformation.CsCenterNumber + ")로 문의 주십시오. 문제해결에 최선을 다하겠습니다.</dd>";
            return result;
        }


        public class FamilySiteInformationList
        {
            public List<FamilySiteInformation> familySiteInformationList = new List<FamilySiteInformation>();

            // 로그인 완료 후 돌아갈 사이트 설정
            public FamilySiteInformationList ()
            {
                familySiteInformationList.Add(new FamilySiteInformation("바른손카드", "1644 - 0708", "barunsoncard", "http://www.barunsoncard.com", "/resources/img_inc/logo_barunsoncard.png", "/member/login.asp", "http://m.barunsoncard.com", "/mobile/member/login.asp", "/member/find_pw.asp", "/mobile/member/find_pw.asp", "SB", "53463", "53481", ".barunsoncard.com"));
                familySiteInformationList.Add(new FamilySiteInformation("비핸즈카드 제휴", "1644 - 9713", "wed.bhandscard", "http://wed.bhandscard.com", "/resources/img_inc/logo_barunsoncard_jehu.png", "/member/login.asp", "http://m.bhandscard.com", "/mobile/member/login.asp", "/member/find_pw.asp", "/mobile/member/find_pw.asp", "B", "", "", ""));
                familySiteInformationList.Add(new FamilySiteInformation("프리미어페이퍼 제휴", "1644 - 8796", "wed.premierpaper", "http://wed.premierpaper.co.kr", "/resources/img_inc/logo_barunsoncard_jehu.png", "/join/login.asp", "http://www.premierpaper.co.kr", "/join/login.asp", "/join/passSearch.asp?memberpage=passsearch", "/join/passSearch.asp?memberpage=passsearch", "H", "53466", "54114", ".premierpaper.co.kr"));
                familySiteInformationList.Add(new FamilySiteInformation("비핸즈카드", "1644 - 9713", "bhandscard", "http://www.bhandscard.com", "/resources/img_inc/logo_bhandscard.png", "/member/login.asp", "http://m.bhandscard.com", "/mobile/member/login.asp", "/member/find_pw.asp", "/mobile/member/find_pw.asp", "SA", "53464", "53482", ".bhandscard.com"));
                familySiteInformationList.Add(new FamilySiteInformation("더카드", "1644 - 7998", "thecard", "http://www.thecard.co.kr", "/resources/img_inc/logo_thecard.png", "/member/login_frm.asp", "http://m.thecard.co.kr", "/mobile/member/login.asp", "/member/login_frm.asp", "/member/login_frm.asp", "ST", "53465", "53483", ".thecard.co.kr"));
                familySiteInformationList.Add(new FamilySiteInformation("프리미어페이퍼", "1644 - 8796", "premierpaper", "http://www.premierpaper.co.kr", "/resources/img_inc/logo_premierpaper.png", "/join/login.asp", "http://m.premierpaper.co.kr", "/mobile/member/login.asp", "/join/passSearch.asp?memberpage=passsearch", "/mobile/member/find_pw.asp", "SS", "53466", "54114", ".premierpaper.co.kr")); 
                familySiteInformationList.Add(new FamilySiteInformation("셀레모", "1644 - 7998", "celemo", "http://www.celemo.co.kr", "/resources/img_inc/logo_celemo.png", "/member/login", "http://m.celemo.co.kr", "/member/login", "/member/find", "/member/find?mode=findid", "CE", "53467", "53484", ".celemo.co.kr"));
                familySiteInformationList.Add(new FamilySiteInformation("바른손몰", "1644 - 9713", "barunsonmall", "http://www.barunsonmall.com/main.asp", "/resources/img_inc/logo_barunsonmall_jehu.png", "/member/login.asp", "http://www.barunsonmall.com/main.asp", "/member/login.asp", "/member/find_pw.asp", "/member/find_pw.asp", "B", "53479", "53479", ".barunsonmall.com"));
                familySiteInformationList.Add(new FamilySiteInformation("바른 웨딩", "1644 - 0708", "barunnwedding", "http://www.barunnwedding.com", "/resources/img_inc/logo_barunsoncard.png", "/Login/Login", "http://www.barunnwedding.com", "/Login/Login", "/member/find_pw.asp", "/mobile/member/find_pw.asp", "SB", "", "", ""));
                familySiteInformationList.Add(new FamilySiteInformation("비웨딩", "1644 - 0708", "bewedding", "http://www.bewedding.co.kr", "/resources/img_inc/logo_bewedding.png", "/Account/SignIn", "http://www.bewedding.co.kr", "/Account/SignIn", "/Account/FindPassword.asp", "/Account/FindPassword.asp", "BE", "", "", ""));

                //20210419 표수현 추가 Start
                familySiteInformationList.Add(new FamilySiteInformation("바른손모바일카드", "1644 - 0708", "barunsonmcard", "http://www.barunsonmcard.com", "/resources/img_inc/logo_barunsoncard.png", "/Member/LogIn", "http://barunsonmcard.com", "/Member/LogIn", "/Member/LogIn?msgYn=", "/Member/LogIn", "BM", "", "", ".barunsonmcard.com"));
                //20210419 표수현 추가 End

            }

            public int FindFamilySiteFromDomainShortName(string pDomainShortName, int defaultIndex = 0)
            {
                int index = 0;

                if (String.IsNullOrEmpty(pDomainShortName))
                    pDomainShortName = "";

                foreach (FamilySiteInformation f in familySiteInformationList)
                {
                    if (pDomainShortName.IndexOf(f.DomainShortName) >= 0)
                    {
                        index = familySiteInformationList.IndexOf(f);
                        break;
                    }
                }

                if (index <= 0 && defaultIndex >= 0) index = defaultIndex;
                return index;
            }
        }

        public class FamilySiteInformation
        {
            public String SiteName;
            public String CsCenterNumber;
            public String DomainShortName;
            public String FullUrl;
            public String LogoImageUrl;
            public String LoginUrl;
            public String FullUrlMobile;
            public String LoginUrlMobile;
            public String FindPasswordUrl;
            public String FindPasswordUrlMobile;
            public String SiteCode;

            public String BizSpringLoggerServiceNumber
            {
                get
                {
                    return  HttpContext.Current.Request.IsMobileDevice()
                            ? 
                            BizSpringLoggerServiceNumberMobile 
                            : 
                            BizSpringLoggerServiceNumberPC;
                }
            }
            public String BizSpringLoggerServiceNumberMobile;
            public String BizSpringLoggerServiceNumberPC;
            public String BizSpringLoggerServiceDomain;

            public FamilySiteInformation()
            {
            }

            public FamilySiteInformation(string pSiteName, string pCsCenterNumber, string pDomainShortName, string pFullUrl, string pLogoImageUrl, string pLoginUrl, string pFullUrlMobile, string pLoginUrlMobile, string pFindPasswordUrl = "", string pFindPasswordUrlMobile = "", string pSiteCode = "", string pBizSpringLoggerServiceNumberPC = "", string pBizSpringLoggerServiceNumberMobile = "", string pBizSpringLoggerServiceDomain = "")
            {
                this.SiteName = pSiteName;
                this.CsCenterNumber = pCsCenterNumber;
                this.DomainShortName = pDomainShortName;
                this.FullUrl = pFullUrl;
                this.LogoImageUrl = pLogoImageUrl;
                this.LoginUrl = pLoginUrl;
                this.FullUrlMobile = pFullUrlMobile;
                this.LoginUrlMobile = pLoginUrlMobile;
                this.FindPasswordUrl = pFindPasswordUrl;
                this.FindPasswordUrlMobile = pFindPasswordUrlMobile;
                this.SiteCode = pSiteCode;

                this.BizSpringLoggerServiceNumberPC = pBizSpringLoggerServiceNumberPC;
                this.BizSpringLoggerServiceNumberMobile = pBizSpringLoggerServiceNumberMobile;
                this.BizSpringLoggerServiceDomain = pBizSpringLoggerServiceDomain;
            }
        }
    }
}