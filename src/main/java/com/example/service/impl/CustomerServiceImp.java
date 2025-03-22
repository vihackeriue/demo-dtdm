package com.example.service.impl;

import com.example.entity.CustomerEntity;
import com.example.entity.OrderEntity;
import com.example.repository.CustomerRepository;
import com.example.service.ICustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerServiceImp implements ICustomerService {
    @Autowired
    private CustomerRepository customerRepository;

    public List<CustomerEntity> getAllCustomers() {
        return customerRepository.findAll();
    }

    public CustomerEntity getCustomerById(Long id) {
        return customerRepository.findById(id).orElse(null);
    }

    public void saveCustomer(CustomerEntity customer) {
        customerRepository.save(customer);

    }

    public void deleteCustomer(Long id) {
        customerRepository.deleteById(id);
    }

    public List<CustomerEntity> findByIds(List<Long> customerIds) {
        return customerRepository.findAllById(customerIds);
    }
    //Phần này nên nằm trong order service imp
    public  List<OrderEntity> findOrdersByCustomerId(Long customerId) {
        return customerRepository.findOrdersByCustomerId(customerId);
    }
}
