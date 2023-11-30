using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace BarunnIntergrationService.Common.Utillity
{
    public class FileUtility
    {
        public static string FileReadToEnd(string path)
        {
            string result = String.Empty;

            try
            {
                StreamReader sr = new StreamReader(path);
                result = sr.ReadToEnd();
                sr.Close();
                sr.Dispose();
            }
            catch
            { }

            return result;
        }
    }
}
