namespace OMSService.Campaing.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Campaign")]
    public partial class Campaign
    {
        [Key]
        public long idCampaign { get; set; }

        [Required]
        public string name { get; set; }

        public long idStateCampaign { get; set; }

        [Required]
        public string urlImage { get; set; }

        [Required]
        public string description { get; set; }

        public long? idProduct { get; set; }

        public DateTime? startDate { get; set; }

        public DateTime? endDate { get; set; }
    }
}
