using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BarunnIntergrationService.Common.Databases
{
    /// <summary>
    /// 단일 ResultRow에 대한 ResultModel 처리 Collection
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class DatabaseSingleRowCollection<T> : IDatabaseResultModel where T : IDatabaseRow, new()
    {
        protected T m_row;

        public DatabaseSingleRowCollection()
        {
            m_row = new T();
        }

        public void update(SqlDataReader pReader)
        {
            pReader.Read();
            m_row.update(pReader);
        }

        public T getRow()
        {
            return m_row;
        }
    }
}