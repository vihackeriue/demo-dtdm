package com.example.service;

import com.example.entity.CustomerEntity;
import com.example.entity.OrderEntity;

import java.util.List;

public interface ICustomerService {
    List<CustomerEntity> getAllCustomers();
    CustomerEntity getCustomerById(Long id);
    void saveCustomer(CustomerEntity customer);
    void deleteCustomer(Long id);
    List<CustomerEntity> findByIds(List<Long> customerIds);
    List<OrderEntity> findOrdersByCustomerId(Long customerId);
}
