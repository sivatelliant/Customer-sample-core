using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Sample_Project.Models
{
    public class Orders
    {

        public string OrderId { set; get; }
        public string ProductId { set; get; }
        public string OrderStatus { set; get; }
        public int OrderType { set; get; }
        public string OrderBy { set; get; }
        public bool IsActive { set; get; }
        public DateTime OrderedOn { set; get; }
        public DateTime ShippedOn { set; get; }

    }
}
