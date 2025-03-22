package com.example.dto;

public class ProductSalesData {
    private String productName;
    private Long totalQuantity;

    public ProductSalesData(String productName, Long totalQuantity) {
        this.productName = productName;
        this.totalQuantity = totalQuantity;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Long getTotalQuantity() {
        return totalQuantity;
    }

    public void setTotalQuantity(Long totalQuantity) {
        this.totalQuantity = totalQuantity;
    }
// Getters and setters
}
