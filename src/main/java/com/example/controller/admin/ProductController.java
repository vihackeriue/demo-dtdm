package com.example.controller.admin;

import com.example.constant.StringConstrant;
import com.example.entity.CategoryEntity;
import com.example.entity.ProductEntity;
import com.example.service.ICategoryService;
import com.example.service.IProductService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/manage/product")
public class ProductController {
    @Autowired
    private IProductService iProductService;
    @Autowired
    private ICategoryService iCategoryService;

    @GetMapping("/list")
    public String listProducts(Model model) {

        model.addAttribute("products", iProductService.getAllProducts());
        return "admin/product_list";
    }

    @GetMapping("/new")
    public String showCreateForm(Model model) {
        model.addAttribute("product", new ProductEntity());
        model.addAttribute("categories", iCategoryService.getAllCategories());
        return "admin/product_form";
    }

    @PostMapping("/save")
    public String saveProduct(@ModelAttribute("product") ProductEntity product, @RequestParam("categoryId") Long categoryId,
                              @RequestParam("imageFile") MultipartFile file,
                              HttpServletRequest request,
                              Model model,
                              RedirectAttributes redirectAttributes) {
        String uploadDir = request.getServletContext().getRealPath(StringConstrant.URL_IMAGE_PRODUCT);
        try {


            iProductService.save(product,categoryId, file, uploadDir);

            if(product.getProductId() != null){
                redirectAttributes.addFlashAttribute("message", "Cập nhật sản phẩm thành công!");
                redirectAttributes.addFlashAttribute("alertClass", "alert-success");
            }
            redirectAttributes.addFlashAttribute("message", "Thêm sản phẩm thành công!");
            redirectAttributes.addFlashAttribute("alertClass", "alert-success");

        } catch (Exception e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("message", "Thêm danh mục không thành công!");
            redirectAttributes.addFlashAttribute("alertClass", "alert-warning");
            return "redirect:/manage/product/new";
        }
        return "redirect:/manage/product/list";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, Model model) {
        ProductEntity product = iProductService.getProductById(id);
        if (product != null) {
            model.addAttribute("product", product);
            model.addAttribute("categories", iCategoryService.getAllCategories());

        } else {
            return "redirect:/manage/product/list";
        }
        return "admin/product_form";
    }
    @GetMapping("/delete/{id}")
    public String deleteProduct(@PathVariable("id") Long id) {
        iProductService.deleteProduct(id);
        return "redirect:/manage/product/list";
    }

    //	@PostMapping("/update/{id}")
//	public String updateProduct(@PathVariable("id") int id, @ModelAttribute("product") ProductEntity product,
//			@RequestParam("imageFile") MultipartFile file, @RequestParam("categoryId") int categoryId) {
//		try {
//			CategoryEntity category = iCategoryService.getCategoryById(categoryId);
//			product.setProductId(id);
//			product.setCategory(category);
//			iProductService.saveProduct(product, file);
//		} catch (Exception e) {
//			e.printStackTrace();
//			return "error"; // Trả về trang lỗi nếu có
//		}
//		return "redirect:/products";
//	}






}
