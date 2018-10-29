using System;
using System.Collections.Generic;
using OMSService.WSOrder.Models;
using System.Configuration;
using OMSService.WSOrder.Payload;


namespace OMSService.WSOrder.Business
{
    public class DALOrder : DALBase
    {
        public List<Order> GetOrderProduct(long IdProduct, int PageNumber)
        {
            int PageSize = Convert.ToInt32(ConfigurationManager.AppSettings["PAGES"]);
            var orders = new List<Order>();
            try
            {
                var cmd = GetDbSprocCommand("[dbo].[USP_OrderProduct]");
                cmd.Parameters.Add(CreateParameter("@IdProduct", IdProduct));
                cmd.Parameters.Add(CreateParameter("@PageNumber", PageNumber));
                cmd.Parameters.Add(CreateParameter("@PageSize", PageSize));
                orders = GetOrder(ref cmd);
            }
            catch (Exception ext)
            {
                throw ext;
            }

            return orders;
        }

        public List<Order> GetOrderOpen(int PageNumber)
        {
            int PageSize = Convert.ToInt32(ConfigurationManager.AppSettings["PAGES"]);
            var orders = new List<Order>();
            try
            {
                var cmd = GetDbSprocCommand("[dbo].[USP_TopOrders_Open]");
                cmd.Parameters.Add(CreateParameter("@PageNumber", PageNumber));
                cmd.Parameters.Add(CreateParameter("@PageSize", PageSize));
                orders = GetOrder(ref cmd);
            }
            catch (Exception ext)
            {
                throw ext;
            }

            return orders;
        }
        public List<ResponseOrderClosed> GetOrderClosed()
        {
            int PageSize = Convert.ToInt32(ConfigurationManager.AppSettings["PAGES"]);
            var orders = new List<ResponseOrderClosed>();
            try
            {
                var cmd = GetDbSprocCommand("[dbo].[USP_Orders_Closed]");
                orders = GetOrderClosed(ref cmd);
            }
            catch (Exception ext)
            {
                throw ext;
            }

            return orders;
        }
    }
}