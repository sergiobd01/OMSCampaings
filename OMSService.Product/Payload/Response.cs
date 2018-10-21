﻿using System.Runtime.Serialization;


namespace OMSService.WSProduct.Payload
{
    public class Response
    {
        [DataMember(Name = "codigo")]
        public int Code { get; set; }

        [DataMember(Name = "description")]
        public string Description { get; set; }
    }
}