using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Sample_Project.Models
{
    public class Supplier
    {
        public string SupplierId { set; get; }
        public string SupplierName { set; get; }
        public decimal CreatedOn { set; get; }
        public bool IsActive { set; get; }
    }
}
