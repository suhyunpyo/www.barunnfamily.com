using BarunnIntergrationService.Common.Databases;
using BarunnIntergrationService.Common.Utillity;
using Newtonsoft.Json;
using System;
using System.Web;

namespace BarunnIntergrationService.Service.Member
{
    /// <summary>
    /// CheckAvailableUser의 요약 설명입니다.
    /// </summary>
    public class CheckAvailableUser : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            HttpContextUtility.SetNoCache();

            //Post Parameter Data Response
            String userID = HTTPRequestUtillity.GetParamValue("USERID");
            String authCode = HTTPRequestUtillity.GetParamValue("AUTHCODE");

            CheckAvaliableUserIntergrationProcesor processor = new CheckAvaliableUserIntergrationProcesor();
            processor.execute(userID, authCode);
            CheckAvailableUserResult result = processor.getResult();

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


    public class CheckAvaliableUserIntergrationProcesor:AbstractIntergrationProcessor
    {
        private CheckAvailableUserResult m_result;

        public CheckAvaliableUserIntergrationProcesor()
        {
            m_result = new CheckAvailableUserResult();
        }

        public void execute(String pUserID, String pAuthCode)
        {
            initConnector();

            try
            {
                if (String.IsNullOrEmpty(pUserID) == false)
                {
                    Boolean existUserID = false;
                    existUserID = checkExistShopUserID(pUserID, pAuthCode);
                    //existUserID = (existUserID == true) ? existUserID : checkExistCelemoUserID(pUserID, pAuthCode);
                    m_result.Success = true;
                    m_result.Avaliable = (existUserID == false);
                }
            }
            catch (Exception ex)
            {
                Console.Write(ex.Message);
                m_result.Success = false;
            }

            closeConnector();
        }

        public CheckAvailableUserResult getResult()
        {
            return m_result;
        }

        /// <summary>
        /// SHOP DB 에 해당 USER ID 가 이미 사용중인 아이디 인지를 반환한다.
        /// </summary>
        /// <param name="pUserID"></param>
        /// <returns></returns>
        private Boolean checkExistShopUserID(String pUserID, String pAuthCode)
        {
            DatabaseSingleColumnResultModel<String> resultModel = new DatabaseSingleColumnResultModel<String>();
            m_shopConnector.Execute(ShopDatabaseFactory.createCommandCheckAvailableUser(pUserID, pAuthCode), resultModel);
            return (resultModel.getResult() != "0000");
        }

        /// <summary>
        /// CELEMO DB 에 해당 USER ID 가 이미 사용중인 아이디 인지를 반환한다.
        /// </summary>
        /// <param name="pUserID"></param>
        /// <returns></returns>
        //private Boolean checkExistCelemoUserID(String pUserID, String pAuthCode)
        //{
        //    MySqlDatabaseSingleColumnResultModel<Int64> resultModel = new MySqlDatabaseSingleColumnResultModel<long>();
        //    m_celemoConnector.execute(CelemoDatabaseFactory.createCommandCheckAvailableUser(pUserID, pAuthCode), resultModel);
        //    return (resultModel.getResult() > 0);
        //}

    }

    /// <summary>
    /// Response Data Class
    /// </summary>
    public class CheckAvailableUserResult:AbstractServiceResult
    {
        
        private Boolean m_avaliable;
        public Boolean Avaliable
        {
            get { return m_avaliable; }
            set { m_avaliable = value; }
        }

        public CheckAvailableUserResult()
        {
            m_success = false;
            m_avaliable = false;
        }

        /// <summary>
        /// 결과값을 XML 형태로 반환한다.
        /// </summary>
        /// <returns></returns>
        public override String parseXML()
        {
            String result = String.Empty;
            result += XMLUtillity.HeadString();
            result += "<ROOT>";
            result += this.buildSuccessXMLElement();
            result += " <RESULT>" + XMLUtillity.WrapCDATA(this.m_avaliable.ToString().ToUpper()) + "</RESULT>";
            result += "</ROOT>";
            return result;
        }

        public override String parseJSON()
        {
            return JsonConvert.SerializeObject(this);
        }
    }
}