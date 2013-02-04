using AntikaMarketim.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AntikaMarketim.ViewModels
{
    public class ProductDetailViewModel
    {
        public List<Category> Categories { get; set; }
        public Product Product { get; set; }
        public decimal UnitPrice { get; set; }
    }
}