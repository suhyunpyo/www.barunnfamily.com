using BarunnIntergrationService.Common.Databases;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using static BarunnIntergrationService.Common.Databases.DBHelper;
using static BarunnIntergrationService.Common.Utillity.MDChoiceBannerUtility;

namespace BarunnIntergrationService.Common.Utillity
{
	public class MDChoiceBannerUtility
	{

		public static List<BannerImage> GetMDChoiceBannerImages(int mdSeq, string viewDiv = "Y")
		{
			ProcedureCallCommand cmd = null;
			DataSet ds = null;
			List<BannerImage> rst = new List<BannerImage>();
			try
			{
				cmd = GetDBMDChoiceBanner(mdSeq, viewDiv);
				ds = DBHelper.ExecuteProcedure(cmd);

				DataTable dt = ds.Tables[0];
				for (int i = 0; i < dt.Rows.Count; i++)
				{
					rst.Add(new BannerImage() { 
						imagePath = dt.Rows[i]["IMGFILE_PATH"].ToString(),
						linkUrl = dt.Rows[i]["LINK_URL"].ToString(),
						linkTarget = dt.Rows[i]["LINK_TARGET"].ToString(),
						mdTitle = dt.Rows[i]["MD_TITLE"].ToString(),
						mdContent = dt.Rows[i]["MD_CONTENT"].ToString()
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
		/// 배너 정보 조회
		/// </summary>
		/// <param name="mdSeq"></param>
		/// <param name="viewDiv"></param>		
		/// <returns></returns>
		public static ProcedureCallCommand GetDBMDChoiceBanner(int mdSeq, string viewDiv)
		{
			ProcedureCallCommand result = new ProcedureCallCommand("SP_SELECT_S4_MD_CHOICE_BANNER");
			result.addParameter("@MD_SEQ", mdSeq);
			result.addParameter("@VIEW_DIV", viewDiv);
			return result;
		}
		
	}

	public class BannerImage
	{
		public string imagePath { get; set; }
		public string linkUrl { get; set; }
		public string linkTarget { get; set; }
		public string mdTitle { get; set; }
		public string mdContent { get; set; }

	}

}
