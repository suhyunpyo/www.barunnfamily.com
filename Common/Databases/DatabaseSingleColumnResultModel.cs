using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BarunnIntergrationService.Common.Databases
{
    public class DatabaseSingleColumnResultModel<T> : IDatabaseResultModel
    {
        private T m_result;

        public void update(System.Data.SqlClient.SqlDataReader reader)
        {
            reader.Read();

            try
            {
                m_result = (T)reader.GetValue(0);
            }
            catch
            {
            }
        }

        public T getResult()
        {
            return m_result;
        }
    }

    public class DatabaseSingleColumnListResultModel<T> : IDatabaseResultModel
    {
        private List<T> m_rowList;

        public DatabaseSingleColumnListResultModel()
        {
            m_rowList = new List<T>();
        }

        public void update(System.Data.SqlClient.SqlDataReader reader)
        {
            while (reader.Read()) m_rowList.Add((T)reader.GetValue(0));
        }

        public List<T> getRowList()
        {
            return m_rowList;
        }
    }
}