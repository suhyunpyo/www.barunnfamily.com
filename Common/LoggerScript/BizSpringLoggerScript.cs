using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace BarunnIntergrationService.Common.LoggerScript
{
    public class BizSpringLoggerScript
    {
        public static String GetDefaultScript(string ServiceNumber, string ServiceDomain)
        {
            StringBuilder sbResult = new StringBuilder();

            sbResult.AppendLine(@"<!-- LOGGER(TM) TRACKING SCRIPT V.40 FOR logger.co.kr / 서비스번호 : COMBINE TYPE / DO NOT ALTER THIS SCRIPT. -->");
            sbResult.AppendLine(@"<script type=""text/javascript"">var _TRK_LID=""" + ServiceNumber + @""";var _L_TD=""ssl.logger.co.kr"";var _TRK_CDMN=""" + ServiceDomain + @""";</script>");
            sbResult.AppendLine(@"<script type=""text/javascript"">var _CDN_DOMAIN = location.protocol == ""https:"" ? ""https://fs.bizspring.net"" : ""http://fs.bizspring.net"";");
            sbResult.AppendLine(@"(function(b,s){var f=b.getElementsByTagName(s)[0],j=b.createElement(s);j.async=true;j.src=""//fs.bizspring.net/fs4/bstrk.1.js"";f.parentNode.insertBefore(j,f);})(document,""script"");</script>");
            sbResult.AppendLine(@"<noscript><img alt=""Logger Script"" width=""1"" height=""1"" src=""http://ssl.logger.co.kr/tracker.tsp?u=" + ServiceNumber + @"&amp;js=N"" /></noscript>");
            sbResult.AppendLine(@"<!-- END OF LOGGER TRACKING SCRIPT -->");

            return sbResult.ToString();
        }

        public static String GetSignUpScript()
        {
            StringBuilder sbResult = new StringBuilder();

            sbResult.AppendLine(@"<!-- LOGGER(TM) SCRIPT FOR SETTING ENVIRONMENT V.27 :  / FILL THE VALUE TO SET. -->");
            sbResult.AppendLine(@"<script type=""text/javascript"">");
            sbResult.AppendLine(@"_TRK_PI = ""RGR"";");
            sbResult.AppendLine(@"</script>");
            sbResult.AppendLine(@"<!-- END OF ENVIRONMENT SCRIPT -->");

            return sbResult.ToString();
        }

    }
}