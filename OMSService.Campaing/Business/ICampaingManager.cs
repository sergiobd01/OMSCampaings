﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using OMSService.WSCampaign.Models;
using OMSService.WSCampaign.Payload;

namespace OMSService.WSCampaign.Business
{
    public class ICampaingManager
    {

        public IList<Campaign> GetAllCampaing()
        {
            OMSModel model = new OMSModel();
            var campaing = model.Campaign.ToList();
            return campaing;
        }

        public int Pagination()
        {
            OMSModel objContext = new OMSModel();

            int pages = Convert.ToInt32(ConfigurationManager.AppSettings["PAGES"]);
            try
            {
                int count = objContext.Campaign.Count();
                return count / pages;
            }
            catch (Exception ext)
            {
                throw ext;
            }
        }

        public Campaign GetCampaignId(long IdCampaign)
        {
            OMSModel objContext = new OMSModel();
            var campaign = new Campaign();
            try
            {
                campaign = objContext.Campaign.First(p => p.idCampaign == IdCampaign);
            }
            catch (Exception ext)
            {
                throw ext;
            }
            return campaign;
        }

        public Response PostCampaignCreate(Campaign campaign)
        {
            var response = new Response();
            OMSModel objContext = new OMSModel();
            try
            {
                objContext.Campaign.Add(campaign);
                var res = objContext.SaveChanges();

                response.Code = res;
                response.Description = "Campaña Creada";
            }
            catch (Exception ext)
            {
                response.Code = 515;
                response.Description = ext.Message;
                return response;
            }

            return response;
        }

        public Response PostCampaignUpdate(Campaign model)
        {
            var response = new Response();
            OMSModel objContext = new OMSModel();
            try
            {
                var campaign = objContext.Campaign.Where(p => p.idCampaign == model.idCampaign).SingleOrDefault();

                if (campaign != null)
                {
                    objContext.Entry(campaign).CurrentValues.SetValues(model);
                    var res = objContext.SaveChanges();

                    response.Code = res;
                    response.Description = "Campaña modificada";
                }
            }
            catch (Exception ext)
            {
                response.Code = 515;
                response.Description = ext.Message;
                return response;
            }

            return response;
        }

        public Response DeleteCampaign(long Idcampaign)
        {
            var response = new Response();
            OMSModel objContext = new OMSModel();
            try
            {
                var campaign = objContext.Campaign.Where(p => p.idCampaign == Idcampaign).SingleOrDefault();

                if (campaign != null)
                {
                    objContext.Campaign.Remove(campaign);
                    var res = objContext.SaveChanges();

                    response.Code = res;
                    response.Description = "Campaña Eliminada";
                }
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