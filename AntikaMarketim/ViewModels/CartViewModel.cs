using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AntikaMarketim.ViewModels
{
    public class CartViewModel
    {
        public decimal GrandTotal { get; set; }
        public List<CartDetail> CartDetailList { set; get; }
    }

    public class CartDetail
    {
        public int ProductId { get; set; }
        public string ProductCode { get; set; }
        public decimal Total { get; set; }
    }
}