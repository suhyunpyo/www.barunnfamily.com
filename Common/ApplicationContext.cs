using BarunnIntergrationService.Common.ExtensionMethod;
using BarunnIntergrationService.Common.Utillity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Text;
using System.Web;

namespace BarunnIntergrationService.Common
{
    public class ApplicationContext
    {
        /// <summary>
        /// Private Instance
        /// </summary>
        private static ApplicationContext M_ME;

        /// <summary>
        /// Private Constructor
        /// </summary>
        private ApplicationContext()
        {
        }

        /// <summary>
        /// SingleTon :: Get Instance
        /// </summary>
        /// <returns></returns>
        public static ApplicationContext GetInstance()
        {
            if (M_ME == null)
            {
                M_ME = new ApplicationContext();
            }
            return M_ME;
        }

        /// <summary>
        /// GetInstance 단축 Interface
        /// </summary>
        /// <returns></returns>
        public static ApplicationContext G()
        {
            return GetInstance();
        }

        public String MAIN_FORM_ID
        {
            get
            {
                return "MainForm";
            }
        }

        public String MAIN_PAGE_URL
        {
            get
            {
                return "/Member/Main.aspx";
            }
        }   

        public String CERTIFICATION_NEXT_STEP_URL
        {
            get
            {
                return "/Member/SignInForTermsAgreement.aspx";
            }
        }




        public String CPCLIENT_RETURN_URL
        {
            get
            {
                String url = "";

				url = GetHostUrl() + "/Member/CPClientReturnProcess.aspx";

				return url;
            }
        }


        public String CPCLIENT_RETURN_URL_V2
        {
            get
            {
                String url = "";				
                
      		    url = GetHostUrl() + "/Member/CPClientReturnProcessOnly.aspx";

				return url;

			}
        }   




        public String CPCLIENT_REQUEST_FORM_NAME
        {
            get
            {
                return "formCPClientRequest";
            }
        }

        public String CPCLIENT_RESPONSE_FORM_NAME
        {
            get
            {
                return "formCPClientResponse";
            }
        }

        

        public String IPIN_REQUEST_FORM_NAME
        {
            get
            {
                return "formIPINRequest";
            }
        }

        public String IPIN_RESPONSE_FORM_NAME
        {
            get
            {
                return "formIPINResponse";
            }
        }

        public String IPIN_RETURN_URL
        {
            get
            {
                String url = "";


                url = GetHostUrl() + "/Member/IPINReturnProcess.aspx";


				return url;
            }
        }

        public String REFERER_SITE
        {
            get
            {
                string sRefererSite = CookieUtility.GetCookieValue("REFERER_SITE");
                string sUrlReferer = HttpContext.Current.Request.UrlReferrer == null ? "barunsoncard" : HttpContext.Current.Request.UrlReferrer.ToString().ToLower();
                string sReturnUrl = HttpContext.Current.Server.UrlEncode(HttpContext.Current.Request.Value("ReturnUrl"));
                string sSiteCode = HttpContext.Current.Request.Value("site_code");

                sUrlReferer = sReturnUrl == "" ? sUrlReferer : sReturnUrl;

                try
                {
                    //파라미터가 존재한다?
                    // = 사이트구분 지어보낸다.
                    if(!String.IsNullOrEmpty(sSiteCode))
                    {
                        sUrlReferer = sSiteCode;
                    }

                    if (IS_REFERER_FAMILY_SITE(sUrlReferer))
                    {
                        sRefererSite = sUrlReferer;
                    }
                }
                catch
                { }
                return sRefererSite;
                
            }
        }

        public bool IS_REFERER_FAMILY_SITE_FOR_JEHU(string pValue)
        {
            bool result = false;
            List<string> familySiteList = new List<string>();
            familySiteList.Add("wed.bhandscard");
            familySiteList.Add("wed.premierpaper");
            foreach (string site in familySiteList)
            {
                if (pValue.ToLower().IndexOf(site) >= 0)
                {
                    result = true;
                    break;
                }
            }
            return result;
        }

