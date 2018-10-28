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



        public void CountProduc()
        {
            int page = 1;
            DALProduct mprod = new DALProduct();
            var products = mprod.GetProducts(page);
            Assert.AreEqual(products.Count, 49);
        }
    }
}
