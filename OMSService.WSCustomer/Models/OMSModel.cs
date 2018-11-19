namespace OMSService.WSCustomer.Models
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

        public virtual DbSet<Customer> Customer { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Customer>()
                .Property(e => e.email)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.userName)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.pass)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.phone_number)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.address)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.numberDoc)
                .IsUnicode(false);

            modelBuilder.Entity<Customer>()
                .Property(e => e.TypeDoc)
                .IsUnicode(false);
        }
    }
}
