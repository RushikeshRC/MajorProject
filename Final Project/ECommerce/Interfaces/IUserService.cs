using ECommerce.Models;
using System.Collections.Generic;

namespace ECommerce.Interfaces
{
    public interface IUserService
    {
        UserMaster AuthenticateUser(UserMaster loginCredentials);
        int RegisterUser(UserMaster userData);
        bool CheckUserAvailabity(string userName);

        List<UserMaster> GetUsers();

        bool IsUserExists(int userId);
    }
}
