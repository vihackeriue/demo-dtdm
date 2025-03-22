package com.example.controller.api;

import com.example.dto.VoucherDTO;
import com.example.dto.VoucherDetailDTO;
import com.example.entity.VoucherDetailEntity;
import com.example.entity.VoucherEntity;
import com.example.service.IVoucherDetailService;
import com.example.service.IVoucherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/manage/voucher/api")
public class VoucherAPI {
    @Autowired
    IVoucherDetailService voucherDetailService;
    @GetMapping(value="/list/{customerID}", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<VoucherDetailDTO> getVouchers(@PathVariable("customerID") Long customerId) {
        LocalDate currentDate = LocalDate.now();
        List<VoucherDetailDTO> results = new ArrayList<>();
        List<VoucherDetailEntity> voucherEntities = voucherDetailService.findValidVouchersByCustomerId(customerId, currentDate);

        for (VoucherDetailEntity item : voucherEntities){
            VoucherDetailDTO voucherDetailDTO = new VoucherDetailDTO();
//            voucherDetailDTO.getCustomer().setCustomerId(item.getCustomer().getCustomerId());

            VoucherDTO voucherDTO = new VoucherDTO();
            voucherDTO.setVoucherId(item.getVoucher().getVoucherId());
            voucherDTO.setDiscount(item.getVoucher().getDiscount());
            voucherDTO.setCode(item.getVoucher().getCode());

            voucherDetailDTO.setVoucher(voucherDTO);
            voucherDetailDTO.setQuantity(item.getQuantity());
            voucherDetailDTO.setShelfLife(item.getShelfLife());

            results.add(voucherDetailDTO);
        }
        return results;
    }
}
