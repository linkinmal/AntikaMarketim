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
    
    public partial class Tag
    {
        public Tag()
        {
            this.Products = new HashSet<Product>();
        }
    
        public int Id { get; set; }
        public string Text { get; set; }
    
        public virtual ICollection<Product> Products { get; set; }
    }
}
