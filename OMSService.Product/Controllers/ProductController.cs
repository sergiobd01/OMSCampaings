using System.Web.Http;
using OMSService.WSProduct.Business;

namespace OMSService.WSProduct.Controllers
{
    [Authorize]
    //[AllowAnonymous]
    [RoutePrefix("Product")]
    public class ProductController : ApiController
    {
        [HttpGet]
        [Route("GetProducts")]
        public IHttpActionResult GetAll()
        {
            IProducManager mprod = new IProducManager();
            var products = mprod.GetAllProduct();

            return Ok(products);
        }

        [HttpGet]
        [Route("GetId")]
        public IHttpActionResult GetProductId(long Id)
        {
            IProducManager mprod = new IProducManager();
            var products = mprod.GetProductId(Id);

            return Ok(products);
        }

        [HttpGet]
        [Route("GetProducts")]
        public IHttpActionResult GetProductName(string name)
        {
            IProducManager mprod = new IProducManager();
            var products = mprod.GetProductName(name);

            return Ok(products);
        }

        [HttpGet]
        [Route("GetProducts")]
        public IHttpActionResult GetProductDescription(string description)
        {
            IProducManager mprod = new IProducManager();
            var products = mprod.GetProductDescription(description);

            return Ok(products);
        }

        /*[HttpGet]
        [Route("GetProducts")]
        public IHttpActionResult GetTopProduct(TopRequest topRequest)
        {
            IProducManager mprod = new IProducManager();
            var products = mprod.GetTopProduct(topRequest.FechaInicio, topRequest.FechaFin);

            return Ok(products);
        }*/
    }
}
