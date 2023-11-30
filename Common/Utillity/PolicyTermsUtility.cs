using BarunnIntergrationService.Common.Databases;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using static BarunnIntergrationService.Common.Databases.DBHelper;
using static BarunnIntergrationService.Common.Utillity.PolicyTermsUtility;

namespace BarunnIntergrationService.Common.Utillity
{
	public class PolicyTermsUtility
    {
        /// <summary>
        ///  약관 정잭 이전 내역 조회
        /// </summary>
        /// <param name="siteCode"></param>
        /// <param name="companySeq"></param>
        /// <param name="policyDiv"></param>
        /// <returns></returns>

		public static List<PoliyInfo> GetPolicyInfoHistoryList(string siteCode, string companySeq, string policyDiv)
        {
			ProcedureCallCommand cmd = null;
			DataSet ds = null;
			List<PoliyInfo> rst = new List<PoliyInfo>();
			string DBConnName = "ShopDB";

			try
			{
				//--모초이면 DB 변경
				if (siteCode == "BM")
				{
					DBConnName = "BarunsonDB";
				}

				cmd = GetDBPolicyInfoHistoryList(siteCode, companySeq, policyDiv);
				ds = DBHelper.ExecuteProcedure(cmd, DBConnName);

				DataTable dt = ds.Tables[0];
				for (int i = 0; i < dt.Rows.Count; i++)
				{
					rst.Add(new PoliyInfo() { 
						Seq = Convert.ToInt32(dt.Rows[i]["Seq"].ToString()),
                        StartDate = dt.Rows[i]["StartDate"].ToString(),
                        EndDate = dt.Rows[i]["EndDate"].ToString(),
                        Title = dt.Rows[i]["Title"].ToString()
                    });
				}

			}
			catch (Exception ex)
			{
				rst = null;
			}

			return rst;
		}

        /// <summary>
        /// 약관 정책 조회
        /// </summary>
        /// <param name="siteCode"></param>
        /// <param name="companySeq"></param>		
        /// <param name="policyDiv"></param>		
        /// <param name="policySeq"></param>		
        /// <returns></returns>
        public static PoliyInfo GetPolicyInfo(string siteCode, string companySeq, string policyDiv, int policySeq=0)
        {
            ProcedureCallCommand cmd = null;
            DataSet ds = null;
            PoliyInfo rst = null;
            string DBConnName = "ShopDB";

            try
            {
                //--모초이면 DB 변경
                if(siteCode=="BM")
                {
                    DBConnName = "BarunsonDB";
				}
                cmd = GetDBPolicyInfo(siteCode, companySeq, policyDiv, policySeq);
                ds = DBHelper.ExecuteProcedure(cmd, DBConnName);

                DataTable dt = ds.Tables[0];
                if(dt.Rows.Count>0) 
                {
                    rst=new PoliyInfo()
                    {                    
                        Title = dt.Rows[0]["Title"].ToString(),
                        Contents = dt.Rows[0]["Contents"].ToString()
                    };
                }
            }
            catch (Exception ex)
            {
                rst = null;
            }

            return rst;
        }


        /// <summary>
        /// 약관 정책 이전 내역 DB 조회
        /// </summary>
        /// <param name="siteCode"></param>
        /// <param name="companySeq"></param>		
        /// <param name="policyDiv"></param>	
        /// <returns></returns>
        private static ProcedureCallCommand GetDBPolicyInfoHistoryList(string siteCode, string companySeq, string policyDiv)
		{
            ProcedureCallCommand result = new ProcedureCallCommand("SP_POLICYINFO_HISTORY_LIST");
			result.addParameter("@SalesGubun", siteCode);
			result.addParameter("@CompanySeq", companySeq);
            result.addParameter("@PolicyDiv", policyDiv);
            result.addOutputParameter("@ErrNum", SqlDbType.Int, 4);
            result.addOutputParameter("@ErrSev", SqlDbType.Int, 4);
            result.addOutputParameter("@ErrState", SqlDbType.Int, 4);
            result.addOutputParameter("@ErrProc", SqlDbType.VarChar, 50);
            result.addOutputParameter("@ErrLine", SqlDbType.Int, 4);
            result.addOutputParameter("@ErrMsg", SqlDbType.VarChar, 2000);
            return result;
		}

        /// <summary>
        /// 약관 정책 DB 조회
        /// </summary>
        /// <param name="siteCode"></param>
        /// <param name="companySeq"></param>		
        /// <param name="policyDiv"></param>		
        /// <param name="policySeq"></param>		
        /// <returns></returns>

        private static ProcedureCallCommand GetDBPolicyInfo(string siteCode, string companySeq, string policyDiv, int policySeq=0)
        {
            ProcedureCallCommand result = new ProcedureCallCommand("SP_POLICYINFO_GET");
            result.addParameter("@SalesGubun", siteCode);
            result.addParameter("@CompanySeq", companySeq);
            result.addParameter("@PolicyDiv", policyDiv);
            result.addParameter("@Seq", policySeq);
            result.addOutputParameter("@ErrNum", SqlDbType.Int, 4);
            result.addOutputParameter("@ErrSev", SqlDbType.Int, 4);
            result.addOutputParameter("@ErrState", SqlDbType.Int, 4);
            result.addOutputParameter("@ErrProc", SqlDbType.VarChar, 50);
            result.addOutputParameter("@ErrLine", SqlDbType.Int, 4);
            result.addOutputParameter("@ErrMsg", SqlDbType.VarChar, 2000);
            return result;
        }

    }

	public class PoliyInfo
    { 
        public int Seq{ get; set; }
		public string StartDate { get; set; }
		public string EndDate { get; set; }
		public string Title { get; set; }
        public string Contents { get; set; }
    }
}
