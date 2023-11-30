using BarunnIntergrationService.Common;
using BarunnIntergrationService.Common.ExtensionMethod;
using BarunnIntergrationService.Common.Utillity;
using BarunnIntergrationService.Service.Member;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.PeerToPeer.Collaboration;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace BarunnIntergrationService.MyPage
{
    public partial class UserProfileModify : System.Web.UI.Page
    {
        public string sitegubun = "";

        protected override void OnInit(EventArgs e)
        {
            selBirthDateForYear.Items.Clear();
            for (int i = 0; i < 120; i++)
            {
                int iYear = 1900 + i;
                ListItem item = new ListItem();
                item.Text = iYear.ToString();
                item.Value = iYear.ToString();
                //if (iYear == 1980)
                //    item.Selected = true;
                selBirthDateForYear.Items.Add(item);
            }

            selBirthDateForMonth.Items.Clear();
            for (int i = 0; i < 12; i++)
            {
                ListItem item = new ListItem();
                item.Text = ("0" + (i + 1).ToString()).Right(2);
                item.Value = ("0" + (i + 1).ToString()).Right(2);
                selBirthDateForMonth.Items.Add(item);
            }

            selBirthDateForDay.Items.Clear();
            for (int i = 0; i < 31; i++)
            {
                ListItem item = new ListItem();
                item.Text = ("0" + (i + 1).ToString()).Right(2);
                item.Value = ("0" + (i + 1).ToString()).Right(2);
                selBirthDateForDay.Items.Add(item);
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {


            ((HtmlGenericControl)Master.FindControl("MasterBody")).Attributes["class"] = "mmodi_p";
            //((HtmlGenericControl)Master.FindControl("divFamilySiteField")).Visible = false;

            InitDeviceBranchProcessing();


            LogUtility.LogWrite(hidDupInfo.Value, ltrUserId.Text, "UserProfileModify - SiteCode", ApplicationContext.G().REFERER_SITE);
            LogUtility.LogWrite(hidDupInfo.Value, ltrUserId.Text, "UserProfileModify - Info", Request.Value("SiteCode").ToUpper() + " " + Request.Value("ReturnUrl").ToUpper() + " " + Request.Value("DupInfo"));

            Member.SignInForCertification.FamilySiteInformation familySiteInformation = BarunnIntergrationService.Member.SignInForEnterCustomerInformation.GetFamilySiteInformation(ApplicationContext.G().REFERER_SITE);

            LogUtility.LogWrite(hidDupInfo.Value, ltrUserId.Text, "UserProfileModify - FamilySiteInformation Site Code", familySiteInformation.SiteCode.ToUpper());

            if ((new string[] { "CE" }).Contains(familySiteInformation.SiteCode.ToUpper()))
            {
                dlWeddingDayField.Visible = false;
                dlWeddingHallField.Visible = false;
            }

            //if (String.IsNullOrEmpty(Request.Value("SiteCode")) == false && Request.Value("SiteCode").ToUpper() == "BE")
            //{
            //    dlWeddingDayField.Visible = false;
            //    dlWeddingHallField.Visible = false;
            //}


            if (IsPostBack == false)
            {
                sitegubun = Request.Value("SiteDiv");
				string sCertID = Request.Value("CertID");
				string sDupInfo = Request.Value("DupInfo");
                string sReturnUrl = Server.UrlEncode(Request.Value("ReturnUrl"));

				if (string.IsNullOrEmpty(sDupInfo) && !string.IsNullOrEmpty(sCertID))
				{
					var dbResult = UserCertificationLogUtility.GetUserCertificationLog(sCertID);
					if (dbResult != null)
					{
						sDupInfo = dbResult.DupInfo;
						UserCertificationLogUtility.DeleteUserCertificationLog(sCertID);
					}
				}
				hidDupInfo.Value = sDupInfo;
                hidReturnUrl.Value = sReturnUrl;

                SelectUserInfoIntergrationProcesor processor = new SelectUserInfoIntergrationProcesor();
                processor.execute("", "", sDupInfo);
                SelectUserInfoResult result = processor.getResult();

                bool isValidationCheck = result.getRowCount() > 0 ? result.getRow()[0].IS_INTERGRATION_MEMBER : false;
                if (isValidationCheck == false)
                {
                    Response.Redirect("~/");
                    Response.End();

                }

                InitExistingMember(result);
            }
        }

        public void InitDeviceBranchProcessing()
        {
            if (Request.IsMobileDevice())
            {
                ((HtmlGenericControl)Master.FindControl("MasterBody")).Attributes["class"] = "form_p";
                dlName.Attributes["class"] = "name";
                dlJoinDate.Attributes["class"] = "";
                dlBirthDate.Attributes["class"] = "birth";
                dlUserId.Attributes["class"] = "id";
                dlPassword.Attributes["class"] = "pw";
                dlPasswordConfirm.Attributes["class"] = "pw2";
                dlAddress.Attributes["class"] = "addr";
                dlPhone.Attributes["class"] = "phone";
                dlHphone.Attributes["class"] = "cphone";
                dlEmail.Attributes["class"] = "email";
            }
            else
            {
                ((HtmlGenericControl)Master.FindControl("MasterBody")).Attributes["class"] = "";
                dlName.Attributes["class"] = "";
                dlJoinDate.Attributes["class"] = "";
                dlBirthDate.Attributes["class"] = "";
                dlUserId.Attributes["class"] = "";
                dlPassword.Attributes["class"] = "";
                dlPasswordConfirm.Attributes["class"] = "";
                dlAddress.Attributes["class"] = "";
                dlPhone.Attributes["class"] = "";
                dlHphone.Attributes["class"] = "";
                dlEmail.Attributes["class"] = "";
            }
        }

        public void InitExistingMember(SelectUserInfoResult pUserInfom)
        {
            SelectUserInfoRow row = pUserInfom.getRow()[0];
            Dictionary<String, String> extractPhone = StringExtractUtillity.extractShopPhone(row.PHONE);
            Dictionary<String, String> extractCellPhone = StringExtractUtillity.extractShopPhone(row.CELLPHONE);
            Dictionary<String, String> extractBirthDate = StringExtractUtillity.extractShopPhone(row.BIRTH_DATE);

            ltrUserName.Text = row.USER_NAME;
            ltrUserId.Text = row.USER_ID;

            selBirthDateForYear.Value = extractBirthDate["head"];
            selBirthDateForMonth.Value = extractBirthDate["middle"];
            selBirthDateForDay.Value = extractBirthDate["foot"];

            rdoSolar.Checked = row.BIRTH_DATE_TYPE == "S";
            rdoLunar.Checked = row.BIRTH_DATE_TYPE == "L";

            if (row.ZIPCODE.Length == 5)
            {
                txtZipCode1.Value = row.ZIPCODE.Substring(0, 1);
                txtZipCode2.Value = row.ZIPCODE.Substring(1, 1);
                txtZipCode3.Value = row.ZIPCODE.Substring(2, 1);
                txtZipCode4.Value = row.ZIPCODE.Substring(3, 1);
                txtZipCode5.Value = row.ZIPCODE.Substring(4, 1);
            }
            
            txtAddress.Value = row.ADDRESS;
            txtAddressDetail.Value = row.ADDRESS_DETAIL;

            txtPhone1.Value = extractPhone["head"];
            txtPhone2.Value = extractPhone["middle"];
            txtPhone3.Value = extractPhone["foot"];

            txtHPhone1.Value = extractCellPhone["head"];
            txtHPhone2.Value = extractCellPhone["middle"];
            txtHPhone3.Value = extractCellPhone["foot"];

            txtWeddingDay.Value = row.WEDDING_DAY;

            txtEMailHeader.Value = row.USER_EMAIL.Split('@')[0];
            txtEMailFooter.Value = row.USER_EMAIL.Split('@')[1];
            chkSMSYorN.Checked = row.ALLOWSMS;
            chkMailServiceYorN.Checked = row.ALLOWMAILING;
            selEMailFooter.Value = row.USER_EMAIL.Split('@')[row.USER_EMAIL.Split('@').Length - 1];

            txtEMailFooter.Attributes.Remove("readonly");
            if (selEMailFooter.Value != "")
                txtEMailFooter.Attributes.Add("readonly", "readonly");

            ltrRegDate.Text = row.INTERGRATION_DATE.Left(10);

            txtWeddingDay.Value = row.WEDDING_DAY;

            switch (row.WEDDING_HALL)
            {
                case "W":
                    rdoWeddingHall_W.Checked = true;
                    break;
                case "H":
                    rdoWeddingHall_H.Checked = true;
                    break;
                case "C":
                    rdoWeddingHall_C.Checked = true;
                    break;
                case "M":
                    rdoWeddingHall_M.Checked = true;
                    break;
                case "E":
                    rdoWeddingHall_E.Checked = true;
                    break;
            }

        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                LogUtility.LogWrite(hidDupInfo.Value, ltrUserId.Text, "UserProfileModify - Save Click", "정보 수정 시작");

                SelectUserInfoRow userInfo = new SelectUserInfoRow();
                SelectUserInfoIntergrationProcesor selectProcessor = new SelectUserInfoIntergrationProcesor();
                selectProcessor.execute("", "", hidDupInfo.Value);
                SelectUserInfoResult selectResult = selectProcessor.getResult();
                userInfo = selectResult.getRow()[0];

                userInfo.ZIPCODE = txtZipCode1.Value + txtZipCode2.Value + txtZipCode3.Value + txtZipCode4.Value + txtZipCode5.Value;
                userInfo.ADDRESS = txtAddress.Value;
                userInfo.ADDRESS_DETAIL = txtAddressDetail.Value;
                userInfo.ALLOWSMS = chkSMSYorN.Checked;
                userInfo.ALLOWMAILING = chkMailServiceYorN.Checked;
                userInfo.PHONE = txtPhone1.Value + "-" + txtPhone2.Value + "-" + txtPhone3.Value;
                userInfo.CELLPHONE = txtHPhone1.Value + "-" + txtHPhone2.Value + "-" + txtHPhone3.Value;
                userInfo.USER_EMAIL = txtEMailHeader.Value + "@" + txtEMailFooter.Value;

                IntergrationUserData userData = new IntergrationUserData();
                userData.init(userInfo);
                userData.NEWPASSWORD = txtPassword.Value;
                userData.PASSWORD = txtPassword.Value;
                userData.AUTHTYPE = userInfo.AUTH_TYPE;
                userData.BIRTH_DATE = selBirthDateForYear.Value + "-" + selBirthDateForMonth.Value + "-" + selBirthDateForDay.Value;
                userData.BIRTH_DATE_TYPE = rdoSolar.Checked ? "S" : "L";

                userData.WEDDING_DAY = txtWeddingDay.Value;

                string sWeddingHall = String.Empty;
                if (rdoWeddingHall_W.Checked) sWeddingHall = rdoWeddingHall_W.Value;
                if (rdoWeddingHall_H.Checked) sWeddingHall = rdoWeddingHall_H.Value;
                if (rdoWeddingHall_C.Checked) sWeddingHall = rdoWeddingHall_C.Value;
                if (rdoWeddingHall_M.Checked) sWeddingHall = rdoWeddingHall_M.Value;
                if (rdoWeddingHall_E.Checked) sWeddingHall = rdoWeddingHall_E.Value;
                userData.WEDDING_HALL = sWeddingHall;

                LogUtility.LogWrite(hidDupInfo.Value, ltrUserId.Text, "UserProfileModify - Save Click", "updateProcessor 시작 - ltrUserId.Text = " + ltrUserId.Text + " , txtPassword.Value = " + txtPassword.Value + " , userData.PASSWORD : " + userData.PASSWORD + " , userData.NEWPASSWORD : " + userData.NEWPASSWORD);

                UpdateUserInfoIntergrationProcessor updateProcessor = new UpdateUserInfoIntergrationProcessor();
                updateProcessor.execute(userData);
                UpdateUserInfoResult updateResult = updateProcessor.getResult();

                LogUtility.LogWrite(hidDupInfo.Value, ltrUserId.Text, "UserProfileModify - Save Click", "updateProcessor 끝 - ltrUserId.Text = " + ltrUserId.Text + " , txtPassword.Value = " + txtPassword.Value + " , userData.PASSWORD : " + userData.PASSWORD + " , userData.NEWPASSWORD : " + userData.NEWPASSWORD);

                bool isSuccess = updateResult.Success;

                if (isSuccess)
                {
                    StringBuilder sb = new StringBuilder();
                    //sb.AppendLine("window.opener.location.href = '" + Server.UrlDecode(hidReturnUrl.Value) + "';");

                    string returnUrl = Request.Value("returnUrl");
                    if (returnUrl.ToUpper().Contains("BARUNSONMCARD.COM"))
                    {
                        sb.AppendLine("alert(\"수정되었습니다.\");location.replace(\"https://barunsonmcard.com/Member/Login\")");
                    }
                    else if (returnUrl.ToUpper().Contains("GSAUTH.BARUNSONCARD.COM"))
                    {
                        sb.AppendLine("alert(\"수정되었습니다.\");opener.close();window.close();");
                    }
                    else if(string.IsNullOrEmpty(returnUrl))
                    {
						sb.AppendLine("if (typeof(window.opener) == 'object'){");
						sb.AppendLine("      window.close();");
						sb.AppendLine("}");
					}
                    else
                    {
						sb.AppendLine("if (opener!=null){");						
						sb.AppendLine("      window.close();");
                        sb.AppendLine("}");
						sb.AppendLine("else{");
						sb.AppendLine("     location.replace(\""+ returnUrl + "\")");
						sb.AppendLine("}");
					}


                    //sb.AppendLine("window.close();");
                    ClientScriptUtility.ClientScript(Page, sb.ToString());

                    LogUtility.LogWrite(hidDupInfo.Value, ltrUserId.Text, "UserProfileModify - Save Click", "정보 수정 끝");

                }
                else
                {
                    ClientScriptUtility.ClientScriptAlert(Page, "오류가 발생 하였습니다. 다시 시도해 주십시오");

                    LogUtility.LogWrite(hidDupInfo.Value, ltrUserId.Text, "UserProfileModify - Save Click", "오류");
                }
            }
            catch(Exception ex)
            {
                ClientScriptUtility.ClientScriptAlert(Page, "오류가 발생 하였습니다. 다시 시도해 주십시오");

                LogUtility.LogWrite(hidDupInfo.Value, ltrUserId.Text, "UserProfileModify - Save Click", "오류 Exception : " + ex.ToString());
            }

        }
    }
}