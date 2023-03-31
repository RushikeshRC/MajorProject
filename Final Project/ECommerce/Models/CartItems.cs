using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ECommerce.Models
{
    public partial class CartItems
    {
        [Key]
        public int CartItemId { get; set; }
        [ForeignKey("Carts")]
        public string CartId { get; set; }
        public Cart Carts { get; set; }
        public int ProductId { get; set; }
        public int Quantity { get; set; }
    }
}
