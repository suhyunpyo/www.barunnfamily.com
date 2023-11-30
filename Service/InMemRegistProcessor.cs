using BarunnIntergrationService.Common.Databases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BarunnIntergrationService.Service
{
    /// <summary>
    /// 회원가입시 쿠폰 발급 프로세서
    /// </summary>
    public class InMemRegistGiftProcessor : AbstractIntergrationProcessor
    {
        public void InsertMemRegistGift(string companySeq, string userId, string giftCardSeq)
        {
            initConnector();
            beginTrans();
            try
            {
                m_shopConnector.Execute(ShopDatabaseFactory.InsertMemRegistGift_V2(companySeq, userId, giftCardSeq));
                commit();
            }
            catch (Exception ex)
            {
                Console.Write(ex);
                rollBack();
            }

            closeConnector();
        }

    }

}