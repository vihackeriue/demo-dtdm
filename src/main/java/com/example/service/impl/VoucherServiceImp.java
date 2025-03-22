package com.example.service.impl;

import com.example.entity.VoucherEntity;
import com.example.repository.VoucherRepository;
import com.example.service.IVoucherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VoucherServiceImp implements IVoucherService {
    @Autowired
    private VoucherRepository voucherRepository;

    public List<VoucherEntity> getAllVouchers() {
        return voucherRepository.findAll();
    }

    public VoucherEntity getVoucherById(Long id) {
        return voucherRepository.findById(id).orElse(null);
    }

    public void saveVoucher(VoucherEntity voucher) {
        voucherRepository.save(voucher);

    }

    public void deleteVoucher(Long id) {
        voucherRepository.deleteById(id);
    }
    public List<VoucherEntity> findVoucherByCustomerId(Long customerId) {
        return voucherRepository.findVoucherByCustomerId(customerId);
    }
}
