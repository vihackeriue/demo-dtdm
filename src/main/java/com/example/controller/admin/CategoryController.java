package com.example.controller.admin;

import com.example.constant.StringConstrant;
import com.example.entity.CategoryEntity;
import com.example.service.ICategoryService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;

@Controller
@RequestMapping("/manage/category")
public class CategoryController {
    @Autowired
    private ICategoryService iCategoryService;

    @GetMapping("/list")
    public String listCategory(Model model) {
        model.addAttribute("categories", iCategoryService.getAllCategories());
        return "admin/category_list";
    }

    @GetMapping("/new")
    public String showCreateForm(Model model) {
        model.addAttribute("category", new CategoryEntity());
        return "admin/category_form";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") long id, Model model) {
        CategoryEntity category = iCategoryService.getCategoryById(id);
        if (category != null) {
            model.addAttribute("category", category);
            return "admin/category_form";
        } else {
            return "redirect:/manage/category/list";
        }
    }

    @PostMapping(value = "/new")
    public String saveCategory(@ModelAttribute CategoryEntity category,
                               @RequestParam("imageFile") MultipartFile file, HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
        String uploadDir = request.getServletContext().getRealPath(StringConstrant.URL_IMAGE_CATEGORY);


        try {
            iCategoryService.save(category, file, uploadDir);
            redirectAttributes.addFlashAttribute("message", "Thêm danh mục thành công!");
            redirectAttributes.addFlashAttribute("alertClass", "alert-success");
            return "redirect:/manage/category/list";
        } catch (IOException e) {
            e.printStackTrace();
            model.addAttribute("message", "Thêm danh mục không thành công!");
            model.addAttribute("alertClass", "alert-warning");
            return "admin/category_form"; // Tạo trang "error" để hiển thị khi có lỗi
        }

    }
    @GetMapping("/delete/{id}")
    public String deleteCategory(@PathVariable("id") long id, RedirectAttributes redirectAttributes) {
        boolean success = iCategoryService.deleteCategory(id);
        if(success){
            redirectAttributes.addFlashAttribute("message", "Xóa danh mục thành công!");
            redirectAttributes.addFlashAttribute("alertClass", "alert-success");
        }else {
            redirectAttributes.addFlashAttribute("message", "Danh mục không tồn tại");
            redirectAttributes.addFlashAttribute("alertClass", "alert-warning");
        }

        return "redirect:/manage/category/list";
    }


}
