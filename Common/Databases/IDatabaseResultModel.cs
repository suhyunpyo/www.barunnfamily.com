using System.Data.SqlClient;

namespace BarunnIntergrationService.Common.Databases
{
    /// <summary>
    /// Database 연동후 반환값을 전달받는 객체에 대한 인터페이스
    /// </summary>
    public interface IDatabaseResultModel
    {
        /// <summary>
        /// SqlDataReader로 반환값을 갱신한다.
        /// </summary>
        /// <param name="reader"></param>
        void update(SqlDataReader reader);
    }

    /// <summary>
    /// Collection Type 의 Result Model 에서 자식 Row 개체 형식
    /// </summary>
    public interface IDatabaseRow
    {
        void update(SqlDataReader pReader);
    }
}