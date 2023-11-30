using BarunnIntergrationService.Common.ExtensionMethod;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace BarunnIntergrationService.MyPage
{
    public partial class UserSecessionComplete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ((HtmlGenericControl)Master.FindControl("MasterBody")).Attributes["class"] = "mleave_p";

            string sReturnUrl = Server.UrlDecode(Request.Value("ReturnUrl"));
            string sSiteDiv = Request.Value("SiteDiv");

            string sFamilySiteHtml = String.Empty;
            sFamilySiteHtml = @"<a href='" + sReturnUrl + "' class='b_btn type2'><span>메인으로 가기</span></a>";

            if (sSiteDiv.Equals("GS"))
            {
                Response.Redirect("https://barunsongshop.com/exec/front/Member/logout/");
            }

            ltrFamilySite.Text = sFamilySiteHtml;
        }
    }
}