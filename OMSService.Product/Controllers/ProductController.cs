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
        //[HttpGet]
        //[Route("GetProducts")]
        //public IHttpActionResult GetAll()
        //{
        //    IProducManager mprod = new IProducManager();

        //    var responseProducs = new ResponseProduct();
        //    responseProducs.totalPaginas = mprod.Pagination();

        //    responseProducs.products = mprod.GetAllProduct();

        //    return Ok(responseProducs);
        //}

        [HttpGet]
        [Route("GetProducts/{page}")]
        public IHttpActionResult GetAll(int page)
        {
            IProducManager mprod = new IProducManager();
            DALProduct dalProduct = new DALProduct();

            var responseProducs = new ResponseProduct();
            responseProducs.totalPaginas = mprod.Pagination();

            responseProducs.products = dalProduct.GetProducts(page);

            return Ok(responseProducs);
        }

        [HttpGet]
        [Route("GetId")]
        public IHttpActionResult GetProductId(long Id)
        {
            IProducManager mprod = new IProducManager();
            var products = mprod.GetProductId(Id);

            return Ok(products);
        }

        [HttpPost]
        [Route("GetName")]
        public IHttpActionResult GetProductName(RequestValue requestValue)
        {
            DALProduct mprod = new DALProduct();
            var products = mprod.GetProductName(requestValue.Value, requestValue.Page);

            return Ok(products);
        }

        [HttpPost]
        [Route("GetDescription")]
        public IHttpActionResult GetProductDescription(RequestValue requestValue)
        {
            DALProduct mprod = new DALProduct();
            var products = mprod.GetProductDescrip(requestValue.Value, requestValue.Page);

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
