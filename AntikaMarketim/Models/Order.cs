//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace AntikaMarketim.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Order
    {
        public Order()
        {
            this.Carts = new HashSet<Cart>();
            this.Statuses = new HashSet<OrderStatus>();
            this.MoneyTransfers = new HashSet<MoneyTransfer>();
        }
    
        public int Id { get; set; }
        public string UserKey { get; set; }
        public short Status { get; set; }
    
        public virtual ICollection<Cart> Carts { get; set; }
        public virtual ICollection<OrderStatus> Statuses { get; set; }
        public virtual Shipping Shipping { get; set; }
        public virtual ICollection<MoneyTransfer> MoneyTransfers { get; set; }
    }
}
