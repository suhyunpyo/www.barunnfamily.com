using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;

namespace BarunnIntergrationService.Common.Utillity
{
    public class UrlRouteUtility
    {

        public static void AddMapPageRoute(string routeName, string routeUrl, string physicalFile)
        {
            try
            {
                RouteTable.Routes.MapPageRoute(routeName, routeUrl, physicalFile);
            }
            catch { }
        }

        public static void AddMapPageRoute(string routeName, string routeUrl, string physicalFile, bool checkphysicalUrlAccess)
        {
            try
            {
                RouteTable.Routes.MapPageRoute(routeName, routeUrl, physicalFile, checkphysicalUrlAccess);
            }
            catch { }
        }

        public static void InitializationRouteTable()
        {
            try
            {
                RouteTable.Routes.Clear();
            }
            catch { }

            try
            {
                AddMapPageRoute("/Member/Main.aspx", "", "~/Member/Main.aspx");
                AddMapPageRoute("/Member/SignInForCertification.aspx", "Certification", "~/Member/SignInForCertification.aspx");
                AddMapPageRoute("/MyPage/UserProfileModify.aspx", "Profile-Modify", "~/MyPage/UserProfileModify.aspx");
                AddMapPageRoute("/MyPage/UserSecession.aspx", "Secession", "~/MyPage/UserSecession.aspx");
                AddMapPageRoute("/MyPage/UserSecessionComplete.aspx", "UserSecessionComplete", "~/MyPage/UserSecessionComplete.aspx");
            }
            catch { }
        }

    }
}