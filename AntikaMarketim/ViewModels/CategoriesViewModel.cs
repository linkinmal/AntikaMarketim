using AntikaMarketim.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AntikaMarketim.ViewModels
{
    public class CategoriesViewModel
    {
        public Category SuperCategory { get; set; }
        public List<Category> CurrentCategories { get; set; }
    }
}