package com.example.controller.admin;

import com.example.entity.VoucherEntity;
import com.example.service.ICustomerService;
import com.example.service.IVoucherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping("/manage/voucher")
public class VoucherController {
    @Autowired
    private IVoucherService iVoucherService;
    @Autowired
    private ICustomerService iCustomerService;

    @GetMapping("/list")
    public String listVouchers(Model model) {

        model.addAttribute("vouchers", iVoucherService.getAllVouchers());
        return "admin/voucher_list";
    }

    @GetMapping("/new")
    public String showCreateForm(Model model) {
        model.addAttribute("voucher", new VoucherEntity());

        return "admin/voucher_form";
    }

    @PostMapping("/save")
    public String saveVoucher(@ModelAttribute("voucher") VoucherEntity voucher,  RedirectAttributes redirectAttributes
    ) {
        String action = "";
        try {
            if(voucher.getVoucherId() != null){
                action = "Cập nhật";
            }else {
                action = "Thêm";
            }
            iVoucherService.saveVoucher(voucher);

            redirectAttributes.addFlashAttribute("message", action +" mã giảm giá thành công!");
            redirectAttributes.addFlashAttribute("alertClass", "alert-success");
            return "redirect:/manage/voucher/list";
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("message", action +" mã giảm giá không thành công!");
            redirectAttributes.addFlashAttribute("alertClass", "alert-warning");
            return "redirect:/manage/voucher/list";
        }

    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, Model model) {
        VoucherEntity voucher = iVoucherService.getVoucherById(id);
        if (voucher != null) {
            model.addAttribute("voucher", voucher);


        } else {
            return "redirect:/manage/vouchers/list";
        }
        return "admin/voucher_form";
    }



    @GetMapping("/delete/{id}")
    public String deleteVoucher(@PathVariable("id") Long id) {
        iVoucherService.deleteVoucher(id);
        return "redirect:/manage/voucher/list";
    }

}
