using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BarunnIntergrationService.Common.Utillity
{
    public class HttpContextUtility
    {
        /// <summary>
        /// No CACHE
        /// </summary>
        public static void SetNoCache()
        {
            //HttpContext.Current.Response.
            HttpContext.Current.Response.AppendHeader("Pragma", "no-cache");
            HttpContext.Current.Response.AppendHeader("Cache-Control", "no-cache");
            HttpContext.Current.Response.AppendHeader("Accept", "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8");

            HttpContext.Current.Response.CacheControl = "no-cache";
            HttpContext.Current.Response.Expires = -1;

            HttpContext.Current.Response.ExpiresAbsolute = new DateTime(1900, 1, 1);

            HttpContext.Current.Response.Cache.SetCacheability(System.Web.HttpCacheability.NoCache);
            HttpContext.Current.Response.Cache.SetNoStore();

        }

        public static bool IsMobileDevice()
        {
            return HttpContext.Current.Request.Browser.IsMobileDevice;
        }
    }
}