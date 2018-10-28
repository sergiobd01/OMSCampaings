namespace OMSService.WSOrder.Models
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

        public virtual DbSet<Order> Order { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Order>()
                .Property(e => e.amount)
                .HasPrecision(19, 4);
        }
    }
}
