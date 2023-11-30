using BarunnIntergrationService.Common.Utillity;
using BarunnIntergrationService.Common.Databases;
using System;
using System.Collections.Generic;
using System.Configuration;

namespace BarunnIntergrationService.Common.Databases
{
    public class ShopDatabaseFactory
    {
        public static DBHelper createDBConnector()
        {
            DBHelper result = new DBHelper();
            return result;
        }
         
        

        /// <summary>
        /// 사용가능한 아이디 인지를 체크한다.
        /// </summary>
        /// <param name="pUserID"></param>
        /// <returns></returns>
        public static ProcedureCallCommand createCommandCheckAvailableUser(String pUserID, String pAuthCode)
        {
            ProcedureCallCommand result = new ProcedureCallCommand("SP_EXEC_AVAILABLE_USER_ID_CHECK");
            result.addParameter("@USER_ID", pUserID);
            result.addParameter("@AUTHCODE", pAuthCode);
            return result;
        }


        /// <summary>
        /// pConnInfo 에 해당하는 회원정보를 NewUserID 값으로 대체하고, 각종 레퍼런스들의 값을 일괄 수정한다.
        /// </summary>
        /// <param name="pAuthCode"></param>
        /// <param name="pNewUserID"></param>
        /// <returns></returns>
        public static ProcedureCallCommand createCommandTransactionInfomation(String pAuthCode,String pNewUserID, String pRefererSite, String pSiteCode, String pSelectId)
        {
            ProcedureCallCommand result = new ProcedureCallCommand("SP_EXEC_TRANSACTION_INFORMATION_ID_TO_INTEGRATION_MEMBER");
            result.addParameter("@DUPINFO", pAuthCode);
            result.addParameter("@NEW_ID", pNewUserID);
            result.addParameter("@REFERER_SITE", pRefererSite);
            result.addParameter("@SELECT_SITE", pSiteCode);
            result.addParameter("@SELECT_ID", pSelectId);
            return result;
        }

        /// <summary>
        /// 해당 값에 해당하는 회원 정보가 존재하는지 확인하고, 존재하면 각 사이트에 대한 가입 정보를 리스트로 반환한다.
        /// </summary>
        /// <param name="pUserID"></param>
        /// <param name="pPWD"></param>
        /// <returns></returns>
        public static ProcedureCallCommand createCommandSelectUserInfo(String pUserID, String pPWD)
        {
            ProcedureCallCommand result = new ProcedureCallCommand("SP_SELECT_VW_USER_INFO_FOR_LOGIN");
            result.addParameter("@USER_ID", pUserID);
            result.addParameter("@PASSWORD", pPWD);
            return result;
        }

        /// <summary>
        /// 해당 값에 해당하는 회원 정보가 존재하는지 확인하고, 존재하면 각 사이트에 대한 가입 정보를 리스트로 반환한다.
        /// </summary>
        /// <param name="pAuthCode"></param>
        /// <returns></returns>
        public static ProcedureCallCommand createCommandSelectUserInfo(String pAuthCode)
        {
            ProcedureCallCommand result = new ProcedureCallCommand("SP_SELECT_VW_USER_INFO_FOR_LOGIN");
            result.addParameter("@DUPINFO", pAuthCode);
            return result;
        }

