package com.example.service;

import com.example.dto.ProductSalesData;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

public interface IHomeService {
    long countTotalOrders();
    double calculateOrderChangePercentage();
    long countTotalProducts();
    double calculateProductChangePercentage();
    double  countAmount();
    double calculateAmountChangePercentage();

    double totalAmountCurrentWeek();
    double totalAmountLastWeek();

    double totalCostCurrentMonth();
    double calculateCostChangePercentage();
    TreeMap<LocalDateTime, Double> getRevenueForCurrentWeek();

    List<ProductSalesData> getTopSellingProductsForCurrentMonth();

    Map<String, Double> getMonthlyRevenueForCurrentYear();
}