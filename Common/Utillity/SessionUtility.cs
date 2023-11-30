using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BarunnIntergrationService.Common.Utillity
{
    public class SessionUtility
    {
        /// <summary>
        /// Cookie 의 Value 를 반환한다.
        /// </summary>
        /// <param name="pName"></param>
        /// <returns></returns>
        static public String GetCookieValue(String pName)
        {
            String result = null;
            try
            {
                HttpCookie cookie = GetCookie(pName);
                result = cookie.Value;
            }
            catch
            {
                result = null;
            }
            return result;
        }

        /// <summary>
        /// 해당 Name을 가지는 Cookie 개체를 반환한다.
        /// </summary>
        /// <param name="pName"></param>
        /// <returns></returns>
        static public HttpCookie GetCookie(String pName)
        {
            HttpCookie result = null;
            try
            {
                result = HttpContext.Current.Request.Cookies.Get(pName);
            }
            catch { }
            return result;
        }

        static public void SetCookie(String pName, String pValue)
        {
            SetCookie(pName, pValue, 60 * 60 * 24 * 1000);
        }

        static public void SetCookie(String pName, String pValue, double pAddExpireSec)
        {
            ClearCooke(pName);

            DateTime expireDate = DateTime.Now;
            expireDate = expireDate.AddSeconds(pAddExpireSec);
            HttpCookie cookie = new HttpCookie(pName, pValue);
            cookie.Expires = expireDate;
            SetCookie(cookie);
        }

        static public void SetCookie(HttpCookie pCookie)
        {
            HttpContext.Current.Response.Cookies.Add(pCookie);
        }

        static public void ClearCooke(String pName)
        {
            try
            {
                HttpCookie cookie = GetCookie(pName);
                cookie.Expires = DateTime.Now.AddYears(-1);
                SetCookie(cookie);
            }
            catch { }
        }
    }
}