        /// <summary>
        /// 사용자 정보를 추가한다.
        /// </summary>
        /// <param name="pUserID"></param>
        /// <param name="pPassword"></param>
        /// <param name="pAuthCode"></param>
        /// <param name="pAuthVNo"></param>
        /// <param name="pUserName"></param>
        /// <param name="pPhone"></param>
        /// <param name="pCellPhone"></param>
        /// <param name="pEmail"></param>
        /// <param name="pZipCode"></param>
        /// <param name="pAddr"></param>
        /// <param name="pAddrDetail"></param>
        /// <param name="pAllowSMS"></param>
        /// <param name="pAllowMailling"></param>
        /// <returns></returns>
        public static ProcedureCallCommand createCommandInsertUserInfo(String pUserID, String pPassword,
            String pAuthType, String pAuthCode, String pAuthVNo, String pUserName, String pPhone, String pCellPhone, String pEmail,
            String pZipCode, String pAddr, String pAddrDetail, Boolean pAllowSMS, Boolean pAllowMailling,
            String pBirthDate = "", String pBirthDateType = "",
            Boolean pChoiceAgreementForThirdParty = false,
            Boolean pChoiceAgreementForSamsungMembership = false, Boolean pChoiceAgreementForSamsungChoicePersonalData = false, Boolean pChoiceAgreementForSamsungThirdParty = false,
            String pWeddingDay = "", String pWeddingHall = "",
            String pOriBirth = "", String pGender = "", String pNationalInfo = "",
            String pEncodeData = "", String pAuthModuleType = "", Boolean pChoiceAgreementForMyomeeMembership = false,
            Boolean pChoiceAgreementForIloomMembership = false, Boolean pchkChoiceAgreementForLGMembership = false, Boolean pchkChoiceAgreementForLGChoicePersonalData = false,
            Boolean pChkChoiceAgreementForCucKooMembership = false, Boolean pChkChoiceAgreementForCasamiaMembership = false, Boolean pChkChoiceAgreementForKtMembership = false, String pWeddName = "", String pSamsungMembershipPeriod = "", Boolean pChkChoiceAgreementForHyundaiMembership = false

            // Boolean pChkChoiceAgreementForCucKooMembership = false, Boolean pChkChoiceAgreementForCasamiaMembership = false, Boolean pChkChoiceAgreementForKtMembership = false, String pWeddName = "", String pSamsungMembershipPeriod = ""
            )
        {

			// 표수현 수정 
			ProcedureCallCommand result = new ProcedureCallCommand("SP_INSERT_INTEGRATION_MEMBER_SIGN_UP_FOR_EXIST_MEMBER_NEW_20230315");
			//ProcedureCallCommand result = new ProcedureCallCommand("SP_INSERT_INTEGRATION_MEMBER_SIGN_UP_FOR_EXIST_MEMBER_NEW_TEST");
            // ProcedureCallCommand result = new ProcedureCallCommand("SP_INSERT_INTEGRATION_MEMBER_SIGN_UP_FOR_EXIST_MEMBER");


            Dictionary<String, String> extractZipCode = StringExtractUtillity.extractShopZipCode(pZipCode);
            Dictionary<String, String> extractPhone = StringExtractUtillity.extractShopPhone(pPhone);
            Dictionary<String, String> extractCellPhone = StringExtractUtillity.extractShopPhone(pCellPhone);

            Dictionary<String, String> extractWeddingDay = StringExtractUtillity.extractShopPhone(pWeddingDay);

            result.addParameter("@P_AUTHCODE       ", pAuthCode);
            result.addParameter("@P_CONNINFO       ", pAuthVNo);
            result.addParameter("@P_AUTHTYPE       ", pAuthType);
            result.addParameter("@P_UID            ", pUserID);
            result.addParameter("@P_PWD            ", pPassword);
            result.addParameter("@P_UNAME          ", pUserName);
            result.addParameter("@P_EMAIL          ", pEmail);
            result.addParameter("@P_BIRTH          ", pBirthDate);
            result.addParameter("@P_BIRTH_DIV      ", pBirthDateType);
            result.addParameter("@P_ZIP1           ", extractZipCode["head"]);
            result.addParameter("@P_ZIP2           ", extractZipCode["foot"]);
            result.addParameter("@P_ADDRESS        ", pAddr);
            result.addParameter("@P_ADDRESS_DETAIL ", pAddrDetail);
            result.addParameter("@P_PHONE1         ", extractPhone["head"]);
            result.addParameter("@P_PHONE2         ", extractPhone["middle"]);
            result.addParameter("@P_PHONE3         ", extractPhone["foot"]);
            result.addParameter("@P_HPHONE1        ", extractCellPhone["head"]);
            result.addParameter("@P_HPHONE2        ", extractCellPhone["middle"]);
            result.addParameter("@P_HPHONE3        ", extractCellPhone["foot"]);
            result.addParameter("@P_CHK_SMS        ", (pAllowSMS ? "Y" : "N"));
            result.addParameter("@P_CHK_MAILSERVICE", (pAllowMailling ? "Y" : "N"));
            result.addParameter("@P_CHK_SMEMBERSHIP", (pChoiceAgreementForSamsungMembership ? "Y" : "N"));
            result.addParameter("@P_CHK_SMEMBERSHIP_PER", (pChoiceAgreementForSamsungChoicePersonalData ? "Y" : "N"));
            result.addParameter("@P_CHK_SMEMBERSHIP_COOP", (pChoiceAgreementForSamsungThirdParty ? "Y" : "N"));
            result.addParameter("@P_MKT_CHK_FLAG", (pChoiceAgreementForThirdParty ? "Y" : "N"));
            result.addParameter("@P_WEDDING_YEAR", extractWeddingDay["head"]);
            result.addParameter("@P_WEDDING_MONTH", extractWeddingDay["middle"]);
            result.addParameter("@P_WEDDING_DAY", extractWeddingDay["foot"]);
            result.addParameter("@P_WEDDING_HALL", pWeddingHall);

            result.addParameter("@P_ORI_BIRTH", pOriBirth);
            result.addParameter("@P_GENDER", pGender);
            result.addParameter("@P_NATIONAL_INFO", pNationalInfo);

            result.addParameter("@P_ENCODE_DATA", pEncodeData);
            result.addParameter("@P_AUTH_MODULE_TYPE", pAuthModuleType);
            result.addParameter("@P_CHK_MYOMEE", (pChoiceAgreementForMyomeeMembership ? "Y" : "N"));

            result.addParameter("@P_CHK_ILOOMMBERSHIP", (pChoiceAgreementForIloomMembership ? "Y" : "N"));

            result.addParameter("@P_CHK_LGMEMBERSHIP", (pchkChoiceAgreementForLGMembership ? "Y" : "N"));
            result.addParameter("@P_CHK_CUCKOOSMEMBERSHIP", (pChkChoiceAgreementForCucKooMembership ? "Y" : "N"));
            result.addParameter("@P_CHK_CASAMIAMEMBERSHIP", (pChkChoiceAgreementForCasamiaMembership ? "Y" : "N"));
            result.addParameter("@P_CHK_KTMEMBERSHIP", (pChkChoiceAgreementForKtMembership ? "Y" : "N"));
            result.addParameter("@P_WEDD_NAME", pWeddName);
            result.addParameter("@P_SMEMBERSHIP_PERIOD", pSamsungMembershipPeriod);
            //result.addParameter("@P_CHK_LGMEMBERSHIP_PER", (pchkChoiceAgreementForLGChoicePersonalData ? "Y" : "N"));
            result.addParameter("@P_CHK_HYUNDAIMEMBERSHIP", (pChkChoiceAgreementForHyundaiMembership ? "Y" : "N"));

            return result;
        }

