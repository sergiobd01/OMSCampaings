using System.Runtime.Serialization;


namespace OMSService.WSProduct.Payload
{
    public class TopRequest
    {
        [DataMember(Name = "dateBegin")]
        public string DateBegin { get; set; }

        [DataMember(Name = "dateEnd")]
        public string DateEnd { get; set; }
    }
}