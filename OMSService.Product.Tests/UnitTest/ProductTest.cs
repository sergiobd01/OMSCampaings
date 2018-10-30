using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using OMSService.WSProduct.Business;
using OMSService.WSProduct.Models;
using System.Data;
using System.Data.SqlClient;
using System.Linq;


namespace OMSService.Product.Tests.UnitTest
{
    [TestClass]
    public class ProductTest
    {
        [TestMethod]
        public void PaginacionTest()
        {
            IProducManager mprod = new IProducManager();
            var paginas = mprod.Pagination();
            Assert.AreEqual(paginas, 4);
        }
        

        [TestMethod]
        public void ProductIdTest()
        {
            int IdProduct = 2;
            IProducManager mprod = new IProducManager();
            var product = mprod.GetProductId(IdProduct);
            Assert.AreEqual(product.name, "semifinal copa libertadores");
        }

        [TestMethod]
        public void ProductsTest()
        {
            int page = 1;
            DALProduct mprod = new DALProduct();
            var products = mprod.GetProducts(page);
            Assert.AreEqual(products.Count, 10);
        }

        [TestMethod]
        public void TopProductsTest()
        {
            string BeginDate = "20181001";
            string EndDate = "20181031";
            DALProduct mprod = new DALProduct();
            var products = mprod.GetTopProduct(BeginDate, EndDate);
            Assert.AreEqual(products.Count, 1);
        }

        [TestMethod]
        public void ProductName()
        {
            string Name = "Real*";
            int Page = 1;
            DALProduct mprod = new DALProduct();
            var products = mprod.GetProductName(Name, Page);
            Assert.AreEqual(products.Count, 5);
        }

        [TestMethod]
        public void ProductDescrip()
        {
            string Descripcion = "*Argen*";
            int Page = 1;
            DALProduct mprod = new DALProduct();
            var products = mprod.GetProductDescrip(Descripcion, Page);
            Assert.AreEqual(products.Count, 5);
        }
    }
}
