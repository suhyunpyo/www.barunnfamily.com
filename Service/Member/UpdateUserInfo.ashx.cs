using BarunnIntergrationService.Common.Databases;
using BarunnIntergrationService.Common.Utillity;
using Newtonsoft.Json;
using System;
using System.Web;

namespace BarunnIntergrationService.Service.Member
{
    /// <summary>
    /// UpdateUserInfo의 요약 설명입니다.
    /// </summary>
    public class UpdateUserInfo : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {

            HttpContextUtility.SetNoCache();

            IntergrationUserData userData = new IntergrationUserData();
            userData.init(context);

            UpdateUserInfoIntergrationProcessor processor = new UpdateUserInfoIntergrationProcessor();
            processor.execute(userData);
            UpdateUserInfoResult result = processor.getResult();

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

    public class UpdateUserInfoIntergrationProcessor : AbstractIntergrationProcessor
    {
        UpdateUserInfoResult m_result;

        public UpdateUserInfoIntergrationProcessor()
        {
            m_result = new UpdateUserInfoResult();
        }

        public UpdateUserInfoResult getResult()
        {
            return m_result;
        }

        public void execute(IntergrationUserData pData)
        {
            if (pData.updateValidate())
            {
                initConnector();
                beginTrans();
                try
                {
                    updateShopUser(pData);
                    //updateCelemoUser(pData);
                    m_result.Success = true;
                }
                catch (Exception ex)
                {
                    Console.Write(ex.Message);
                    m_result.Success = false;
                    m_result.Message = ex.Message;
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
                m_result.Message = "Validate Fail";
            }
        }

        private void updateShopUser(IntergrationUserData pData)
        {
            m_shopConnector.Execute(ShopDatabaseFactory.createCommandUpdateUserInfo(pData.AUTHCODE, pData.USERID,
                pData.NEWPASSWORD, pData.EMAIL, pData.ZIPCODE, 
                pData.ADDR, pData.ADDRDETAIL, 
                pData.PHONE, pData.CELLPHONE, pData.ALLOWSMS, pData.ALLOWMALLING,
                pData.BIRTH_DATE, pData.BIRTH_DATE_TYPE, pData.WEDDING_DAY, pData.WEDDING_HALL
                ));
        }

        //private void updateCelemoUser(IntergrationUserData pData)
        //{
        //    m_celemoConnector.execute(CelemoDatabaseFactory.createCommandUpdateUserInfo(pData.AUTHCODE, pData.USERID,
        //        pData.NEWPASSWORD,pData.EMAIL,pData.ZIPCODE,
        //        pData.ADDR,pData.ADDRDETAIL,
        //        pData.PHONE,pData.CELLPHONE,
        //        pData.BIRTH_DATE_TYPE,pData.BIRTH_DATE,
        //        pData.ALLOWSMS,pData.ALLOWMALLING
        //        ));
        //}
    }

    public class UpdateUserInfoResult : AbstractServiceResult
    {

        public override string parseXML()
        {
            String result = String.Empty;
            result = XMLUtillity.HeadString();
            result += "<ROOT>";
            result += this.buildSuccessXMLElement();
            result += this.buildMessageXMLElement();
            result += "</ROOT>";
            return result;
        }

        public override string parseJSON()
        {
            return JsonConvert.SerializeObject(this);
        }
    }
}