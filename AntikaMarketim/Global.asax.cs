using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using WebMatrix.WebData;

namespace AntikaMarketim
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801

    public class MvcApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            WebApiConfig.Register(GlobalConfiguration.Configuration);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            AuthConfig.RegisterAuth();
        }
    }

    public static class Globals
    {
        public const short PRODUCTAVAILABILITY_AVAILABLE = 1;
        public const short PRODUCTAVAILABILITY_SOLD = 2;

        public const short ORDERSTATUS_INCOMPLETE = 0;
        public const short ORDERSTATUS_COMPLETE = 1;

        public const short DEFAULT_PAGESIZE = 24;

        public const string USERROLE_ADMIN = "Admin";

        public enum ERRTYPES : short
        {
            ORDER_NOTFOUND,
            CHECKOUT_PAYMENTERROR,
            CART_CARTEMPTY,
            OTHER,
            PRODUCT_NOTFOUND,
            CATEGORY_NOTFOUND
        };

        /// <summary>
        /// Returns the key associated with the current user. If logged in, UserKey=UserName
        /// </summary>
        public static string GetUserKey(this HttpSessionStateBase Session)
        {
            if (Session["UserKey"] == null)
            {

                Session["UserKey"] = Guid.NewGuid().ToString();
            }
            return Session["UserKey"].ToString();
        }
    }
}