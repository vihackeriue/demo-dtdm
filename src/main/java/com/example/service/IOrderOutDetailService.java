package com.example.service;

import com.example.entity.OrderOutDetailEntity;

import java.util.List;

public interface IOrderOutDetailService {

    List<OrderOutDetailEntity> getAllOrderDetail();
    OrderOutDetailEntity getOrderDetailById(Long id);
    void saveOrderDetail(OrderOutDetailEntity orderDetailEntity);
    void deleteOrderDetail(Long id);

}
