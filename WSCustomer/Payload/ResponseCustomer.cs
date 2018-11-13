using System.Collections.Generic;
using OMSService.WSCustomer.Models;

namespace OMSService.WSCustomer.Payload
{
    public class ResponseCustomer
    {
        public int totalPaginas { get; set; }

        public List<Customer> customers { get; set; }
    }
}