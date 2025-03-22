package com.example.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.UUID;


import com.example.entity.CategoryEntity;
import com.example.service.ICategoryService;
import jakarta.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.example.repository.CategoryRepository;


@Service
public class CategoryServiceImp implements ICategoryService {
	@Autowired
    private CategoryRepository categoryRepository;
	@Autowired
    private ServletContext servletContext;
	
	public List<CategoryEntity> getAllCategories() {
        return categoryRepository.findAll();
    }

    public CategoryEntity getCategoryById(Long id) {
        return categoryRepository.findById(id).orElse(null);
    }

    public void save(CategoryEntity category, MultipartFile file, String uploadDir) throws IOException {
        if (!file.isEmpty()) {
            String fileName = file.getOriginalFilename();
//            String uploadDir = System.getProperty("user.dir") + "/src/main/webapp/resources/category";
//            String uploadDir = "src/main/webapp/resources/category/";
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
            System.out.println(filePath);

            String linkfile = randomFileName;
            category.setImage(linkfile);
            // Lưu tên file hoặc đường dẫn vào cơ sở dữ liệu
//            category.setImage(filePath);
            categoryRepository.save(category);
        }
      
    }

    public Boolean deleteCategory(Long id) {
        Optional<CategoryEntity> categoryOpt = categoryRepository.findById(id);
        if(categoryOpt != null){
            categoryRepository.deleteById(id);
            return true;
        }
       return false;
    }

	
}
