using BarunnIntergrationService.Common.Databases;
using BarunnIntergrationService.Common.Utillity;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Web;

namespace BarunnIntergrationService.Service.Member
{
    /// <summary>
    /// SelectUserInfo의 요약 설명입니다.
    /// </summary>
    public class SelectUserInfo : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {

            HttpContextUtility.SetNoCache();

            String userID = HTTPRequestUtillity.GetParamValue("USERID");
            String password = HTTPRequestUtillity.GetParamValue("PASSWORD");
            String authcode = HTTPRequestUtillity.GetParamValue("AUTHCODE");

            //userID = "s4guest";
            //password = "ysmguest1";

            SelectUserInfoIntergrationProcesor processor = new SelectUserInfoIntergrationProcesor();
            processor.execute(userID, password, authcode);
            SelectUserInfoResult result = processor.getResult();

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

    public class SelectUserInfoIntergrationProcesor : AbstractIntergrationProcessor
    {
        private SelectUserInfoResult m_result;

        public SelectUserInfoIntergrationProcesor()
        {
            m_result = new SelectUserInfoResult();
        }

        public SelectUserInfoResult getResult()
        {
            return m_result;
        }

        public void execute(String pUserID, String pPassword, String pAuthCode)
        {
            initConnector();
            try
            {
                
                if (String.IsNullOrEmpty(pAuthCode) == false)
                {
                    //본인 인증 값으로 회원 검사 시행하는 경우
                    selectShopUserInfo(m_result, pUserID, pPassword, pAuthCode);
                    //selectCelemoUserInfo(m_result, pUserID, pPassword, pAuthCode);
                }
                else
                {
                    #region 본인 인증은 동일하나, ID 및 PASSWORD 가 다른 경우에 대비한 처리
                    Boolean existShopUser = false;
                    //Boolean existCelemoUser = false;
                    int shopUserCount = 0;

                    selectShopUserInfo(m_result, pUserID, pPassword, pAuthCode);
                    shopUserCount = m_result.getRowCount();
                    existShopUser = (shopUserCount > 0);

                    //selectCelemoUserInfo(m_result, pUserID, pPassword, pAuthCode);
                    //existCelemoUser = (shopUserCount < m_result.getRowCount());

                    if (existShopUser == false)
                    {
                        selectShopUserInfo(m_result, string.Empty, string.Empty, m_result.getRow()[0].AUTH_CODE);
                    }

                    //if (existCelemoUser == true && existShopUser == false)
                    //{
                    //    selectShopUserInfo(m_result, string.Empty, string.Empty, m_result.getRow()[0].AUTH_CODE);
                    //}
                    //else if (existShopUser == true && existCelemoUser == false)
                    //{
                    //    selectCelemoUserInfo(m_result, string.Empty, string.Empty, m_result.getRow()[0].AUTH_CODE);
                    //}
                    #endregion
                }

                m_result.Success = true;
            }
            catch (Exception ex)
            {
                m_result.Message = ex.Message;
                m_result.Success = false;
            }

            #region 전환 가능 아이디 여부 체크
            foreach (SelectUserInfoRow row in m_result.getRow())
            {
                CheckAvaliableUserIntergrationProcesor processor = new CheckAvaliableUserIntergrationProcesor();
                //processor.assignConnector(m_celemoConnector);
                processor.assignConnector(m_shopConnector);
                processor.execute(row.USER_ID, row.AUTH_CODE);
                CheckAvailableUserResult result = processor.getResult();
                row.IS_AVAILABLE = result.Avaliable;
            }
            #endregion

            closeConnector();
        }

