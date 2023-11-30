using BarunnIntergrationService.Common;
using BarunnIntergrationService.Common.Databases;
using BarunnIntergrationService.Common.ExtensionMethod;
using BarunnIntergrationService.Common.Utillity;
using BarunnIntergrationService.Service.Member;
using Newtonsoft.Json;
using System;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.HtmlControls;

namespace BarunnIntergrationService.Member
{
    public partial class BarunsonForRegistrationComplete : System.Web.UI.Page
    {
        protected string MobileYN;
        protected string sUserId;
        protected string sUserName;
        protected string certID;

		public string RouletteKey { get; set; }
        public string EventCode { get; set; }
        public string UserId { get; set; }
        public int? ResultCode { get; set; }
        public string ErrorMsg { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
			string sUserDinfo = string.Empty;


			if (Request.IsMobileDevice()) MobileYN = "Y";
            else MobileYN = "N";

            HttpContextUtility.SetNoCache();
            ((HtmlGenericControl)Master.FindControl("MasterBody")).Attributes["class"] = "apcom_p";
            Session["JOIN_STEP"] = "3";

            certID = Request.Value("CERT_ID");
			var dbResult = UserCertificationLogUtility.GetUserCertificationLog(certID);
			if (dbResult != null)
			{
                sUserDinfo = dbResult.DupInfo;
			}

            //--인증정보 삭제
			//UserCertificationLogUtility.DeleteUserCertificationLog(certID);

			sUserId = Request.Value("USER_ID");                

            Session["sUserId"] = sUserId;
            Session["sUserDinfo"] = sUserDinfo;

            //회원정보 조회(룰렛이벤트 Data 전송용)
            SelectUserInfoIntergrationProcesor processor = new SelectUserInfoIntergrationProcesor();
            processor.execute("", "", sUserDinfo);
            SelectUserInfoResult result = processor.getResult();

            if (result.getRowCount() == 0)
            {
                Response.RedirectForReferer();
                Response.End();
            }

            sUserName = result.getRow()[0].USER_NAME;

            UserId = sUserId;
            RouletteKey = CookieUtility.GetCookieValue("RouletteKey");
            EventCode = CookieUtility.GetCookieValue("EventCode");

            /*룰렛 이벤트 API 연동*/
            if (RouletteKey != null)
            {
                var userName = result.getRow()[0].USER_NAME;
                var cellPhone = result.getRow()[0].CELLPHONE;
                cellPhone = cellPhone.Replace("-", "");

                var resultData = RouletteEventSend(new RouletteEvent
                {
                    eventCode = EventCode != null ? EventCode.ToString() : "",
                    key = RouletteKey != null ? RouletteKey.ToString() : "",
                    userName = userName,
                    userPhone = cellPhone,
                    joinCorp = "barunnson"
                }).Result;

                ResultCode = resultData.resultCode;
                ErrorMsg = resultData.errorMsg;
            }

            string sRefererSite = ApplicationContext.G().REFERER_SITE;
            Member.SignInForCertification.FamilySiteInformationList familySiteInformationList = new Member.SignInForCertification.FamilySiteInformationList();
            int index = familySiteInformationList.FindFamilySiteFromDomainShortName(sRefererSite, 0);
            Member.SignInForCertification.FamilySiteInformation familySiteInformation = familySiteInformationList.familySiteInformationList[index];

            ltrBrandName.Text = createBrandName(familySiteInformation.DomainShortName);
            ltrBrandUrl.Text = createBrandURL(familySiteInformation.DomainShortName);

            string strMailingTitle = "[" + familySiteInformation.SiteName + "] 회원이 되신것을 환영합니다.";

            InsertUserSecessionComment InsertUserSecessionComment = new InsertUserSecessionComment();
            InsertUserSecessionComment.execute(ShopDatabaseFactory.createCommandInsertTneoQueue("[RegistrationComplete]", familySiteInformation.SiteCode, "no-reply@barunn.net", "", "", strMailingTitle, "", sUserId));

            //string sUrlReferer = ApplicationContext.G().REFERER_SITE;

            // Biz Spring Logger 비즈 스프링 로거
            if (String.IsNullOrEmpty(familySiteInformation.BizSpringLoggerServiceNumber) == false)
            {
                //((Literal)Master.FindControl("ltrBizSpringLoggerScriptForRegistrationComplete")).Text = Common.LoggerScript.BizSpringLoggerScript.GetSignUpScript();
            }
        }

