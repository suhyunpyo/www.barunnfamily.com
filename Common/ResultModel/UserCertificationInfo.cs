using BarunnIntergrationService.Common.Utillity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BarunnIntergrationService.Common.ResultModel
{
    public class UserCertificationInfo
    {
        public String VIRTUAL_IDENTITY_NUMBER;                  // 가상주민번호 (13자리이며, 숫자 또는 문자 포함)
        public String NAME;                                     // 이름
        public String DUP_INFO;                                 // 중복가입 확인값 (DI - 64 byte 고유값)
        public String CONN_INFO;                                // 연계정보 확인값 (CI - 88 byte 고유값)
        public String AGE_CODE;                                 // 연령대 코드 (개발 가이트 참조)
        public String GENDER_CODE;                              // 성별 코드 (개발 가이드 참조)
        public String BIRTH_DATE;                               // 생년월일 (YYYYMMDD)
        public String NATIONAL_INFO;                            // 내/외국인 정보 (개발 가이드 참조)
        public String REQUEST_NUMBER;                           // CP 요청번호
        public String RESPONSE_NUMBER;                          
        public String AUTH_INFO;                                // 본인확인 수단 (개발 가이드 참조)
        public String CI_UPDATE;                                // CI 갱신정보
        public String AUTH_MODULE_TYPE;
        public String MOBILE_NO;                                // 연락처

		
        public void update(NiceCPCResponseData cpClientData)
		{
			this.REQUEST_NUMBER = cpClientData.requestno;
            this.RESPONSE_NUMBER = cpClientData.responseno;
			this.AUTH_INFO = cpClientData.authtype;
            this.NAME = cpClientData.name;
			this.BIRTH_DATE = cpClientData.birthdate;
			this.GENDER_CODE = cpClientData.gender;
			this.NATIONAL_INFO = cpClientData.nationalinfo;
			this.DUP_INFO = cpClientData.di;
			this.CONN_INFO = cpClientData.ci;
			this.MOBILE_NO = cpClientData.mobileno;
		}

		public void update(NiceIPINResponseData iPinData)
		{
			this.REQUEST_NUMBER = iPinData.requestno;	
			this.AUTH_INFO = "I";
			this.NAME = iPinData.name;
			this.BIRTH_DATE = iPinData.birthdate;
			this.GENDER_CODE = iPinData.gendercode;
			this.NATIONAL_INFO = iPinData.nationalinfo;
			this.DUP_INFO = iPinData.dupinfo;
			this.CONN_INFO = iPinData.coinfo1;
		}
    }
}