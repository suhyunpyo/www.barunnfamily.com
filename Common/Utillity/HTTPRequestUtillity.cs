using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BarunnIntergrationService.Common.Utillity
{
    public class HTTPRequestUtillity
    {
        private HTTPRequestUtillity()
        {
        }

        public static String GetDomain(HttpContext pContext)
        {
            String result = String.Empty;

            Uri uriInfo = pContext.Request.Url;
            result += uriInfo.Scheme;
            result += "://";
            result += (uriInfo.Port == 80 ? uriInfo.Host : uriInfo.Authority);
            return result;
        }

        public static String GetFormValue(String pName)
        {
            return GetFormValue(HttpContext.Current, pName);
        }

        public static String GetFormValue(HttpContext pContext, String pName)
        {
            return GetFormValue(pContext.Request, pName);
        }

        public static String GetFormValue(HttpRequest pRequest, String pName)
        {
            String result = "";
            try
            {
                result = pRequest.Form[pName];
            }
            catch
            {
                //Nothing
            }
            return result;
        }


        public static String GetParamValue(HttpContext pContext, String pName)
        {
            return GetParamValue(pContext.Request, pName);
        }

        public static String GetParamValue(String pName)
        {
            return GetParamValue(HttpContext.Current, pName);
        }

        public static String GetParamValue(HttpRequest pRequest, String pName)
        {
            String result = "";
            try
            {
                result = pRequest.Params[pName];
            }
            catch
            {
                //Nothing
            }
            return result;
        }

        public static String GetRouteParamValue(System.Web.UI.Page pPage, String pName)
        {
            String result = String.Empty;
            object route = pPage.RouteData.Values[pName];
            if (route != null)
            {
                result = route.ToString();
            }
            return result;
        }

        /// <summary>
        /// HttpPostedFile 로 Request 된 File의 원본 파일 이름을 반환한다.
        /// </summary>
        /// <param name="pPostedFile"></param>
        /// <returns></returns>
        public static String GetFileName(HttpPostedFile pPostedFile)
        {
            String result = String.Empty;
            String BrowserStr = HttpContext.Current.Request.Browser.Browser.ToUpper();
            if (BrowserStr.IndexOf("IE") >= 0 || BrowserStr.IndexOf("INTERNETEXPLORER") >= 0)
            {
                string[] files = pPostedFile.FileName.Split(new char[] { '\\' });
                result = files[files.Length - 1];
            }
            else
            {
                result = pPostedFile.FileName;
            }
            return result;
        }
    }
}