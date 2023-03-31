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
    [Route("api/[controller]")]
    public class UserController : Controller
    {
        readonly IUserService _userService;
        readonly ICartService _cartService;




        public UserController(IUserService userService, ICartService cartService)
        {
            _userService = userService;
            _cartService = cartService;
        }

        /// Get the count of item in the shopping cart
    
        /// param name="userId"
        /// returns The count of items in shopping cart
        [HttpGet("{userId}")]
        public int Get(int userId)
        {
            int cartItemCount = _cartService.GetCartItemCount(userId);
                return cartItemCount;
        }


        [HttpGet]
        [Authorize(Policy = UserRoles.Admin)]
        public async Task<List<UserMaster>> GetUsers()
        {
            return await Task.FromResult(_userService.GetUsers()).ConfigureAwait(true);
        }

        /// Check the availability of the username
   
        /// param name="userName"
        [HttpGet]
        [Route("validateUserName/{userName}")]
        public bool ValidateUserName(string userName)
        {
            return _userService.CheckUserAvailabity(userName);
        }

   
        /// Register a new user and send email to that registered email
  
        /// param name="userData"
        [HttpPost]
        public void Post([FromBody] UserMaster userData)
        {
            _userService.RegisterUser(userData);

            string MailBody = "<!DOCTYPE html>" +
                       "<html> " +
                           "<body style=\"background -color:#ff7f26;text-align:center;\"> " +
                           "<h1 style=\"color:#051a80;\">Welcome to ECommerce</h1> " +
                           "<h1 style=\"color:#051a80;\">Your Login Credentials ::</h1> " +
                            "<h3>username :" +userData.Username+" </h3>" +
                            "<h3>Password :" + userData.Password + " </h3>" +
                            "<label style=\"color:orange;font-size:100px;border:5px dotted;border-radius:50px\">N</label> " +
                            "</body> " +
                            "</html>";
            string subject = "Welcome to  World.";
            string mailTitle = "Email from .Net Core App";
            string fromEmail = "Trng2@evolvingsols.com";
            string fromEmailPassword = "Cybage@#123";

            //Email & Content 
            MailMessage message = new MailMessage(new MailAddress(fromEmail, mailTitle), new MailAddress(userData.Username));
            message.Subject = subject;
            message.Body = MailBody;
            message.IsBodyHtml = true;


            //Attachment data = new Attachment("D:\\MIni_Project\\images\\post.png");
            //message.Attachments.Add(data);

            SmtpClient smtp = new SmtpClient();

            smtp.Host = "webmail.evolvingsols.com";
            smtp.Port = 25;
            smtp.EnableSsl = false;
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;

            System.Net.NetworkCredential credentials = new System.Net.NetworkCredential();
            credentials.UserName = fromEmail;
            credentials.Password = fromEmailPassword;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = credentials;

            smtp.Send(message);

            ViewBag.EmailSentMessage = "Email sent successfully";

        }


    }
}
