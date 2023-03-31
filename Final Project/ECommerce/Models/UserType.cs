using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace ECommerce.Models
{
    public partial class UserType
    {
        internal static int userTypeId;

        [Key]
        public int UserTypeId { get; set; }
        public string UserTypeName { get; set; }
    }
}