        /// <summary>
        /// 회원 정보를 갱신한다.
        /// </summary>
        /// <param name="pAuthCode"></param>
        /// <param name="pUserID"></param>
        /// <param name="pPassword"></param>
        /// <param name="pEmail"></param>
        /// <param name="pZipCode"></param>
        /// <param name="pAddr"></param>
        /// <param name="pAddrDetail"></param>
        /// <param name="pPhone"></param>
        /// <param name="pCellPhone"></param>
        /// <param name="pAllowSMS"></param>
        /// <param name="pAllowMailling"></param>
        /// <returns></returns>
        public static ProcedureCallCommand createCommandUpdateUserInfo(String pAuthCode, String pUserID, String pPassword,
            String pEmail, String pZipCode, String pAddr, String pAddrDetail, String pPhone, String pCellPhone,
            Boolean pAllowSMS, Boolean pAllowMailling, String pBirthDate, String pBirthDateType, String pWeddingDay, String pWeddingHall)
        {
            ProcedureCallCommand result = new ProcedureCallCommand("SP_UPDATE_USER_INFO");
            //ProcedureCallCommand result = new ProcedureCallCommand("SP_UPDATE_USER_INFO_V2");

            Dictionary<String, String> extractZipCode = StringExtractUtillity.extractShopZipCode(pZipCode);
            Dictionary<String, String> extractPhone = StringExtractUtillity.extractShopPhone(pPhone);
            Dictionary<String, String> extractCellPhone = StringExtractUtillity.extractShopPhone(pCellPhone);
            Dictionary<String, String> extractWeddingDay = StringExtractUtillity.extractShopPhone(pWeddingDay);

            result.addParameter("@AUTHCODE       ", pAuthCode);
            result.addParameter("@USER_ID        ", pUserID);
            result.addParameter("@PASSWORD       ", pPassword);
            result.addParameter("@EMAIL          ", pEmail);
            result.addParameter("@ZIP1           ", extractZipCode["head"]);
            result.addParameter("@ZIP2           ", extractZipCode["foot"]);
            result.addParameter("@ADDRESS        ", pAddr);
            result.addParameter("@ADDRESS_DETAIL ", pAddrDetail);
            result.addParameter("@PHONE1         ", extractPhone["head"]);
            result.addParameter("@PHONE2         ", extractPhone["middle"]);
            result.addParameter("@PHONE3         ", extractPhone["foot"]);
            result.addParameter("@HPHONE1        ", extractCellPhone["head"]);
            result.addParameter("@HPHONE2        ", extractCellPhone["middle"]);
            result.addParameter("@HPHONE3        ", extractCellPhone["foot"]);
            result.addParameter("@CHK_SMS        ", (pAllowSMS ? "Y" : "N"));
            result.addParameter("@CHK_MAILSERVICE", (pAllowMailling ? "Y" : "N"));
            result.addParameter("@BIRTH_DATE", pBirthDate);
            result.addParameter("@BIRTH_DATE_TYPE", pBirthDateType);
            result.addParameter("@WEDDING_YEAR", extractWeddingDay["head"]);
            result.addParameter("@WEDDING_MONTH", extractWeddingDay["middle"]);
            result.addParameter("@WEDDING_DAY", extractWeddingDay["foot"]);
            result.addParameter("@WEDDING_HALL", pWeddingHall);
            return result;
        }


