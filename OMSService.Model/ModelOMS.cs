namespace OMSService.Model
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class ModelOMS : DbContext
    {
        public ModelOMS()
            : base("name=ModelOMS")
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
