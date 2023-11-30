using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Web;

namespace BarunnIntergrationService.Common.Databases
{

    /// <summary>
    /// RESULT 형태가 'SELECT * FROM TABLE A', 'SELECT * FROM TABLE B', 'SELECT * FROM TABLE C' 와 같이
    /// 서로 다른 형태의 결과물이 여러개의 튜블로 구성된 형태의 Result 를 처리한다.
    /// 
    /// 
    /// TODO :
    /// #ISSUE 1 - 중복된 IDatabaseRow 가 발생될 경우에 대한 대비
    /// #ISSUE 2 - getResult 에 대하여 Type Cast 하지 않고 사용하는 방안에 대해서 연구 필요.
    /// </summary>
    public class DatabaseMultipleResultRowCollection : IDatabaseResultModel
    {
        private List<IDatabaseResultModel> m_resultModelList;

        public DatabaseMultipleResultRowCollection()
        {
            m_resultModelList = new List<IDatabaseResultModel>();
        }

        /// <summary>
        /// TODO : Generic Type 을 Multiple 로 전달받아, 생성 하는 방안에 대한 모색
        /// </summary>
        /// <param name="pResultModelList"></param>
        public DatabaseMultipleResultRowCollection(List<IDatabaseResultModel> pResultModelList)
            : base()
        {
            m_resultModelList = pResultModelList;
        }



        public void update(SqlDataReader reader)
        {
            int que = 0;
            while (reader.HasRows)
            {
                m_resultModelList[que].update(reader);
                reader.NextResult();
                que++;
            }
        }
                

        public List<IDatabaseResultModel> getResultModelList()
        {
            return m_resultModelList;
        }


        public IDatabaseResultModel getResultModel<T>() where T : IDatabaseRow
        {
            IDatabaseResultModel result = null;
            foreach (IDatabaseResultModel resultModel in m_resultModelList)
            {
                if (result != null) break;
                if (resultModel.GetType().GetGenericArguments().Contains(typeof(T)) == true) result = resultModel;
            }
            return result;
        }

        public IDatabaseResultModel getResultModel(Type pType)
        {
            IDatabaseResultModel result = null;
            foreach (IDatabaseResultModel resultModel in m_resultModelList)
            {
                if (result != null) break;
                if (resultModel.GetType().GetGenericArguments().Contains(pType) == true) result = resultModel;
            }
            return result;
        }


        #region TODO
        /// <summary>
        /// 해당하는 IDatabaseRow 를 삽입한다.
        /// </summary>
        /// <typeparam name="T"></typeparam>
        //public void push<T>() where T:IDatabaseRow
        //{
        //    Type pGenericType = typeof(T);

        //    Type rowCollectionType = typeof(DatabaseRowCollection<>);
        //    var consturctType = rowCollectionType.MakeGenericType(pGenericType);
        //    var instance = Activator.CreateInstance(consturctType);
        //    m_resultModelList.Add((IDatabaseRowCollection<IDatabaseRow>)Activator.CreateInstance(consturctType));
        //}

        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T"></typeparam>
        //public void remove<T>() where T : IDatabaseRow
        //{
        //    List<IDatabaseResultModel> copyList = new List<IDatabaseResultModel>();
        //    foreach (IDatabaseResultModel resultModel in m_resultModelList)
        //    {
        //        if (resultModel.GetType().GetGenericArguments().Contains(typeof(T)) == false) copyList.Add(resultModel);
        //    }
        //    m_resultModelList = copyList;
        //}

        #endregion

    }


    /// <summary>
    /// RESULT 형태가 'SELECT * FROM TABLE A', 'SELECT * FROM TABLE A', 'SELECT * FROM TABLE A', 'SELECT * FROM TABLE A'
    /// 과 같이, 
    /// 동일한 형태의 결과물(Table A)이 여러개의 튜블로 구성된 형태의 Result 를 처리한다.
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class DatabaseSegmentalizedResultRowCollection<T> : IDatabaseResultModel, IDatabaseRowCollection<T> where T : IDatabaseRow, new()
    {
        protected List<T> m_rowList;

        public DatabaseSegmentalizedResultRowCollection()
        {
            m_rowList = new List<T>();
        }

        public void update(SqlDataReader reader)
        {
            while (reader.HasRows)
            {
                while (reader.Read())
                {
                    T row = new T();
                    row.update(reader);
                    m_rowList.Add(row);
                }
                reader.NextResult();
            }
        }

        public List<T> getRowList()
        {
            return m_rowList;
        }
    }

    /// <summary>
    /// RESULT 형태가 'SELECT * FROM TABLE '
    /// 과 같이, 한개의 결과가 여러개의 튜블로 구성된 형태의 Result 를 처리한다.
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class DatabaseRowCollection<T> : IDatabaseResultModel, IDatabaseRowCollection<T> where T : IDatabaseRow
    {
        protected List<T> m_rowList;

        public DatabaseRowCollection()
        {
            m_rowList = new List<T>();
        }

        public void update(SqlDataReader reader)
        {
            while (reader.Read())
            {

                T row = (T)Activator.CreateInstance(typeof(T));
                row.update(reader);
                m_rowList.Add(row);
            }
        }

        public List<T> getRowList()
        {
            return m_rowList;
        }
    }




    public interface IDatabaseRowCollection<T> : IDatabaseResultModel where T : IDatabaseRow
    {
        List<T> getRowList();
    }


}