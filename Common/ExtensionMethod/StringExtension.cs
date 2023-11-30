using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BarunnIntergrationService.Common.ExtensionMethod
{
    public static class StringExtension
    {
        public static string Left(this string str, int length)
        {
            return str.Substring(0, Math.Min(length, str.Length));
        }

        public static string Right(this string str, int length)
        {
            return str.Substring(Math.Max(0, str.Length - length), Math.Min(str.Length, length));
            
        }
    }
}