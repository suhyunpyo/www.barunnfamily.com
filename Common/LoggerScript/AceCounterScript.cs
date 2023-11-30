using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace BarunnIntergrationService.Common.LoggerScript
{
    public class AceCounterScript
    {
        /// <summary>
        /// 공통 스크립트 
        /// </summary>
        /// <param name="ServiceDomain"></param>
        /// <param name="IsMobile"></param>
        /// <returns></returns>
        public static String GetDefaultScript(string ServiceDomain, bool IsMobile)
        {
            StringBuilder sbResult = new StringBuilder();

            if(ServiceDomain == "barunsoncard")
            {
                if (IsMobile)
                {
                    sbResult.AppendLine(@"<!-- AceCounter Mobile WebSite Gathering Script V.8.0.2019080601 -->");
                    sbResult.AppendLine(@"<script language='javascript'>");
                    sbResult.AppendLine(@"var _AceGID=(function(){var Inf=['m.barunsoncard.com','m.barunsoncard.com','AZ3A72533','AM','0','NaPm,Ncisy','ALL','0']; var _CI=(!_AceGID)?[]:_AceGID.val;var _N=0;if(_CI.join('.').indexOf(Inf[3])<0){ _CI.push(Inf);  _N=_CI.length; } return {o: _N,val:_CI}; })();");
                    sbResult.AppendLine(@"var _AceCounter=(function(){var G=_AceGID;var _sc=document.createElement('script');var _sm=document.getElementsByTagName('script')[0];if(G.o!=0){var _A=G.val[G.o-1];var _G=(_A[0]).substr(0,_A[0].indexOf('.'));var _C=(_A[7]!='0')?(_A[2]):_A[3];var _U=(_A[5]).replace(/\,/g,'_');_sc.src=(location.protocol.indexOf('http')==0?location.protocol:'http:')+'//cr.acecounter.com/Mobile/AceCounter_'+_C+'.js?gc='+_A[2]+'&py='+_A[1]+'&up='+_U+'&rd='+(new Date().getTime());_sm.parentNode.insertBefore(_sc,_sm);return _sc.src;}})();");
                    sbResult.AppendLine(@"</script>");
                    sbResult.AppendLine(@"<noscript><img src='http://gmb.acecounter.com/mwg/?mid=AZ3A72533&tp=noscript&ce=0&' border='0' width='0' height='0' alt=''></noscript>");
                    sbResult.AppendLine(@"<!-- AceCounter Log Gathering Script End -->");

                }
                else
                {
                    sbResult.AppendLine(@"<!-- AceCounter Log Gathering Script V.8.0.2019080601 -->");
                    sbResult.AppendLine(@"<script language=""javascript"">");
                    sbResult.AppendLine(@"var _AceGID=(function(){var Inf=['gtc11.acecounter.com','8080','BS4A42067772530','AW','0','NaPm,Ncisy','ALL','0']; var _CI=(!_AceGID)?[]:_AceGID.val;var _N=0;var _T=new Image(0,0);if(_CI.join('.').indexOf(Inf[3])<0){ _T.src =( location.protocol==""https: ""?""https://""+Inf[0]:""http://""+Inf[0]+"":""+Inf[1]) +'/?cookie'; _CI.push(Inf);  _N=_CI.length; } return {o: _N,val:_CI}; })();");
                    sbResult.AppendLine(@"var _AceCounter=(function(){var G=_AceGID;var _sc=document.createElement('script');var _sm=document.getElementsByTagName('script')[0];if(G.o!=0){var _A=G.val[G.o-1];var _G=(_A[0]).substr(0,_A[0].indexOf('.'));var _C=(_A[7]!='0')?(_A[2]):_A[3];var _U=(_A[5]).replace(/\,/g,'_');_sc.src=(location.protocol.indexOf('http')==0?location.protocol:'http:')+'//cr.acecounter.com/Web/AceCounter_'+_C+'.js?gc='+_A[2]+'&py='+_A[4]+'&gd='+_G+'&gp='+_A[1]+'&up='+_U+'&rd='+(new Date().getTime());_sm.parentNode.insertBefore(_sc,_sm);return _sc.src;}})();");
                    sbResult.AppendLine(@"</script>");
                    sbResult.AppendLine(@"<noscript><img src=""http://gtc11.acecounter.com:8080/?uid=BS4A42067772530&je=n&"" border='0' width='0' height='0' alt=''></noscript>");
                    sbResult.AppendLine(@"<!-- AceCounter Log Gathering Script End -->");

                }
                
            }

            return sbResult.ToString();
        }

        /// <summary>
        /// 회원가입완료 스크립트 공통 스크립트보다 이전에 실행되어야된다. 
        /// </summary>
        /// <param name="ServiceDomain">도메인</param>
        /// <param name="sUserId">회원가입아이디</param>
        /// <param name="IsMobile">모바일인가?</param>
        /// <returns></returns>
        public static String GetRegistrCompleteScript(string ServiceDomain, string sUserId, bool IsMobile)
        {
            StringBuilder sbResult = new StringBuilder();


            if (ServiceDomain == "barunsoncard")
            {
                sbResult.AppendLine(@"<!-- This script is for AceCounter START -->");
                sbResult.AppendLine(@"<script type=""text/javascript"">");

                if (IsMobile)
                {
                    sbResult.AppendLine(@"var m_jn = ""join"";");
                    sbResult.AppendLine(@"var m_jid = """ + sUserId + @""";");
                }
                else
                {
                    sbResult.AppendLine(@"var _jn = ""join"";");
                    sbResult.AppendLine(@"var _jid = """ + sUserId + @""";");
                }                
                
                sbResult.AppendLine(@"</script>");
                sbResult.AppendLine(@"<!-- AceCounter END -->");
            }

            return sbResult.ToString();
        }

    }
}