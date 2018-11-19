using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OMSService.WSCustomer.Payload
{
    public class RespCustomerProduct
    {
        public long idCustomer { get; set; }

        public string email { get; set; }

        public string first_name { get; set; }

        public string last_name { get; set; }

        public long idProduct { get; set; }

        public string name { get; set; }
    }
}