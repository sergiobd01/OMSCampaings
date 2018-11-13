namespace OMSService.WSCampaign.Models
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class OMSModel : DbContext
    {
        public OMSModel()
            : base("name=OMSModel")
        {
        }

        public virtual DbSet<Campaign> Campaign { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Campaign>()
                .Property(e => e.name)
                .IsUnicode(false);

            modelBuilder.Entity<Campaign>()
                .Property(e => e.urlImage)
                .IsUnicode(false);

            modelBuilder.Entity<Campaign>()
                .Property(e => e.description)
                .IsUnicode(false);
        }
    }
}
