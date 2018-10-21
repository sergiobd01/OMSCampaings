using System.Web.Http;
using OMSService.WSProduct.Business;
using OMSService.WSProduct.Payload;
using OMSService.WSProduct.Models;

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

        [HttpPost]
        [Route("GetTopProducts")]
        public IHttpActionResult GetTopProduct(TopRequest topRequest)
        {
            DALProduct dalbase = new DALProduct();
            var products = dalbase.GetTopProduct(topRequest.DateBegin, topRequest.DateEnd);

            return Ok(products);
        }

        [HttpPost]
        [Route("NewProduct")]
        public IHttpActionResult PostNewProduct(Product product)
        {
            IProducManager mprod = new IProducManager();
            var response = mprod.PostProductCreate(product);

            return Ok(response);
        }
        [HttpPost]
        [Route("UpdateProduct")]
        public IHttpActionResult PostUpdateProduct(Product product)
        {
            IProducManager mprod = new IProducManager();
            var response = mprod.PostProductUpdate(product);

            return Ok(response);
        }
    }
}
