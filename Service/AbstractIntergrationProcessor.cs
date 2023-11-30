using BarunnIntergrationService.Common.Databases;
using System;

namespace BarunnIntergrationService.Service
{
    /// <summary>
    /// 통합 회원 관련 Processor - 추상클래스, 베이스
    /// </summary>
    public abstract class AbstractIntergrationProcessor
    {

        
        protected DBHelper m_shopConnector;
        protected Boolean m_initShopConnector;

        public void assignConnector(DBHelper pConnector)
        {
            m_shopConnector = pConnector;
        }

        public void beginTrans(Boolean pForce=false)
        {

            if (m_initShopConnector == false || pForce == true)
            {
                m_shopConnector.BeginTransaction();
            }
        }

        public void rollBack(Boolean pForce = false)
        {
            if (m_initShopConnector == false || pForce == true)
            {
                m_shopConnector.Rollback();
            }
        }

        public void commit(Boolean pForce = false)
        {
            if (m_initShopConnector == false || pForce == true)
            {
                m_shopConnector.Commit();
            }
        }

        protected void initConnector()
        {

            if (m_shopConnector == null)
            {
                m_shopConnector = ShopDatabaseFactory.createDBConnector();
                m_shopConnector.Connect("ShopDB");
                m_initShopConnector = true;
            }
        }

        protected void closeConnector()
        {
            if (m_initShopConnector) m_shopConnector.Close();
            m_shopConnector = null;
        }
    }
}