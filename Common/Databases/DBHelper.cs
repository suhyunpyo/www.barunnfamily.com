using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;

namespace BarunnIntergrationService.Common.Databases
{
    public class DBHelper
    {
        private SqlConnection conn = null;
        private SqlTransaction tr = null;
        private DateTime createTime = DateTime.Now;
        private string ConnectionString = "";
        private bool SessionStarted = false;

        public DBHelper()
        {   
        }

        void conn_StateChange(object sender, StateChangeEventArgs e)
        {
            if (e.CurrentState == ConnectionState.Closed)
            {
                conn = null;
                tr = null;
                SessionStarted = false;
            }
        }
        
        public void Connect(string connectString= "ShopDB")
        {
            this.ConnectionString = ConfigurationManager.ConnectionStrings[connectString].ConnectionString;
        }
        public SqlConnection Connection
        {
            get { return conn; }
        }

        public SqlTransaction Transaction
        {
            get { return tr; }
        }

        private void PrivateConnect(string connectString = "ShopDB")
        {
            if (SessionStarted) return;
            if (conn == null || conn.State == ConnectionState.Closed)
            {
                Connect(connectString);
                conn = new SqlConnection(this.ConnectionString);
                conn.StateChange += new StateChangeEventHandler(conn_StateChange);
                conn.Open();
                tr = null;
            }
        }
        public void Close()
        {
            this.PrivateClose();
        }
        private void PrivateClose()
        {
            if (SessionStarted) return;
            if (conn != null)
            {
                if (tr == null || tr.Connection == null)
                {
                    try
                    {
                        conn.Close();
                    }
                    catch
                    {
                    }
                    conn = null;
                    tr = null;
                }
            }
        }

        public void StartSession()
        {
            SessionStarted = true;
            if (conn == null || conn.State == ConnectionState.Closed)
            {
                conn = new SqlConnection(this.ConnectionString);
                conn.StateChange += new StateChangeEventHandler(conn_StateChange);
                conn.Open();
            }
        }

        public void EndSession()
        {
            SessionStarted = false;
            if (conn != null && conn.State != ConnectionState.Closed && tr == null)
            {
                try
                {
                    conn.Close();
                }
                catch
                {
                }
                conn = null;
                tr = null;
            }
        }

        public void BeginTransaction()
        {
            PrivateConnect();
            tr = conn.BeginTransaction();
        }

        public void ClearTransaction()
        {
            tr.Dispose();
            tr = null;
            PrivateClose();
        }

        public void Rollback()
        {
            tr.Rollback();
            ClearTransaction();
        }

        public void Commit()
        {
            tr.Commit();
            ClearTransaction();
        }

        public DataRow GetDataRow(string query)
        {
            DataSet ds;
            DataRow row;
            try
            {
                ds = GetDataSet(query);
                row = ds.Tables[0].Rows[0];
            }
            catch (Exception ex)
            {
                return null;
            }
            return row;
        }


        public DataSet GetDataSet(string query)
        {
            PrivateConnect();
            SqlCommand cmd = new SqlCommand(query, conn);
            if (tr != null)
            {
                cmd.Transaction = tr;
            }
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            PrivateClose();

            return ds;
        }

        public DataRowCollection GetDataRows(string query)
        {
            DataSet ds;
            DataRowCollection dc;
            try
            {
                ds = GetDataSet(query);
                dc = ds.Tables[0].Rows;
            }
            catch (Exception ex)
            {
                return null;
            }
            return dc;
        }

        public int GetOneInt(string query)
        {
            try
            {
                return (int)GetOne(query);
            }
            catch (Exception ex)
            {
                return 0;
            }
        }

        public string GetOneString(string query)
        {
            try
            {
                return (string)GetOne(query);
            }
            catch (Exception ex)
            {
                return "";
            }
        }

        public object GetOne(string query)
        {
            PrivateConnect();
            SqlCommand cmd = new SqlCommand(query, conn);
            object result = null;
            if (tr != null)
            {
                cmd.Transaction = tr;
            }
            result = cmd.ExecuteScalar();
            PrivateClose();
            return result;
        }

        public int Execute(string query)
        {
            PrivateConnect();
            SqlCommand cmd = new SqlCommand(query, conn);
            if (tr != null)
            {
                cmd.Transaction = tr;
            }
            int nResult = cmd.ExecuteNonQuery();
            PrivateClose();
            return nResult;
        }
        public int Execute(ProcedureCallCommand pcc)
        {
            PrivateConnect();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = pcc.ProcedureName;
            if (tr != null) cmd.Transaction = tr;

            cmd.Parameters.AddRange(pcc.getParameterList().ToArray());
            if (tr != null)
            {
                cmd.Transaction = tr;
            }
            int nResult = cmd.ExecuteNonQuery();
            PrivateClose();
            return nResult;
        }
        public void Execute(ProcedureCallCommand pcc, IDatabaseResultModel resultModel)
        {
            PrivateConnect();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = conn;
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.CommandText = pcc.ProcedureName;
            if (tr != null) cmd.Transaction = tr;

            cmd.Parameters.AddRange(pcc.getParameterList().ToArray());
            if (tr != null)
            {
                cmd.Transaction = tr;
            }

            SqlDataReader reader = cmd.ExecuteReader();
            resultModel.update(reader);

            PrivateClose();
            
        }
        public static DataSet ExecuteProcedure(ProcedureCallCommand pcc, string connString = "ShopDB")
        {
            DataSet ds = null;
            try
            {
                DBHelper DB = new DBHelper();
                DB.Connect(connString);
                ds = DB.ExecuteProcedureDataSet(pcc, connString);
            }
            catch (Exception ex)
            {
                ds = null;
            }
            return ds;
        }		

