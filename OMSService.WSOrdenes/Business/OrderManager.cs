using System;
using System.Linq;
using OMSService.WSOrder.Models;
using OMSService.WSOrder.Payload;

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
        public Order OrderCancel(long IdOrder)
        {
            var response = new Response();
            OMSModel objContext = new OMSModel();
            var Order = new Order();
            try
            {
                var order = objContext.Order.Where(p => p.idOrder == IdOrder).SingleOrDefault();
                if (order != null)
                {
                    order.idStateOrder = 5;
                    objContext.Entry(order).CurrentValues.SetValues(order);
                    var res = objContext.SaveChanges();

                    response.Code = res;
                    response.Description = "Orden Cancelada";
                }

            }
            catch (Exception ext)
            {
                throw ext;
            }
            return Order;
        }
    }
}