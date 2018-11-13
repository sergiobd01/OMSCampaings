using System;
using System.Collections.Generic;
using System.Configuration;
using OMSService.WSCustomer.Models;
using OMSService.WSCustomer.Payload;

namespace  OMSService.WSCustomer.Business
{
    public class DALCustomer : DALBase
    {
        public List<Customer> GetProducts(int PageNumber)
        {
            int PageSize = Convert.ToInt32(ConfigurationManager.AppSettings["PAGES"]);
            var customer = new List<Customer>();

            try
            {
                var cmd = GetDbSprocCommand("[dbo].[USP_Customer]");
                cmd.Parameters.Add(CreateParameter("@PageNumber", PageNumber));
                cmd.Parameters.Add(CreateParameter("@PageSize", PageSize));
                customer = GetCustomer(ref cmd);
            }
            catch (Exception ext)
            {
                throw ext;
            }

            return customer;
        }

        public List<RespCustomerProduct> GetCustomerProduct(long IdProduct, int PageNumber)
        {
            int PageSize = Convert.ToInt32(ConfigurationManager.AppSettings["PAGES"]);
            var customer = new List<RespCustomerProduct>();
            try
            {
                var cmd = GetDbSprocCommand("[dbo].[USP_CustomerProduct]");
                cmd.Parameters.Add(CreateParameter("@IdProduct", IdProduct));
                cmd.Parameters.Add(CreateParameter("@PageNumber", PageNumber));
                cmd.Parameters.Add(CreateParameter("@PageSize", PageSize));
                customer = CustomerProduct(ref cmd);
            }
            catch (Exception ext)
            {
                throw ext;
            }

            return customer;
        }

        public List<RespTopCustomer> GetTopCustomer(string DateBegin, string DateEnd)
        {
            var customer = new List<RespTopCustomer>();
            try
            {
                var cmd = GetDbSprocCommand("[dbo].[USP_TopCustomer]");
                cmd.Parameters.Add(CreateParameter("@DateBegin", DateBegin));
                cmd.Parameters.Add(CreateParameter("@DateEnd", DateEnd));
                customer = TopCustomer(ref cmd);
            }
            catch (Exception ext)
            {
                throw ext;
            }

            return customer;
        }
    }
}