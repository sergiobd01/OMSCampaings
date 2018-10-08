namespace OMSService.Campaing.Models
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
        public virtual DbSet<Product> Product { get; set; }

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

            modelBuilder.Entity<Product>()
                .Property(e => e.name)
                .IsUnicode(false);

            modelBuilder.Entity<Product>()
                .Property(e => e.urlImage)
                .IsUnicode(false);

            modelBuilder.Entity<Product>()
                .Property(e => e.price)
                .HasPrecision(19, 4);

            modelBuilder.Entity<Product>()
                .Property(e => e.discountRate)
                .HasPrecision(5, 2);

            modelBuilder.Entity<Product>()
                .Property(e => e.code)
                .IsUnicode(false);

            modelBuilder.Entity<Product>()
                .Property(e => e.description)
                .IsUnicode(false);
        }
    }
}
