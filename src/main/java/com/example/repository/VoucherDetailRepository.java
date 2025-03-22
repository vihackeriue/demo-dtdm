package com.example.repository;

import com.example.dto.VoucherDetailDTO;
import com.example.entity.VoucherDetailEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;

@Repository
public interface VoucherDetailRepository extends JpaRepository<VoucherDetailEntity, Long> {
    @Query("SELECT v FROM VoucherDetailEntity v  WHERE v.customer.customerId = :customerId AND v.voucher.voucherId = :voucherId")
    VoucherDetailEntity findVoucherDetailExist(@Param("customerId") Long customerId, @Param("voucherId") Long voucherId);

    @Query("SELECT v FROM VoucherDetailEntity v WHERE v.customer.customerId = :customerId " +
            "AND v.shelfLife >= :currentDate " +
            "AND v.quantity > 0")
    List<VoucherDetailEntity> findValidVouchersByCustomerId(@Param("customerId") Long customerId,
                                                            @Param("currentDate") LocalDate currentDate);
}
