using AntikaMarketim.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AntikaMarketim.ViewModels
{
    public class CheckoutViewModel
    {
        public Order Order { get; set; }
        public decimal ItemsTotal { get; set; }
        public decimal ShippingPrice { get; set; }
        public decimal OrderTotal { get; set; }
    }
}