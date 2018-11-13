using System.Web.Http;
using OMSService.WSCustomer.Business;
using OMSService.WSCustomer.Payload;
using OMSService.WSCustomer.Models;

namespace WSCustomer.Controllers
{
    //[Authorize]
    [AllowAnonymous]
    [RoutePrefix("Customer")]
    public class CustomerController : ApiController
    {
        [HttpGet]
        [Route("GetCustomer/{page}")]
        public IHttpActionResult GetAll(int page)
        {
            ICustomerManager mcust = new ICustomerManager();
            DALCustomer dalCustomer = new DALCustomer();

            var responseCustomer = new ResponseCustomer();
            responseCustomer.totalPaginas = mcust.Pagination();

            responseCustomer.customers = dalCustomer.GetProducts(page);

            return Ok(responseCustomer);
        }

        [HttpGet]
        [Route("GetId")]
        public IHttpActionResult GetCustomerId(long Id)
        {
            ICustomerManager mcust = new ICustomerManager();
            var products = mcust.GetCustomerId(Id);

            return Ok(products);
        }

        [HttpGet]
        [Route("GetNumberDoc")]
        public IHttpActionResult GetNumberDoc(string number)
        {
            ICustomerManager mcust = new ICustomerManager();
            var customer = mcust.GetNumberDoc(number);

            return Ok(customer);
        }

        [HttpGet]
        [Route("GetCustomerProduct")]
        public IHttpActionResult GetCustomerProduct(long IdProduct, int page)
        {
            DALCustomer mcust = new DALCustomer();
            var customer = mcust.GetCustomerProduct(IdProduct, page);

            return Ok(customer);
        }

        [HttpGet]
        [Route("GetTopCustomer")]
        public IHttpActionResult GetTopCustomer(string DateBegin, string DateEnd)
        {
            DALCustomer mcust = new DALCustomer();
            var customer = mcust.GetTopCustomer(DateBegin, DateEnd);

            return Ok(customer);
        }

        [HttpPost]
        [Route("NewCustomer")]
        public IHttpActionResult PostNewProduct(Customer customer)
        {
            ICustomerManager mcust = new ICustomerManager();
            var response = mcust.CustomerCreate(customer);

            return Ok(response);
        }

        [HttpPost]
        [Route("UpdateProduct")]
        public IHttpActionResult PostUpdateProduct(Customer customer)
        {
            ICustomerManager mcust = new ICustomerManager();
            var response = mcust.CustomerUpdate(customer);

            return Ok(response);
        }

        [HttpDelete]
        [Route("DeleteProduct")]
        public IHttpActionResult DeleteProduct(long Id)
        {
            ICustomerManager mcust = new ICustomerManager();
            var response = mcust.DeleteCustomer(Id);

            return Ok(response);
        }
    }
}