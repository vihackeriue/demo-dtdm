package com.example.repository;

import com.example.dto.ProductSalesData;
import com.example.entity.OrderEntity;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<OrderEntity, Long> {
    List<OrderEntity> findByOrderType(int orderType);
    List<OrderEntity> findOrdersByOrderDateBetween(LocalDateTime orderDate, LocalDateTime orderDate2);
    @Query("SELECT o FROM OrderEntity o WHERE o.orderType = 1")
    List<OrderEntity> findAllByType1();
    @Query("SELECT COUNT(o) FROM OrderEntity o WHERE MONTH(o.orderDate) = MONTH(CURRENT_DATE) AND YEAR(o.orderDate) = YEAR(CURRENT_DATE) AND o.orderType = 0")
    Long countOrdersInCurrentMonth();
    @Query("SELECT COUNT(o) FROM OrderEntity o WHERE MONTH(o.orderDate) = MONTH(CURRENT_DATE) - 1 AND YEAR(o.orderDate) = YEAR(CURRENT_DATE) AND o.orderType = 0")
    Long  countOrdersInLastMonth();
    @Query("SELECT SUM(d.quantity) FROM OrderEntity o JOIN o.orderOutDetails d WHERE MONTH(o.orderDate) = MONTH(CURRENT_DATE) AND YEAR(o.orderDate) = YEAR(CURRENT_DATE) AND o.orderType = 0")
    Long  countProductsInCurrentMonth();
    @Query("SELECT SUM(d.quantity) FROM OrderEntity o JOIN o.orderOutDetails d WHERE MONTH(o.orderDate) = MONTH(CURRENT_DATE) - 1 AND YEAR(o.orderDate) = YEAR(CURRENT_DATE) AND o.orderType = 0")
    Long  countProductsInLastMonth();
    @Query("SELECT SUM(o.orderTotal) FROM OrderEntity o WHERE MONTH(o.orderDate) = MONTH(CURRENT_DATE) AND YEAR(o.orderDate) = YEAR(CURRENT_DATE) AND o.orderType = 0")
    Double totalAmountCurrentMonth();
    @Query("SELECT SUM(o.orderTotal) FROM OrderEntity o WHERE MONTH(o.orderDate) = MONTH(CURRENT_DATE) - 1 AND YEAR(o.orderDate) = YEAR(CURRENT_DATE) AND o.orderType = 0")
    Double totalAmountLastMonth();
    @Query("SELECT SUM(o.orderTotal) FROM OrderEntity o WHERE o.orderDate BETWEEN :startOfWeek AND :endOfWeek AND o.orderType = 0")
    Double totalAmountCurrentWeek(@Param("startOfWeek") LocalDateTime startOfWeek, @Param("endOfWeek") LocalDateTime endOfWeek);
    @Query("SELECT SUM(o.orderTotal) FROM OrderEntity o WHERE o.orderDate BETWEEN :startOfWeek AND :endOfWeek AND o.orderType = 0")
    Double totalAmountLastWeek(@Param("startOfWeek") LocalDateTime startOfWeek, @Param("endOfWeek") LocalDateTime endOfWeek);
    @Query("SELECT SUM(o.orderTotal) FROM OrderEntity o WHERE MONTH(o.orderDate) = MONTH(CURRENT_DATE) AND YEAR(o.orderDate) = YEAR(CURRENT_DATE) AND o.orderType = 1")
    Double totalCostCurrentMonth();
    @Query("SELECT SUM(o.orderTotal) FROM OrderEntity o WHERE MONTH(o.orderDate) = MONTH(CURRENT_DATE) - 1 AND YEAR(o.orderDate) = YEAR(CURRENT_DATE) AND o.orderType = 1")
    Double totalCostLastMonth();
    @Query("SELECT new com.example.dto.ProductSalesData(p.productName, SUM(d.quantity)) " +
            "FROM OrderEntity o " +
            "JOIN o.orderOutDetails d " +
            "JOIN d.product p " +
            "WHERE MONTH(o.orderDate) = MONTH(CURRENT_DATE) " +
            "AND YEAR(o.orderDate) = YEAR(CURRENT_DATE) " +
            "AND o.orderType = 0 " +
            "GROUP BY p.productName " +
            "ORDER BY SUM(d.quantity) DESC")
    List<ProductSalesData> findTopSellingProductsForCurrentMonth();
    @Query("SELECT MONTH(o.orderDate) AS month, SUM(o.orderTotal) AS total " +
            "FROM OrderEntity o " +
            "WHERE YEAR(o.orderDate) = YEAR(CURRENT_DATE) AND o.orderType = 0 " +
            "GROUP BY MONTH(o.orderDate) " +
            "ORDER BY MONTH(o.orderDate)")
    List<Object[]> findMonthlyRevenueForCurrentYear();

}