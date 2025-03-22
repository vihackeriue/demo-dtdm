package com.example.dto;

import java.time.LocalDate;

public class VoucherDetailDTO {

    private Long id;
    private VoucherDTO voucher;
    private CustomerDTO customer;
    private int quantity;
    private LocalDate shelfLife;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public VoucherDTO getVoucher() {
        return voucher;
    }

    public void setVoucher(VoucherDTO voucher) {
        this.voucher = voucher;
    }

    public CustomerDTO getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerDTO customer) {
        this.customer = customer;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public LocalDate getShelfLife() {
        return shelfLife;
    }

    public void setShelfLife(LocalDate shelfLife) {
        this.shelfLife = shelfLife;
    }
}
