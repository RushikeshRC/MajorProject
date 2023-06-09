﻿namespace ECommerce.Interfaces
{
   public interface IWishlistService
    {
        void ToggleWishlistItem(int userId, int bookId);
        int ClearWishlist(int userId);
        string GetWishlistId(int userId);
    }
}
