using BarunnIntergrationService.Common.Databases;
using BarunnIntergrationService.Common.Utillity;
using Newtonsoft.Json;
using System;
using System.Web;

namespace BarunnIntergrationService.Service.Member
{
    /// <summary>
    /// ExecuteTransactionInfomation의 요약 설명입니다.
    /// </summary>
    public class ExecuteTransactionInfomation : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {

            HttpContextUtility.SetNoCache();

            String authCode = HTTPRequestUtillity.GetParamValue("AUTHCODE");
            String newUserID = HTTPRequestUtillity.GetParamValue("NEWUSERID");
            String newPassword = HTTPRequestUtillity.GetParamValue("NEWPASSWORD");

            ExecuteTransactionIntergrationProcessor processor = new ExecuteTransactionIntergrationProcessor();
            processor.execute(authCode, newUserID, newPassword, "", "", "");
            ExecuteTransactionInfomationResult result = processor.getResult();

            if (HTTPRequestUtillity.GetParamValue("OUTPUT") == "json")
            {
                context.Response.ContentType = "text/plain";
                context.Response.Write(result.parseJSON());
            }
            else
            {
                context.Response.ContentType = "text/xml";
                context.Response.Write(result.parseXML());
            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }

    public class ExecuteTransactionIntergrationProcessor : AbstractIntergrationProcessor
    {
        private ExecuteTransactionInfomationResult m_result;

        public ExecuteTransactionIntergrationProcessor()
        {
            m_result = new ExecuteTransactionInfomationResult();
        }

        public ExecuteTransactionInfomationResult getResult()
        {
            return m_result;
        }

        public void execute(String pAuthCode, String pNewUserID, String pNewPassword, String pRefererSite, String pSiteCode, String pSelectId)
        {

            if (string.IsNullOrEmpty(pAuthCode) == false && string.IsNullOrEmpty(pNewUserID) == false && string.IsNullOrEmpty(pNewPassword) == false)
            {
                initConnector();

                beginTrans();

                try
                {
                    LogUtility.LogWrite(pAuthCode, pNewUserID, "executeTransactionShopUser", "시작");
                    executeTransactionShopUser(pAuthCode, pNewUserID, pNewPassword, pRefererSite, pSiteCode, pSelectId);

                    //LogUtility.LogWrite(pAuthCode, pNewUserID, "executeTransactionCelemoUser", "시작");
                    //executeTransactionCelemoUser(pAuthCode, pNewUserID, pNewPassword);
                    m_result.Success = true;
                }
                catch (Exception ex)
                {
                    LogUtility.LogWrite(pAuthCode, pNewUserID, "executeTransactionShopUser - Error", ex.Message);

                    Console.Write(ex.Message);
                    m_result.Success = false;
                    rollBack();
                }
                finally
                {
                    commit();
                }

                closeConnector();
            }
            else
            {
                m_result.Success = false;
            }
        }


        private void executeTransactionShopUser(String pAuthCode, String pNewUserID, String pNewPassword, String pRefererSite, String pSiteCode, String pSelectId)
        {
            //TODO : pNewPassword 파라미터 추가 처리 필요.
            m_shopConnector.Execute(ShopDatabaseFactory.createCommandTransactionInfomation(pAuthCode, pNewUserID, pRefererSite, pSiteCode, pSelectId));
        }

        //private void executeTransactionCelemoUser(String pAuthCode, String pNewUserID, String pNewPassword)
        //{
        //    m_celemoConnector.execute(CelemoDatabaseFactory.createCommandTransactionInfomation(pAuthCode, pNewUserID, pNewPassword));
        //}

    }

    public class ExecuteTransactionInfomationResult:AbstractServiceResult
    {
        public override String parseXML()
        {
            String result = String.Empty;
            result += XMLUtillity.HeadString();
            result += "<ROOT>";
            result += this.buildSuccessXMLElement();
            result += "</ROOT>";
            return result;
        }

        public override String parseJSON()
        {
            return JsonConvert.SerializeObject(this);
        }
         
    }
}