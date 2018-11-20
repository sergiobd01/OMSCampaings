using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using OMSService.WSOrder.Business;
using OMSService.WSOrder.Payload;

namespace OMSService.WSOrder.Controllers
{
    [AllowAnonymous]
    [RoutePrefix("Order")]
    public class OrderController : ApiController
    {
        [HttpGet]
        [Route("GetId")]
        public IHttpActionResult GetOrderId(long Id)
        {
            OrderManager mord = new OrderManager();
            var order = mord.GetOrderId(Id);
            return Ok(order);
        }

        [HttpPost]
        [Route("GetOrderProduc")]
        public IHttpActionResult GetOrderProduct(RequestOrder requestOrder)
        {
            DALOrder mord = new DALOrder();
            var order = mord.GetOrderProduct(requestOrder.IdOrder, requestOrder.Page);
            return Ok(order);
        }

        [HttpPost]
        [Route("GetOrderOpen")]
        public IHttpActionResult GetOrderOen(RequestOrder requestOrder)
        {
            DALOrder mord = new DALOrder();
            var order = mord.GetOrderOpen(requestOrder.Page);
            return Ok(order);
        }

        [HttpGet]
        [Route("GetOrderClosed")]
        public IHttpActionResult GetOrderClosed()
        {
            DALOrder mord = new DALOrder();
            var order = mord.GetOrderClosed();
            return Ok(order);
        }

        [HttpGet]
        [Route("GetOrderCancel")]
        public IHttpActionResult OrderCancel(long Id)
        {
            OrderManager mord = new OrderManager();
            var order = mord.OrderCancel(Id);
            return Ok(order);
        }
    }
}
