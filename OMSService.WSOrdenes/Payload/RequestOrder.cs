using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OMSService.WSOrder.Payload
{
    public class RequestOrder
    {
        public long IdOrder { get; set; }
        public int Page { get; set; }
    }
}