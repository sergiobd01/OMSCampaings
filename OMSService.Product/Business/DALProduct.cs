using System;
using System.Collections.Generic;
using OMSService.WSProduct.Models;
using Newtonsoft.Json;

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
    }
}
