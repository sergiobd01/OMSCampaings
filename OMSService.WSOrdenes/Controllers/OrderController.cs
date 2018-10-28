using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using OMSService.WSOrder.Business;

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
    }
}
