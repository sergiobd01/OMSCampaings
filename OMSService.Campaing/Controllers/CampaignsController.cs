using System.Web.Http;
using OMSService.Campaing.Business;


namespace OMSService.Campaing.Controllers
{
    [Authorize]
    //[AllowAnonymous]
    [RoutePrefix("Campaign")]
    public class CampaignsController : ApiController
    {
        [HttpGet]
        [Route("GetCampins")]
        public IHttpActionResult GetAll()
        {
            ICampaingManager mca = new ICampaingManager();
            var campaing = mca.GetAllCampaing();

            return Ok(campaing);
        }
    }
}
