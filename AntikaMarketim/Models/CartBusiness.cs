using AntikaMarketim.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebMatrix.WebData;

namespace AntikaMarketim.Models
{
    public class CartBusiness : DBContainer
    {
        internal string UserKey;

        private CartBusiness() { }

        public CartBusiness(string UserKey)
        {
            this.UserKey = UserKey;
        }

        /// <summary>
        /// Gets the info of products that are currently in the user's cart.
        /// </summary>
        /// <returns></returns>
        public List<Cart> GetCurrentCarts()
        {
            return GetCurrentCartsQueryable().ToList();
        }

        /// <summary>
        /// Returns the number of items added to the user's cart
        /// </summary>
        /// <returns></returns>
        internal int GetCurrentCartCount()
        {
            return GetCurrentCartsQueryable().Count();
        }

        /// <summary>
        /// Returns the query that will list the current user's shopping cart
        /// </summary>
        private IQueryable<Cart> GetCurrentCartsQueryable()
        {
            var cartQuery = Cart.Where(c => c.UserKey == UserKey && !c.OrderCompleted);

            // check for removal of unavailable products from the cart
            foreach (var item in cartQuery.Where(c => !Product.Any(p => p.Id == c.ProductId && p.Availability == Globals.PRODUCTAVAILABILITY_AVAILABLE)))
            {
                Cart.Remove(item);
            }
            SaveChanges();

            return cartQuery;
        }

        /// <summary>
        /// Simply calculates the total price from a given list of carts.
        /// </summary>
        public static decimal CalculateGrandTotal(IQueryable<Cart> carts)
        {
            return carts.AsEnumerable().Sum(c => c.UnitPrice * c.Count);
        }

        public List<CartDetail> GenerateCartDetailList(List<Cart> carts)
        {
            return (from p in Product
                    from c in carts
                    where c.ProductId == p.Id
                    select new CartDetail
                    {
                        ProductCode = p.ProductCode,
                        ProductId = p.Id,
                        Total = Decimal.Round(c.UnitPrice * c.Count, 2)
                    }).ToList();
        }

        internal void AddToCart(int ProductId)
        {
            var product = Product.Single(p => p.Id == ProductId);
            if (product is Antique)
            {
                Cart.Add(new AntiqueCart
                {
                    Count = 1,
                    UnitPrice = (product as Antique).Price,
                    Discount = (product as Antique).Discount,
                    UserKey = UserKey,
                    ProductId = ProductId,
                    OrderCompleted = false
                });
            }
            SaveChanges();
        }

        internal void RemoveFromCart(int Id)
        {
            Cart.Remove(Cart.Single(c => c.Id == Id));
            SaveChanges();
        }

        internal static decimal GetItemsTotal(IQueryable<Cart> Carts)
        {
            return Carts.Sum(c => c.Count * c.UnitPrice);
        }
    }
}