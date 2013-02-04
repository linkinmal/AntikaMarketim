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
    
    public abstract partial class Product
    {
        public Product()
        {
            this.Availability = 1;
            this.Favorited = 0;
            this.Tags = new HashSet<Tag>();
            this.ImageFileNames = new HashSet<ImageFileName>();
        }
    
        public int Id { get; set; }
        public string ProductCode { get; set; }
        public string Title { get; set; }
        public short Availability { get; set; }
        public int Favorited { get; set; }
    
        public virtual Category Category { get; set; }
        public virtual ICollection<Tag> Tags { get; set; }
        public virtual ICollection<ImageFileName> ImageFileNames { get; set; }
        public virtual Description Description { get; set; }
    }
}