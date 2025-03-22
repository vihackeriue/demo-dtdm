package com.example.service;

import com.example.entity.OrderEntity;
import com.example.entity.OrderInDetailEntity;

import java.util.List;

public interface IOrderInService {
    public List<OrderEntity> getAllOrders();
    public OrderEntity getOrderById(Long id);
    public OrderEntity SaveOrder(OrderEntity order);
    public List<OrderInDetailEntity> getAllOrderDetails();
    public OrderInDetailEntity getOrderDetailById(Long id);
    public void deleteOrderDetailById(Long id);
    public OrderInDetailEntity saveOrderDetail(OrderInDetailEntity orderInDetail);
    public void deleteOrderById(Long id);
    public void saveOrderIn(OrderEntity orderEntity);
    public void updateOrderTotal(OrderEntity order);
}
