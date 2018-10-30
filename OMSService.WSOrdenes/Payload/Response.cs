using System.Runtime.Serialization;

namespace OMSService.WSOrder.Payload
{
    public class Response
    {
        [DataMember(Name = "codigo")]
        public int Code { get; set; }

        [DataMember(Name = "description")]
        public string Description { get; set; }
    }
}