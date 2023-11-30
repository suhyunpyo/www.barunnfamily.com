using BarunnIntergrationService.Common.Utillity;
using System;

namespace BarunnIntergrationService.Service
{
    public abstract class AbstractServiceResult
    {
        protected Boolean m_success;
        public Boolean Success
        {
            get { return m_success; }
            set { m_success = value; }
        }

        protected String m_message;
        public String Message
        {
            get { return m_message; }
            set { m_message = value; }
        }

        public AbstractServiceResult()
        {
            m_success = false;
        }

        public abstract String parseXML();

        public abstract String parseJSON();

        protected String buildSuccessXMLElement()
        {
            return "<SUCCESS>" + XMLUtillity.WrapCDATA(this.m_success.ToString().ToUpper()) + "</SUCCESS>";
        }

        protected String buildMessageXMLElement()
        {
            String message = this.m_message;
            message = String.IsNullOrEmpty(message) ? String.Empty : message;
            return "<MESSAGE>" + XMLUtillity.WrapCDATA(message.ToString().ToUpper()) + "</MESSAGE>";
        }

    }
}