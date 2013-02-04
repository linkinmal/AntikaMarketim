using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace AntikaMarketim.ViewModels
{
    public class PaginatedList<T> : List<T>
    {
        public int PageIndex { get; set; }
        public int PageSize { get; set; }
        public int TotalCount { get; set; }
        public int TotalPages { get; set; }
        public List<T> PageItems { get; set; }

        public PaginatedList()
        {
            PageItems = new List<T>();
        }

        public PaginatedList(IQueryable<T> source, int pageIndex, int pageSize)
        {
            PageIndex = pageIndex;
            PageSize = pageSize;
            TotalCount = source.Count();
            TotalPages = (int)Math.Ceiling(TotalCount / (double)PageSize);

            PageItems = source.Skip(PageIndex * PageSize).Take(PageSize).ToList();
            this.AddRange(PageItems);
        }

        public bool HasPreviousPage
        {
            get
            {
                return (PageIndex > 0);
            }
        }
        public bool HasNextPage
        {
            get
            {
                return (PageIndex + 1 < TotalPages);
            }
        }
    }
}