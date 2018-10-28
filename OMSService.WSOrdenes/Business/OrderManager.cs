using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OMSService.WSOrder.Models;

namespace OMSService.WSOrder.Business
{
    public class OrderManager
    {
        public Order GetOrderId(long IdOrder)
        {
            OMSModel objContext = new OMSModel();
            var Order = new Order();
            try
            {
                if(objContext.Order.Count(p => p.idOrder == IdOrder) > 0)
                {
                    Order = objContext.Order.First(p => p.idOrder == IdOrder);
                }
                
            }
            catch (Exception ext)
            {
                throw ext;
                
            }
            return Order;
        }
        public Order GetOrderIdProduc(long IdOrder)
        {
            OMSModel objContext = new OMSModel();
            var Order = new Order();
            //try
            //{
            //    if (objContext.Order.Count(p => p.idOrder == IdOrder) > 0)
            //    {
            //        Order = objContext.Order.wh(p => p.idOrder == IdOrder);
            //    }

            //}
            //catch (Exception ext)
            //{
            //    throw ext;

            //}
            return Order;
        }
    }
}