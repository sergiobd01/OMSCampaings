using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Serialization;

namespace OMSService.WSProduct.Models
{
    public class TopProducts : CommonBase
    {
        [DataMember(Name = "idProduct")]
        public long IdProduct { get; set; }

        [DataMember(Name = "name")]
        public string Name { get; set; }

        [DataMember(Name = "description")]
        public string Description { get; set; }

        [DataMember(Name = "idEntertainment")]
        public long IdEntertainment { get; set; }

        [DataMember(Name = "cantidad")]
        public int Cantidad { get; set; }

    }
}