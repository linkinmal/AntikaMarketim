using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebMatrix.WebData;

namespace AntikaMarketim.Models
{
    public class OrderBusiness : DBContainer
    {
        internal void CreateOrder(string UserKey, List<Cart> Carts, Shipping Shipping)
        {
            var order = new Order
            {
                Carts = Carts,
                Status = Globals.ORDERSTATUS_INCOMPLETE,
                Statuses = new List<OrderStatus> { new OrderStatus { State = Globals.ORDERSTATUS_INCOMPLETE, Date = DateTime.Now } },
                UserKey = UserKey,
                Shipping = Shipping
            };
            
            var outdatedOrder = GetIncompleteOrder(UserKey);
            if(outdatedOrder != null)
            {
                Order.Remove(outdatedOrder);
            }
            
            Order.Add(order);
            SaveChanges();
        }

        /// <summary>
        /// Gets the in-process order entity that's associated with the current user
        /// </summary>
        /// <returns></returns>
        internal Order GetIncompleteOrder(string UserKey)
        {
            return Order.SingleOrDefault(o => o.UserKey == UserKey && o.Status == Globals.ORDERSTATUS_INCOMPLETE);
        }

        internal void CalculateOrderSummary(out decimal ItemsTotal, out decimal ShippingPrice, out decimal OrderTotal, Order currentOrder)
        {
            ItemsTotal = CartBusiness.CalculateGrandTotal(currentOrder.Carts.AsQueryable());
            ShippingPrice = currentOrder.Shipping.ShippingPrice;
            OrderTotal = ItemsTotal + ShippingPrice;
        }

        /// <summary>
        /// Makes the payment, and if successful, completes the order.
        /// </summary>
        /// <param name="Payment"></param>
        /// <param name="Order"></param>
        internal void Checkout(Payment Payment, Order Order)
        {
            Order.MoneyTransfers.Add(Payment);

            Order.Status = Globals.ORDERSTATUS_COMPLETE;
            Order.Statuses.Add(new OrderStatus { State = Globals.ORDERSTATUS_COMPLETE, Date = DateTime.Now });
            Order.Carts.ToList().AsParallel().ForAll(c => c.OrderCompleted = true);
            SaveChanges();
        }

        internal Order GetOrder(int OrderId, string UserKey)
        {
            return Order.Single(o => o.Id == OrderId && o.UserKey == UserKey);
        }
    }
}