        public String createBrandName(string param)
        {
            StringBuilder sb = new StringBuilder();

            if (param == "barunsoncard")
            {
                sb.AppendLine(@"바른손카드");
            }
            else
            {
                sb.AppendLine(@"바른손몰");
            }
            return sb.ToString();
        }

        public String createBrandURL(string param)
        {
            StringBuilder sb = new StringBuilder();

            if (param == "barunsoncard")
            {
                if (Request.IsMobileDevice())
                {
                    sb.AppendLine(@"<div class='btn_box'><a href='https://m.barunsoncard.com/' target='_parent' class='btn type01'>메인으로 가기</a><a href='https://m.barunsoncard.com/member/login.asp' target='_parent' class='btn type02'>로그인 하기</a></div>");
                }
                else
                {
                    sb.AppendLine(@"<div class='btn_box'><a href='https://www.barunsoncard.com/' target='_parent' class='btn type01'>메인으로 가기</a><a href='https://www.barunsoncard.com/member/login.asp' target='_parent' class='btn type02'>로그인 하기</a></div>");
                }
            } 
            else
            {
                if (Request.IsMobileDevice())
                {
                    sb.AppendLine(@"<div class='btn_box'><a href='http://m.barunsonmall.com/' target='_parent' class='btn type01'><span>메인으로 가기</span></a><a href='https://m.barunsonmall.com/member/login.asp' target='_parent' class='btn type02'>로그인 하기</a></div></div>");
                }
                else
                {
                    sb.AppendLine(@"<div class='btn_box'><a href='http://www.barunsonmall.com/' target='_parent' class='btn type01'><span>메인으로 가기</span></a><a href='https://www.barunsonmall.com/member/login.asp' target='_parent' class='btn type02'>로그인 하기</a></div></div>");
                }
            }
            return sb.ToString();
        }

        /// <summary>
        /// 룰렛 이벤트 Send Data
        /// </summary>
        public class RouletteEvent
        {
            public string eventCode { get; set; }
            public string key { get; set; }
            public string userName { get; set; }
            public string userPhone { get; set; }
            public string joinCorp { get; set; }
        }

        /// <summary>
        /// 룰렛 이벤트 Return Data
        /// </summary>
        public class RouletteResponseMessage
        {
            public int resultCode { get; set; }
            public string resultDate { get; set; }
            public string errorMsg { get; set; }
        }

        /// <summary>
        /// 룰렛 이벤트 전송
        /// </summary>
        /// <param name="postData"></param>
        /// <returns></returns>
        public async Task<RouletteResponseMessage> RouletteEventSend(RouletteEvent postData)
        {

            var apiUri = new Uri("https://event.epopkon.com/common/callback");
            var httpClient = new HttpClient();

            RouletteResponseMessage RouletteResponseMessage = null;

            var bodystr = JsonConvert.SerializeObject(postData);

            using (var request = new HttpRequestMessage())
            {
                request.Method = HttpMethod.Post;
                request.RequestUri = apiUri;
                request.Content = new StringContent(bodystr, Encoding.UTF8, "application/json");

                var response = await httpClient.SendAsync(request);
                response.EnsureSuccessStatusCode();

                var restr = await response.Content.ReadAsStringAsync();
                RouletteResponseMessage = JsonConvert.DeserializeObject<RouletteResponseMessage>(restr);

            }
            return RouletteResponseMessage;
        }



    }
}