		public static DataSet ExecuteQuery(string Query, string connectString = "ShopDB")

		{
            DataSet ds = null;
            try
            {
                DBHelper DB = new DBHelper();
                DB.Connect(connectString);
                ds = DB.GetDataSet(Query);
            }
            catch (Exception ex)
            {
                ds = null;
            }
            return ds;
        }

        public object ExecuteProcedureScalar(string ProcName, List<ProcedureParam> Parameters)
        {
            PrivateConnect();
            SqlCommand cmd = new SqlCommand(ProcName, conn);
            object result = null;
            if (tr != null)
            {
                cmd.Transaction = tr;
            }

            cmd.CommandType = CommandType.StoredProcedure;

            foreach (ProcedureParam Param in Parameters)
            {
                cmd.Parameters.Add(Param.SqlParameter);
            }
            result = cmd.ExecuteScalar();
            PrivateClose();

            return result;
        }

        public int ExecuteProcedure(string ProcName, ProcedureParam Parameters)
        {
            List<ProcedureParam> ProcedureParamList = new List<ProcedureParam>();
            ProcedureParamList.Add(Parameters);
            return ExecuteProcedure(ProcName, ProcedureParamList);
        }
        public int ExecuteProcedure(string ProcName, List<ProcedureParam> Parameters)
        {
            PrivateConnect();
            SqlCommand cmd = new SqlCommand(ProcName, conn);
            if (tr != null)
            {
                cmd.Transaction = tr;
            }

            cmd.CommandType = CommandType.StoredProcedure;

            foreach (ProcedureParam Param in Parameters)
            {
                cmd.Parameters.Add(Param.SqlParameter);
            }
            int nResult = cmd.ExecuteNonQuery();
            PrivateClose();

            return nResult;
        }

        public SqlDataReader ExecuteProcedureReader(string ProcName, List<ProcedureParam> Parameters)
        {
            PrivateConnect();
            SqlCommand cmd = new SqlCommand(ProcName, conn);
            if (tr != null)
            {
                cmd.Transaction = tr;
            }

            cmd.CommandType = CommandType.StoredProcedure;

            foreach (ProcedureParam Param in Parameters)
            {
                cmd.Parameters.Add(Param.SqlParameter);
            }
            SqlDataReader sdr = cmd.ExecuteReader();

            //PrivateClose();

            return sdr;
        }

        public DataSet ExecuteProcedureDataSet(string ProcName, ProcedureParam Parameters)
        {
            List<ProcedureParam> ProcedureParamList = new List<ProcedureParam>();
            ProcedureParamList.Add(Parameters);
            return ExecuteProcedureDataSet(ProcName, ProcedureParamList);
        }

        public DataSet ExecuteProcedureDataSet(string ProcName, List<ProcedureParam> ProcedureParamList = null)
        {
            PrivateConnect();
            SqlCommand cmd = new SqlCommand(ProcName, conn);
            if (tr != null)
            {
                cmd.Transaction = tr;
            }

            cmd.CommandType = CommandType.StoredProcedure;

            if (ProcedureParamList != null)
            {
                foreach (ProcedureParam Param in ProcedureParamList)
                {
                    cmd.Parameters.Add(Param.SqlParameter);
                }
            }

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds);
            PrivateClose();

            return ds;
        }

