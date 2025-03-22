package com.example.service.impl;

import com.example.entity.VoucherDetailEntity;
import com.example.repository.VoucherDetailRepository;
import com.example.service.IVoucherDetailService;
import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class VoucherDetailServiceImp implements IVoucherDetailService {
    @Autowired
    private VoucherDetailRepository voucherDetailRepository;

    @Transactional
    public void saveAll(List<VoucherDetailEntity> voucherDetails) {
        voucherDetailRepository.saveAll(voucherDetails);
    }
    public VoucherDetailEntity findVoucherDetailExist(Long customerId, Long voucherId) {
        return voucherDetailRepository.findVoucherDetailExist(customerId, voucherId);
    }

    @Override
    public List<VoucherDetailEntity> findValidVouchersByCustomerId(Long customerId, LocalDate currentDate) {
        return voucherDetailRepository.findValidVouchersByCustomerId(customerId, currentDate);
    }
}
