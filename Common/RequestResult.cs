using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BarunnIntergrationService.Common
{
    public class RequestResult
    {
        public Boolean RESULT;
        public String VALUE;

        public RequestResult()
        {
            RESULT = false;
            VALUE = String.Empty;
        }
    }
}