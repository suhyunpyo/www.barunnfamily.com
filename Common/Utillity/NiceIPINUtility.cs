using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Security.Policy;
using System.Text;
using System.Web;
using System.Xml.Linq;

namespace BarunnIntergrationService.Common.Utillity
{
	public class NiceIPINUtility
	{
		public string receiveData { get; set; }     //--본인인증 후 복호화시 리턴받을 custom data		
		public string returnUrl { get; set; }       //--본인인증 후 리턴 받을 URL
		public string authType { get; set; }        //--

		public string tokenVersionId { get; set; }  //--본인인증 후 복호화시 필요값
		public string encData { get; set; }         //--본인인증 후 복호화시 필요값
		public string integrityValue { get; set; }  //--본인인증 후 복호화시 필요값

		public string nextStepUrl { get; set; }     //--본인인증 후 action url (기본)
		public string urlReferer { get; set; }      //--이전페이지


		public string respDecJson { get; set; }     //--복호화 API 응답 JSON (DB저장용)
		public NiceIPINResponseData respDecData { get; set; }
		public NiceCryptoResponse respEncData { get; set; }


		///---------------------------------------
		/// <summary>
		/// Nice 인증창에 전달할 EncData 생성
		/// </summary>
		/// <returns></returns>
		///---------------------------------------
		public NiceCryptoResponse ExecuteDataEncoding()
		{
			string privateApiUrl = string.Empty;
			string getData = string.Empty;
			string responseText = string.Empty;

			respEncData = null;
			privateApiUrl = string.Format("https://privateapi.barunsoncard.com/api/Nice/IpinEncrypt?returnUrl={0}&receiveData={1}&methodType=post&popupYn=Y",
												string.IsNullOrEmpty(returnUrl) ? "" : HttpContext.Current.Server.UrlEncode(returnUrl),
												string.IsNullOrEmpty(receiveData) ? "" : HttpContext.Current.Server.UrlEncode(receiveData));

			System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;      // TLS 1.2 강제 셋팅 (framework 4.0은 1.1이 default)
			HttpWebRequest webRequest = (HttpWebRequest)WebRequest.Create(privateApiUrl);
			webRequest.Method = WebRequestMethods.Http.Get;
			webRequest.ContentType = "application/x-www-form-urlencoded";

			try
			{
				using (HttpWebResponse resp = (HttpWebResponse)webRequest.GetResponse())
				{

					using (StreamReader streamReader = new StreamReader(resp.GetResponseStream()))
					{
						responseText = streamReader.ReadToEnd();
					}
				}
			}
			catch (Exception ex)
			{
				responseText = "HTTP_ERROR:" + ex.ToString();
			}

			if (!responseText.Contains("HTTP_ERROR") && !string.IsNullOrEmpty(responseText))
			{				
				respEncData = Newtonsoft.Json.JsonConvert.DeserializeObject<NiceCryptoResponse>(responseText);
			}
			else
			{
				respEncData = null;
			}
					

			return respEncData;
		}


		///---------------------------------------
		/// <summary>
		/// Nice 인증 완료 후 받은 데이터 복호화 처리
		/// </summary>
		/// <returns></returns>
		///---------------------------------------
		public NiceIPINResponseData ExecuteDataDecoding()
		{
			respDecData = null;

			if (!string.IsNullOrEmpty(tokenVersionId) && !string.IsNullOrEmpty(encData) && !string.IsNullOrEmpty(integrityValue))
			{
				string responseText = string.Empty;
				string privateApiUrl = "https://privateapi.barunsoncard.com/api/Nice/IpinDecrypt";
				string getData = string.Format("tokenVersionId={0}&encData={1}&integrityValue={2}",
												tokenVersionId,
												encData.Contains("%") ? encData : HttpContext.Current.Server.UrlEncode(encData),
												integrityValue.Contains("%") ? integrityValue : HttpContext.Current.Server.UrlEncode(integrityValue));

				System.Net.ServicePointManager.SecurityProtocol = System.Net.SecurityProtocolType.Tls12;      // TLS 1.2 강제 셋팅 (framework 4.0은 1.1이 default)
				HttpWebRequest webRequest = (HttpWebRequest)WebRequest.Create(privateApiUrl + "?" + getData);
				webRequest.Method = WebRequestMethods.Http.Get;
				webRequest.ContentType = "application/x-www-form-urlencoded";

				try
				{
					using (HttpWebResponse resp = (HttpWebResponse)webRequest.GetResponse())
					{

						using (StreamReader streamReader = new StreamReader(resp.GetResponseStream()))
						{
							responseText = streamReader.ReadToEnd();
						}
					}
				}
				catch (Exception ex)
				{
					responseText = "HTTP_ERROR:" + ex.ToString();
				}

				if (!responseText.Contains("HTTP_ERROR") && !string.IsNullOrEmpty(responseText))
				{
					respDecJson = responseText;
					respDecData = Newtonsoft.Json.JsonConvert.DeserializeObject<NiceIPINResponseData>(responseText);
				}
				else
				{
					respDecData = null;
				}
			}

			return respDecData;
		}

		/// <summary>
		/// Nice 인증창에 보낼 post from
		/// </summary>
		/// <param name="formName"></param>
		/// <returns></returns>
		public String GetRequestFormTag(string formName)
		{
			StringBuilder result = new StringBuilder();
			result.AppendLine("<form name='"+ formName + "' method='post'>");
			result.AppendLine("<input type='hidden' name='token_version_id' value='" + this.respEncData.TokenVersionId + "'/>");
			result.AppendLine("<input type='hidden' name='enc_data' value='" + this.respEncData.EncData + "'>");
			result.AppendLine("<input type='hidden' name='integrity_value' value='" + this.respEncData.IntegrityValue + "'>");
			result.AppendLine("<input type='hidden' name='param_popup_yn' value='Y'>");
			result.AppendLine("<input type='hidden' name='m' value='service'>");
			result.AppendLine("</form>");
			return result.ToString();
		}

