using BarunnIntergrationService.Common;
using BarunnIntergrationService.Common.Databases;
using BarunnIntergrationService.Common.ExtensionMethod;
using BarunnIntergrationService.Common.Utillity;
using BarunnIntergrationService.Service;
using BarunnIntergrationService.Service.Member;
using Newtonsoft.Json;
using System;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using System.Web.Services;
using System.Web.UI.HtmlControls;

namespace BarunnIntergrationService.Member
{
    public partial class CompleteForExistingMember : System.Web.UI.Page
    {
        public string RouletteKey { get; set; }
        public string EventCode { get; set; }
        public string UserId { get; set; }
        public int? ResultCode { get; set; }
        public string ErrorMsg { get; set; }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            ((HtmlGenericControl)Master.FindControl("MasterBody")).Attributes["class"] = "apcom_p member_c";

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

            UserId = result.getRow()[0].USER_ID;
            RouletteKey = CookieUtility.GetCookieValue("RouletteKey");
            EventCode = CookieUtility.GetCookieValue("EventCode");
            
            /*룰렛 이벤트 API 연동*/
            if (RouletteKey != null) {

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

            string sRefererSite = CookieUtility.GetCookieValue("REFERER_SITE");
            Member.SignInForCertification.FamilySiteInformationList familySiteInformationList = new Member.SignInForCertification.FamilySiteInformationList();
            int index = familySiteInformationList.FindFamilySiteFromDomainShortName(sRefererSite, 0);
            Member.SignInForCertification.FamilySiteInformation familySiteInformation = familySiteInformationList.familySiteInformationList[index];
            if (Request.IsMobileDevice())
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

        /// <summary>
        /// 제휴 신청 정보 저장
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="partnerCode"></param>
        /// <param name="extendData"></param>
        /// <returns></returns>
        [WebMethod]
        public static string applyJehu(string userId, string partnerCode, string extendData)
        {
            RequestResult result = new RequestResult();

            try
            {
                JehuProcessor JehuProcessor = new JehuProcessor();
                DatabaseSingleColumnResultModel<String> resultModel = new DatabaseSingleColumnResultModel<String>();
                var applyChk = JehuProcessor.ApplyS2UserInfoJehu(userId, partnerCode, extendData);

                result.RESULT = true;
                result.VALUE = applyChk;
            }
            catch (Exception ex)
            {
                result.RESULT = false;
                result.VALUE = ex.Message;
            }

            return JsonConvert.SerializeObject(result);
        }


        public class JehuProcessor : AbstractIntergrationProcessor
        {

            public string ApplyS2UserInfoJehu(string userId, string partnerCode, string extendData)
            {
                var result = "N";

                initConnector();
                beginTrans();
                try
                {
                    DatabaseSingleColumnResultModel<String> resultModel = new DatabaseSingleColumnResultModel<String>();
                    m_shopConnector.Execute(ShopDatabaseFactory.SaveS2UserInfoJehu(userId, partnerCode, true, extendData), resultModel);
                    commit();

                    result = resultModel.getResult();

                }
                catch (Exception ex)
                {
                    Console.Write(ex);
                    rollBack();
                }

                closeConnector();

                return (result);
            }
        }

    }
}