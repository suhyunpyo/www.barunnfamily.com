using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml;

namespace BarunnIntergrationService.Common.Utillity
{
    public class XMLUtillity
    {

        /// <summary>
        /// XML Response Write 를 위하여 정의되는 ContextType 을 반환한다.
        /// </summary>
        /// <returns></returns>
        static public String ContextType() { return "text/xml"; }

        /// <summary>
        /// XML 선언문(XML declaration)을 반환한다.
        /// </summary>
        /// <returns></returns>
        static public String HeadString()
        {
            return "<?xml version=\"1.0\" encoding=\"UTF-8\"?>";
        }

        /// <summary>
        /// <![CDATA[]]> 태그로 감싼다.
        /// </summary>
        /// <param name="pValue"></param>
        /// <returns></returns>
        static public String WrapCDATA(String pValue)
        {
            String result = "<![CDATA[";
            result += pValue;
            result += "]]>";
            return result;
        }


        static public String ToString(Boolean pBoolean)
        {
            return (pBoolean == true) ? "true" : "false";
        }

        /// <summary>
        /// XMLElement 의 하위 노드의 InnerText를 반환한다.
        /// </summary>
        /// <param name="pTarget"></param>
        /// <param name="pNodeName"></param>
        /// <param name="pDefaultValue"></param>
        /// <returns></returns>
        static public String GetInnerText(XmlElement pTarget, String pNodeName, String pDefaultValue = null)
        {
            String result = pDefaultValue;
            if (pTarget != null && pTarget[pNodeName] != null) result = pTarget[pNodeName].InnerText;
            return result;
        }
    }
}