        public DataSet ExecuteProcedureDataSet(ProcedureCallCommand procedureCmd, string connString="ShopDB")
        {
            PrivateConnect(connString);

            SqlCommand command = new SqlCommand();
            command.Connection = conn;
            command.CommandType = System.Data.CommandType.StoredProcedure;
            command.CommandText = procedureCmd.ProcedureName;
            if (tr != null) command.Transaction = tr;

            command.Parameters.AddRange(procedureCmd.getParameterList().ToArray());

            SqlDataAdapter da = new SqlDataAdapter(command);
            DataSet ds = new DataSet();
            da.Fill(ds);
            PrivateClose();

            return ds;
        }
        
    }


    public class ProcedureParam
    {
        public SqlParameter SqlParameter = null;

        public ProcedureParam(string Name, object Value)
        {
            SqlParameter = new SqlParameter(Name, Value);
        }
        public ProcedureParam(string Name, object Value, SqlDbType DbType)
        {
            SqlParameter = new SqlParameter(Name, Value);
            SqlParameter.SqlDbType = DbType;
        }
        public ProcedureParam(string Name, object Value, SqlDbType DbType, int size)
        {
            SqlParameter = new SqlParameter(Name, Value);
            SqlParameter.SqlDbType = DbType;
            SqlParameter.Size = size;
        }
        public ProcedureParam(string Name, object Value, SqlDbType DbType, bool isNullable)
        {
            SqlParameter = new SqlParameter(Name, Value);
            SqlParameter.SqlDbType = DbType;
            SqlParameter.IsNullable = isNullable;
        }
        public ProcedureParam(string Name, object Value, SqlDbType DbType, int size, ParameterDirection Direction, bool isNullable)
        {
            SqlParameter = new SqlParameter(Name, Value);
            SqlParameter.SqlDbType = DbType;
            SqlParameter.Size = size;
            SqlParameter.Precision = 0;
            SqlParameter.Scale = 0;
            SqlParameter.IsNullable = isNullable;
            SqlParameter.Direction = Direction;
        }
        public ProcedureParam(string Name, object Value, SqlDbType DbType, int size, ParameterDirection Direction, bool isNullable, byte precision, byte scale)
        {
            SqlParameter = new SqlParameter(Name, Value);
            SqlParameter.SqlDbType = DbType;
            SqlParameter.Size = size;
            SqlParameter.Precision = precision;
            SqlParameter.Scale = scale;
            SqlParameter.IsNullable = isNullable;
            SqlParameter.Direction = Direction;
        }

        public ProcedureParam(string Name, SqlDbType DbType, ParameterDirection Direction)
        {
            SqlParameter = new SqlParameter();
            SqlParameter.ParameterName = Name;
            SqlParameter.SqlDbType = DbType;
            SqlParameter.Direction = Direction;
        }
        public ProcedureParam(string Name, SqlDbType DbType, int size, ParameterDirection Direction)
        {
            SqlParameter = new SqlParameter();
            SqlParameter.ParameterName = Name;
            SqlParameter.SqlDbType = DbType;
            SqlParameter.Size = size;
            SqlParameter.Direction = Direction;
        }
    }

    /// <summary>
    /// 프로시져 호출을 위한 커맨더 객체를 생성한다.
    /// </summary>
    public class ProcedureCallCommand
    {
        private String m_proceduerName;

        private List<SqlParameter> m_parameterList;

        public ProcedureCallCommand(String procedureName)
        {
            m_proceduerName = procedureName;
            m_parameterList = new List<SqlParameter>();
        }

        /// <summary>
        /// Procedure 호출시에 사용될 파라미터를 등록한다.
        /// </summary>
        /// <param name="parameterName"></param>
        /// <param name="value"></param>
        public void addParameter(String parameterName, object value)
        {
            if (existParameterByName(parameterName)) return;
            SqlParameter param = new SqlParameter(parameterName, value);
            m_parameterList.Add(param);
        }

        public void addParameter(String parameterName, object value, bool isNullable)
        {
            if (existParameterByName(parameterName)) return;
            SqlParameter param = new SqlParameter(parameterName, value);
            if (isNullable) param.IsNullable = isNullable;
            m_parameterList.Add(param);
        }

        public void addParameter(String parameterName, object value, SqlDbType sqlDbType, bool isNullable = true)
        {
            if (existParameterByName(parameterName)) return;
            SqlParameter param = new SqlParameter(parameterName, value);
            param.SqlDbType = sqlDbType;
            if (isNullable) param.IsNullable = isNullable;
            m_parameterList.Add(param);
        }

        public SqlParameter addOutputParameter(String parameterName, SqlDbType pType, int pSize)
        {
            SqlParameter result = new SqlParameter();
            result.ParameterName = parameterName;
            result.SqlDbType = pType;
            result.Size = pSize;
            result.Direction = ParameterDirection.Output;
            m_parameterList.Add(result);
            return result;
        }

        /// <summary>
        /// 등록된 Parameter중 메게변수로 전달되는 이름과 동일한 파라미터가 존재하는지를 반환한다.
        /// </summary>
        /// <param name="parameterName"></param>
        /// <returns></returns>
        public Boolean existParameterByName(String parameterName)
        {
            Boolean result = false;

            foreach (SqlParameter param in m_parameterList)
            {
                if (result) break;
                if (param.ParameterName == parameterName) result = true;
            }
            return result;
        }

        public SqlParameter getParameterByName(String parameterName)
        {
            SqlParameter result = null;
            foreach (SqlParameter param in m_parameterList)
            {
                if (result != null) break;
                if (param.ParameterName == parameterName) result = param;
            }
            return result;
        }


        public List<SqlParameter> getParameterList()
        {
            return m_parameterList.ToList<SqlParameter>();
        }

        public String ProcedureName
        {
            get
            {
                return m_proceduerName;
            }
        }
    }
}