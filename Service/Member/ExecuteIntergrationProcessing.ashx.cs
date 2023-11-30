using BarunnIntergrationService.Common.Utillity;
using System;
using System.Web;

namespace BarunnIntergrationService.Service.Member
{
    /// <summary>
    /// 통합회원 전환,
    /// 통합회원 가입,
    /// 통합회원 동기화처리 등등
    /// 일괄처리
    /// </summary>
    public class ExecuteIntergrationProcessing : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {

            HttpContextUtility.SetNoCache();

            String authCode = CastingUtillity.ParseToString(HTTPRequestUtillity.GetParamValue("AUTHCODE"), "");
            String newUserID = CastingUtillity.ParseToString(HTTPRequestUtillity.GetParamValue("NEWUSERID"), "");
            String newPassword = CastingUtillity.ParseToString(HTTPRequestUtillity.GetParamValue("NEWPASSWORD"), "");
            String siteCode = CastingUtillity.ParseToString(HTTPRequestUtillity.GetParamValue("SITECODE"), "");
            #region 사이트 코드 종류
            /**
             * SB : 바른손카드
             * SA : 비핸즈카드
             * ST : 더카드
             * SS : 프리미어페이퍼
             * CE : 셀레모
             **/ 
            #endregion


            ExecuteIntergrationProcessor processor = new ExecuteIntergrationProcessor();
            processor.execute(authCode, newUserID, newPassword, "", siteCode, "");
            ExecuteIntergrationResult result = processor.getResult();

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

    /// <summary>
    /// 통합회원 전환, 가입, 동기화 처리 등등을 일괄처리 한다.
    /// </summary>
    public class ExecuteIntergrationProcessor : AbstractIntergrationProcessor
    {
        ExecuteIntergrationResult m_result;

        public ExecuteIntergrationProcessor()
        {
            m_result = new ExecuteIntergrationResult();
        }

        public ExecuteIntergrationResult getResult()
        {
            return m_result;
        }

        public void execute(String pAuthCode, String pNewUserID, String pNewPassword, String pRefererSite, String pSiteCode, String pSelectId)
        {
            initConnector();
            beginTrans();
            try
            {
                //try
                //{
                //    LogUtility.LogWrite(pAuthCode, pNewUserID, "ExecuteIntergrationProcessor - execute", "insertUserInfo - 시작");
                //    insertUserInfo(pAuthCode, pNewUserID, pNewPassword, pSiteCode);
                //    LogUtility.LogWrite(pAuthCode, pNewUserID, "ExecuteIntergrationProcessor - execute", "insertUserInfo - 끝, executeTransaction - 시작 " + "AuthCode : " + pAuthCode + " , " + "NewUserID : " + pNewUserID + " , " + "NewPassword : " + pNewPassword + " , " + "SiteCode : " + pSiteCode);
                //}
                //catch (Exception ex)
                //{
                //    LogUtility.LogWrite(pAuthCode, pNewUserID, "ExecuteIntergrationProcessor - execute", "insertUserInfo - 오류 , " + "AuthCode : " + pAuthCode + " , " + "NewUserID : " + pNewUserID + " , " + "NewPassword : " + pNewPassword + " , " + "SiteCode : " +  pSiteCode + " " + ex.ToString());
                //}

                try
                {
                    LogUtility.LogWrite(pAuthCode, pNewUserID, "ExecuteIntergrationProcessor - execute", "executeTransaction - 시작, updateUserInfo - 시작 " + "AuthCode : " + pAuthCode + " , " + "NewUserID : " + pNewUserID + " , " + "NewPassword : " + pNewPassword + " , " + "RefererSite : " + pRefererSite + " , " + "SiteCode : " + pSiteCode + " , " + "SelectId : " + pSelectId);
                    executeTransaction(pAuthCode, pNewUserID, pNewPassword, pRefererSite, pSiteCode, pSelectId);
                    LogUtility.LogWrite(pAuthCode, pNewUserID, "ExecuteIntergrationProcessor - execute", "executeTransaction - 끝, updateUserInfo - 시작 " + "AuthCode : " + pAuthCode + " , " + "NewUserID : " + pNewUserID + " , " + "NewPassword : " + pNewPassword + " , " + "RefererSite : " + pRefererSite + " , " + "SiteCode : " + pSiteCode + " , " + "SelectId : " + pSelectId);
                }
                catch (Exception ex)
                {
                    LogUtility.LogWrite(pAuthCode, pNewUserID, "ExecuteIntergrationProcessor - execute", "insertUserInfo - 오류 , " + "AuthCode : " + pAuthCode + " , " + "NewUserID : " + pNewUserID + " , " + "NewPassword : " + pNewPassword + " , " + "RefererSite : " + pRefererSite + " , " + "SiteCode : " + pSiteCode + " , " + "SelectId : " + pSelectId + " , " + ex.ToString());
                }

                updateUserInfo(pAuthCode, pNewPassword, pSiteCode);

                LogUtility.LogWrite(pAuthCode, pNewUserID, "ExecuteIntergrationProcessor - execute", "updateUserInfo - 끝");

                m_result.Success = true;

                commit();
            }
            catch (Exception ex)
            {
                Console.Write(ex);
                m_result.Success = false;
                m_result.Message = ex.Message;
                rollBack();
            }

            closeConnector();
        }


