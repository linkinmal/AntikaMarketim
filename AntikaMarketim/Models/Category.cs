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
    
    public abstract partial class Category
    {
        public Category()
        {
            this.Products = new HashSet<Product>();
            this.SubCategories = new HashSet<Category>();
        }
    
        public int Id { get; set; }
        public string Title { get; set; }
    
        public virtual ICollection<Product> Products { get; set; }
        public virtual ICollection<Category> SubCategories { get; set; }
        public virtual Category SuperCategory { get; set; }
    }
}
