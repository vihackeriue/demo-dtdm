package com.example.service.impl;

import com.example.entity.MaterialEntity;
import com.example.entity.OrderEntity;
import com.example.entity.OrderInDetailEntity;
import com.example.repository.MaterialRepository;
import com.example.repository.OrderInDetailRepository;
import com.example.repository.OrderRepository;
import com.example.service.IOrderInService;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.swing.text.html.Option;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Service
public class OrderInServiceImp implements IOrderInService {
    @Autowired
    private OrderInDetailRepository orderInDetailRepository;
    @Autowired
    private OrderRepository orderRepository;;
    @Autowired
    private MaterialRepository materialRepository;

    @Override
    public List<OrderEntity> getAllOrders() {
        return orderRepository.findAllByType1();
    }

    @Override
    public OrderEntity getOrderById(Long id) {
        return orderRepository.findById(id).orElse(null);
    }

    @Override
    public OrderEntity SaveOrder(OrderEntity order) {
        OrderEntity savedOrder = orderRepository.save(order);
        for (OrderInDetailEntity detail : savedOrder.getOrderInDetails()) {
            MaterialEntity material = detail.getMaterial();
        }

        return savedOrder;
    }

    @Override
    public List<OrderInDetailEntity> getAllOrderDetails() {
        return List.of();
    }

    @Override
    public OrderInDetailEntity getOrderDetailById(Long id) {
        return orderInDetailRepository.findById(id).orElse(null);
    }

    @Override
    public void deleteOrderDetailById(Long id) {
        orderInDetailRepository.deleteById(id);
    }

    @Override
    public OrderInDetailEntity saveOrderDetail(OrderInDetailEntity orderInDetail) {
        System.out.println(orderInDetail.getId());
        MaterialEntity material = orderInDetail.getMaterial();
        if(orderInDetail.getId() != null) {
            OrderInDetailEntity orderInDetailEntity = orderInDetailRepository.findById(orderInDetail.getId()).orElse(null);
            int quantity1 = orderInDetailEntity.getQuantity();
            int quantity2 = orderInDetail.getQuantity();
            int quantityChange = quantity1 - quantity2;
            material.setQuantity(material.getQuantity() - quantityChange);
        }
        else {
            material.setQuantity(material.getQuantity() + orderInDetail.getQuantity());
        }

        materialRepository.save(material);

        return  orderInDetailRepository.save(orderInDetail);
    }

    @Override
    public void updateOrderTotal(OrderEntity order) {
        OrderEntity fetchedOrder = orderRepository.findById(order.getOrderId()).orElseThrow(() ->
                new EntityNotFoundException("Order not found"));

        double total = fetchedOrder.getOrderInDetails().stream()
                .mapToDouble(OrderInDetailEntity::getPrice)
                .sum();

        fetchedOrder.setOrderTotal(total);
        orderRepository.save(fetchedOrder);
    }

    @Override
    public void deleteOrderById(Long id) {
        orderRepository.deleteById(id);
    }

    @Override
    public void saveOrderIn(OrderEntity order) {
        order.setOrderType(1);
        double orderTotal = 0.0;

        for (OrderInDetailEntity detail : order.getOrderInDetails()) {
            MaterialEntity material = materialRepository.findById(detail.getMaterial().getMaterialId()).orElse(null);
            detail.setMaterial(material);
            detail.setOrderIn(order);
            orderTotal += detail.getPrice();

            //update material quantity
            int newQuantity = material.getQuantity() + detail.getQuantity();
            material.setQuantity(newQuantity);
            materialRepository.save(material);
        }

        order.setOrderTotal(orderTotal);

        orderRepository.save(order);
    }
}
