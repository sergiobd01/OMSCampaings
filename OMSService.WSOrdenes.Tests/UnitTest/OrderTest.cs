using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using OMSService.WSOrder.Business;
namespace OMSService.WSOrder.Tests
{
    [TestClass]
    public class OrderTest
    {
        [TestMethod]
        public void OrderId()
        {
            int IdOrder = 4;
            OrderManager mprod = new OrderManager();
            var order = mprod.GetOrderId(IdOrder);
            Assert.AreEqual(order.amount, 9000000);
        }

        [TestMethod]
        public void OrderOpen()
        {
            int page = 1;
            DALOrder mprod = new DALOrder();
            var order = mprod.GetOrderOpen(page);
            Assert.AreEqual(order.Count, 0);
        }

        [TestMethod]
        public void OrderClosed()
        {
            DALOrder mprod = new DALOrder();
            var order = mprod.GetOrderClosed();
            Assert.AreEqual(order.Count, 1);
        }

        [TestMethod]
        public void OrderProduct()
        {
            long IdProduct = 2;
            int PageNumber = 1;
            DALOrder mprod = new DALOrder();
            var order = mprod.GetOrderProduct(IdProduct, PageNumber);
            Assert.AreEqual(order.Count, 7);
        }
        
    }
}
