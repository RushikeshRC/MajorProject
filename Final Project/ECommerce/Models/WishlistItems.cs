using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ECommerce.Models
{
    public partial class WishlistItems
    {
        [Key]
        public int WishlistItemId { get; set; }
        [ForeignKey("Wishlists")]
        public string WishlistId { get; set; }
        public Wishlist Wishlists { get; set; } 
        public int ProductId { get; set; }
    }
}