        private void selectShopUserInfo(SelectUserInfoResult pRefResult, String pUserID, String pPassword, String pAuthCode)
        {
            DatabaseSingleRowCollection<SelectUserSuccessRow> successResultModel = new DatabaseSingleRowCollection<SelectUserSuccessRow>();
            DatabaseRowCollection<SelectUserInfoRow> userInfoResultModel = new DatabaseRowCollection<SelectUserInfoRow>();

            List<IDatabaseResultModel> modelList = new List<IDatabaseResultModel>();
            modelList.Add(successResultModel);
            modelList.Add(userInfoResultModel);

            DatabaseMultipleResultRowCollection resultModel = new DatabaseMultipleResultRowCollection(modelList);

            
            if (String.IsNullOrEmpty(pAuthCode))
            {
                m_shopConnector.Execute(ShopDatabaseFactory.createCommandSelectUserInfo(pUserID, pPassword), resultModel);
            }
            else
            {
                m_shopConnector.Execute(ShopDatabaseFactory.createCommandSelectUserInfo(pAuthCode), resultModel);
            }
            

            foreach (SelectUserInfoRow row in userInfoResultModel.getRowList())
            {
                if (String.IsNullOrEmpty(row.USER_ID)) continue;
                row.AUTH_CODE = successResultModel.getRow().DUPINFO;
                pRefResult.registRow(row);
            }
        }

        //private void selectCelemoUserInfo(SelectUserInfoResult pRefResult, String pUserID, String pPassword, String pAuthCode)
        //{
        //    MysqlDatabaseRowCollection<SelectUserInfoRow> resultModel = new MysqlDatabaseRowCollection<SelectUserInfoRow>();
            

        //    if (String.IsNullOrEmpty(pAuthCode))
        //    {
        //        m_celemoConnector.execute(CelemoDatabaseFactory.createCommandSelectUserInfo(pUserID, pPassword), resultModel);
        //    }
        //    else
        //    {
        //        m_celemoConnector.execute(CelemoDatabaseFactory.createCommandSelectUserInfo(pAuthCode), resultModel);
        //    }

        //    foreach (SelectUserInfoRow row in resultModel.getRowList()) pRefResult.registRow(row);
        //}
    }

    public class SelectUserInfoResult:AbstractServiceResult
    {

        private List<SelectUserInfoRow> m_rowList;
        public List<SelectUserInfoRow> Result
        {
            get
            {
                return m_rowList;
            }
        }

        public SelectUserInfoResult()
        {
            this.m_success = false;
            this.m_rowList = new List<SelectUserInfoRow>();
        }

        public void registRow(SelectUserInfoRow pRow)
        {
            this.m_rowList.Add(pRow);
        }

        public List<SelectUserInfoRow> getRow()
        {
            return this.m_rowList;
        }

        public int getRowCount()
        {
            return this.m_rowList.Count;
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
            result += " <RESULT>";
            foreach (SelectUserInfoRow row in m_rowList) result += buildRowXMLElement(row);
            result += " </RESULT>";
            result += "</ROOT>";
            return result;
        }

