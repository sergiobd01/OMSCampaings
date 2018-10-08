using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using OMSService.Campaing.Models;

namespace OMSService.Campaing.Controllers
{
    [Authorize]

    [RoutePrefix("api/Campaigns")]
    public class CampaignsController : ApiController
    {
        public IHttpActionResult GetAll()
        {
            OMSModel model = new OMSModel();
            var campaing = model.Campaign.ToList(); 
            return Ok(campaing);
        }
    }
}
