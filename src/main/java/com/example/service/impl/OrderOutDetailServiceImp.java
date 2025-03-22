package com.example.service.impl;


import com.example.entity.OrderOutDetailEntity;
import com.example.repository.OrderOutDetailRepository;
import com.example.service.IOrderOutDetailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class OrderOutDetailServiceImp implements IOrderOutDetailService {
    @Autowired
    private OrderOutDetailRepository orderOutDetailRepository;


    @Override
    public List<OrderOutDetailEntity> getAllOrderDetail() {
        return orderOutDetailRepository.findAll();
    }

    @Override
    public OrderOutDetailEntity getOrderDetailById(Long id) {
        return orderOutDetailRepository.findById(id).orElse(null);
    }

    @Override
    public void saveOrderDetail(OrderOutDetailEntity orderDetailEntity) {
        orderOutDetailRepository.save(orderDetailEntity);

    }

    @Override
    public void deleteOrderDetail(Long id) {
        orderOutDetailRepository.deleteById(id);
    }

}