        private String buildRowXMLElement(SelectUserInfoRow pRow)
        {
            String result = String.Empty;
            result += "<ELEMENT>";
            result += " <AUTH_CODE>" + XMLUtillity.WrapCDATA(pRow.AUTH_CODE) + "</AUTH_CODE>";
            result += " <AUTH_TYPE>" + XMLUtillity.WrapCDATA(pRow.AUTH_TYPE) + "</AUTH_TYPE>";
            result += " <AUTH_VNO>" + XMLUtillity.WrapCDATA(pRow.AUTH_VNO) + "</AUTH_VNO>";
            result += " <USER_ID>" + XMLUtillity.WrapCDATA(pRow.USER_ID) + "</USER_ID>";
            result += " <USER_NAME>" + XMLUtillity.WrapCDATA(pRow.USER_NAME) + "</USER_NAME>";
            result += " <USER_EMAIL>" + XMLUtillity.WrapCDATA(pRow.USER_EMAIL) + "</USER_EMAIL>";
            result += " <SITE_CODE>" + XMLUtillity.WrapCDATA(pRow.SITE_CODE) + "</SITE_CODE>";
            result += " <SITE_KR_NAME>" + XMLUtillity.WrapCDATA(pRow.SITE_KR_NAME) + "</SITE_KR_NAME>";
            result += " <ZIPCODE>" + XMLUtillity.WrapCDATA(pRow.ZIPCODE) + "</ZIPCODE>";
            result += " <PHONE>" + XMLUtillity.WrapCDATA(pRow.PHONE) + "</PHONE>";
            result += " <CELLPHONE>" + XMLUtillity.WrapCDATA(pRow.CELLPHONE) + "</CELLPHONE>";
            result += " <ADDRESS>" + XMLUtillity.WrapCDATA(pRow.ADDRESS) + "</ADDRESS>";
            result += " <ADDRESS_DETAIL>" + XMLUtillity.WrapCDATA(pRow.ADDRESS_DETAIL) + "</ADDRESS_DETAIL>";
            result += " <ALLOWSMS>" + XMLUtillity.WrapCDATA(pRow.ALLOWSMS.ToString().ToUpper()) + "</ALLOWSMS>";
            result += " <ALLOWMAILING>" + XMLUtillity.WrapCDATA(pRow.ALLOWMAILING.ToString().ToUpper()) + "</ALLOWMAILING>";
            result += " <IS_INTERGRATION_MEMBER>" + XMLUtillity.WrapCDATA(pRow.IS_INTERGRATION_MEMBER.ToString().ToUpper()) + "</IS_INTERGRATION_MEMBER>";
            result += " <IS_AVAILABLE>" + XMLUtillity.WrapCDATA(pRow.IS_AVAILABLE.ToString().ToUpper()) + "</IS_AVAILABLE>";
            result += "</ELEMENT>";
            return result;
        }

        public override String parseJSON()
        {
            return JsonConvert.SerializeObject(this);
        }
    }

    public class SelectUserSuccessRow : IDatabaseRow
    {
        public String RESULT_CODE;
        public String DUPINFO;
        public Boolean IS_INTERGRATION_MEMBER;

        public void update(System.Data.SqlClient.SqlDataReader pReader)
        {
            this.RESULT_CODE = DataReaderUtillity.GetString(pReader, "RESULT_CODE");
            this.DUPINFO = DataReaderUtillity.GetString(pReader, "DUPINFO");
            this.IS_INTERGRATION_MEMBER = (DataReaderUtillity.GetString(pReader, "INTERGRATION_MEMBER_YORN") == "Y");
        }
    }

    public class SelectUserInfoRow:IDatabaseRow
    {
        public String USER_ID;
        public String USER_NAME;
        public String USER_EMAIL;
        public String SITE_CODE;
        public String SITE_KR_NAME;
        public String AUTH_CODE;
        public String AUTH_TYPE;
        public String AUTH_VNO;
        public String ZIPCODE;
        public String PHONE;
        public String CELLPHONE;
        public String ADDRESS;
        public String ADDRESS_DETAIL;
        public Boolean ALLOWSMS;
        public Boolean ALLOWMAILING;
        public Boolean IS_INTERGRATION_MEMBER;
        public Boolean IS_AVAILABLE;

        public String WEDDING_DAY;
        public String WEDDING_HALL;
        public String BIRTH_DATE;
        public String BIRTH_DATE_TYPE;
        public Boolean CHOICE_AGREEMENT_FOR_THIRDPARTY;
        public Boolean CHOICE_AGREEMENT_FOR_SAMSUNG_MEMBERSHIP;
        public Boolean CHOICE_AGREEMENT_FOR_SAMSUNG_CHOICE_PERSONAL_DATA;
        public Boolean CHOICE_AGREEMENT_FOR_SAMSUNG_THIRDPARTY;
        // 롯데묘미 추가
        public Boolean CHOICE_AGREEMENT_FOR_MYOMEE_MEMBERSHIP;
        // 일룸 추가
        public Boolean CHOICE_AGREEMENT_FOR_ILOOM_MEMBERSHIP;
        public Boolean CHOICE_AGREEMENT_FOR_ILOOM_CHOICE_PERSONAL_DATA;
        public Boolean CHOICE_AGREEMENT_FOR_ILOOM_THIRDPARTY;

