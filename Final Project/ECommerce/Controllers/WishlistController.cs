using ECommerce.Interfaces;
using ECommerce.Models;
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
    public class WishlistController : Controller
    {
        readonly IWishlistService _wishlistService;
        readonly IBookService _bookService;
        readonly IUserService _userService;

        public WishlistController(IWishlistService wishlistService, IBookService bookService, IUserService userService)
        {
            _wishlistService = wishlistService;
            _bookService = bookService;
            _userService = userService;
        }

        /// Get the list of items in the Wishlist
       
        /// param name="userId"
        /// returns All the items in the Wishlist
        [HttpGet("{userId}")]
        public async Task<List<Book>> Get(int userId)
        {
            return await Task.FromResult(GetUserWishlist(userId)).ConfigureAwait(true);
        }

   
        /// Toggle the items in Wishlist. If item doesn't exists, it will be added to the Wishlist else it will be removed.

        /// param name="userId"
        /// param name="bookId"
        /// returns All the items in the Wishlist
        [Authorize]
        [HttpPost]
        [Route("ToggleWishlist/{userId}/{bookId}")]
        public async Task<List<Book>> Post(int userId, int bookId)
        {
            _wishlistService.ToggleWishlistItem(userId, bookId);
            return await Task.FromResult(GetUserWishlist(userId)).ConfigureAwait(true);
        }

        /// Clear the Wishlist
     
        /// param name="userId"
        [Authorize]
        [HttpDelete("{userId}")]
        public int Delete(int userId)
        {
            return _wishlistService.ClearWishlist(userId);
        }

        List<Book> GetUserWishlist(int userId)
        {
            bool user = _userService.IsUserExists(userId);
            if (user)
            {
                string Wishlistid = _wishlistService.GetWishlistId(userId);
                return _bookService.GetBooksAvailableInWishlist(Wishlistid);
            }
            else
            {
                return new List<Book>();
            }

        }
    }
}
