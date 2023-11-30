using BarunnIntergrationService.Common.Utillity;
using System;
using System.Data.SqlClient;

namespace BarunnIntergrationService.Common.Databases
{
    public class DataReaderUtillity
    {
        public static double GetDouble(SqlDataReader pReader, String pColumnName, double pNullValue = 0)
        {
            double result = pNullValue;

            try
            {
                int cellIndex = GetCellIndex(pReader, pColumnName);
                if (pReader.IsDBNull(cellIndex) == false) result = CastingUtillity.ParseToDouble(pReader.GetValue(cellIndex).ToString());
            }
            catch
            {

            }

            return result;
        }

        public static float GetFloat(SqlDataReader pReader, String pColumnName, float pNullValue = 0)
        {
            float result = pNullValue;
            try
            {
                int cellIndex = GetCellIndex(pReader, pColumnName);
                if (pReader.IsDBNull(cellIndex) == false) result = CastingUtillity.ParseToFloat(pReader.GetValue(cellIndex).ToString());
            }
            catch { }

            return result;
        }

        public static int GetInt(SqlDataReader pReader, String pColumnName, int pNullValue = 0)
        {
            int result = pNullValue;

            try
            {
                int cellIndex = GetCellIndex(pReader, pColumnName);
                if (pReader.IsDBNull(cellIndex) == false) result = pReader.GetInt32(cellIndex);
            }
            catch { }

            return result;
        }

        public static String GetString(SqlDataReader pReader, String pColumnName, String pNullValue = null)
        {
            String result = pNullValue;
            try
            {
                //int cellIndex = pReader.GetOrdinal(pColumnName);
                int cellIndex = GetCellIndex(pReader, pColumnName);
                if (cellIndex != -1 && pReader.IsDBNull(cellIndex) == false) result = pReader.GetString(cellIndex);
            }
            catch { }
            return result;
        }

        public static DateTime GetDateTime(SqlDataReader pReader, String pColumnName, DateTime pNullValue)
        {
            DateTime result = pNullValue;
            try
            {
                int cellIndex = GetCellIndex(pReader, pColumnName);
                if (pReader.IsDBNull(cellIndex) == false) result = pReader.GetDateTime(cellIndex);
            }
            catch { }
            return result;
        }

        /// <summary>
        /// 해당 튜블이 존재하는지를 반환한다.
        /// TODO : SqlDataReader의 ObjectID 값을 토대로, CellIndex 검사 결과값을 Cash 관리 하도록 변경 요망.
        /// </summary>
        /// <param name="pReader"></param>
        /// <param name="pColumnName"></param>
        /// <returns></returns>
        public static int GetCellIndex(SqlDataReader pReader, String pColumnName)
        {
            int result = -1;

            #region Legacy
            //int cellIndex = pReader.GetOrdinal(pColumnName);
            #endregion

            for (int index = 0; index < pReader.FieldCount && result == -1; index++)
            {
                if (pReader.GetName(index) == pColumnName) result = index;
            }
            return result;
        }

    }
}