        //엘지전자 추가
        public Boolean CHOICE_AGREEMENT_FOR_LG_MEMBERSHIP;
        public Boolean CHOICE_AGREEMENT_FOR_LG_CHOICE_PERSONAL_DATA;

        //쿠쿠
        public Boolean CHOICE_AGREEMENT_FOR_CUCKOO_MEMBERSHIP;

        //까사미아
        public Boolean CHOICE_AGREEMENT_FOR_CASAMIA_MEMBERSHIP;

        //KT 추가
        public Boolean CHOICE_AGREEMENT_FOR_KT_MEMBERSHIP;

        //예식장
        public String WEDD_NAME;

        //삼성동의기간
        public String SAMSUNG_MEMBERSHIP_PERIOD;

        public String ORI_BIRTH_DATE;
        public String GENDER;
        public String NATIONAL_INFO;

        public String ENCODE_DATA;
        public String AUTH_MODULE_TYPE;

        public String REG_DATE;
        public String INTERGRATION_DATE;


        /// <summary>
        /// 현대백화점 신촌점
        /// </summary>
        public Boolean CHOICE_AGREEMENT_FOR_HYUNDAI_MEMBERSHIP;

        public void update(System.Data.SqlClient.SqlDataReader pReader)
        {
            this.USER_ID = DataReaderUtillity.GetString(pReader, "UID", "");
            this.USER_NAME = DataReaderUtillity.GetString(pReader, "UNAME", "");
            this.USER_EMAIL = DataReaderUtillity.GetString(pReader, "UMAIL", "");
            this.SITE_CODE = DataReaderUtillity.GetString(pReader, "SITE_DIV", "");
            this.SITE_KR_NAME = DataReaderUtillity.GetString(pReader, "SITE_DIV_NAME", "");
            this.AUTH_CODE = DataReaderUtillity.GetString(pReader, "AUTH_CODE", "");
            this.AUTH_TYPE = DataReaderUtillity.GetString(pReader, "AUTH_TYPE", "");
            this.AUTH_VNO = DataReaderUtillity.GetString(pReader, "AUTH_VNO", "");
            this.IS_INTERGRATION_MEMBER = (DataReaderUtillity.GetString(pReader, "INTERGRATION_MEMBER_YORN", "").ToUpper() == "Y");
            this.ZIPCODE = DataReaderUtillity.GetString(pReader, "ZIPCODE", "");
            this.PHONE = DataReaderUtillity.GetString(pReader, "PHONE", "");
            this.CELLPHONE = DataReaderUtillity.GetString(pReader, "CELLPHONE", "");
            this.ADDRESS = DataReaderUtillity.GetString(pReader, "ADDRESS", "");
            this.ADDRESS_DETAIL = DataReaderUtillity.GetString(pReader, "ADDRESS_DETAIL", "");
            this.ALLOWSMS = (DataReaderUtillity.GetString(pReader, "ALLOWSMS", "").ToUpper() == "Y");
            this.ALLOWMAILING = (DataReaderUtillity.GetString(pReader, "ALLOWMAILING", "").ToUpper() == "Y");
            this.BIRTH_DATE = DataReaderUtillity.GetString(pReader, "BIRTH_DATE", "");
            this.BIRTH_DATE_TYPE = DataReaderUtillity.GetString(pReader, "BIRTH_DATE_TYPE", "");
            this.WEDDING_DAY = DataReaderUtillity.GetString(pReader, "WEDDING_DAY", "");
            this.WEDDING_HALL = DataReaderUtillity.GetString(pReader, "WEDDING_HALL", "");
            this.INTERGRATION_DATE = DataReaderUtillity.GetString(pReader, "INTERGRATION_DATE", "");
            this.REG_DATE = DataReaderUtillity.GetString(pReader, "REG_DATE", "");
            this.CHOICE_AGREEMENT_FOR_THIRDPARTY = (DataReaderUtillity.GetString(pReader, "CHOICE_AGREEMENT_FOR_THIRDPARTY", "").ToUpper() == "Y");
            this.CHOICE_AGREEMENT_FOR_SAMSUNG_MEMBERSHIP = (DataReaderUtillity.GetString(pReader, "CHOICE_AGREEMENT_FOR_SAMSUNG_MEMBERSHIP", "").ToUpper() == "Y");
            this.CHOICE_AGREEMENT_FOR_SAMSUNG_CHOICE_PERSONAL_DATA = (DataReaderUtillity.GetString(pReader, "CHOICE_AGREEMENT_FOR_SAMSUNG_CHOICE_PERSONAL_DATA", "").ToUpper() == "Y");
            this.CHOICE_AGREEMENT_FOR_SAMSUNG_THIRDPARTY = (DataReaderUtillity.GetString(pReader, "CHOICE_AGREEMENT_FOR_SAMSUNG_THIRDPARTY", "").ToUpper() == "Y");
            this.CHOICE_AGREEMENT_FOR_MYOMEE_MEMBERSHIP = (DataReaderUtillity.GetString(pReader, "CHOICE_AGREEMENT_FOR_MYOMEE_MEMBERSHIP", "").ToUpper() == "Y");

            this.CHOICE_AGREEMENT_FOR_ILOOM_MEMBERSHIP = (DataReaderUtillity.GetString(pReader, "CHOICE_AGREEMENT_FOR_ILOOM_MEMBERSHIP", "").ToUpper() == "Y");
            this.CHOICE_AGREEMENT_FOR_ILOOM_CHOICE_PERSONAL_DATA = (DataReaderUtillity.GetString(pReader, "CHOICE_AGREEMENT_FOR_ILOOM_CHOICE_PERSONAL_DATA", "").ToUpper() == "Y");
            this.CHOICE_AGREEMENT_FOR_ILOOM_THIRDPARTY = (DataReaderUtillity.GetString(pReader, "CHOICE_AGREEMENT_FOR_ILOOM_THIRDPARTY", "").ToUpper() == "Y");

            //엘지전자 추가
            this.CHOICE_AGREEMENT_FOR_LG_MEMBERSHIP = (DataReaderUtillity.GetString(pReader, "CHOICE_AGREEMENT_FOR_LG_MEMBERSHIP", "").ToUpper() == "Y");
            this.CHOICE_AGREEMENT_FOR_LG_CHOICE_PERSONAL_DATA = (DataReaderUtillity.GetString(pReader, "CHOICE_AGREEMENT_FOR_LG_CHOICE_PERSONAL_DATA", "").ToUpper() == "Y");

            //쿠쿠
            this.CHOICE_AGREEMENT_FOR_CUCKOO_MEMBERSHIP = (DataReaderUtillity.GetString(pReader, "CHOICE_AGREEMENT_FOR_CUCKOO_MEMBERSHIP", "").ToUpper() == "Y");

            //까사미아
            this.CHOICE_AGREEMENT_FOR_CASAMIA_MEMBERSHIP = (DataReaderUtillity.GetString(pReader, "CHOICE_AGREEMENT_FOR_CASAMIA_MEMBERSHIP", "").ToUpper() == "Y");

            //KT 추가
            this.CHOICE_AGREEMENT_FOR_KT_MEMBERSHIP = (DataReaderUtillity.GetString(pReader, "CHOICE_AGREEMENT_FOR_KT_MEMBERSHIP", "").ToUpper() == "Y");

            //예식장 추가
            this.WEDD_NAME = DataReaderUtillity.GetString(pReader, "WEDD_NAME", "");
            //삼성동의기간
            this.SAMSUNG_MEMBERSHIP_PERIOD = DataReaderUtillity.GetString(pReader, "SAMSUNG_MEMBERSHIP_PERIOD", "");

            //현대백화점 추가 
            this.CHOICE_AGREEMENT_FOR_HYUNDAI_MEMBERSHIP = (DataReaderUtillity.GetString(pReader, "CHOICE_AGREEMENT_FOR_HYUNDAI_MEMBERSHIP", "").ToUpper() == "Y");
        }

        
    }
}