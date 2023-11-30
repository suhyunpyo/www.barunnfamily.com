using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BarunnIntergrationService.Common.Utillity
{
    /// <summary>
    /// 각종 변수 타입 Casting 처리 유틸리티 모음
    /// </summary>
    public class CastingUtillity
    {
        /// <summary>
        /// float type 으로 Casting 처리한다.
        /// </summary>
        /// <param name="pValue"></param>
        /// <param name="pDefaultValue"></param>
        /// <returns></returns>
        public static float ParseToFloat(String pValue, float pDefaultValue = -1)
        {
            float result = pDefaultValue;
            try
            {
                result = float.Parse(pValue);
            }
            catch { }
            return result;
        }

        /// <summary>
        /// float type 으로 Casting 처리한다.
        /// </summary>
        /// <param name="pObject"></param>
        /// <param name="pDefaultValue"></param>
        /// <returns></returns>
        public static double ParseToFloat(object pObject, float pDefaultValue = -1)
        {
            return pObject == null ? pDefaultValue : ParseToFloat(pObject.ToString(), pDefaultValue);
        }

        /// <summary>
        /// int type 으로 Casting 처리한다.
        /// </summary>
        /// <param name="pValue"></param>
        /// <param name="pDefaultValue"></param>
        /// <returns></returns>
        public static int ParseToInt(String pValue, int pDefaultValue = -1)
        {
            int result = pDefaultValue;
            try
            {
                result = int.Parse(pValue);
            }
            catch { }
            return result;
        }

        /// <summary>
        /// int type 으로 Casting 처리한다.
        /// </summary>
        /// <param name="pObject"></param>
        /// <param name="pDefaultValue"></param>
        /// <returns></returns>
        public static int ParseToInt(object pObject, int pDefaultValue = -1)
        {
            return pObject == null ? pDefaultValue : ParseToInt(pObject.ToString(), pDefaultValue);

        }

        /// <summary>
        /// Double type 으로 Casting 처리한다.
        /// </summary>
        /// <param name="pValue"></param>
        /// <param name="pDefaultValue"></param>
        /// <returns></returns>
        public static double ParseToDouble(String pValue, double pDefaultValue = -1)
        {
            double result = pDefaultValue;
            try
            {
                result = double.Parse(pValue);
            }
            catch { }
            return result;
        }

        /// <summary>
        /// Double type 으로 Casting 처리한다.
        /// </summary>
        /// <param name="pObject"></param>
        /// <param name="pDefaultValue"></param>
        /// <returns></returns>
        public static double ParseToDouble(object pObject, double pDefaultValue = -1)
        {
            return pObject == null ? pDefaultValue : ParseToDouble(pObject.ToString(), pDefaultValue);
        }


        /// <summary>
        /// String type 으로 Casting 처리한다.
        /// </summary>
        /// <param name="pValue"></param>
        /// <param name="pDefaultValue"></param>
        /// <returns></returns>
        public static String ParseToString(String pValue, String pDefaultValue = null)
        {
            String result = pValue;
            if (result == null) result = pDefaultValue;
            return result;
        }

        /// <summary>
        /// String type 으로 Casting 처리한다.
        /// </summary>
        /// <param name="pObject"></param>
        /// <param name="pDefaultValue"></param>
        /// <returns></returns>
        public static String ParseToString(object pObject, String pDefaultValue = null)
        {
            return pObject == null ? pDefaultValue : ParseToString(pObject.ToString(), pDefaultValue);

        }


        /// <summary>
        /// Datetime type으로 Casting 처리한다.
        /// </summary>
        /// <param name="pDataTimeStr"></param>
        /// <param name="pDefaultValue"></param>
        /// <returns></returns>
        public static DateTime ParseToDatetime(String pDataTimeStr, DateTime pDefaultValue)
        {
            DateTime result = pDefaultValue;
            try
            {
                result = Convert.ToDateTime(pDataTimeStr);
            }
            catch { }
            return result;
        }


    }
}