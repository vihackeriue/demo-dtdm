package com.example.entity;

import jakarta.persistence.*;

import java.util.Set;

@Entity
@Table(name = "products")
public class ProductEntity extends BaseEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "product_id")
    private Long productId;
    @Column(name = "product_name",columnDefinition = "VARCHAR(255)", nullable = false)
    private String productName;
    @Column(name = "price")
    private double price;
    @Column(name = "description",columnDefinition = "VARCHAR(255)" )
    private String description;
    @Column(name = "total_quality")
    private int totalQuality = 0;
    @Column(name = "image")
    private String image;
    @ManyToOne
    @JoinColumn(name = "category_id")
    private CategoryEntity category;
    //    trường liên kết với bảng order_out_detail
    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL,fetch = FetchType.LAZY)
    private Set<OrderOutDetailEntity> orderOutDetails;
    //    trường liên kết với bảng material
    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<ProductMaterialEntity> materials;

    public Long getProductId() {
        return productId;
    }

    public void setProductId(Long productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public CategoryEntity getCategory() {
        return category;
    }

    public void setCategory(CategoryEntity category) {
        this.category = category;
    }

    public Set<OrderOutDetailEntity> getOrderOutDetails() {
        return orderOutDetails;
    }

    public void setOrderOutDetails(Set<OrderOutDetailEntity> orderOutDetails) {
        this.orderOutDetails = orderOutDetails;
    }

    public Set<ProductMaterialEntity> getMaterials() {
        return materials;
    }

    public void setMaterials(Set<ProductMaterialEntity> materials) {
        this.materials = materials;
    }

    public int getTotalQuality() {
        return totalQuality;
    }

    public void setTotalQuality(int totalQuality) {
        this.totalQuality = totalQuality;
    }
}
