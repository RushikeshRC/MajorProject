using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ECommerce.Models
{
    public partial class CustomerOrderDetails
    {
        [Key]
        public int OrderDetailsId { get; set; }
        [ForeignKey("CustomerOrder")]
        public string OrderId { get; set; }
        public CustomerOrders CustomerOrder { get; set; }
        public int ProductId { get; set; }
        public int Quantity { get; set; }
        public decimal Price { get; set; }
    }
}
