using System;
using BarunnIntergrationService.Common.Databases;
using static BarunnIntergrationService.Common.Databases.DBHelper;

namespace BarunnIntergrationService.Common.Utillity
{
    public class LogUtility
    {
        public static void LogWrite(String pDupInfo, String pID, String pStep, String pStepDesc)
        {
            DBHelper.ExecuteProcedure(InsertBarunnIntegrateUserChangeProgressLog(pDupInfo, pID, pStep, pStepDesc));
        }

        /// <summary>
        /// 통합회원 전환중 진행 상황에 대한 로그를 남긴다.
        /// </summary>
        /// <param name="pUserID"></param>
        /// <returns></returns>
        public static ProcedureCallCommand InsertBarunnIntegrateUserChangeProgressLog(String pDupInfo, String pID, String pStep, String pStepDesc)
        {
            ProcedureCallCommand result = new ProcedureCallCommand("SP_INSERT_BARUNN_INTEGRATE_USER_CHANGE_PROGRESS_LOG");
            result.addParameter("@P_DUPINFO", pDupInfo);
            result.addParameter("@P_ID", pID);
            result.addParameter("@P_STEP", pStep);
            result.addParameter("@P_STEP_DESC", pStepDesc);
            return result;
        }

    }
}
