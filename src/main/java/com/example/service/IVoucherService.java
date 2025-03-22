package com.example.service;

import com.example.entity.VoucherEntity;

import java.util.List;

public interface IVoucherService {
    List<VoucherEntity> getAllVouchers();
    VoucherEntity getVoucherById(Long id);
    void saveVoucher(VoucherEntity voucher);
    void deleteVoucher(Long id);
    List<VoucherEntity> findVoucherByCustomerId(Long customerId);
}