		/// <summary>
		///  Nice 인증창에서 리턴되는 param 을 담을 form (popup 창에서 값이 전달된다)
		/// </summary>
		/// <param name="formName"></param>
		/// <returns></returns>
		public String GetResponseFormTag(string formName)
		{
			StringBuilder result = new StringBuilder();
			result.AppendLine("<form name='" + formName + "' method='post' action='"+ nextStepUrl+"'>");
			result.AppendLine("<input type='hidden' name='certID' value='' />");
			result.AppendLine("<input type='hidden' name='sUrlReferer' value='" + this.urlReferer + "'/>");
			result.AppendLine("</form>");
			return result.ToString();
		}
		
		

		/// <summary>
		/// Nice 인증 창에서 결과 수신후 에러 처리 및 부모창 처리
		/// </summary>
		/// <param name="pFormName"></param>
		/// <param name="pActionPageUrl"></param>
		/// <returns></returns>
		public String GetResultScript(string certId, string pFormName, string pActionPageUrl = "")
		{
			string errorMsg = String.Empty;			

			if (respDecData==null)
			{
				errorMsg = "복호화 오류입니다.";
				return GetErrorResultScript(errorMsg);
			}

			string errorCode = respDecData.resultcode;

			if (errorCode != "1")
			{
				errorMsg = string.Format("복호화 결과 오류({0})",errorCode);
				return GetErrorResultScript(errorMsg);
			}

			return GetSuccessResultScript(certId, pFormName, pActionPageUrl);
		}

		/// <summary>
		/// Nice 인증창 리턴후 복호화 및 결과 오류시 에러 출력 후 창닫음
		/// </summary>
		/// <param name="pErrorMessage"></param>
		/// <returns></returns>
		public String GetErrorResultScript(string pErrorMessage)
		{
			StringBuilder result = new StringBuilder();
			result.AppendLine("<script type='text/javascript'>");
			result.AppendLine("alert('" + pErrorMessage + "');");
			result.AppendLine("window.close();");
			result.AppendLine("</script>");
			return result.ToString();
		}

		/// <summary>
		/// Nice 인증창 리턴후 복호화 성공시 부모창에 param 셋팅 및 submit후 창닫음
		/// </summary>
		/// <param name="pFormName"></param>
		/// <param name="pActionPageUrl"></param>
		/// <returns></returns>
		public String GetSuccessResultScript(string certID, string pFormName, string pActionPageUrl)
		{
			StringBuilder result = new StringBuilder();

			
			result.AppendLine("<html>");
			result.AppendLine("<body>");

			result.AppendLine("<script type='text/javascript'>");
			result.AppendLine("document.domain = window.location.hostname; ");

			if (pActionPageUrl != "")
				result.AppendLine("window.opener." + pFormName + ".action='" + pActionPageUrl + "';");

			result.AppendLine("window.opener." + pFormName + ".certID.value='" + certID + "';");
			result.AppendLine("window.opener." + pFormName + ".submit();");
			result.AppendLine("window.close();");
			result.AppendLine("</script>");

			result.AppendLine("</body>");
			result.AppendLine("</html>");

			return result.ToString();
		}

	}


	public class NiceIPINResponseData
	{
		/// <summary>
		/// 결과코드 result_code가 성공(1)일 때만 전달
		/// </summary>		
		public string resultcode { get; set; }

		/// <summary>
		/// [필수] 서비스 요청 고유 번호
		/// </summary>		
		public string requestno { get; set; }

		/// <summary>
		/// 암호화 일시(YYYYMMDDHH24MISS)
		/// </summary>		
		public string enctime { get; set; }

		/// <summary>
		/// [필수] 암호화토큰요청 API에 응답받은 site_code
		/// </summary>		
		public string sitecode { get; set; }

		/// <summary>
		/// 인증서버 아이피
		/// </summary>		
		public string ipaddr { get; set; }


		/// <summary>
		/// 이름
		/// </summary>		
		public string name { get; set; }

		/// <summary>
		/// UTF8로 URLEncoding된 이름 값
		/// </summary>		
		public string utf8_name { get; set; }

		/// <summary>
		/// 아이핀 번호
		/// </summary>		
		public string vnumber { get; set; }

		/// <summary>
		/// 성별 0:여성, 1:남성
		/// </summary>		
		public string gendercode { get; set; }

		/// <summary>
		/// 생년월일 8자리
		/// </summary>		
		public string birthdate { get; set; }

		/// <summary>
		/// 내외국인 0:내국인, 1:외국인
		/// </summary>		
		public string nationalinfo { get; set; }

		/// <summary>
		/// 연령 코드
		/// </summary>		
		public string agecode { get; set; }

		/// <summary>
		/// 개인 식별 코드 (CI)
		/// </summary>		
		public string coinfo1 { get; set; }

		/// <summary>
		/// 개인 식별 코드 (CI2)
		/// </summary>		
		public string coinfo2 { get; set; }

		/// <summary>
		/// 개인 식별 코드(di)
		/// </summary>		
		public string dupinfo { get; set; }

		/// <summary>
		/// CI 버전 정보
		/// </summary>		
		public string ciupdate { get; set; }

		/// <summary>
		/// 인증 후 전달받을 데이터 세팅 (요청값 그대로 리턴)
		/// </summary>		
		public string receivedata { get; set; } = "";
	}
}