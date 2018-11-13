using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OMSService.WSCampaign.Models;

namespace OMSService.WSCampaign.Payload
{
    public class ResponseCampaign
    {
         public int totalPaginas { get; set; }

        public List<Campaign> campaigns { get; set; }
    }
}