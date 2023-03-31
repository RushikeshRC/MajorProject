using ECommerce.Models;

namespace ECommerce.Dto
{
    public class CartItemDto
    {
        public Book Book { get; set; }
        public int Quantity { get; set; }
    }
}
