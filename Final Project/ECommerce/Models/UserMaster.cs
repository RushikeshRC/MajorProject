﻿using ECommerce.Interfaces;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ECommerce.Models
{
    public partial class UserMaster 
    {
        [Key]
        public int UserId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Gender { get; set; }
        [ForeignKey("UserTypes")]
        public int UserTypeId { get; set; }
        public UserType UserTypes { get; set; }
    }
}
