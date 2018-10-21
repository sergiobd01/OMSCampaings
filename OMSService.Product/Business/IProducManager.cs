using System;
using System.Collections.Generic;
using System.Linq;
using OMSService.WSProduct.Models;
using OMSService.WSProduct.Payload;


namespace OMSService.WSProduct.Business
{
    public class IProducManager
    {

        public IList<Product> GetAllProduct()
        {
            OMSModel objContext = new OMSModel();
            var products = new List<Product>();
            try
            {
                products = objContext.Product.ToList();
            }
            catch (Exception ext)
            {
                throw ext;
            }
            return products;
        }
        public Product GetProductId(long IdProduct)
        {
            OMSModel objContext = new OMSModel();
            var product = new Product();
            try
            {
               product = objContext.Product.First(p => p.idProduct == IdProduct);
            }
            catch (Exception ext)
            {
                throw ext;
            }
            return product;
        }

        public IList<Product> GetProductName(string name)
        {

            OMSModel objContext = new OMSModel();
            var products = new List<Product>();
            try
            {
                name = name.Replace("%", "");
                name = name.Replace("*", "");
                products = objContext.Product.Where(p => p.name.Contains(name)).ToList();
            }
            catch (Exception ext)
            {
                throw ext;
            }
            return products;
        }

        public IList<Product> GetProductDescription(string description)
        {
            OMSModel objContext = new OMSModel();
            var products = new List<Product>();
            try
            {
                description = description.Replace("%", "");
                description = description.Replace("*", "");

                products = objContext.Product.Where(p => p.description.Contains(description)).ToList();
            }
            catch (Exception ext)
            {
                throw ext;
            }
            return products;
        }

        public Response PostProductCreate(Product product)
        {
            var response = new Response();
            OMSModel objContext = new OMSModel();
            try
            {
                objContext.Product.Add(product);
                var res = objContext.SaveChanges();

                response.Code = res;
                response.Description = "Producto Creado";
            }
            catch (Exception ext)
            {
                response.Code = 515;
                response.Description = ext.Message;
                return response;
            }

            return response;
        }
        public Response PostProductUpdate(Product model)
        {
            var response = new Response();
            OMSModel objContext = new OMSModel();
            try
            {
                var products = objContext.Product.Where(p => p.idProduct == model.idProduct).SingleOrDefault();

                if (products != null)
                {
                    objContext.Entry(products).CurrentValues.SetValues(model);
                    var res =  objContext.SaveChanges();

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
        public Response PostProductDelete(Product model)
        {
            var response = new Response();
            OMSModel objContext = new OMSModel();
            try
            {
                var products = objContext.Product.Where(p => p.idProduct == model.idProduct).SingleOrDefault();

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
    }
}