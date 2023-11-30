using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BarunnIntergrationService.Common.Utillity;

namespace BarunnIntergrationService.Common.Enum
{
    public enum SiteGroupType
    {
        [StringValue("SA")]
        BHANDSCARD = 1,
        [StringValue("B")]
        BHANDSCARD_JEHU,
        [StringValue("SB")]
        BARUNSONCARD,
        [StringValue("ST")]
        THECARD,
        [StringValue("SS")]
        PREMIERPAPER,
        [StringValue("H")]
        PREMIERPAPER_JEHU,
        [StringValue("CE")]
        CELEMO,
        //20210419 표수현 추가 
        [StringValue("BM")]
        BARUNSONMCARD
    }

    public class SiteGroupTypeUtility
    {
        public static SiteGroupType GetByString(String pValue)
        {
            SiteGroupType result = SiteGroupType.BHANDSCARD;
            try
            {
                result = (SiteGroupType)StringEnumUtility.Parse(result.GetType(), pValue);
            }
            catch
            { }
            return result;
        }

        public static String ToString(SiteGroupType pType)
        {
            return StringEnumUtility.GetStringValue(pType);
        }
    }

}