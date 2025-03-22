package com.example.dto;

import com.example.entity.VoucherDetailEntity;

import java.util.Set;

public class VoucherDTO {
    private Long voucherId;
    private Long discount;
    private String code;
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

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Set<VoucherDetailEntity> getVouchers() {
        return vouchers;
    }

    public void setVouchers(Set<VoucherDetailEntity> vouchers) {
        this.vouchers = vouchers;
    }
}
