package com.example.service.impl;

import com.example.dto.ProductSalesData;
import com.example.entity.OrderEntity;
import com.example.repository.OrderRepository;
import com.example.service.IHomeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.temporal.TemporalAdjusters;
import java.util.*;

import java.util.stream.Collectors;

@Service
public class HomeServiceImpl implements IHomeService {
    @Autowired
    private OrderRepository orderRepository;


    @Override
    public long countTotalOrders() {
        Long count = orderRepository.countOrdersInCurrentMonth();
        return count != null ? count : 0;
    }

    @Override
    public double calculateOrderChangePercentage() {
        Long  currentMonthOrders = orderRepository.countOrdersInCurrentMonth();
        Long  lastMonthOrders = orderRepository.countOrdersInLastMonth();

        currentMonthOrders = currentMonthOrders != null ? currentMonthOrders : 0;
        lastMonthOrders = lastMonthOrders != null ? lastMonthOrders : 0;
        Double percentageChange = 0.0;
        if (lastMonthOrders > 0) {
            percentageChange = ((double) (currentMonthOrders - lastMonthOrders) / lastMonthOrders) * 100;
            // Làm tròn phần trăm đến 1 chữ số sau dấu thập phân
            percentageChange = Math.round(percentageChange * 10.0) / 10.0;
        }
        return percentageChange;
    }


    @Override
    public long countTotalProducts() {
        Long count =  orderRepository.countProductsInCurrentMonth();
        return count != null ? count : 0;
    }

    @Override
    public double calculateProductChangePercentage() {
        Long currentMonthProducts = orderRepository.countProductsInCurrentMonth();
        Long lastMonthProducts = orderRepository.countProductsInLastMonth();
        currentMonthProducts = currentMonthProducts != null ? currentMonthProducts : 0;
        lastMonthProducts = lastMonthProducts != null ? lastMonthProducts : 0;
        Double percentageChange = 0.0;
        if (lastMonthProducts > 0) {
            percentageChange = ((double) (currentMonthProducts - lastMonthProducts) / lastMonthProducts) * 100;
            // Làm tròn phần trăm đến 3 chữ số sau dấu thập phân
            percentageChange = Math.round(percentageChange * 10.0) / 10.0;
        }
        return percentageChange;
    }

    @Override
    public double countAmount() {
        Double amount = orderRepository.totalAmountCurrentMonth();
        amount = amount != null ? amount : 0;
        return Math.round(amount * 10.0) / 10.0;
    }

    @Override
    public double calculateAmountChangePercentage() {
        Double current = orderRepository.totalAmountCurrentMonth();
        Double lastMonth = orderRepository.totalAmountLastMonth();
        current = current != null ? current : 0;
        lastMonth = lastMonth != null ? lastMonth : 0;
        Double percentageChange = 0.0;
        if (lastMonth > 0) {
            percentageChange = ((current - lastMonth) / lastMonth) * 100;
            // Làm tròn phần trăm đến 3 chữ số sau dấu thập phân
            percentageChange = Math.round(percentageChange * 10.0) / 10.0;
        }
        return percentageChange;
    }
    @Override
    public double totalCostCurrentMonth() {
        Double amount = orderRepository.totalCostCurrentMonth();
        amount = amount != null ? amount : 0;
        return Math.round(amount * 10.0) / 10.0;
    }

    @Override
    public double calculateCostChangePercentage() {
        Double current = orderRepository.totalCostCurrentMonth();
        Double lastMonth = orderRepository.totalCostLastMonth();
        current = current != null ? current : 0;
        lastMonth = lastMonth != null ? lastMonth : 0;
        Double percentageChange = 0.0;
        if (lastMonth > 0) {
            percentageChange = ((current - lastMonth) / lastMonth) * 100;
            // Làm tròn phần trăm đến 3 chữ số sau dấu thập phân
            percentageChange = Math.round(percentageChange * 10.0) / 10.0;
        }
        return percentageChange;
    }

    @Override
    public double totalAmountCurrentWeek() {
        LocalDate today = LocalDate.now();
        LocalDate startOfWeek = today.with(TemporalAdjusters.previousOrSame(DayOfWeek.MONDAY));
        LocalDate endOfWeek = today.with(TemporalAdjusters.nextOrSame(DayOfWeek.SUNDAY));
        LocalDateTime startOfWeekDateTime = startOfWeek.atStartOfDay();
        LocalDateTime endOfWeekDateTime = endOfWeek.atTime(LocalTime.MAX);

        // Sử dụng Optional để xử lý trường hợp null
        Double totalAmount = Optional.ofNullable(orderRepository.totalAmountCurrentWeek(startOfWeekDateTime, endOfWeekDateTime))
                .orElse(0.0);
        totalAmount = Math.round(totalAmount * 1000.0) / 1000.0;
        return totalAmount;
    }

    @Override
    public double totalAmountLastWeek() {
        LocalDate today = LocalDate.now();
        LocalDate startOfLastWeek = today.minusWeeks(1).with(TemporalAdjusters.previousOrSame(DayOfWeek.MONDAY));
        LocalDate endOfLastWeek = today.minusWeeks(1).with(TemporalAdjusters.nextOrSame(DayOfWeek.SUNDAY));
        LocalDateTime startOfLastWeekDateTime = startOfLastWeek.atStartOfDay();
        LocalDateTime endOfLastWeekDateTime = endOfLastWeek.atTime(LocalTime.MAX);

        // Sử dụng Optional để xử lý trường hợp null
        Double totalAmount = Optional.ofNullable(orderRepository.totalAmountLastWeek(startOfLastWeekDateTime, endOfLastWeekDateTime))
                .orElse(0.0);
        totalAmount = Math.round(totalAmount * 1000.0) / 1000.0;
        return totalAmount;
    }


    @Override
    public TreeMap<LocalDateTime, Double> getRevenueForCurrentWeek() {
        // Xác định ngày hiện tại và đầu tuần
        LocalDateTime now = LocalDateTime.now();
        LocalDateTime startOfWeek = now.with(DayOfWeek.MONDAY).toLocalDate().atStartOfDay();
        LocalDateTime endOfWeek = now.with(DayOfWeek.SUNDAY).toLocalDate().atTime(LocalTime.MAX);
        List<OrderEntity> orders = orderRepository.findOrdersByOrderDateBetween(startOfWeek, endOfWeek);

        return orders.stream()
                .filter(order -> order.getOrderType() == 0) // Chỉ lấy orderType = 0 nếu cần
                .collect(Collectors.groupingBy(
                        order -> order.getOrderDate().toLocalDate().atStartOfDay(),
                        TreeMap::new,
                        Collectors.summingDouble(OrderEntity::getOrderTotal)
                ));
    }

    @Override
    public List<ProductSalesData> getTopSellingProductsForCurrentMonth() {
        return orderRepository.findTopSellingProductsForCurrentMonth();
    }

    @Override
    public Map<String, Double> getMonthlyRevenueForCurrentYear() {
        List<Object[]> results = orderRepository.findMonthlyRevenueForCurrentYear();
        Map<String, Double> monthlyRevenue = new LinkedHashMap<>();

        // Initialize all months with 0 revenue
        for (int i = 1; i <= 12; i++) {
            monthlyRevenue.put(String.format("%02d", i), 0.0);
        }

        // Update with actual data
        for (Object[] result : results) {
            String month = String.format("%02d", result[0]);
            Double total = (Double) result[1];
            monthlyRevenue.put(month, total);
        }

        return monthlyRevenue;
    }

}
