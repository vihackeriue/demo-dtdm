package com.example.controller.admin;

import com.example.dto.UserDTO;
import com.example.dto.input.UserChangeProfileForm;
import com.example.entity.ProductEntity;
import com.example.entity.UserEntity;
import com.example.repository.UserRepository;
import com.example.security.SecurityUtils;
import com.example.service.IUserService;
import com.example.service.impl.UserServiceImp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {
    @Autowired
    private IUserService userService;


    @GetMapping("/login")
    public String home(Model model) {
        model.addAttribute("message", "Hello, Thymeleaf!");
        return "login";
    }

    @GetMapping("/logout")
    public String logout() {
        // Nếu cần, thực hiện các hành động khi người dùng yêu cầu đăng xuất
        return "redirect:/login?logout";
    }



    @GetMapping("/accessDenied")
    public String accessDenied(Model model) {
        model.addAttribute("message", "Hello, Thymeleaf!");
        return "login";
    }
    @GetMapping("/manage/manager/employee/list")
    public String listEmployee( Model model ) {


        List<UserEntity> users = userService.findAll();


        model.addAttribute("users", users);
        return "admin/employee_list";
    }

    @GetMapping("/manage/manager/employee/new")
    public String showCreateForm(Model model) {
      model.addAttribute("managers", userService.getAllManager());
        return "admin/employee_form";
    }
    @PostMapping("/manage/manager/employee/new")
    public String addEmployee(@ModelAttribute UserEntity userEntity, RedirectAttributes redirectAttributes) {
        boolean success = userService.addEmployee(userEntity);
        if(success){
            redirectAttributes.addFlashAttribute("message", "Thêm nhân viên thành công!");
            redirectAttributes.addFlashAttribute("alertClass", "alert-success");
            return "redirect:/manage/manager/employee/list";
        }else {
            redirectAttributes.addFlashAttribute("message", "Người dùng đã tồn tại");
            redirectAttributes.addFlashAttribute("alertClass", "alert-warning");
            return "redirect:/manage/manager/employee/new";
        }



    }

    @GetMapping("/manage/manager/employee/delete/{id}")
    public String deleteUser(@PathVariable("id") Long id , RedirectAttributes redirectAttributes) {
        boolean success = userService.deleteUser(id);
        if(success){
            redirectAttributes.addFlashAttribute("message", "Thay đổi thành công!");
            redirectAttributes.addFlashAttribute("alertClass", "alert-success");
        }else {
            redirectAttributes.addFlashAttribute("message", "Thay đổi Không thành công!");
            redirectAttributes.addFlashAttribute("alertClass", "alert-warning");
        }
        return "redirect: /manage/manager/employee/list";
    }
    @GetMapping("/manage/manager/employee/lock/{id}")
    public String LockUser(@PathVariable("id") Long id , RedirectAttributes redirectAttributes) {
        boolean success = userService.lockUser(id);
        if(success){
            redirectAttributes.addFlashAttribute("message", "Thay đổi thành công!");
            redirectAttributes.addFlashAttribute("alertClass", "alert-success");
        }else {
            redirectAttributes.addFlashAttribute("message", "Thay đổi Không thành công!");
            redirectAttributes.addFlashAttribute("alertClass", "alert-warning");
        }
        return "redirect:/manage/manager/employee/list";
    }
    @PostMapping("/manage/manager/employee/edit-role")
    public String editRoleUser(@RequestParam ("userId") Long userId ,@RequestParam("role") int role,  RedirectAttributes redirectAttributes) {
        boolean success = userService.editRoleUser(userId, role);
        if(success){
            redirectAttributes.addFlashAttribute("message", "Thay đổi thành công!");
            redirectAttributes.addFlashAttribute("alertClass", "alert-success");
        }else {
            redirectAttributes.addFlashAttribute("message", "Thay đổi Không thành công!");
            redirectAttributes.addFlashAttribute("alertClass", "alert-warning");
        }
        return "redirect:/manage/manager/employee/list";
    }


    @GetMapping("/manage/profile")
    public String profile(Model model) {
        return "admin/profile";
    }
    @PostMapping("/manage/change-password")
    public String changePassword(@RequestParam("currentPassword") String currentPassword, @RequestParam("newPassword") String newPassword, Model model
            , RedirectAttributes redirectAttributes) {
        String username = SecurityUtils.getPrincipal().getUsername();
        boolean success = userService.changePassword(username, currentPassword, newPassword);

        if (success) {
            System.out.println("Password changed successfully!");
//            model.addAttribute("message", "Password changed successfully!");
//            model.addAttribute("alertClass", "alert-success");
            redirectAttributes.addFlashAttribute("message", "Thay đổi mật khẩu thành công!");
            redirectAttributes.addFlashAttribute("alertClass", "alert-success");
        } else {
            System.out.println("Old password is incorrect.");
//            model.addAttribute("message", "Old password is incorrect.");
//            model.addAttribute("alertClass", "alert-warning");
            redirectAttributes.addFlashAttribute("message", "Mật khẩu cũ không đúng");
            redirectAttributes.addFlashAttribute("alertClass", "alert-warning");
        }

        return "redirect:/manage/profile";  // Chuyển hướng đến danh sách sản phẩm sau khi thêm thành công
    }
    @PostMapping("/manage/change-profile")
    public String changeProfile(@ModelAttribute UserChangeProfileForm userChangeProfileForm, RedirectAttributes redirectAttributes){
        String username = SecurityUtils.getPrincipal().getUsername();
        Boolean success = userService.changeProfile(username,userChangeProfileForm);
        if(success){
            redirectAttributes.addFlashAttribute("alertClass", "alert-success");
            redirectAttributes.addFlashAttribute("message", "Cập nhật tài khoản thành công!");
        }else {
            redirectAttributes.addFlashAttribute("message", "Cập nhật tài khoản không thành công!");
            redirectAttributes.addFlashAttribute("alertClass", "alert-success");
        }

        return "redirect:/manage/profile";
    }


}
