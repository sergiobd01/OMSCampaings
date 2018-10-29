using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OMSService.WSOrder.Payload
{
    public class ResponseOrderClosed
    {
        public string Periodo { get; set; }

        public int Cantidad { get; set; }

        public decimal Facturado { get; set; }
    }
}