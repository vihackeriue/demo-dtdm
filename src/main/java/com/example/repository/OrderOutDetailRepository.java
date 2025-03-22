package com.example.repository;

import com.example.entity.OrderOutDetailEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OrderOutDetailRepository extends JpaRepository<OrderOutDetailEntity, Long> {
}
