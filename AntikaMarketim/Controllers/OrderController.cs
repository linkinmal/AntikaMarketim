using AntikaMarketim.Models;
using AntikaMarketim.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebMatrix.WebData;

namespace AntikaMarketim.Controllers
{
    public class OrderController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Shipping()
        {
            if (new CartBusiness { UserKey = Session.GetUserKey() }.GetCurrentCartCount() <= 0)
            {
                var ex = new HttpException(400, "");
                ex.Data["ErrType"] = Globals.ERRTYPES.CART_CARTEMPTY;
                throw ex;
            }
            return View(new OrderBusiness().ShippingOption.ToList());
        }

        [HttpPost]
        public ActionResult Shipping(Shipping Shipping)
        {
            var cartBusiness = new CartBusiness { UserKey = Session.GetUserKey() };
            if (cartBusiness.GetCurrentCartCount() <= 0)
            {
                var ex = new HttpException(400, "");
                ex.Data["ErrType"] = Globals.ERRTYPES.CART_CARTEMPTY;
                throw ex;
            }

            if (ModelState.IsValid)
            {
                var orderBusiness = new OrderBusiness();
                orderBusiness.CreateOrder(cartBusiness.UserKey, cartBusiness.GetCurrentCarts(), Shipping);

                return RedirectToAction("Checkout");
            }
            else
            {
                return View(Shipping);
            }
        }

        public ActionResult Checkout()
        {
            if (new CartBusiness { UserKey = Session.GetUserKey() }.GetCurrentCartCount() <= 0)
            {
                var ex = new HttpException(400, "");
                ex.Data["ErrType"] = Globals.ERRTYPES.CART_CARTEMPTY;
                throw ex;
            }
            var orderBusiness = new OrderBusiness();
            var currentOrder = orderBusiness.GetIncompleteOrder(Session.GetUserKey());
            if (currentOrder == null)
            {
                var ex = new HttpException(404, "");
                ex.Data["ErrType"] = Globals.ERRTYPES.ORDER_NOTFOUND;
                throw ex;
            }

            decimal ItemsTotal;
            decimal ShippingPrice;
            decimal OrderTotal;
            orderBusiness.CalculateOrderSummary(out ItemsTotal, out ShippingPrice, out OrderTotal, currentOrder);

            return View(new CheckoutViewModel
            {
                Order = currentOrder,
                ItemsTotal = ItemsTotal,
                ShippingPrice = ShippingPrice,
                OrderTotal = OrderTotal
            });
        }

        [HttpPost]
        public ActionResult Checkout(Payment Payment)
        {
            if (new CartBusiness { UserKey = Session.GetUserKey() }.GetCurrentCartCount() <= 0)
            {
                var ex = new HttpException(400, "");
                ex.Data["ErrType"] = Globals.ERRTYPES.CART_CARTEMPTY;
                throw ex;
            }
            var orderBusiness = new OrderBusiness();
            var currentOrder = orderBusiness.GetIncompleteOrder(Session.GetUserKey());
            if (currentOrder == null)
            {
                var ex = new HttpException(404, "");
                ex.Data["ErrType"] = Globals.ERRTYPES.ORDER_NOTFOUND;
                throw ex;
            }

            decimal ItemsTotal;
            decimal ShippingPrice;
            decimal OrderTotal;
            orderBusiness.CalculateOrderSummary(out ItemsTotal, out ShippingPrice, out OrderTotal, currentOrder);
            if (OrderTotal != Payment.AmountPaid)
            {
                var ex = new HttpException(400, "");
                ex.Data["ErrType"] = Globals.ERRTYPES.CHECKOUT_PAYMENTERROR;
                throw ex;
            }

            orderBusiness.Checkout(Payment, currentOrder);

            // order completed, SEND E-MAIL

            return RedirectToAction("CheckoutComplete", currentOrder);
        }

        public ActionResult CheckoutComplete(Order order)
        {
            return View("OrderDetails", order);
        }

        public ActionResult OrderDetails(int OrderId, string UserKey = "")
        {
            // we don't want to show the orders from other registered users
            if (Session.GetUserKey() != UserKey && WebSecurity.UserExists(UserKey))
            {
                var ex = new HttpException(404, "");
                ex.Data["ErrType"] = Globals.ERRTYPES.ORDER_NOTFOUND;
                throw ex;
            }

            try
            {
                return View(new OrderBusiness().GetOrder(OrderId, UserKey.Trim() != "" ? UserKey : Session.GetUserKey()));
            }
            catch (InvalidOperationException)
            {
                var ex = new HttpException(404, "");
                ex.Data["ErrType"] = Globals.ERRTYPES.ORDER_NOTFOUND;
                throw ex;
            }
        }
    }
}
