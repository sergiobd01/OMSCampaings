using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using OMSService.WSCampaign.Models;

namespace OMSService.WSCampaign.Business
{
    public class DALCampaing : DALBase
    {
        public List<Campaign> GetCampaings(int PageNumber)
        {
            int PageSize = Convert.ToInt32(ConfigurationManager.AppSettings["PAGES"]);
            var campaign = new List<Campaign>();

            try
            {
                var cmd = GetDbSprocCommand("[dbo].[USP_Campaign]");
                cmd.Parameters.Add(CreateParameter("@PageNumber", PageNumber));
                cmd.Parameters.Add(CreateParameter("@PageSize", PageSize));
                campaign = GetCampaing(ref cmd);
            }
            catch (Exception ext)
            {
                throw ext;
            }

            return campaign;
        }
    }
}