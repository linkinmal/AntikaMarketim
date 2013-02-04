using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AntikaMarketim.ViewModels
{
    public class ProductListViewModel
    {
        public int ProductId { get; set; }
        public string ImageFileName { get; set; }
        public string ProductTitle { get; set; }
        public decimal Price { get; set; }
    }
}