        public bool IS_REFERER_FAMILY_SITE(string pValue)
        {
            bool result = false;
            List<string> familySiteList = new List<string>();
            familySiteList.Add("barunsoncard");
            familySiteList.Add("wed.bhandscard");
            familySiteList.Add("wed.premierpaper");
            familySiteList.Add("bhandscard");
            familySiteList.Add("thecard");
            familySiteList.Add("premierpaper");
            familySiteList.Add("celemo");
            familySiteList.Add("barunsonmall");
            familySiteList.Add("barunnwedding");
            familySiteList.Add("bewedding");
          
            familySiteList.Add("barunsonmcard");   //20210419 표수현 추가 

            foreach (string site in familySiteList)
            {
                if (pValue.ToLower().IndexOf(site) >= 0)
                {
                    result = true;
                    break;
                }
            }

            return result;
        }

        public string IS_REFERER_SITE(string pValue)
        {
            string result = "";

            if (pValue.Contains("bhandscard"))
            {
                result = "bhandscard";
            }
            else if (pValue.Contains("barunsonmall"))
            {
                result = "barunsonmall";
            }
            else if (pValue.Contains("barunsoncard"))
            {
                result = "barunsoncard";
            }
            else if (pValue.Contains("thecard"))
            {
                result = "thecard";
            }
            //20210419 표수현 추가 
            else if (pValue.Contains("barunsonmcard"))
            {
                result = "barunsonmcard";
            }
            else if (pValue.Contains("premierpaper"))
            {
                result = "premierpaper";
            }
            else
            {
                result = "barunsoncard";
            }

            return result;
        }


        public string IS_REFERER_COMPANYSEQ(string pValue)
        {
            string result = "";

            if (pValue.Contains("bhandscard"))
            {
                result = "5006";
            }
            else if (pValue.Contains("barunsonmall"))
            {
                result = "5000";
            }
            else if (pValue.Contains("barunsoncard"))
            {
                result = "5001";
            }
            else if (pValue.Contains("thecard"))
            {
                result = "5007";
            }
            //20210419 표수현 추가 
            else if (pValue.Contains("barunsonmcard"))
            {
                result = "8029";
            }
            else if (pValue.Contains("premierpaper"))
            {
                result = "5003";
            }
            else
            {
                result = "5001";
            }

            return result;
        }

        public string REFERER_SITE_DOMAIN(string pValue)
        {
            string ReturnValue = "";

            try
            {
                Member.SignInForCertification.FamilySiteInformationList familySiteInformationList = new Member.SignInForCertification.FamilySiteInformationList();
                int index = familySiteInformationList.FindFamilySiteFromDomainShortName(pValue, 0);
                Member.SignInForCertification.FamilySiteInformation familySiteInformation = familySiteInformationList.familySiteInformationList[index];
                ReturnValue = familySiteInformation.DomainShortName;

            }
            catch
            { }

            return ReturnValue;
        }

        public string IS_REFERER_FORM_ACTION(string pValue)
        {
            string result = "/Member/CustomerInformation_NEW.aspx";
            var DomainSite = pValue.ToLower();
           
            if (DomainSite == "barunsonmcard")
            {
                result = "/Member/BarunsonMcardForCustomerInformation.aspx";
            }

            return "https://www.barunnfamily.com/" + result;
        }

        public string GetHostUrl()
        {
            string ProtocolDomain = "";

            if (HttpContext.Current.Request.Url.Authority.ToLower().IndexOf("dev-www.barunnfamily.com") >= 0 || HttpContext.Current.Request.Url.Authority.ToLower().IndexOf("localhost") >= 0)
            {
                if (HttpContext.Current.Request.Url.Port == 80)
                {
                    ProtocolDomain = string.Format("http://{0}", HttpContext.Current.Request.Url.Host);
                }
                else
                {
					ProtocolDomain = string.Format("http://{0}:{1}", HttpContext.Current.Request.Url.Host, HttpContext.Current.Request.Url.Port);
				}
				  
            }
            else
            {
				ProtocolDomain = string.Format("https://{0}", HttpContext.Current.Request.Url.Host);
			}

            return ProtocolDomain;

        }


    }
}
