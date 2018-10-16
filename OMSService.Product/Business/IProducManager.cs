using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OMSService.WSProduct.Models;
using System.Data.Entity;

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

      /*  public IList<View_TopProduct> GetTopProduct(DateTime fechaInicio, DateTime fechaFin)
        {
            OMSModel model = new OMSModel();
            var products = model.View_TopProduct.Where(p => p.Date >= fechaInicio 
                                                        && p.Date <= fechaFin).ToList();
            return products;
        }*/
    }
}