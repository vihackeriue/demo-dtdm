package com.example.entity;

import jakarta.persistence.*;

import java.util.Set;

@Entity
@Table(name = "voucher")
public class VoucherEntity extends BaseEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "voucher_id")
    private Long voucherId;

    @Column(name = "voucher_discount")
    private Long discount;

    @Column(name = "voucher_code")
    private String code;

    @OneToMany(mappedBy = "voucher", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<VoucherDetailEntity> vouchers;
    public Long getVoucherId() {
        return voucherId;
    }

    public void setVoucherId(Long voucherId) {
        this.voucherId = voucherId;
    }

    public Long getDiscount() {
        return discount;
    }

    public void setDiscount(Long discount) {
        this.discount = discount;
    }

    public Set<VoucherDetailEntity> getVouchers() {
        return vouchers;
    }

    public void setVouchers(Set<VoucherDetailEntity> vouchers) {
        this.vouchers = vouchers;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
