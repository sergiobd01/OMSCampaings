using System.Web.Http;
using OMSService.WSCampaign.Business;
using OMSService.WSCampaign.Payload;
using OMSService.WSCampaign.Models;


namespace OMSService.WSCampaign.Controllers
{
    [Authorize]
    //[AllowAnonymous]
    [RoutePrefix("Campaign")]
    public class CampaignsController : ApiController
    {
        [HttpGet]
        [Route("GetCampaign/{page}")]
        public IHttpActionResult GetAll(int page)
        {
            ICampaingManager mprod = new ICampaingManager();
            DALCampaing dalCampign = new DALCampaing();

            var responseCampaign = new ResponseCampaign();
            responseCampaign.totalPaginas = mprod.Pagination();

            responseCampaign.campaigns = dalCampign.GetCampaings(page);

            return Ok(responseCampaign);
        }

        [HttpGet]
        [Route("GetId")]
        public IHttpActionResult GetCampaignId(long Id)
        {
            ICampaingManager mprod = new ICampaingManager();
            var campaign = mprod.GetCampaignId(Id);

            return Ok(campaign);
        }

        [HttpPost]
        [Route("NewCampaign")]
        public IHttpActionResult PostNewCampaign(Campaign campaign)
        {
            ICampaingManager mprod = new ICampaingManager();
            var response = mprod.PostCampaignCreate(campaign);

            return Ok(response);
        }

        [HttpPost]
        [Route("UpdateCampaign")]
        public IHttpActionResult PostCampaignUpdate(Campaign campaign)
        {
            ICampaingManager mprod = new ICampaingManager();
            var response = mprod.PostCampaignUpdate(campaign);

            return Ok(response);
        }

        [HttpDelete]
        [Route("DeleteCampaign")]
        public IHttpActionResult DeleteCampaign(long Id)
        {
            ICampaingManager mprod = new ICampaingManager();
            var response = mprod.DeleteCampaign(Id);

            return Ok(response);
        }
    }
}
