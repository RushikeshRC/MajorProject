using ECommerce.Dto;
using ECommerce.Interfaces;
using ECommerce.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Threading.Tasks;

namespace ECommerce.Controllers
{
    [Authorize]
    [Route("api/[controller]")]
    public class CheckOutController : Controller
    {
        readonly IOrderService _orderService;
        readonly ICartService _cartService;
        //readonly IUserService _userService;
        public CheckOutController(IOrderService orderService, ICartService cartService)
        {
            _orderService = orderService;
            _cartService = cartService;
            //_userService = userService;
        }

 
        /// Checkout from shopping cart
        /// param name="userId"
        /// param name="checkedOutItems"
  
        [HttpPost("{userId}")]
        public int Post(int userId, [FromBody] OrdersDto checkedOutItems)
        {
            _orderService.CreateOrder(userId, checkedOutItems);
            return _cartService.ClearCart(userId);
        }
    }
}
