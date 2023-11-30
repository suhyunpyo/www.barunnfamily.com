using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using BarunnIntergrationService.Common.Utillity;
using System.Web.Security;

namespace BarunnIntergrationService.Common
{
    public class AuthManager
    {
        private const String USER_ID_KEY = "USER_ID";
        private const String AUTH_ID_KEY = "AUTH_ID";

        private Boolean m_guestSessionEnabled;

        public String USER_ID
        {
            get
            {
                String result = String.Empty;
                try
                {
                    result = SessionUtility.GetCookieValue(USER_ID_KEY);
                }
                catch { }
                return result;
            }
            set
            {
                SessionUtility.SetCookie(USER_ID_KEY, value);
            }
        }

        public String AUTH_ID
        {
            get
            {
                String result = String.Empty;
                try
                {
                    result = SessionUtility.GetCookieValue(AUTH_ID_KEY);
                }
                catch { }

                if (IsSignIn == false && m_guestSessionEnabled == true)
                {
                    if (String.IsNullOrEmpty(result))
                    {
                        this.AUTH_ID = createAuthID();
                        result = SessionUtility.GetCookieValue(AUTH_ID_KEY);
                    }
                }

                return result;
            }

            set
            {
                SessionUtility.SetCookie(AUTH_ID_KEY, value);
            }
        }

        /// <summary>
        /// 현재 로그인 상태인지를 반환한다.
        /// </summary>
        public Boolean IsSignIn
        {
            get
            {
                Boolean result = false;
                result = HttpContext.Current.User.Identity.IsAuthenticated;
                return result;
            }
        }


        public AuthManager()
        {
        }

        public AuthManager(Boolean pGuestSessionEnabled)
        {
            m_guestSessionEnabled = pGuestSessionEnabled;
        }


        public void SignIn(String pUserID)
        {
            SignIn(pUserID, createAuthID());
        }

        public void SignIn(String pUserID, String pAuthId)
        {
            FormsAuthentication.SetAuthCookie(pAuthId, false);
            USER_ID = pUserID;
            AUTH_ID = pAuthId;
        }

        public void SignOut()
        {
            SessionUtility.ClearCooke(USER_ID_KEY);
            SessionUtility.ClearCooke(AUTH_ID_KEY);
            FormsAuthentication.SignOut();
            HttpContext.Current.Response.Cookies.Get(FormsAuthentication.FormsCookieName).Expires = DateTime.Now.AddYears(-1);
        }

        private String createAuthID()
        {
            String result = "";
            result = Guid.NewGuid().ToString();
            return result;
        }
    }
}