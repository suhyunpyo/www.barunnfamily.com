using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace BarunnIntergrationService.Common.Attribute
{
    [AttributeUsage(AttributeTargets.Field)]
    public class InsertRequire : System.Attribute
    {
    }

    [AttributeUsage(AttributeTargets.Field)]
    public class UpdateRequire : System.Attribute
    {
    }

}