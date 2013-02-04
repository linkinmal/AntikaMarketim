using AntikaMarketim.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AntikaMarketim.Models
{
    public class ProductBusiness : DBContainer
    {
        internal IQueryable<Product> GetProductsQueryable(int CategoryId)
        {
            if (Category.Where(c => c.Id == CategoryId).Any())
            {
                return Product.Where(p => (p.Category.Id in CategoryId) && p.Availability == Globals.PRODUCTAVAILABILITY_AVAILABLE);
            }
            else
            {
                throw new InvalidOperationException();
            }
        }

        /// <summary>
        /// Gets some products in the given category other than the given product. Namely, 'Other Products In This Category'
        /// </summary>
        internal IQueryable<Product> GetOtherProductsQueryable(int CategoryId, int ProductId)
        {
            return GetProductsQueryable(CategoryId).Where(p => p.Id != ProductId);
        }

        internal IQueryable<Product> GetSingleProductQueryable(int ProductId)
        {
            return Product.Where(p => p.Id == ProductId && p.Availability == Globals.PRODUCTAVAILABILITY_AVAILABLE);
        }

        internal Product GetProduct(int ProductId)
        {
            return GetSingleProductQueryable(ProductId).Single();
        }

        internal decimal GetPrice(int ProductId)
        {
            return GetSingleProductQueryable(ProductId).Select(
                p => p is Antique ? (p as Antique).Price
                    : 0).Single();
        }

        internal PaginatedList<ProductListViewModel> CreateProductListViewModel(IQueryable<Product> source, int PageIndex, int PageSize)
        {
            return new PaginatedList<ProductListViewModel>(source.Select(
                 p => new ProductListViewModel
                 {
                     ProductId = p.Id,
                     ImageFileName = p.ImageFileNames.First().FileName,
                     ProductTitle = p.Title,
                     Price = GetPrice(p.Id)
                 }),
                 PageIndex, PageSize);
        }

        internal List<Category> GetCategoryNavigation(int CategoryId)
        {
            var result = new List<Category>();

            Configuration.LazyLoadingEnabled = false;
            var leaf = Category.Single(c => c.Id == CategoryId);
            result.Add(leaf);
            while (leaf.SuperCategory != null)
            {
                leaf = leaf.SuperCategory;
                result.Add(leaf);
            }

            result.Reverse();
            return result;
        }
    }
}