namespace OMSService.WSCustomer.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Customer")]
    public partial class Customer
    {
        [Key]
        public long idCustomer { get; set; }

        public long? idCategory { get; set; }

        public string email { get; set; }

        [Required]
        public string userName { get; set; }

        [Required]
        public string pass { get; set; }

        public long? idCard { get; set; }

        [StringLength(60)]
        public string first_name { get; set; }

        [StringLength(60)]
        public string last_name { get; set; }

        [StringLength(25)]
        public string phone_number { get; set; }

        [StringLength(50)]
        public string address { get; set; }

        [StringLength(60)]
        public string country { get; set; }

        [StringLength(60)]
        public string numberDoc { get; set; }

        [StringLength(20)]
        public string TypeDoc { get; set; }

        [StringLength(60)]
        public string city { get; set; }

        public long? idUser { get; set; }

        [Column(TypeName = "date")]
        public DateTime? modificationDate { get; set; }
    }
}
