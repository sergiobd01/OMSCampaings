using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using OMSService.WSCustomer.Models;
using OMSService.WSCustomer.Payload;

namespace OMSService.WSCustomer.Business
{
    public class ICustomerManager
    {
        public int Pagination()
        {
            OMSModel objContext = new OMSModel();

            int pages = Convert.ToInt32(ConfigurationManager.AppSettings["PAGES"]);
            try
            {
                int count = objContext.Customer.Count();
                return count / pages;
            }
            catch (Exception ext)
            {
                throw ext;
            }
        }
        public Customer GetCustomerId(long IdCustomer)
        {
            OMSModel objContext = new OMSModel();
            var customer = new Customer();
            try
            {
                customer = objContext.Customer.First(p => p.idCustomer == IdCustomer);
            }
            catch (Exception ext)
            {
                throw ext;
            }
            return customer;
        }

        public Customer GetNumberDoc(string NumberDoc)
        {
            OMSModel objContext = new OMSModel();
            var customer = new Customer();
            try
            {
                customer = objContext.Customer.First(p => p.numberDoc == NumberDoc);
            }
            catch (Exception ext)
            {
                throw ext;
            }
            return customer;
        }

        public Response CustomerCreate(Customer product)
        {
            var response = new Response();
            OMSModel objContext = new OMSModel();
            try
            {
                objContext.Customer.Add(product);
                var res = objContext.SaveChanges();

                response.Code = res;
                response.Description = "Cliente Creado";
            }
            catch (Exception ext)
            {
                response.Code = 515;
                response.Description = ext.Message;
                return response;
            }

            return response;
        }
        public Response CustomerUpdate(Customer model)
        {
            var response = new Response();
            OMSModel objContext = new OMSModel();
            try
            {
                var products = objContext.Customer.Where(p => p.idCustomer == model.idCustomer).SingleOrDefault();

                if (products != null)
                {
                    objContext.Entry(products).CurrentValues.SetValues(model);
                    var res = objContext.SaveChanges();

                    response.Code = res;
                    response.Description = "Producto modificado";
                }
            }
            catch (Exception ext)
            {
                response.Code = 515;
                response.Description = ext.Message;
                return response;
            }

            return response;
        }
        public Response DeleteCustomer(long Idproduct)
        {
            var response = new Response();
            OMSModel objContext = new OMSModel();
            try
            {
                var products = objContext.Customer.Where(p => p.idCustomer == Idproduct).SingleOrDefault();

                if (products != null)
                {
                    objContext.Customer.Remove(products);
                    var res = objContext.SaveChanges();

                    response.Code = res;
                    response.Description = "Producto Eliminado";
                }
            }
            catch (Exception ext)
            {
                response.Code = 515;
                response.Description = ext.Message;
                return response;
            }

            return response;
        }
    }

}