        private SelectUserInfoRow getUserInfo(String pAuthCode, String pSiteCode)
        {
            SelectUserInfoRow result = null;
            //TODO : Processor Factory 형식으로 처리 필요.
            SelectUserInfoIntergrationProcesor processor = new SelectUserInfoIntergrationProcesor();
            //processor.assignConnector(m_celemoConnector);
            processor.assignConnector(m_shopConnector);
            processor.execute(String.Empty, String.Empty, pAuthCode);
            if (processor.getResult().getRowCount() == 0)
            {
                throw new Exception("회원정보가 존재하지 않음");
            }

            foreach (SelectUserInfoRow row in processor.getResult().getRow())
            {
                if (result != null) break;
                if (row.SITE_CODE.ToUpper() == pSiteCode.ToUpper()) result = row;
            }
            result = (result == null) ? processor.getResult().getRow()[0] : result;

            return result;
        }

        /// <summary>
        /// 회원가입이 되어있지 않은 사이트에 회원가입을 처리한다.
        /// 회원가입은 사이트코드(SiteCode)로 전달되는 사이트의 값으로, 회원가입 처리한다.
        /// 만약 사이트코드(SiteCode)값이 존재하지 않으면, 임이의 사이트값을 기준으로 회원가입을 처리한다.
        /// </summary>
        /// <param name="pAuthCode"></param>
        /// <param name="pNewUserID"></param>
        /// <param name="pNewPassword"></param>
        /// <param name="pSiteCode"></param>
        private void insertUserInfo(String pAuthCode, String pNewUserID, String pNewPassword, String pSiteCode)
        {
            //TODO : Processor Factory 형식으로 처리 필요.
            InsertUserInfoIntergrationProcessor insertProcessor = new InsertUserInfoIntergrationProcessor();
            //insertProcessor.assignConnector(m_celemoConnector);
            insertProcessor.assignConnector(m_shopConnector);
            IntergrationUserData userData = new IntergrationUserData();
            userData.init(getUserInfo(pAuthCode, pSiteCode));
            userData.PASSWORD = pNewPassword;
            userData.AUTHTYPE = String.IsNullOrEmpty(userData.AUTHTYPE) ? "phone" : userData.AUTHTYPE;
            insertProcessor.execute(userData);
        }


        /// <summary>
        /// 가입된 회원들을 통합회원으로 전환한다.
        /// </summary>
        /// <param name="pAuthCode"></param>
        /// <param name="pNewUserID"></param>
        /// <param name="pNewPassword"></param>
        private void executeTransaction(String pAuthCode, String pNewUserID, String pNewPassword, String pRefererSite, String pSiteCode, String pSelectId)
        {
            //TODO : Processor Factory 형식으로 처리 필요.
            ExecuteTransactionIntergrationProcessor processor = new ExecuteTransactionIntergrationProcessor();
            //processor.assignConnector(m_celemoConnector);
            processor.assignConnector(m_shopConnector);
            processor.execute(pAuthCode, pNewUserID, pNewPassword, pRefererSite, pSiteCode, pSelectId);
        }

        /// <summary>
        /// 가입된 회원들의 정보를 동기화한다.(비밀번호제외)
        /// </summary>
        /// <param name="pAuthCode"></param>
        /// <param name="pNewUserID"></param>
        /// <param name="pNewPassword"></param>
        /// <param name="pSiteCode"></param>
        private void updateUserInfo(String pAuthCode, String pNewPassword, String pSiteCode)
        {
            //TODO : Processor Factory 형식으로 처리 필요.
            UpdateUserInfoIntergrationProcessor processor = new UpdateUserInfoIntergrationProcessor();
            //processor.assignConnector(m_celemoConnector);
            processor.assignConnector(m_shopConnector);
            IntergrationUserData userData = new IntergrationUserData();
            userData.init(getUserInfo(pAuthCode, pSiteCode));
            userData.NEWPASSWORD = (String.IsNullOrEmpty(pNewPassword) ? String.Empty : pNewPassword);
            processor.execute(userData);
        }
    }

    public class ExecuteIntergrationResult : AbstractServiceResult
    {

        public override string parseXML()
        {
            String result = String.Empty;
            result += XMLUtillity.HeadString();
            result += "<ROOT>";
            result += this.buildSuccessXMLElement();
            result += this.buildMessageXMLElement();
            result += "</ROOT>";
            return result;
        }

        public override string parseJSON()
        {
            throw new NotImplementedException();
        }
    }

}