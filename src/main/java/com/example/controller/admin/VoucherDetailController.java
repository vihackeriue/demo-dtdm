package com.example.controller.admin;

import com.example.entity.CustomerEntity;
import com.example.entity.VoucherDetailEntity;
import com.example.entity.VoucherEntity;
import com.example.service.ICustomerService;
import com.example.service.IVoucherDetailService;
import com.example.service.IVoucherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/manage/voucher-detail")
public class VoucherDetailController {
    @Autowired
    private IVoucherService iVoucherService;
    @Autowired
    private ICustomerService iCustomerService;
    @Autowired
    private IVoucherDetailService iVoucherDetailService;
    @GetMapping("/send")
    public String sendVoucher(Model model) {

        model.addAttribute("vouchers", iVoucherService.getAllVouchers());
        model.addAttribute("customers", iCustomerService.getAllCustomers());


        return "admin/voucher_send";
    }
    @PostMapping("/saveVoucherDetails")
    public String saveVoucherDetails(
            @RequestParam("voucherId") Long voucherId,
            @RequestParam("quantity") int quantity,
            @RequestParam("shelfLife") LocalDate shelfLife,
            @RequestParam("customerIds") List<Long> customerIds) {

        // Lấy danh sách CustomerEntity từ customerIds
        List<CustomerEntity> customers = iCustomerService.findByIds(customerIds);
        VoucherEntity voucher = iVoucherService.getVoucherById(voucherId);
        if (voucher == null) {
            throw new RuntimeException("Voucher not found");
        }
        // Tạo danh sách VoucherDetailEntity
        List<VoucherDetailEntity> voucherDetails = new ArrayList<>();
        for (CustomerEntity customer : customers) {
            //Lây voucher detail để xem customer này có mã giảm giá này hay chưa
            VoucherDetailEntity voucherDetail = iVoucherDetailService.findVoucherDetailExist(customer.getCustomerId(),voucherId);
            //Nếu có thì cập nhật lại số lượng và ngày hết hạn
            if (voucherDetail != null) {
                voucherDetail.setShelfLife(shelfLife);
                voucherDetail.setQuantity(quantity);
                voucherDetails.add(voucherDetail);
            } 
            //Ngược lại thì thêm mới
			else {
                VoucherDetailEntity newVoucherDetail1 = new VoucherDetailEntity();
                newVoucherDetail1.setVoucher(voucher);
                newVoucherDetail1.setCustomer(customer);
                newVoucherDetail1.setQuantity(quantity);
                newVoucherDetail1.setShelfLife(shelfLife);
                voucherDetails.add(newVoucherDetail1);
            }
        }
        // Lưu tất cả VoucherDetailEntity vào cơ sở dữ liệu
        iVoucherDetailService.saveAll(voucherDetails);

        return "redirect:/manage/voucher-detail/send";
    }
}
