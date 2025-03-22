package com.example.service.impl;

import com.example.entity.CategoryEntity;
import com.example.entity.ProductEntity;
import com.example.repository.ProductRepository;
import com.example.service.ICategoryService;
import com.example.service.IProductService;
import jakarta.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Service
public class ProductServiceImp implements IProductService {
	@Autowired
    private ProductRepository productRepository;
	@Autowired
    private ServletContext servletContext;
    @Autowired
    private ICategoryService categoryService;
	
	public List<ProductEntity> getAllProducts() {
        return productRepository.findAll();
    }

    public ProductEntity getProductById(Long id) {
        return productRepository.findById(id).orElse(null);
    }
    @Override
    public void save(ProductEntity product, Long categoryId, MultipartFile file, String uploadDir) throws IOException {

        CategoryEntity category = categoryService.getCategoryById(categoryId);
        if(category == null){
            System.out.println("Không tìm thấy danh mục!");
            new Exception("Không tìm thấy danh mục!");
            return;
        }
        product.setCategory(category);
        // Kiểm tra nếu file không rỗng
        if (!file.isEmpty()) {
            String fileName = file.getOriginalFilename();
            String extension = "";

            // Tạo thư mục nếu chưa tồn tại
            File dir = new File(uploadDir);
            if (!dir.exists()) {
                dir.mkdirs();
            }
            if (fileName != null && fileName.contains(".")) {
                extension = fileName.substring(fileName.lastIndexOf("."));
            }

            // Tạo tên file ngẫu nhiên duy nhất
            String randomFileName = UUID.randomUUID().toString() + extension;
            // Tạo đường dẫn đầy đủ để lưu file
            String filePath = uploadDir + File.separator + randomFileName;
            file.transferTo(new File(filePath));
            
            // Lưu tên file hoặc đường dẫn vào cơ sở dữ liệu
            product.setImage(randomFileName);
        } else {
            // Nếu không có file mới, giữ lại hình ảnh cũ nếu có
            ProductEntity existingProduct = productRepository.findById(product.getProductId()).orElse(null);
            if (existingProduct != null) {
                product.setImage(existingProduct.getImage());
            }
        }
        product.setCategory(category);
        // Lưu hoặc cập nhật sản phẩm
        productRepository.save(product);
    }

    public void deleteProduct(Long id) {
        productRepository.deleteById(id);
    }
}
