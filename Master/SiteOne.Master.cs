using BarunnIntergrationService.Common;
using BarunnIntergrationService.Common.ExtensionMethod;
using BarunnIntergrationService.Common.Utillity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BarunnIntergrationService.Master
{
    public partial class SiteOne : System.Web.UI.MasterPage
    {
        public string DomainSite = "";        
        public string sFileName = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            HttpContextUtility.SetNoCache();
           
            sFileName = System.IO.Path.GetFileName(Request.Url.LocalPath);

            try
            {
                string sUrlReferer = ApplicationContext.G().REFERER_SITE;

                if (ApplicationContext.G().IS_REFERER_FAMILY_SITE(sUrlReferer))
                {
                    CookieUtility.SetCookie("REFERER_SITE", sUrlReferer);
                }


                initializeRefererLogo(sUrlReferer);
                initializeMasterPage();

            }
            catch
            { }
        }

        public void initializeMasterPage()
        {
            ltrMasterPageMetaTag.Text = createMasterPageMetaTag();
            ltrMasterPageStyleSheet.Text = createMasterPageStyleSheet();
            ContentNavigation.Text = createMasterPageNavigation();

        }

        public String createMasterPageMetaTag()
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine(@"<meta http-equiv=""Content-Type"" content=""text/html; charset=utf-8"">");
            sb.AppendLine(@"<meta http-equiv=""X-UA-Compatible"" content=""IE=edge,chrome=1"">");
            if (Request.IsMobileDevice())
            {
                sb.AppendLine(@"<meta name=""viewport"" content=""width=device-width"">");
            }
            else
            {
                sb.AppendLine(@"<meta name=""viewport"" content=""width=1100"" />");
            }
            return sb.ToString();
        }

        public void initializeRefererLogo(string sRefererSite)
        {
            Member.SignInForCertification.FamilySiteInformationList familySiteInformationList = new Member.SignInForCertification.FamilySiteInformationList();
            int index = familySiteInformationList.FindFamilySiteFromDomainShortName(sRefererSite, 0);
            Member.SignInForCertification.FamilySiteInformation familySiteInformation = familySiteInformationList.familySiteInformationList[index];

            DomainSite = familySiteInformation.DomainShortName;

            if (sFileName == "BarunsonForRegistrationComplete.aspx")
            {
                // 에이스 카운터 공통 스크립트 전에 실행 
                ltrScriptAceCounterTagBefore.Text = Common.LoggerScript.AceCounterScript.GetRegistrCompleteScript(DomainSite, Session["sUserId"].ToString(), Request.IsMobileDevice());
            }


            // 사이트별 에이스카운트 스크립트
            ltrScriptAceCounterTag.Text = Common.LoggerScript.AceCounterScript.GetDefaultScript(DomainSite, Request.IsMobileDevice());
        }

        /// <summary>
        /// 사이트별 Style 값 처리
        /// </summary>
        /// <returns></returns>
        public String createMasterPageStyleSheet()
        {
            StringBuilder sb = new StringBuilder();

            // string strName = getDomainName();

            //DomainSite = "premierpaper";


            if (DomainSite == "bhandscard")
            {
                sb.AppendLine(@"<link rel=""stylesheet"" type=""text/css"" href=""/resources/css/common_bhands.css"">");
                sb.AppendLine(@"<link rel=""stylesheet"" type=""text/css"" href=""/resources/css/layout_member_bhands.css"">");
                sb.AppendLine(@"<link rel=""stylesheet"" type=""text/css"" href=""/resources/css/layout_mobile_bhands.css"">");
            }
            //else if (DomainSite == "thecard")
            //{
            //    //sb.AppendLine(@"<link rel=""stylesheet"" type=""text/css"" href=""/resources/css/common_thecard.css"">");
            //    //sb.AppendLine(@"<link rel=""stylesheet"" type=""text/css"" href=""/resources/css/layout_member_thecard.css"">");
            //    //sb.AppendLine(@"<link rel=""stylesheet"" type=""text/css"" href=""/resources/css/layout_mobile_thecard.css"">");
            //}
            else
            {
                sb.AppendLine(@"<link rel=""stylesheet"" type=""text/css"" href=""/resources/css/common.css"">");
                sb.AppendLine(@"<link rel=""stylesheet"" type=""text/css"" href=""/resources/css/layout_member.css"">");

            }

            //프리미어 style
            if (DomainSite == "premierpaper" || DomainSite == "barunsonmall" || DomainSite.ToLower() == "barunsoncard" || DomainSite.ToLower() == "thecard")
            {
                sb.AppendLine(@"<link rel=""stylesheet"" type=""text/css"" href=""/resources/css/layout_premierpaper.css"">");
                sb.AppendLine(@"<link rel=""stylesheet"" type=""text/css"" href=""/resources/css/layout_mobile.css"">");
            }



            //모바일Style ( 사이트별로 모바일에서 요청이 들어왔을경우 Style 추가 )
            if (Request.IsMobileDevice())
            {

                if (DomainSite == "bhandscard")
                {
                    //sb.AppendLine(@"<link rel=""stylesheet"" type=""text/css"" href=""/resources/css/ui/selectric_default.css"">");
                    //sb.AppendLine(@"<link rel=""stylesheet"" type=""text/css"" href=""/resources/css/layout_mobile.css"">");
                }
                else if (DomainSite == "barunsoncard" || DomainSite == "barunsonmall")
                {
                    sb.AppendLine(@"<link rel=""stylesheet"" type=""text/css"" href=""/resources/css/layout_mobile.css"">");
                }
            }

            if (DomainSite == "barunsonmcard")
            {
                sb.AppendLine(@"<link rel=""stylesheet"" type=""text/css"" href=""/resources/css/layout_mobile.css"">");
            }

            return sb.ToString();
        }

        private String getDomainName()
        {
            string result = DomainSite;

            if (sFileName.ToLower().Contains("bhands"))
            {
                result = "bhandscard";
            }
            else if (sFileName.ToLower().Contains("premier"))
            {
                result = "premierpaper";
            }
            else if (sFileName.ToLower().Contains("thecard"))
            {
                result = "thecard";
            }
            else if (sFileName.ToLower().Contains("barunson"))
            {
                result = "barunsoncard";
            }

            //20210419 표수현 추가 
            else if (sFileName.ToLower().Contains("barunsonmcard"))
            {
                result = "barunsonmcard";
            }
            else if (sFileName.ToLower().Contains("gsauth"))
            {
                result = "gsauth";
            }

            return result;
        }

        /// <summary>
        /// 사이트별 회원가입 Navi 처리 
        /// 바른손, 비핸즈, 프리미어는 각 사이트에서 띄우기로 하였음.
        /// 내부로직에서 확인하기 위한 작업
        /// </summary>
        /// <returns></returns>
        public String createMasterPageNavigation()
        {
            StringBuilder sb = new StringBuilder();
            //DomainSite = "premierpaper";

            if (DomainSite.ToLower() == "bhandscard")
            {
                sb.AppendLine(@"<div class='step_a_in'>");
                sb.AppendLine(@"<div class='tit'><a href = 'http://www.bhandscard.com/' target='_parent' ><img src='/resources/img_inc/bhandscard_logo.png' alt='bhandscard'></a></div>");
                sb.AppendLine(@"</div>");
            }
            //else if (DomainSite.ToLower() == "thecard")
            //{

            //    if (Request.IsMobileDevice() == false)
            //    {
            //        sb.AppendLine(@"<div class='step_a_in'>");
            //        sb.AppendLine(@"<div class='tit'><img src = '/resources/member/thecard_join.jpg' alt='바른 ONE 회원가'>");
            //        sb.AppendLine(@"<p style='color:#999999; padding-top:10px;'>다양한 서비스를 이용하실 수 있습니다.</p>");
            //        sb.AppendLine(@"</div>");
            //        sb.AppendLine(@"<ul>");
            //        sb.AppendLine(@"<li style = 'margin-left:0px;' class='" + (Session["JOIN_STEP"].ToString() == "1" ? "on" : "") + "'> Step1.휴대폰인증</li>");
            //        sb.AppendLine(@"<li class='" + (Session["JOIN_STEP"].ToString() == "2" ? "on" : "") + "'>Step2.정보입력</li>");
            //        sb.AppendLine(@"<li class='" + (Session["JOIN_STEP"].ToString() == "3" ? "on" : "") + "'>Step3.가입완료");
            //        sb.AppendLine(@"</ul>");
            //        sb.AppendLine(@"</div>");
            //    }

            //}
            else if (DomainSite.ToLower() == "premierpaper" || DomainSite.ToLower() == "barunsoncard" || DomainSite.ToLower() == "thecard" || DomainSite.ToLower() == "barunsonmall")
            {
                sb.AppendLine("<ul>");
                sb.AppendLine("     <li class=\"on\"><span>1</span>본인인증</li>");
                sb.AppendLine("     <li class=\"m-line\"></li>");
                sb.AppendLine("     <li><span>2</span>정보입력</li>");
                sb.AppendLine("</ul>");

                //sb.AppendLine(@"<div class='step_a_in'>");
                //sb.AppendLine(@"<div class='tit'><img src = 'http://www.premierpaper.co.kr/resources/images/member/sing_up.png' alt='바른 ONE 회원가'></div>");
                //sb.AppendLine(@"<ul>");
                //sb.AppendLine(@"<li style = 'width:33.1%;'><div class='premier-step " + (Session["JOIN_STEP"].ToString() == "1" ? "on" : "") + "'>1. 본인인증</div></li>");
                //sb.AppendLine(@"<li style = 'width:33.1%;'><div class='premier-step " + (Session["JOIN_STEP"].ToString() == "2" ? "on" : "") + "'>2. 정보입력</div></li>");
                //sb.AppendLine(@"<li style = 'width:33.1%;'><div class='premier-step " + (Session["JOIN_STEP"].ToString() == "3" ? "on" : "") + "'>3. 가입완료</div></li>");
                //sb.AppendLine(@"</ul>");
                //sb.AppendLine(@"</div>");
            }
            //else if (DomainSite.ToLower() == "barunsonmall")
            //{
            //    sb.AppendLine("<ul>");
            //    sb.AppendLine("     <li class=\"on\"><span>1</span>본인인증</li>");
            //    sb.AppendLine("     <li class=\"m-line\"></li>");
            //    sb.AppendLine("     <li><span>2</span>정보입력</li>");
            //    sb.AppendLine("</ul>");

            //}



            //20210419 표수현 추가 
            else if (DomainSite.ToLower() == "barunsonmcard")
            {
                // Response.Write(Session["JOIN_STEP"].ToString());
                sb.AppendLine("<header class=\"header\" style=\"position: static;border-bottom: 1px solid #aaa;padding: 40px 0;background: #fff;\">");
                sb.AppendLine("<div class=\"area\">");
                sb.AppendLine("<h1 style=\"position: static; float: none; margin: 0 auto; text-align: center;left:3%\">" +
                    "<a href = \"//www.barunsonmcard.com\" style=\"background:url(/Resources/img_inc/logo_mcard.svg) no-repeat center;display:inline-block; width: 201px; height:24px;text-indent: -99999px;\"> barunsonMcard 로고</a></h1>");
                sb.AppendLine("</div>");
                sb.AppendLine("</header>");


            }

            else
            {
                //sb.AppendLine(@"<div class='step_a_in'>");
                //sb.AppendLine(@"<div class='tit'><img src = '/resources/member/tit_barunnone_join_barunson.png' alt='바른 ONE 회원가'></div>");
                //sb.AppendLine(@"<ul>");
                //sb.AppendLine(@"<li style = 'width:33.1%;' class='" + (Session["JOIN_STEP"].ToString() == "1" ? "on" : "") + "'><img src='/resources/member/img_step1_barunson.png' alt='Step1 본인인증' style='padding: 10px 0px;'></li>");
                //sb.AppendLine(@"<li style = 'width:33.1%;' class='" + (Session["JOIN_STEP"].ToString() == "2" ? "on" : "") + "'><img src='/resources/member/img_step2_barunson.png' alt='Step2 약관동의' style='padding: 10px 0px;'></li>");
                //sb.AppendLine(@"<li style = 'width:33.1%;' class='" + (Session["JOIN_STEP"].ToString() == "3" ? "on" : "") + "'><img src='/resources/member/img_step3_barunson.png' alt='Step3 가입완료' style='padding: 10px 0px;'></li>");
                //sb.AppendLine(@"</ul>");
                //sb.AppendLine(@"</div>");
            }

            return sb.ToString();
        }
    }
}