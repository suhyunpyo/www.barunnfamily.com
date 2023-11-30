using BarunnIntergrationService.Common.Attribute;
using BarunnIntergrationService.Common.Databases;
using BarunnIntergrationService.Common.Utillity;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;

namespace BarunnIntergrationService.Service.Member
{
    /// <summary>
    /// 회원가입/통합회원등록 용 Interface
    /// </summary>
    public class InsertUserInfo : IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {

            HttpContextUtility.SetNoCache();

            IntergrationUserData userData = new IntergrationUserData();
            userData.init(context);

            InsertUserInfoIntergrationProcessor processor = new InsertUserInfoIntergrationProcessor();
            processor.execute(userData);
            InsertUserInfoResult result = processor.getResult();

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

    public class InsertUserInfoIntergrationProcessor : AbstractIntergrationProcessor
    {
        private InsertUserInfoResult m_result;

        public InsertUserInfoIntergrationProcessor()
        {
            m_result = new InsertUserInfoResult();
        }

        public InsertUserInfoResult getResult()
        {
            return m_result;
        }

        public void execute(IntergrationUserData pData)
        {
            string StepFunctionName = String.Empty;
            if (pData.insertValidate())
            {
                initConnector();
                beginTrans();

                try
                {
                    StepFunctionName = "insertShopUser";
					m_result.Message = insertShopUser(pData);

                    //StepFunctionName = "insertCelemoUser";
                    //insertCelemoUser(pData);
                    m_result.Success = true;   
                }
                catch (Exception ex)
                {
                    m_result.Message = "FAIL";

					LogUtility.LogWrite(pData.AUTHCODE, pData.USERID, "InsertUserInfoIntergrationProcessor - execute", StepFunctionName + " Error " + ex.ToString());
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

		public class InsertResult : IDatabaseRow
		{
			public String ReturnStr;

			public void update(System.Data.SqlClient.SqlDataReader pReader)
			{
				this.ReturnStr = DataReaderUtillity.GetString(pReader, "ReturnStr");
			}
		}


		private string insertShopUser(IntergrationUserData pData)
        {
			DatabaseSingleRowCollection<InsertResult> InsertResultModel = new DatabaseSingleRowCollection<InsertResult>();
			List<IDatabaseResultModel> modelList = new List<IDatabaseResultModel>();
			modelList.Add(InsertResultModel);

			DatabaseMultipleResultRowCollection resultModel = new DatabaseMultipleResultRowCollection(modelList);

			ProcedureCallCommand command = ShopDatabaseFactory.createCommandInsertUserInfo(pData.USERID, pData.PASSWORD,
                pData.AUTHTYPE, pData.AUTHCODE, pData.AUTHVNO, pData.USERNAME, pData.PHONE, pData.CELLPHONE, pData.EMAIL,
                pData.ZIPCODE, pData.ADDR, pData.ADDRDETAIL, pData.ALLOWSMS, pData.ALLOWMALLING, pData.BIRTH_DATE, pData.BIRTH_DATE_TYPE,
                pData.CHOICE_AGREEMENT_FOR_THIRDPARTY, pData.CHOICE_AGREEMENT_FOR_SAMSUNG_MEMBERSHIP, pData.CHOICE_AGREEMENT_FOR_SAMSUNG_CHOICE_PERSONAL_DATA, pData.CHOICE_AGREEMENT_FOR_SAMSUNG_THIRDPARTY,
                pData.WEDDING_DAY, pData.WEDDING_HALL,
                pData.ORI_BIRTH_DATE, pData.GENDER, pData.NATIONAL_INFO,
                pData.ENCODE_DATA, pData.AUTH_MODULE_TYPE,
                pData.CHOICE_AGREEMENT_FOR_MYOMEE_MEMBERSHIP,
                pData.CHOICE_AGREEMENT_FOR_ILOOM_MEMBERSHIP, pData.CHOICE_AGREEMENT_FOR_LG_MEMBERSHIP, pData.CHOICE_AGREEMENT_FOR_LG_CHOICE_PERSONAL_DATA,
                  pData.CHOICE_AGREEMENT_FOR_CUCKOO_MEMBERSHIP, pData.CHOICE_AGREEMENT_FOR_CASAMIA_MEMBERSHIP, pData.CHOICE_AGREEMENT_FOR_KT_MEMBERSHIP, pData.WEDD_NAME, pData.SAMSUNG_MEMBERSHIP_PERIOD, pData.CHOICE_AGREEMENT_FOR_HYUNDAI_MEMBERSHIP
                // pData.CHOICE_AGREEMENT_FOR_CUCKOO_MEMBERSHIP, pData.CHOICE_AGREEMENT_FOR_CASAMIA_MEMBERSHIP, pData.CHOICE_AGREEMENT_FOR_KT_MEMBERSHIP, pData.WEDD_NAME, pData.SAMSUNG_MEMBERSHIP_PERIOD
                );
            //m_shopConnector.Execute(command);

            m_shopConnector.Execute(command, resultModel);


            string ReturnStr = InsertResultModel.getRow().ReturnStr;

            return ReturnStr;

		}

		//private void insertCelemoUser(IntergrationUserData pData)
		//{
		//    ProcedureCallCommand command = CelemoDatabaseFactory.createCommandInsertUserInfo(pData.USERID, pData.PASSWORD,
		//        pData.AUTHTYPE, pData.AUTHCODE, pData.AUTHVNO, pData.USERNAME, pData.PHONE, pData.CELLPHONE, pData.EMAIL,
		//        pData.ZIPCODE, pData.ADDR, pData.ADDRDETAIL,
		//        pData.BIRTH_DATE_TYPE,pData.BIRTH_DATE,
		//        pData.ALLOWSMS, pData.ALLOWMALLING);
		//    m_celemoConnector.execute(command);
		//}
	}

    public class IntergrationUserData
    {

        #region Getter/Setter
        [InsertRequire,UpdateRequire]
        public String USERID;
        [InsertRequire]
        public String PASSWORD;
        public String NEWPASSWORD;
        
        public String AUTHTYPE;
        [InsertRequire, UpdateRequire]
        public String AUTHCODE;
        [InsertRequire]
        public String AUTHVNO;
        [InsertRequire]
        public String USERNAME;
        [InsertRequire, UpdateRequire]
        public String PHONE;
        [InsertRequire, UpdateRequire]
        public String CELLPHONE;
        [InsertRequire, UpdateRequire]
        public String EMAIL;
        [InsertRequire, UpdateRequire]
        public String ZIPCODE;
        [InsertRequire, UpdateRequire]
        public String ADDR;
        [InsertRequire, UpdateRequire]
        public String ADDRDETAIL;
        public Boolean ALLOWSMS;
        public Boolean ALLOWMALLING;

        public String WEDDING_DAY;
        public String WEDDING_HALL;
        public String BIRTH_DATE;
        public String BIRTH_DATE_TYPE;

        public Boolean CHOICE_AGREEMENT_FOR_THIRDPARTY;
        public Boolean CHOICE_AGREEMENT_FOR_SAMSUNG_MEMBERSHIP;
        public Boolean CHOICE_AGREEMENT_FOR_SAMSUNG_CHOICE_PERSONAL_DATA;
        public Boolean CHOICE_AGREEMENT_FOR_SAMSUNG_THIRDPARTY;

        //엘지전자 추가
        public Boolean CHOICE_AGREEMENT_FOR_LG_MEMBERSHIP;
        public Boolean CHOICE_AGREEMENT_FOR_LG_CHOICE_PERSONAL_DATA;
        //public Boolean CHOICE_AGREEMENT_FOR_LG_THIRDPARTY;

        //쿠쿠홈시스 추가
        public Boolean CHOICE_AGREEMENT_FOR_CUCKOO_MEMBERSHIP;

        //까사미아 추가
        public Boolean CHOICE_AGREEMENT_FOR_CASAMIA_MEMBERSHIP;

        //KT 추가
        public Boolean CHOICE_AGREEMENT_FOR_KT_MEMBERSHIP;

        //예식장 추가
        public String WEDD_NAME;

        //삼성동의기간
        public String SAMSUNG_MEMBERSHIP_PERIOD;

        //롯데묘미 추가
        public Boolean CHOICE_AGREEMENT_FOR_MYOMEE_MEMBERSHIP;

        public Boolean CHOICE_AGREEMENT_FOR_ILOOM_MEMBERSHIP;
        public Boolean CHOICE_AGREEMENT_FOR_ILOOM_CHOICE_PERSONAL_DATA;
        public Boolean CHOICE_AGREEMENT_FOR_ILOOM_THIRDPARTY;


        //현대백화점 신촌점 추가
        public Boolean CHOICE_AGREEMENT_FOR_HYUNDAI_MEMBERSHIP;


        public String ORI_BIRTH_DATE;
        public String GENDER;
        public String NATIONAL_INFO;

        public String ENCODE_DATA;
        public String AUTH_MODULE_TYPE;

        #endregion

        /// <summary>
        /// HTTP Request를 이용하여 초기화한다.
        /// </summary>
        /// <param name="pContext"></param>
        public void init(HttpContext pContext)
        {
            this.USERID = CastingUtillity.ParseToString(HTTPRequestUtillity.GetParamValue(pContext, "USERID"), "");
            this.PASSWORD = CastingUtillity.ParseToString(HTTPRequestUtillity.GetParamValue(pContext, "PASSWORD"), "");
            this.NEWPASSWORD = CastingUtillity.ParseToString(HTTPRequestUtillity.GetParamValue(pContext, "NEWPASSWORD"), "");
            this.AUTHTYPE = CastingUtillity.ParseToString(HTTPRequestUtillity.GetParamValue(pContext, "AUTHTYPE"), "");
            this.AUTHCODE = CastingUtillity.ParseToString(HTTPRequestUtillity.GetParamValue(pContext, "AUTHCODE"), "");
            this.AUTHVNO = CastingUtillity.ParseToString(HTTPRequestUtillity.GetParamValue(pContext, "AUTHVNO"), "");
            this.USERNAME = CastingUtillity.ParseToString(HTTPRequestUtillity.GetParamValue(pContext, "USERNAME"), "");
            this.PHONE = CastingUtillity.ParseToString(HTTPRequestUtillity.GetParamValue(pContext, "PHONE"), "");
            this.CELLPHONE = CastingUtillity.ParseToString(HTTPRequestUtillity.GetParamValue(pContext, "CELLPHONE"), "");
            this.EMAIL = CastingUtillity.ParseToString(HTTPRequestUtillity.GetParamValue(pContext, "EMAIL"), "");
            this.ZIPCODE = CastingUtillity.ParseToString(HTTPRequestUtillity.GetParamValue(pContext, "ZIPCODE"), "");
            this.ADDR = CastingUtillity.ParseToString(HTTPRequestUtillity.GetParamValue(pContext, "ADDR"), "");
            this.ADDRDETAIL = CastingUtillity.ParseToString(HTTPRequestUtillity.GetParamValue(pContext, "ADDRDETAIL"), "");
            this.ALLOWSMS = (CastingUtillity.ParseToString(HTTPRequestUtillity.GetParamValue(pContext, "ALLOWSMS"), "").ToUpper() == "Y");
            this.ALLOWMALLING = (CastingUtillity.ParseToString(HTTPRequestUtillity.GetParamValue(pContext, "ALLOWMALLING"), "").ToUpper() == "Y");
            this.BIRTH_DATE = CastingUtillity.ParseToString(HTTPRequestUtillity.GetParamValue(pContext, "BIRTH_DATE"), "");
            this.BIRTH_DATE_TYPE = CastingUtillity.ParseToString(HTTPRequestUtillity.GetParamValue(pContext, "BIRTH_DATE_TYPE"), "");

            switch (BIRTH_DATE_TYPE.ToLower())
            {
                case "sola":
                    BIRTH_DATE_TYPE = "S";
                    break;
                case "luna":
                    BIRTH_DATE_TYPE = "L";
                    break;

            }
        }


        public void init(SelectUserInfoRow pRow)
        {
            this.USERID = pRow.USER_ID;
            this.USERNAME = pRow.USER_NAME;
            this.EMAIL = pRow.USER_EMAIL;
            this.AUTHCODE = pRow.AUTH_CODE;
            this.AUTHTYPE = pRow.AUTH_TYPE;
            this.AUTHVNO = pRow.AUTH_VNO;
            this.ZIPCODE = pRow.ZIPCODE;
            this.PHONE = pRow.PHONE;
            this.CELLPHONE = pRow.CELLPHONE;
            this.ADDR = pRow.ADDRESS;
            this.ADDRDETAIL = pRow.ADDRESS_DETAIL;
            this.ALLOWSMS = pRow.ALLOWSMS;
            this.ALLOWMALLING = pRow.ALLOWMAILING;
            this.WEDDING_DAY = pRow.WEDDING_DAY;
            this.WEDDING_HALL = pRow.WEDDING_HALL;
            this.BIRTH_DATE = pRow.BIRTH_DATE;
            this.BIRTH_DATE_TYPE = pRow.BIRTH_DATE_TYPE;
            this.CHOICE_AGREEMENT_FOR_THIRDPARTY = pRow.CHOICE_AGREEMENT_FOR_THIRDPARTY;
            this.CHOICE_AGREEMENT_FOR_SAMSUNG_MEMBERSHIP = pRow.CHOICE_AGREEMENT_FOR_SAMSUNG_MEMBERSHIP;
            this.CHOICE_AGREEMENT_FOR_SAMSUNG_CHOICE_PERSONAL_DATA = pRow.CHOICE_AGREEMENT_FOR_SAMSUNG_CHOICE_PERSONAL_DATA;
            this.CHOICE_AGREEMENT_FOR_SAMSUNG_THIRDPARTY = pRow.CHOICE_AGREEMENT_FOR_SAMSUNG_THIRDPARTY;
            this.CHOICE_AGREEMENT_FOR_MYOMEE_MEMBERSHIP = pRow.CHOICE_AGREEMENT_FOR_MYOMEE_MEMBERSHIP;

            this.CHOICE_AGREEMENT_FOR_ILOOM_MEMBERSHIP = pRow.CHOICE_AGREEMENT_FOR_ILOOM_MEMBERSHIP;
            this.CHOICE_AGREEMENT_FOR_ILOOM_CHOICE_PERSONAL_DATA = pRow.CHOICE_AGREEMENT_FOR_ILOOM_CHOICE_PERSONAL_DATA;
            this.CHOICE_AGREEMENT_FOR_ILOOM_THIRDPARTY = pRow.CHOICE_AGREEMENT_FOR_ILOOM_THIRDPARTY;

            this.ORI_BIRTH_DATE = pRow.ORI_BIRTH_DATE;
            this.GENDER = pRow.GENDER;
            this.NATIONAL_INFO = pRow.NATIONAL_INFO;

            this.ENCODE_DATA = pRow.ENCODE_DATA;
            this.AUTH_MODULE_TYPE = pRow.AUTH_MODULE_TYPE;

            //엘지전자 추가
            this.CHOICE_AGREEMENT_FOR_LG_MEMBERSHIP = pRow.CHOICE_AGREEMENT_FOR_LG_MEMBERSHIP;
            this.CHOICE_AGREEMENT_FOR_LG_CHOICE_PERSONAL_DATA = pRow.CHOICE_AGREEMENT_FOR_LG_CHOICE_PERSONAL_DATA;

            //쿠쿠
            this.CHOICE_AGREEMENT_FOR_CUCKOO_MEMBERSHIP = pRow.CHOICE_AGREEMENT_FOR_CUCKOO_MEMBERSHIP;

            //까사미아
            this.CHOICE_AGREEMENT_FOR_CASAMIA_MEMBERSHIP = pRow.CHOICE_AGREEMENT_FOR_CASAMIA_MEMBERSHIP;

            //KT
            this.CHOICE_AGREEMENT_FOR_KT_MEMBERSHIP = pRow.CHOICE_AGREEMENT_FOR_KT_MEMBERSHIP;

            //예식장
            this.WEDD_NAME = pRow.WEDD_NAME;

            //삼성동의기간
            this.SAMSUNG_MEMBERSHIP_PERIOD = pRow.SAMSUNG_MEMBERSHIP_PERIOD;

            //현대백화점 신촌점
            this.CHOICE_AGREEMENT_FOR_HYUNDAI_MEMBERSHIP = pRow.CHOICE_AGREEMENT_FOR_HYUNDAI_MEMBERSHIP;

        }

        /// <summary>
        /// Insert 를 위한 무결성 검사
        /// </summary>
        /// <returns></returns>
        public Boolean insertValidate()
        {
            Boolean result = true;
            foreach (FieldInfo fieldInfo in this.GetType().GetFields().Where(s => Attribute.IsDefined(s, typeof(InsertRequire))))
            {
                if (result == false) break;
                if(fieldInfo.FieldType==typeof(String))
                {
                    String fieldValue = (String)fieldInfo.GetValue(this);
                    result = (String.IsNullOrEmpty(fieldValue) == false);
                }
            }
            return result;
        }

        /// <summary>
        /// Update를 위한 무결성 검사
        /// </summary>
        /// <returns></returns>
        public Boolean updateValidate()
        {
            Boolean result = true;
            foreach (FieldInfo fieldInfo in this.GetType().GetFields().Where(s => Attribute.IsDefined(s, typeof(UpdateRequire))))
            {
                if (result == false) break;
                if (fieldInfo.FieldType == typeof(String))
                {
                    String fieldValue = (String)fieldInfo.GetValue(this);
                    result = (String.IsNullOrEmpty(fieldValue) == false);
                }
            }
            return result;
        }

    }

    public class InsertUserInfoResult : AbstractServiceResult
    {
        public InsertUserInfoResult()
        {
            this.m_success = false;
        }

        public override String parseXML()
        {
            String result = String.Empty;
            result = XMLUtillity.HeadString();
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