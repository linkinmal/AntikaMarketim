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
    
    public partial class Shipping
    {
        public int Id { get; set; }
        public decimal ShippingPrice { get; set; }
        public string ShippingOptionId { get; set; }
    
        public virtual DeliveryAddress DeliveryAddress { get; set; }
        public virtual BillingAddress BillingAddress { get; set; }
        public virtual Order Order { get; set; }
    }
}
