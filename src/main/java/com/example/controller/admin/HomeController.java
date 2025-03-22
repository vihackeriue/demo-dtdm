package com.example.controller.admin;

import com.example.dto.ProductSalesData;
import com.example.entity.ShiftDetailEntity;
import com.example.entity.ShiftEntity;
import com.example.security.SecurityUtils;
import com.example.service.IHomeService;
import com.example.service.IShiftService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.WeekFields;
import java.util.*;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/manage")
public class HomeController {

    @Autowired
    private IShiftService shiftService;

    @Autowired
    private IHomeService iHomeService;

    @GetMapping("/home")
    public String home(Model model) {
        String fullName = SecurityUtils.getPrincipal().getFullName();
        String username = SecurityUtils.getPrincipal().getUsername();
//        model.addAttribute("message", "Xin chào, "+fullName+"!");
        LocalDate today = LocalDate.now();
        WeekFields weekFields = WeekFields.of(Locale.getDefault());
        // Tính ngày đầu tuần và ngày cuối tuần
        LocalDate startOfWeek = today.with(weekFields.dayOfWeek(), 1);
        LocalDate endOfWeek = today.with(weekFields.dayOfWeek(), 7);
        // Lưu ngày trong tuần vào danh sách
        List<LocalDate> daysOfWeek = new ArrayList<>();
        for (int i = 0; i < 7; i++) {
            daysOfWeek.add(startOfWeek.plusDays(i));
        }
        LocalTime currentTime = LocalTime.now();
        ShiftDetailEntity shiftCurrentOfEmployee = shiftService.findShiftDetailByIDCurrentTime(username, today, currentTime);

        model.addAttribute("daysOfWeek", daysOfWeek);
        model.addAttribute("startOfWeek", startOfWeek);
        model.addAttribute("endOfWeek", endOfWeek);
        model.addAttribute("today", today);
        model.addAttribute("shiftCurrentOfEmployee", shiftCurrentOfEmployee);


        List<ShiftDetailEntity> shiftDetailEntities = shiftService.listShiftOfEmployee(username);
        List<ShiftEntity> shifts = shiftService.getShifts();
        if (!shifts.isEmpty()) {
            model.addAttribute("shifts", shifts);
        }
        model.addAttribute("myShifts", shiftDetailEntities);


        // Thống kê và vẽ các biểu đồ
        Long totalOrders = iHomeService.countTotalOrders();
        double percentageChangeOrders = iHomeService.calculateOrderChangePercentage();
        Long totalProducts = iHomeService.countTotalProducts();
        double percentageChangeProducts = iHomeService.calculateProductChangePercentage();
        double totalAmount = iHomeService.countAmount();
        double percentageChangeAmounts = iHomeService.calculateAmountChangePercentage();

        model.addAttribute("totalAmount", totalAmount);
        model.addAttribute("percentageChangeAmounts", percentageChangeAmounts);
        model.addAttribute("totalProducts", totalProducts);
        model.addAttribute("percentageChangeProducts", percentageChangeProducts);
        model.addAttribute("totalOrders", totalOrders);
        model.addAttribute("percentageChange", percentageChangeOrders);

        // Dữ liệu cho line chart
        TreeMap<LocalDateTime, Double> revenueData = iHomeService.getRevenueForCurrentWeek();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        Map<String, Double> formattedRevenueData = revenueData.entrySet().stream()
                .collect(Collectors.toMap(
                        entry -> entry.getKey().format(formatter),
                        Map.Entry::getValue
                ));

        model.addAttribute("revenueData", formattedRevenueData);
        // Tính doanh thu tiền theo tuần cho line chart
        model.addAttribute("amountCurrentWeek",iHomeService.totalAmountCurrentWeek());
        model.addAttribute("amountLastWeek",iHomeService.totalAmountLastWeek());

        // Dữ liệu cho pie chart
        List<ProductSalesData> salesData = iHomeService.getTopSellingProductsForCurrentMonth();
        model.addAttribute("salesData", salesData);

        // Dữ liệu cho
        Map<String, Double> monthlyRevenue = iHomeService.getMonthlyRevenueForCurrentYear();
        model.addAttribute("monthlyRevenue", monthlyRevenue);

        double totalCosst = iHomeService.totalCostCurrentMonth();
        double percentageChangeCost = iHomeService.calculateCostChangePercentage();

        model.addAttribute("totalCosst", totalCosst);
        model.addAttribute("percentageChangeCost", percentageChangeCost);

        return "admin/home";
    }

    @PostMapping("/roll-attendance")
    public ResponseEntity<?> updateStatus() {
        String username = SecurityUtils.getPrincipal().getUsername();
        LocalDate today = LocalDate.now();



        return ResponseEntity.ok().body("Status updated successfully");
    }
}
