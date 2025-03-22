package com.example.service;

import java.io.IOException;
import java.util.List;

import com.example.entity.CategoryEntity;
import org.springframework.web.multipart.MultipartFile;




public interface ICategoryService {
	List<CategoryEntity> getAllCategories();
    CategoryEntity getCategoryById(Long id);
    void save(CategoryEntity category, MultipartFile file, String url) throws IOException;
    Boolean deleteCategory(Long id);
}
