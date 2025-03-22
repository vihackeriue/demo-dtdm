package com.example.entity;

import jakarta.persistence.*;

import java.time.LocalDate;

@Entity
@Table(name = "voucher_detail")
public class VoucherDetailEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "voucher_id", nullable = false)
    private VoucherEntity voucher;

    @ManyToOne
    @JoinColumn(name = "customer_id", nullable = false)
    private CustomerEntity customer;

    @Column(name = "voucher_quantity", nullable = false)
    private int quantity;

    @Column(name = "shelf_life")
    private LocalDate shelfLife;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public VoucherEntity getVoucher() {
        return voucher;
    }

    public void setVoucher(VoucherEntity voucher) {
        this.voucher = voucher;
    }

    public CustomerEntity getCustomer() {
        return customer;
    }

    public void setCustomer(CustomerEntity customer) {
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
