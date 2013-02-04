using AntikaMarketim.Models;
using AntikaMarketim.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AntikaMarketim.Controllers
{
    public class CartController : Controller
    {
        private CartBusiness cartBusiness;

        public ActionResult Index()
        {
            cartBusiness = new CartBusiness(Session.GetUserKey());
            var currentCarts = cartBusiness.GetCurrentCarts();
            return View(new CartViewModel
            {
                GrandTotal = CartBusiness.CalculateGrandTotal(currentCarts.AsQueryable()),
                CartDetailList = cartBusiness.GenerateCartDetailList(currentCarts)
            });
        }

        [HttpPost]
        public void AddToCart(int ProductId, decimal UnitPrice)
        {
            cartBusiness = new CartBusiness(Session.GetUserKey());

            if (UnitPrice != new ProductBusiness().GetPrice(ProductId))
            {
                throw new HttpException(400, "");
            }

            try
            {
                cartBusiness.AddToCart(ProductId);
            }
            catch(InvalidOperationException)
            {
                throw new HttpException(404, "");
            }
        }

        [HttpPost]
        public void RemoveFromCart(int Id)
        {
            cartBusiness = new CartBusiness(Session.GetUserKey());
            try
            {
                cartBusiness.RemoveFromCart(Id);
            }
            catch( InvalidOperationException)
            {
                var ex = new HttpException(404, "");
                ex.Data["ErrType"] = Globals.ERRTYPES.OTHER;
                throw ex;      
            }
        }

        [ChildActionOnly]
        public string CartSummary()
        {
            return new CartBusiness(Session.GetUserKey()).GetCurrentCartCount().ToString();
        }
    }
}