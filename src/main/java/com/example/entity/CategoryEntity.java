package com.example.entity;

import jakarta.persistence.*;

import java.util.Set;

@Entity
@Table(name = "categories")
public class CategoryEntity extends BaseEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "category_id")
    private Long categoryId;
    @Column(name = "category_name",columnDefinition = "VARCHAR(255)", nullable = false)
    private String categoryName;
    @Column(name = "category_description",columnDefinition = "VARCHAR(255)")
    private String categoryDescription;
    @Column(name = "image",length = 255)
    private String image;
    @OneToMany(mappedBy = "category", cascade = CascadeType.ALL)
    private Set<ProductEntity> products;

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getCategoryDescription() {
        return categoryDescription;
    }

    public void setCategoryDescription(String categoryDescription) {
        this.categoryDescription = categoryDescription;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public Set<ProductEntity> getProducts() {
        return products;
    }

    public void setProducts(Set<ProductEntity> products) {
        this.products = products;
    }
}
