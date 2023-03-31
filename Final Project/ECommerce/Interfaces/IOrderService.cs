using ECommerce.Dto;
using System.Collections.Generic;

namespace ECommerce.Interfaces
{
    public interface IOrderService
    {
        void CreateOrder(int userId, OrdersDto orderDetails);
        List<OrdersDto> GetOrderList(int userId);
    }
}