        /// <summary>
        /// Call Center 신호등 및 SMS 접수/할당 및 Q&A 접수/처리중 에 대한 상태값을 가져온다
        /// </summary>
        /// <param name="pStartDate"></param>
        /// <param name="pEndDate"></param>
        /// <returns></returns>
        public static ProcedureCallCommand createCommandSelectCallCenterStatus(String pStartDate, String pEndDate)
        {
            ProcedureCallCommand result = new ProcedureCallCommand("SP_SELECT_CALL_CENTER_STATUS");
            result.addParameter("@START_DATE", pStartDate);
            result.addParameter("@END_DATE", pEndDate);
            return result;
        }

        /// <summary>
        /// 탈퇴 이유를 Insert 한다
        /// </summary>
        /// <param name="pDupInfo"></param>
        /// <param name="pSiteDiv"></param>
        /// <param name="pSecessionCause"></param>
        /// <param name="pEtcComment"></param>
        /// <returns></returns>
        public static ProcedureCallCommand createCommandInsertUserSecession(String pDupInfo, String pSiteDiv, String pSecessionCauseCode, String pEtcComment)
        {
            ProcedureCallCommand result = new ProcedureCallCommand("SP_INSERT_USER_SECESSION");
            result.addParameter("@P_DUP_INFO        ", pDupInfo);
            result.addParameter("@P_SITE_DIV       ", pSiteDiv);
            result.addParameter("@P_SECESSION_CAUSE_CODE", pSecessionCauseCode);
            result.addParameter("@P_ETC_COMMENT    ", pEtcComment);
            return result;
        }

        /// <summary>
        /// 메일을 Insert 한다
        /// </summary>
        /// <param name="pDupInfo"></param>
        /// <param name="pSiteDiv"></param>
        /// <param name="pSecessionCause"></param>
        /// <param name="pEtcComment"></param>
        /// <returns></returns>
        public static ProcedureCallCommand createCommandInsertTneoQueue(String pMailType, String pSiteName, String pfromEmail, String pToName, String pToEmail, String pMailTitle, String pMailForm, String pUserID)
        {
            //기존소스 수정
            //ProcedureCallCommand result = new ProcedureCallCommand("SP_INSERT_TNEO_QUEUE");
            ProcedureCallCommand result = new ProcedureCallCommand("SP_INSERT_TNEO_QUEUE_V2");
            result.addParameter("@P_MAIL_TYPE", pMailType);
            result.addParameter("@P_SITE_NAME", pSiteName);
            result.addParameter("@P_FROM_EMAIL", pfromEmail);
            result.addParameter("@P_TO_NAME", pToName);
            result.addParameter("@P_TO_EMAIL", pToEmail);
            result.addParameter("@P_MAIL_TITLE", pMailTitle);
            result.addParameter("@P_MAIL_FROM", pMailForm);
            result.addParameter("@P_USER_ID", pUserID);
            return result;
        }
        
        /// <summary>
        /// 제 3자 마케팅 동의
        /// </summary>
        public static ProcedureCallCommand InsertS2UserInfoThirdPartyMarketingAgreement(String pDupInfo, String pMarketingTypeCode)
        {
            ProcedureCallCommand result = new ProcedureCallCommand("SP_INSERT_S2_USERINFO_THIRD_PARTY_MARKETING_AGREEMENT");
            result.addParameter("@P_UID", pDupInfo);
            result.addParameter("@P_MARKETING_TYPE_CODE", pMarketingTypeCode);
            return result;
        }

