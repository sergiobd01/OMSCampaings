using System;
using System.Collections.Generic;
using OMSService.WSProduct.Models;
using System.Configuration;

namespace OMSService.WSProduct.Business
{
    public class DALProduct : DALBase
    {
        public List<TopProducts> GetTopProduct(string DateBegin, string DateEnd)
        {
            var resultado = new List<TopProducts>();

            try
            {
                var cmd = GetDbSprocCommand("[dbo].[TopProducts]");
                cmd.Parameters.Add(CreateParameter("@DateBegin", DateBegin));
                cmd.Parameters.Add(CreateParameter("@DateEnd", DateEnd));
                resultado = GetDTOListJSON<TopProducts>(ref cmd);
            }
            catch (Exception ext)
            {
                throw ext;
            }

            return resultado;
        }
        public List<Product> GetProducts(int PageNumber)
        {
            int PageSize = Convert.ToInt32(ConfigurationManager.AppSettings["PAGES"]);
            var products = new List<Product>();

            try
            {
                var cmd = GetDbSprocCommand("[dbo].[USP_Product]");
                cmd.Parameters.Add(CreateParameter("@PageNumber", PageNumber));
                cmd.Parameters.Add(CreateParameter("@PageSize", PageSize));
                products = GetProducts(ref cmd);
            }
            catch (Exception ext)
            {
                throw ext;
            }

            return products;
        }

        public IList<Product> GetProductName(string value, int PageNumber)
        {
            int PageSize = Convert.ToInt32(ConfigurationManager.AppSettings["PAGES"]);
            var products = new List<Product>();
            try
            {
                var cmd = GetDbSprocCommand("[dbo].[USP_Product_Name]");
                cmd.Parameters.Add(CreateParameter("@PageNumber", PageNumber));
                cmd.Parameters.Add(CreateParameter("@PageSize", PageSize));
                cmd.Parameters.Add(CreateParameter("@Name", value));
                products = GetProducts(ref cmd);
            }
            catch (Exception ext)
            {
                throw ext;
            }
            return products;
        }

        public IList<Product> GetProductDescrip(string value, int PageNumber)
        {
            int PageSize = Convert.ToInt32(ConfigurationManager.AppSettings["PAGES"]);
            var products = new List<Product>();
            try
            {
                var cmd = GetDbSprocCommand("[dbo].[USP_Product_Descrip]");
                cmd.Parameters.Add(CreateParameter("@Description", value));
                cmd.Parameters.Add(CreateParameter("@PageNumber", PageNumber));
                cmd.Parameters.Add(CreateParameter("@PageSize", PageSize));
                products = GetProducts(ref cmd);
            }
            catch (Exception ext)
            {
                throw ext;
            }
            return products;
        }

    }
}
