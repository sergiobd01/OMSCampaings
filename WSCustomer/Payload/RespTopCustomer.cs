using System.Collections.Generic;
using OMSService.WSCustomer.Models;

namespace OMSService.WSCustomer.Payload
{
    public class RespTopCustomer
    {
        public long idCustomer { get; set; }

        public string first_name { get; set; }

        public string last_name { get; set; }

        public decimal Acumulado { get; set; }

    }
}