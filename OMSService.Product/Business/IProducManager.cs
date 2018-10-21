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
            OMSModel model = new OMSModel();
            var products = model.Product.ToList();
            return products;
        }
        public Product GetProductId(long IdProduct)
        {
            OMSModel model = new OMSModel();
            var product = model.Product.First(p => p.idProduct == IdProduct);
            return product;
        }

        public IList<Product> GetProductName(string name)
        {
            name = name.Replace("%", "");
            name = name.Replace("*", "");
            OMSModel model = new OMSModel();
            var products = model.Product.Where(p => p.name.Contains(name)).ToList();
            return products;
        }

        public IList<Product> GetProductDescription(string description)
        {
            description = description.Replace("%", "");
            description = description.Replace("*", "");
            OMSModel model = new OMSModel();
            var products = model.Product.Where(p => p.description.Contains(description)).ToList();
            return products;
        }

        public Response PostProductCreate(Product product)
        {
            var response = new Response();
            OMSModel model = new OMSModel();
            try
            {
                model.Product.Add(product);
                var products = model.SaveChanges();

                response.Code = 0;
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
    }
}