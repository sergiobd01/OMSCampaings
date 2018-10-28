using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OMSService.WSProduct.Models;

namespace OMSService.WSProduct.Payload
{
    public class ResponseProduct
    {
        public int totalPaginas { get; set; }

        public List<Product> products { get; set; }
    }
}