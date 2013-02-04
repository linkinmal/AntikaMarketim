using AntikaMarketim.Models;
using AntikaMarketim.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace AntikaMarketim.Controllers
{
    public class ProductController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        [ChildActionOnly]
        public ActionResult MainCategories()
        {
            // BURANIN LAZYLOADING'iNE BAK PRODUCTLARIN DA GELDIGINI GOR, LAZYLOADING'SIZ RECURSIVE'LI BIR COZUM YAZ   
            return PartialView(new ProductBusiness().Category.Where(c => c is MainCategory).ToList());
        }

        [ChildActionOnly]
        public ActionResult CurrentCategories(int CategoryId)
        {  
            var productBusiness = new ProductBusiness();
            try
            {
                productBusiness.Configuration.LazyLoadingEnabled = false;
                var currentCategory = productBusiness.Category.Single(c => c.Id == CategoryId);
                return PartialView(new CategoriesViewModel 
                {
                    SuperCategory = currentCategory.SuperCategory,
                    CurrentCategories = currentCategory.SuperCategory.SubCategories.ToList()
                });
            }
            catch (InvalidOperationException)
            {
                var ex = new HttpException(404, "");
                ex.Data["ErrType"] = Globals.ERRTYPES.CATEGORY_NOTFOUND;
                throw ex;
            }
        }

        public ActionResult ListByCategory(int CategoryId, int PageIndex, int PageSize)
        {
            var productBusiness = new ProductBusiness();
            try
            {
                productBusiness.Configuration.LazyLoadingEnabled = false;
                ViewData["Category"] = productBusiness.Category.Where(c => c.Id == CategoryId).Single();
                return View(productBusiness.CreateProductListViewModel(productBusiness.GetProductsQueryable(CategoryId), PageIndex, PageSize));
            }
            catch (InvalidOperationException)
            {
                var ex = new HttpException(404, "");
                ex.Data["ErrType"] = Globals.ERRTYPES.CATEGORY_NOTFOUND;
                throw ex;
            }
        }

        public ActionResult Details(int ProductId)
        {
            var productBusiness = new ProductBusiness();
            try
            {
                var product= productBusiness.GetProduct(ProductId);
                return View(new ProductDetailViewModel
                {
                    Categories = productBusiness.GetCategoryNavigation(product.Category.Id),
                    Product = product,
                    UnitPrice = productBusiness.GetPrice(ProductId)
                });
            }
            catch (InvalidOperationException)
            {
                var ex = new HttpException(404, "");
                ex.Data["ErrType"] = Globals.ERRTYPES.PRODUCT_NOTFOUND;
                throw ex;
            }
        }

        public JsonResult OtherProductsInThisCategory(int CategoryId, int ProductId, int PageIndex, int PageSize)
        {
            var productBusiness = new ProductBusiness();
            return Json(new { result = productBusiness.CreateProductListViewModel(productBusiness.GetOtherProductsQueryable(CategoryId, ProductId), PageIndex, PageSize) }, JsonRequestBehavior.AllowGet);
        }
    }
}