using AntikaMarketim.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AntikaMarketim.ViewModels
{
    public class ShippingViewModel
    {
        public DeliveryAddress DeliveryAddress { get; set; }
        public BillingAddress BillingAddress { get; set; }
    }
}