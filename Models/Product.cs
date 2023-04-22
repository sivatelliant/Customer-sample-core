using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Sample_Project.Models
{
    public class Product
    {
        public string ProductId { set; get; }
        public string ProductName { set; get; }
        public decimal UnitPrice { set; get; }
        public string SupplierId { set; get; }
        public bool IsActive { set; get; }
        public DateTime CreatedOn { set; get; }
    }
}