        /// <summary>
        /// 유입 경로
        /// </summary>
        public static ProcedureCallCommand InsertInflowRoute(String pDupInfo, String pDeviceType ,String pUserAgent)
        {
            ProcedureCallCommand result = new ProcedureCallCommand("SP_UPDATE_S2_USERINFO_INFLOW_ROUTE");
            result.addParameter("@P_DUPINFO", pDupInfo);
            result.addParameter("@P_INFLOW_ROUTE", pDeviceType);
            result.addParameter("@P_USER_AGENT", pUserAgent);
            return result;
        }

        /// <summary>
        /// 관리자 로그인
        /// </summary>
        public static ProcedureCallCommand SelectAdminLstForLogin(String userId, String userPw)
        {
            ProcedureCallCommand result = new ProcedureCallCommand("SP_SELECT_ADMIN_LST_FOR_LOGIN");
            result.addParameter("@P_USER_ID", userId);
            result.addParameter("@P_USER_PW", userPw);
            return result;
        }

        public static ProcedureCallCommand InsertMarketingAgreementLog(String uid, String agreementData)
        {
            ProcedureCallCommand result = new ProcedureCallCommand("SP_INSERT_MARKETING_AGREEMENT_LOG");
            result.addParameter("@P_USER_ID", uid);
            result.addParameter("@P_AGREEMENT_DATA", agreementData);
            return result;
        }

        public static ProcedureCallCommand InsertCouponIssueForSamsung(String companySeq, String userId)
        {
            ProcedureCallCommand result = new ProcedureCallCommand("SP_INSERT_SAMSUNG_LOUNGE_COUPON");
            result.addParameter("@COMPANY_SEQ", companySeq);
            result.addParameter("@UID", userId);
            return result;
        }
        
        public static ProcedureCallCommand InsertMemRegistGift(String companySeq, String userId, String giftCardSeq)
        {
            ProcedureCallCommand result = new ProcedureCallCommand("SP_EXEC_MEM_REGIST_GIFT_BARUNSONCARD_V2");
            result.addParameter("@COMPANY_SEQ", companySeq);
            result.addParameter("@UID", userId);
            result.addParameter("@GIFT_CARD_SEQ", giftCardSeq);
            return result;
        }

        public static ProcedureCallCommand InsertMemRegistGift_V2(String companySeq, String userId, String giftCardSeq)
        {
            ProcedureCallCommand result = new ProcedureCallCommand("SP_EXEC_MEM_REGIST_GIFT_BARUNSONCARD_V3");
            result.addParameter("@COMPANY_SEQ", companySeq);
            result.addParameter("@UID", userId);
            result.addParameter("@GIFT_CARD_SEQ", giftCardSeq);
            return result;
        }

        //알림톡 발송
        public static ProcedureCallCommand SendBizTalk(String salesGubun, String companySeq, String memberName, String memberHphone)
        {
            ProcedureCallCommand result = new ProcedureCallCommand("PROC_MEMBER_JOIN_BIZTALK");
            result.addParameter("@SALES_GUBUN", salesGubun);
            result.addParameter("@COMPANY_SEQ", companySeq);
            result.addParameter("@MEMBER_NAME", memberName);
            result.addParameter("@MEMBER_HPHONE", memberHphone);
            return result;
        }

        public static ProcedureCallCommand EventCouponIssue(int companySeq, String salesGubun, String userId, String couponCode)
        {
            ProcedureCallCommand result = new ProcedureCallCommand("SP_EXEC_COUPON_ISSUE_FOR_ONE");
            result.addParameter("@COMPANY_SEQ", companySeq);
            result.addParameter("@SALES_GUBUN", salesGubun);
            result.addParameter("@USER_ID", userId);
            result.addParameter("@COUPON_CODE", couponCode);
            return result;
        }

        /// <summary>
        /// 회원 제휴 정보 저장
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="partnerCode"></param>
        /// <param name="consent"></param>
        /// <param name="extendData"></param>
        /// <returns></returns>
        public static ProcedureCallCommand SaveS2UserInfoJehu(string userId, string partnerCode, bool consent, string extendData)
        {
            ProcedureCallCommand result = new ProcedureCallCommand("SP_SAVE_S2_USERINFO_JEHU");
            result.addParameter("@USERID", userId);
            result.addParameter("@PARTNERCODE", partnerCode);
            result.addParameter("@CONSENT ", consent);
            result.addParameter("@EXTENDDATA ", extendData);
            return result;
        }

    }
}