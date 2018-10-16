namespace OMSService.WSLogin.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("User")]
    public partial class User
    {
        [Key]
        public long idUser { get; set; }

        public string email { get; set; }

        [Required]
        public string userName { get; set; }

        [Required]
        public string pass { get; set; }

        [StringLength(60)]
        public string first_name { get; set; }

        [StringLength(60)]
        public string last_name { get; set; }

        [StringLength(50)]
        public string Rol { get; set; }
    }
}
