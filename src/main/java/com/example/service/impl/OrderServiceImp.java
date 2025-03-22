package com.example.service.impl;

import com.example.entity.OrderEntity;
import com.example.repository.OrderRepository;
import com.example.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImp implements IOrderService {
    @Autowired
    private OrderRepository orderRepository;

    @Override
    public List<OrderEntity> getOrdersByOrderType(int orderType) {
        return orderRepository.findByOrderType(orderType);
    }

    @Override
    public List<OrderEntity> getAllOrders() {
        return orderRepository.findAll();
    }

    @Override
    public OrderEntity getOrderById(Long id) {
        return orderRepository.findById(id).orElse(null);
    }

    @Override
    public void saveOrder(OrderEntity orderEntity) {
        orderRepository.save(orderEntity);

    }

    @Override
    public void deleteOrder(Long id) {
        orderRepository.deleteById(id);

    }
}
