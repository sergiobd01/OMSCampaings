using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OMSService.Campaing.Models;

namespace OMSService.Campaing.Business
{
    public class ICampaingManager
    {

        public IList<Campaign> GetAllCampaing()
        {
            OMSModel model = new OMSModel();
            var campaing = model.Campaign.ToList();
            return campaing;
        }
    }
}