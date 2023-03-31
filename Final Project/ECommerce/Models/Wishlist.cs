using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ECommerce.Models
{
    public partial class Wishlist
    {
        [Key]
        public string WishlistId { get; set; }
        [ForeignKey("Users")]
        public int UserId { get; set; }
        public UserMaster Users { get; set; }
        public DateTime DateCreated { get; set; }
    }
}
