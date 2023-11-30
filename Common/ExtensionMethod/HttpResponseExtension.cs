using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BarunnIntergrationService.Common.ExtensionMethod
{
    public static class HttpResponseExtension
    {
        public static void RedirectForReferer(this HttpResponse r)
        {
            string refererUrl = HttpContext.Current.Request.ServerVariables["HTTP_REFERER"];
            refererUrl = String.IsNullOrEmpty(refererUrl) ? ApplicationContext.G().MAIN_PAGE_URL : refererUrl;
            r.Redirect(refererUrl);
            r.End();
        }
    }
}