package com.example.entity;

import jakarta.persistence.*;

import java.util.Set;

@Entity
@Table(name = "material")
public class MaterialEntity extends BaseEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "material_id")
    private Long materialId;

    @Column(name = "material_name",columnDefinition = "VARCHAR(255)")
    private String materialName;
    @Column(name = "Units_of_measurement")
    private String unitsOfMeasurement;
    @Column(name = "quantity")
    private int quantity;

    //    trường liên kết với bảng order_in_details
    @OneToMany(mappedBy = "material", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<OrderInDetailEntity> orderInDetails;
    //    trường liên kết với bảng product_material
    @OneToMany(mappedBy = "material", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<ProductMaterialEntity> products;

    public Long getMaterialId() {
        return materialId;
    }

    public void setMaterialId(Long materialId) {
        this.materialId = materialId;
    }

    public String getMaterialName() {
        return materialName;
    }

    public void setMaterialName(String materialName) {
        this.materialName = materialName;
    }

    public String getUnitsOfMeasurement() {
        return unitsOfMeasurement;
    }

    public void setUnitsOfMeasurement(String unitsOfMeasurement) {
        this.unitsOfMeasurement = unitsOfMeasurement;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Set<OrderInDetailEntity> getOrderInDetails() {
        return orderInDetails;
    }

    public void setOrderInDetails(Set<OrderInDetailEntity> orderInDetails) {
        this.orderInDetails = orderInDetails;
    }

    public Set<ProductMaterialEntity> getProducts() {
        return products;
    }

    public void setProducts(Set<ProductMaterialEntity> products) {
        this.products = products;
    }

    @Override
    public String toString() {
        return "MaterialEntity{" +
                "materialId=" + materialId +
                ", materialName='" + materialName + '\'' +
                ", unitsOfMeasurement=" + unitsOfMeasurement +
                ", quantity=" + quantity +
                '}';
    }
}
