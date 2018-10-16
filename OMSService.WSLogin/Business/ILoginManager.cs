using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using OMSService.WSLogin.Models;
using OMSService.WSLogin.Payload;

namespace OMSService.WSLogin.Business
{
    public class ILoginManager
    {
        public bool LoginUser(LoginRequest alogin)
        {
            OMSModel model = new OMSModel();
            foreach (var userOMS in model.User)
            {
                if (userOMS.userName == alogin.Username && userOMS.pass == alogin.Password)
                {
                    return true;
                }
                else return false;
            }

            //var usuario = model.User.Select( user.userName);
            return false;
        }
    }
}