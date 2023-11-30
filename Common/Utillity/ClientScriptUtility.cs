using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;

namespace BarunnIntergrationService.Common.Utillity
{
    public class ClientScriptUtility
    {
        /// <summary>
        /// 클라이언트 스크립트 알럿
        /// </summary>
        /// <param name="msg">알럿 메세지</param>
        /// <param name="page">페이지 객체</param>
        public static void ClientScriptAlert(Page page, string msg, bool isWindowLoad = true)
        {
            ClientScript(page, " alert('" + msg + "'); ", isWindowLoad);
        }

        /// <summary>
        /// 클라이언트 스크립트
        /// </summary>
        /// <param name="script">스크립트</param>
        /// <param name="page">페이지 객체</param>
        public static void ClientScript(Page page, string script, bool isWindowLoad = true)
        {
            String key = Guid.NewGuid().ToString();
            StringBuilder sb = new StringBuilder();

            sb.AppendLine((isWindowLoad ? " $(document).ready(function () { " : ""));
            sb.AppendLine(script);
            sb.AppendLine((isWindowLoad ? " }); " : ""));

            page.ClientScript.RegisterClientScriptBlock(page.GetType(), key, sb.ToString(), true);
        }
    }
}