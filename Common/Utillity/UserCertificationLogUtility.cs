using BarunnIntergrationService.Common.Databases;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using static BarunnIntergrationService.Common.Databases.DBHelper;

namespace BarunnIntergrationService.Common.Utillity
{
    public class UserCertificationLogUtility
    {

        public static string InsertUserCertificationLog(string certType, string dupInfo, string certData)
        {
			int errNum =0;
			string certID = string.Empty;
			ProcedureCallCommand cmd = null;
			DataSet ds = null;
			try
			{
				cmd = InsertDBUserCertificationLog(certType, dupInfo, certData);
				ds = DBHelper.ExecuteProcedure(cmd);

				errNum = Convert.ToInt32(cmd.getParameterByName("@ErrNum").Value);
				if (errNum != 0)
				{
					certID = "";
				}
				else
				{
					DataTable dt = ds.Tables[0];
					certID = dt.Rows[0]["CertID"].ToString();
				}
			}
			catch(Exception ex)
			{
				certID = "";
			}

			return certID;
		}

		public static UserCertificationLog GetUserCertificationLog(string certID)
		{
			int errNum = 0;
			string certData = string.Empty;
			ProcedureCallCommand cmd = null;
			DataSet ds = null;
			UserCertificationLog rst = null;
			try
			{
				cmd = GetDBUserCertificationLog(certID);
				ds = DBHelper.ExecuteProcedure(cmd);

				errNum = Convert.ToInt32(cmd.getParameterByName("@ErrNum").Value);
				if (errNum != 0)
				{
					certData = "";
				}
				else
				{
					DataTable dt = ds.Tables[0];
					rst = new UserCertificationLog()
					{
						CertType = dt.Rows[0]["CERTTYPE"].ToString(),
						CertData = dt.Rows[0]["CERTDATA"].ToString(),
						CertID = dt.Rows[0]["CERTID"].ToString(),
						DupInfo = dt.Rows[0]["DUPINFO"].ToString()
					};
				}
			}
			catch (Exception ex)
			{
				rst = null;
			}

			return rst;
		}

		public static void DeleteUserCertificationLog(string certID)
		{
			int errNum = 0;			
			ProcedureCallCommand cmd = null;
			DataSet ds = null;
			try
			{
				cmd = DeleteDBUserCertificationLog(certID);
				ds = DBHelper.ExecuteProcedure(cmd);

				errNum = Convert.ToInt32(cmd.getParameterByName("@ErrNum").Value);			
			}
			catch (Exception ex)
			{				
			}			
		}


		private static ProcedureCallCommand InsertDBUserCertificationLog(string certType, string dupInfo, string certData)
		{
			ProcedureCallCommand result = new ProcedureCallCommand("SP_USER_CERTIFICATION_LOG_INSERT");
			result.addParameter("@CertType", certType);
			result.addParameter("@DupInfo", dupInfo);
			result.addParameter("@CertData", certData);
			result.addOutputParameter("@ErrNum", SqlDbType.Int, 4);
			result.addOutputParameter("@ErrSev", SqlDbType.Int, 4);
			result.addOutputParameter("@ErrState", SqlDbType.Int, 4);
			result.addOutputParameter("@ErrProc", SqlDbType.VarChar, 50);
			result.addOutputParameter("@ErrLine", SqlDbType.Int, 4);
			result.addOutputParameter("@ErrMsg", SqlDbType.VarChar, 2000);			
			return result;
		}

		private static ProcedureCallCommand GetDBUserCertificationLog(string certID)
		{
			ProcedureCallCommand result = new ProcedureCallCommand("SP_USER_CERTIFICATION_LOG_GET");
			result.addParameter("@CertID", certID);			
			result.addOutputParameter("@ErrNum", SqlDbType.Int, 4);
			result.addOutputParameter("@ErrSev", SqlDbType.Int, 4);
			result.addOutputParameter("@ErrState", SqlDbType.Int, 4);
			result.addOutputParameter("@ErrProc", SqlDbType.VarChar, 50);
			result.addOutputParameter("@ErrLine", SqlDbType.Int, 4);
			result.addOutputParameter("@ErrMsg", SqlDbType.VarChar, 2000);
			return result;
		}

		private static ProcedureCallCommand DeleteDBUserCertificationLog(string certID)
		{
			ProcedureCallCommand result = new ProcedureCallCommand("SP_USER_CERTIFICATION_LOG_DELETE");
			result.addParameter("@CertID", certID);
			result.addOutputParameter("@ErrNum", SqlDbType.Int, 4);
			result.addOutputParameter("@ErrSev", SqlDbType.Int, 4);
			result.addOutputParameter("@ErrState", SqlDbType.Int, 4);
			result.addOutputParameter("@ErrProc", SqlDbType.VarChar, 50);
			result.addOutputParameter("@ErrLine", SqlDbType.Int, 4);
			result.addOutputParameter("@ErrMsg", SqlDbType.VarChar, 2000);
			return result;
		}

	}

	public class UserCertificationLog
	{
		public string CertType { get; set; }
		public string CertID { get; set; }
		public string DupInfo { get; set; }
		public string CertData { get; set; }
	}

}
