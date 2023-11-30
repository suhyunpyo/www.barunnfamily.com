using BarunnIntergrationService.Common.ExtensionMethod;
using System;
using System.Collections.Generic;
using System.Linq;

namespace BarunnIntergrationService.Common.Utillity
{
    /// <summary>
    /// 데이터 형식이 다른 플랫폼의 데이터를 추출/생성 하는 유틸리티
    /// </summary>
    public class StringExtractUtillity
    {
        /// <summary>
        /// 010-yyyy-xxxx 의 데이터를
        /// 
        /// Dic{
        /// head=>010
        /// middle=>yyyy
        /// foot=>xxxx
        /// }
        /// 
        /// 형태로 가공하여 반환한다.
        /// </summary>
        /// <param name="pCelemoPhone"></param>
        /// <returns></returns>
        public static Dictionary<String, String> extractShopPhone(String pCelemoPhone)
        {
            Dictionary<String, String> result = new Dictionary<string, string>();
            result.Add("head", String.Empty);
            result.Add("middle", String.Empty);
            result.Add("foot", String.Empty);
            
            List<String> splitList = StringExtractUtillity.Split(pCelemoPhone, '-');
            result["head"] = (splitList.Count > 0) ? splitList[0] : result["head"];
            result["middle"] = (splitList.Count > 1) ? splitList[1] : result["middle"];
            result["foot"] = (splitList.Count > 2) ? splitList[2] : result["foot"];
            return result;
        }

        /// <summary>
        /// 010-yyyy-xxxx 형태로 전화번호 데이터를 생성한다.
        /// </summary>
        /// <param name="pHead"></param>
        /// <param name="pMiddle"></param>
        /// <param name="pFoot"></param>
        /// <returns></returns>
        public static String buildCelemoPhone(String pHead, String pMiddle = "", String pFoot = "")
        {
            String result = String.Empty;
            result = pHead;
            result = (String.IsNullOrEmpty(result) ? pMiddle : (String.IsNullOrEmpty(pMiddle) ? result : "-" + pMiddle));
            result = (String.IsNullOrEmpty(result) ? pFoot : (String.IsNullOrEmpty(pFoot) ? result : "-" + pFoot));
            return result;
        }

        /// <summary>
        /// 010-yyyy-xxxx 형태로 전화번호 데이터를 생성한다.
        /// </summary>
        /// <param name="pPhoneDic"></param>
        /// <returns></returns>
        public static String buildCelemoPhone(Dictionary<String, String> pPhoneDic)
        {
            return buildCelemoPhone(
                String.IsNullOrEmpty(pPhoneDic["head"]) ? "" : pPhoneDic["head"],
                String.IsNullOrEmpty(pPhoneDic["middle"]) ? "" : pPhoneDic["middle"],
                String.IsNullOrEmpty(pPhoneDic["foot"]) ? "" : pPhoneDic["foot"]
            );
        }
        /// <summary>
        /// 문자열을 delim 을 기준으로 분할하여 List 로 반환한다.
        /// 문자열이 공백이면 List 의 Count = 0
        /// 문자열에 delim 키워드가 존재하지 않으면 List Count = 1 => List[0] = 문자열 원본 
        /// </summary>
        /// <param name="pValue"></param>
        /// <param name="pDelim"></param>
        /// <returns></returns>
        static public List<string> Split(String pValue, Char pDelim)
        {
            pValue = (pValue == null) ? "" : pValue;
            List<String> result = new List<string>();

            if (pValue.IndexOf(pDelim) >= 0)
            {
                result = pValue.Split(pDelim).ToList<String>();
            }
            else if (pValue != String.Empty)
            {
                result.Add(pValue);
            }

            return result;
        }
        /// <summary>
        /// xxx-yyy 형태의 Zipcode를
        /// Dic
        /// {
        ///     head => xxx
        ///     foot => yyy
        /// }
        /// 로 반환한다.
        /// 
        /// Zipcode가 5자리일경우,
        /// Dic
        /// {
        ///     head => xxxxx
        ///     foot => ''(empty)
        /// }
        /// 로 반환한다.
        /// </summary>
        /// <param name="pCelemoZipCode"></param>
        /// <returns></returns>
        public static Dictionary<String, String> extractShopZipCode(String pCelemoZipCode)
        {
            Dictionary<String, String> result = new Dictionary<string, string>();
            result.Add("head", String.Empty);
            result.Add("foot", String.Empty);

            if (pCelemoZipCode.Length == 5)
            {
                result["head"] = pCelemoZipCode.Left(3);
                result["foot"] = pCelemoZipCode.Right(2);
            }
            else if (pCelemoZipCode.Length == 7)
            {
                List<String> splitList = StringExtractUtillity.Split(pCelemoZipCode, '-');
                result["head"] = (splitList.Count > 0) ? splitList[0] : result["head"];
                result["foot"] = (splitList.Count > 1) ? splitList[1] : result["foot"];
            }
            else
            {
                result["head"] = pCelemoZipCode;
            }
            return result;
        }

        /// <summary>
        /// xxx-yyy 또는 xxxxx 형태의 zip code 데이터를 생성한다.
        /// </summary>
        /// <param name="pHead"></param>
        /// <param name="pFoot"></param>
        /// <returns></returns>
        public static String buildCelemoZipCode(String pHead, String pFoot = "")
        {
            String result = String.Empty;
            result = pHead;
            result = (String.IsNullOrEmpty(result) ? pFoot : (String.IsNullOrEmpty(pFoot) ? result : "-" + pFoot));
            return result;
        }

        /// <summary>
        /// xxx-yyy 또는 xxxxx 형태의 zip code 데이터를 생성한다.
        /// </summary>
        /// <param name="pDic"></param>
        /// <returns></returns>
        public static String buildCelemoZipCode(Dictionary<String, String> pDic)
        {
            return buildCelemoZipCode(
                String.IsNullOrEmpty(pDic["head"]) ? "" : pDic["head"],
                String.IsNullOrEmpty(pDic["foot"]) ? "" : pDic["foot"]
            );
        }

    }
}