namespace OMSService.Campaing.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Product")]
    public partial class Product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Product()
        {
            Campaign = new HashSet<Campaign>();
        }

        [Key]
        public long idProduct { get; set; }

        public long? idTransport { get; set; }

        public long? idEntertainment { get; set; }

        public long? idHotel { get; set; }

        [Required]
        public string name { get; set; }

        [Required]
        public string urlImage { get; set; }

        [Column(TypeName = "money")]
        public decimal price { get; set; }

        public decimal? discountRate { get; set; }

        [StringLength(50)]
        public string code { get; set; }

        public long? source_city { get; set; }

        public long? target_city { get; set; }

        public DateTime? spectacle_date { get; set; }

        public DateTime? arrival_date { get; set; }

        public DateTime? departure_date { get; set; }

        public string description { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Campaign> Campaign { get; set; }
    }
}
