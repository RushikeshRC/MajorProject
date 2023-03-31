using ECommerce.Dto;
using ECommerce.Interfaces;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ECommerce.Controllers
{
    [Route("api/[controller]")]
    public class ShoppingCartController : Controller
    {
        readonly ICartService _cartService;
        readonly IBookService _bookService;

        public ShoppingCartController(ICartService cartService, IBookService bookService)
        {
            _cartService = cartService;
            _bookService = bookService;
        }

       
        /// Get the shopping cart for a user upon Login. If the user logs in for the first time, creates the shopping cart.
    
        /// param name="oldUserId"
        /// param name="newUserId"
        /// returns The count of items in shopping cart
        [Authorize]
        [HttpGet]
        [Route("SetShoppingCart/{oldUserId}/{newUserId}")]
        public int Get(int oldUserId, int newUserId)
        {
            _cartService.MergeCart(oldUserId, newUserId);
            return _cartService.GetCartItemCount(newUserId);
        }


        /// Get the list of items in the shopping cart

        /// param name="userId"

        [HttpGet("{userId}")]
        public async Task<List<CartItemDto>> Get(int userId)
        {
            string cartid = _cartService.GetCartId(userId);
            return await Task.FromResult(_bookService.GetBooksAvailableInCart(cartid)).ConfigureAwait(true);
        }


        /// Add a single item into the shopping cart. If the item already exists, increase the quantity by one

        /// param name="userId"
        /// param name="bookId"
        /// returns Count of items in the shopping cart
        [HttpPost]
        [Route("AddToCart/{userId}/{bookId}")]
        public int Post(int userId, int bookId)
        {
            _cartService.AddBookToCart(userId, bookId);
            return _cartService.GetCartItemCount(userId);
        }

        
        /// Reduces the quantity by one for an item in shopping cart
     
        /// param name="userId"
        /// <param name="bookId"
        [HttpPut("{userId}/{bookId}")]
        public int Put(int userId, int bookId)
        {
            _cartService.DeleteOneCartItem(userId, bookId);
            return _cartService.GetCartItemCount(userId);
        }


        /// Delete a single item from the cart 
      
        /// param name="userId"
        /// param name="bookId"
        [HttpDelete("{userId}/{bookId}")]
        public int Delete(int userId, int bookId)
        {
            _cartService.RemoveCartItem(userId, bookId);
            return _cartService.GetCartItemCount(userId);
        }

    
        /// Clear the shopping cart

        /// param name="userId"
        [HttpDelete("{userId}")]
        public int Delete(int userId)
        {
            return _cartService.ClearCart(userId);
        }
    }
}
