package com.example.controller.admin;

import com.example.entity.CustomerEntity;
import com.example.service.ICustomerService;
import com.example.service.IVoucherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping("/manage/customer")
public class CustomerController {
    @Autowired
    private ICustomerService iCustomerService;
    @Autowired
    private IVoucherService iVoucherService;


    @GetMapping("/list")
    public String listCustomers(Model model) {

        model.addAttribute("customers", iCustomerService.getAllCustomers());
        return "admin/customer_list";
    }

    @GetMapping("/new")
    public String showCreateForm(Model model) {
        model.addAttribute("customer", new CustomerEntity());

        return "admin/customer_form";
    }

    @GetMapping("/detail/{id}")
    public String showCreateForm(@PathVariable("id") Long id,Model model) {
        model.addAttribute("orders", iCustomerService.findOrdersByCustomerId(id));
        model.addAttribute("vouchers", iVoucherService.findVoucherByCustomerId(id));
        model.addAttribute("customer",iCustomerService.getCustomerById(id));
        return "admin/customer_detail";
    }

    @PostMapping("/save")
    public String saveProduct(@ModelAttribute("customer") CustomerEntity customer,  RedirectAttributes redirectAttributes
    ) {
        String action = "";
        try {
            if(customer.getCustomerId() != null){
                action = "Cập nhật";
            }else {
                action = "Thêm";
            }
            iCustomerService.saveCustomer(customer);
            redirectAttributes.addFlashAttribute("message", action +" khách hàng thành công!");
            redirectAttributes.addFlashAttribute("alertClass", "alert-success");
        return "redirect:/manage/customer/list";
        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("message", action +" khách hàng không thành công!");
            redirectAttributes.addFlashAttribute("alertClass", "alert-warning");
            return "redirect:/manage/customer/list";
        }

    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, Model model) {
        CustomerEntity customer = iCustomerService.getCustomerById(id);
        if (customer != null) {
            model.addAttribute("customer", customer);


        } else {
            return "redirect:/manage/customers/list";
        }
        return "admin/customer_form";
    }



    @GetMapping("/delete/{id}")
    public String deleteCustomer(@PathVariable("id") Long id) {
        iCustomerService.deleteCustomer(id);
        return "redirect:/manage/customer/list";
    }
}
