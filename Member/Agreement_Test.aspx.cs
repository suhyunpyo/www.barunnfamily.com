﻿using BarunnIntergrationService.Common;
using BarunnIntergrationService.Common.ExtensionMethod;
using BarunnIntergrationService.Common.Utillity;
using BarunnIntergrationService.Service.Member;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace BarunnIntergrationService.Member
{
    public partial class Agreement_Test : System.Web.UI.Page
    {
        string sRefererSite = "";
        //20210419 표수현 - DomainSite 변수를 퍼블릭으로 변경
        public string DomainSite = "";
        string sUrlReferer = "";
        public string sAuthModuleType;
        public string sEncodeData;
        public string sParamR1;
        public string sParamR2;
        public string sParamR3;
        public string sConnInfo;
        public string sDupInfo;
        public string sAuthType;
        public string sSelectSiteCode;
        public string sSelectCustomUserId;

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write("TEfdfdfST");
            Response.End();
            SetCookie();

            SetFormAction();

            SetFamilySiteInfomation();

            SetProcressor();

            InitDeviceBranchProcessing();

           // ltrHiddenField.Text = CreateHiddenField();

           // AgreementStyleSheet.Text = createMasterPageStyleSheet();

          //  LiteralCellPhone.Text = CreateStepOneButton();

            if (DomainSite == "barunsoncard")
            {
            //    LiteralEventText.Text = CreateStepOneEventText(); //바른손 이벤트 문구 추가 
            }

            //선물코드 초기화
            if (HttpContext.Current.Session["freeGift"] == null)
            {
                HttpContext.Current.Session["freeGift"] = "37429";
            }
         
           // InitCPClient();

           // InitCompanySeq();

        }

        private void SetCookie()
        {
            HttpContextUtility.SetNoCache();
            sUrlReferer = ApplicationContext.G().REFERER_SITE;
            CookieUtility.SetCookie("REFERER_SITE", sUrlReferer);
            DomainSite = ApplicationContext.G().REFERER_SITE_DOMAIN(sUrlReferer);
            //Response.Write("sUrlReferer" + sUrlReferer);

        }

        private void SetFormAction()
        {
            ((HtmlGenericControl)Master.FindControl("MasterBody")).Attributes["class"] = "term_p";
            string actionUrl = ApplicationContext.G().IS_REFERER_FORM_ACTION(DomainSite);
            ((HtmlForm)Master.FindControl(ApplicationContext.G().MAIN_FORM_ID)).Attributes["action"] = actionUrl;
            //((HtmlForm)Master.FindControl(ApplicationContext.G().MAIN_FORM_ID)).Attributes["action"] = "";
        }

        private void SetFamilySiteInfomation()
        {
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('" + ApplicationContext.G().IS_REFERER_FORM_ACTION(sUrlReferer) + "');", true);

            sRefererSite = CookieUtility.GetCookieValue("REFERER_SITE");
            Session["JOIN_STEP"] = "1";

            Member.SignInForCertification.FamilySiteInformationList familySiteInformationList = new Member.SignInForCertification.FamilySiteInformationList();
            int index = familySiteInformationList.FindFamilySiteFromDomainShortName(sRefererSite, 0);
            Member.SignInForCertification.FamilySiteInformation familySiteInformation = familySiteInformationList.familySiteInformationList[index];

            //hidSelectSiteCode.Value = familySiteInformation.SiteCode;

        }

        private void SetProcressor()
        {
            SelectUserInfoIntergrationProcesor processor = new SelectUserInfoIntergrationProcesor();
            processor.execute("", "", sDupInfo);
            SelectUserInfoResult result = processor.getResult();
        }

        /// <summary>
        /// 사이트별 Hidden 값 처리
        /// </summary>
        /// <returns></returns>
        public string CreateHiddenField()
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendLine("<input type=\"hidden\" name=\"sRefererSite\"             id=\"sRefererSite\" value=\"" + DomainSite + "\" />");
            sb.AppendLine("<input type=\"hidden\" name=\"AuthModuleType\"           id=\"AuthModuleType\" value=\"" + sAuthModuleType + "\" />");
            sb.AppendLine("<input type=\"hidden\" name=\"EncodeData\"               id=\"EncodeData\"     value=\"" + sEncodeData + "\" />");
            //sb.AppendLine("<input type=\"hidden\" name=\"param_r1\"                 id=\"param_r1\"       value=\"" + sParamR1 + "\" />");
            //sb.AppendLine("<input type=\"hidden\" name=\"param_r2\"                 id=\"param_r2\"       value=\"" + sParamR2 + "\" />");
            //sb.AppendLine("<input type=\"hidden\" name=\"param_r3\"                 id=\"param_r3\"       value=\"" + sParamR3 + "\" />");
            sb.AppendLine("<input type=\"hidden\" name=\"ConnInfo\"                 id=\"ConnInfo\"       value=\"" + sConnInfo + "\" />");
            sb.AppendLine("<input type=\"hidden\" name=\"DupInfo\"                  id=\"DupInfo\"        value=\"" + sDupInfo + "\" />");
            sb.AppendLine("<input type=\"hidden\" name=\"AuthType\"                 id=\"AuthType\"        value=\"" + sAuthType + "\" />");

            sb.AppendLine("<input type=\"hidden\" name=\"rdoSelectSiteCode\"        id=\"rdoSelectSiteCode\"        value=\"" + sSelectSiteCode + "\" />");
            sb.AppendLine("<input type=\"hidden\" name=\"SelectCustomUserId\"      id=\"SelectCustomUserId\"        value=\"" + sSelectCustomUserId + "\" />");
            return sb.ToString();
        }

        /// <summary>
        /// 바른손만 보이는 이벤트 문구 
        /// </summary>
        /// <returns></returns>
        public string CreateStepOneEventText()
        {
            StringBuilder sb = new StringBuilder();


            if (DomainSite == "barunsoncard")
            {
                if (Request.IsMobileDevice())
                {
                    sb.AppendLine("<div style= \"text-align: left; margin: 20px auto; background: #f3f3f3; padding: 10px; font-family: 'NanumBarunGothic', sans-serif;  font-size: 15px; line-height: 25px; letter-spacing: 0px; \">");
                    sb.AppendLine("<h3 style = \"font-size: 16px; padding: 0 0 5px 0; font-weight: bold;  letter-spacing: 0px;  color: #617bd1;\">[알고 계세요] </h3> ");
                    sb.AppendLine("<ul>");
                    sb.AppendLine(" <li>•청첩장 및 감사장 할인쿠폰은 마케팅 수신 동의(전체동의) 시, 적용됩니다.</li>");
                    sb.AppendLine(" <li>•혼수용품 할인쿠폰은 청첩장 샘플신청 시, 택배 동봉 발송됩니다. </li>");
                    sb.AppendLine("</ul>");
                    sb.AppendLine("</div>");

                }
                else
                {
                    sb.AppendLine("<div style= \"text-align: left;  width: 879px; margin: 20px auto; background: #f3f3f3; padding: 25px; font-family: 'NanumBarunGothic', sans-serif;  font-size: 15px; line-height: 25px; letter-spacing: 0px; \">");


                    sb.AppendLine("<h3 style = \"font-size: 16px; padding: 0 0 5px 0; font-weight: bold;  letter-spacing: 0px;  color: #617bd1;\">[알고 계세요] </h3> ");
                    sb.AppendLine("<ul>");
                    sb.AppendLine(" <li>•&nbsp; &nbsp; 청첩장 및 감사장 할인쿠폰은 마케팅 수신 동의(전체동의) 시, 적용됩니다.</li>");
                    sb.AppendLine(" <li>•&nbsp; &nbsp; 혼수용품 할인쿠폰은 청첩장 샘플신청 시, 택배 동봉 발송됩니다. </li>");
                    sb.AppendLine("</ul>");
                    sb.AppendLine("</div>");
                }
            }

            return sb.ToString();
        }

        /// <summary>
        /// 사이트별 Hidden 값 처리
        /// </summary>
        /// <returns></returns>
        public string CreateStepOneButton()
        {
            StringBuilder sb = new StringBuilder();


            if (DomainSite == "barunsoncard")
            {
                if (Request.IsMobileDevice())
                {
                    sb.AppendLine("<img src=\"/Resources/member/img_top_mo.png\"/>");
                }
                else
                {
                    sb.AppendLine("<img src=\"/Resources/member/img_top.png\"/>");
                }

            }
            else if (DomainSite == "barunsonmall")
            {
                sb.AppendLine("<img src=\"/Resources/member/phone_img_barunsoncard.png\"/>");
            }
            else if (DomainSite == "bhandscard")
            {
                sb.AppendLine("<img src=\"/Resources/member/phone_img_bhandscard.png\"/>");
            }
            else if (DomainSite == "thecard")
            {
                sb.AppendLine("<img src=\"/Resources/member/phone_img_thecard.png\"/>");
            }
            else if (DomainSite == "barunsonmall")
            {
                sb.AppendLine("<img src=\"/Resources/member/phone_img_barunsoncard.png\"/>");
            }
            else if (DomainSite == "premierpaper")
            {
                sb.AppendLine("<img src=\"/Resources/member/phone_img_premierpaper.png\"/>");
            }

            return sb.ToString();
        }


        /// <summary>
        /// 사이트별 Style 처리
        /// </summary>
        /// <returns></returns>
        public String createMasterPageStyleSheet()
        {
            StringBuilder sb = new StringBuilder();

            if (DomainSite == "barunsoncard" || DomainSite == "barunsonmall")
            {
                sb.AppendLine(@"<style> body {background: #f1f1f1;} .input_b .ez-checkbox {background-image: url(/resources/img_inc/set_check_new.png);} ");


                // 20191031 바른손회원가입 이벤트 
                if (DomainSite == "barunsoncard")
                {
                    sb.AppendLine(@".cont_a {background:#f7f8f9;}");
                    sb.AppendLine(@".cont_a_in.check_all_area {background:none;}");

                    sb.AppendLine(@".b_btn.type2 { background - color: #515151; width: 931px;}");

                    sb.AppendLine(@".step01 .b_btn.type2.right span {min-width: 690px; margin:0 35px 0 0;}");
                    sb.AppendLine(@".cont_a_in.check_all_area.step01 {padding-top: 30px; width: 52%;overflow: hidden;}");

                    sb.AppendLine(@"@media screen and (max-width: 650px) { ");
                    sb.AppendLine(@".cont_a_in.check_all_area.step01 { width: 76%; }");
                    sb.AppendLine(@".b_btn.type3 {background:#eff0f1;padding: 0px !important;}");
                    sb.AppendLine(@".step01 .b_btn.type3 {width:100%;}");
                    sb.AppendLine(@".step01 .b_btn.type2 {width:100%; !important}");
                    sb.AppendLine(@"}");



                }

                sb.AppendLine(@" </style>");

            }
            else if (DomainSite == "bhandscard")
            {
                sb.AppendLine(@"<style>  body {background: #f1f1f1 !important;} .cont_a {background:#f8f7f5 !important;} .cont_a_in.step01 {background-color: #f8f7f5;}  .input_b.type1 label{font-size: 12px; font-weight: bold;} .input_b .ez-checkbox {background-image: url(/resources/img_inc/set_check_bhandscard.png);} </style>");
            }


            else if (DomainSite == "thecard")
            {
                sb.AppendLine(@"<style> .input_b .ez-checkbox {background-image: url(/resources/img_inc/set_check_thecard.png);}  .cont_a_in.step01{ padding: 70px 20px; } </style>");
            }

            else if (DomainSite == "premierpaper")
            {
                sb.AppendLine(@"<style> body {background: #f1f1f1 !important;} .input_b .ez-checkbox {background-image: url(/resources/img_inc/set_check_new_premierpaper.png);} </style>");
            }

            return sb.ToString();
        }


        public void InitCPClient()
        {
            //String NextStepUrl = "";
            //if (DomainSite == "barunsoncard")
            //{
            //    NextStepUrl = "/Member/BarunsonForCustomerInformation.aspx";
            //}
            //else if (DomainSite == "bhandscard")
            //{
            //    NextStepUrl = "/Member/BhandsForCustomerInformation.aspx";
            //}
            //else if (DomainSite == "thecard")
            //{
            //    NextStepUrl = "/Member/ThecardForCustomerInformation.aspx";
            //}
            //else if (DomainSite == "barunsonmall")
            //{
            //    NextStepUrl = "/Member/BarunsonForCustomerInformation.aspx";
            //}
            //else if (DomainSite == "premierpaper")
            //{
            //    NextStepUrl = "/Member/PremierForCustomerInformation.aspx";
            //}
            ////20210419 표수현 추가 
            //else if (DomainSite == "barunsonmcard")
            //{
            //    NextStepUrl = "/Member/BarunsonMcardForCustomerInformation.aspx";
            //}

            //CPClientUtility CPClientUtility = new CPClientUtility();

            //CPClientUtility.SiteCode = ApplicationContext.G().CPCLIENT_SITE_CODE;
            //CPClientUtility.Password = ApplicationContext.G().CPCLIENT_PASSWORD;
            //CPClientUtility.AuthType = ApplicationContext.G().CPCLIENT_AUTH_TYPE;
            //CPClientUtility.ReturnUrl = ApplicationContext.G().CPCLIENT_RETURN_URL_V2;
            //CPClientUtility.NextStepUrl = NextStepUrl;
            //CPClientUtility.IsSessionCheck = false;
            //CPClientUtility.ExecuteDataEncoding();

            //((Literal)Master.FindControl("ltrMasterPageCPClientRequestForm")).Text = CPClientUtility.GetCPClientRequestOneFormTag(ApplicationContext.G().CPCLIENT_REQUEST_FORM_NAME);
            //((Literal)Master.FindControl("ltrMasterPageCPClientResponseForm")).Text = CPClientUtility.GetCPClientResponseOneFormTag(ApplicationContext.G().CPCLIENT_RESPONSE_FORM_NAME);
        }

        public void InitCompanySeq()
        {


            if (DomainSite == "barunsoncard")
            {
                Session.Add("companySeq", "5001");
                Session.Add("saleGubun", "SB");
            }
            else if (DomainSite == "bhandscard")
            {
                Session.Add("companySeq", "5006");
                Session.Add("saleGubun", "SA");
            }
            else if (DomainSite == "thecard")
            {
                Session.Add("companySeq", "5007");
                Session.Add("saleGubun", "ST");
            }
            else if (DomainSite == "barunsonmall")
            {
                Session.Add("companySeq", "5000");
                Session.Add("saleGubun", "B");
            }
            else if (DomainSite == "premierpaper")
            {
                Session.Add("companySeq", "5003");
                Session.Add("saleGubun", "SS");
            }
            //20210419 표수현 추가 
            else if (DomainSite == "barunsonmcard")
            {
                Session.Add("companySeq", "8029");
                Session.Add("saleGubun", "BM");
            }
        }

        public void InitDeviceBranchProcessing()
        {
            if (Request.IsMobileDevice() || Request.UserAgent.ToUpper().Contains("BARUNSON_APP"))
            {
                ((HtmlGenericControl)Master.FindControl("MasterBody")).Attributes["class"] = "form_p";
            }
            else
            {
                ((HtmlGenericControl)Master.FindControl("MasterBody")).Attributes["class"] = "";
            }
        }

        [WebMethod(EnableSession = true)]
        public static String SetUserFreeGift(String giftCode)
        {
            RequestResult result = new RequestResult();
            try
            {
                HttpContext.Current.Session["freeGift"] = giftCode;

                result.RESULT = true;
            }
            catch (Exception ex)
            {
                result.RESULT = false;
                result.VALUE = ex.Message;
            }

            return JsonConvert.SerializeObject(result);
        }

    }
}