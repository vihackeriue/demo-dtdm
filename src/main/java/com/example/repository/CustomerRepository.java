package com.example.repository;

import com.example.entity.CustomerEntity;
import com.example.entity.OrderEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CustomerRepository extends JpaRepository<CustomerEntity, Long> {
    @Query("SELECT o FROM OrderEntity o JOIN FETCH o.orderOutDetails od WHERE od.customer.customerId = :customerId")
    List<OrderEntity> findOrdersByCustomerId(@Param("customerId") Long customerId);
}
