package com.example.repository;



import com.example.entity.VoucherEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface VoucherRepository extends JpaRepository<VoucherEntity, Long> {
    @Query("SELECT v FROM VoucherEntity v JOIN FETCH v.vouchers vd WHERE vd.customer.customerId = :customerId")
    List<VoucherEntity> findVoucherByCustomerId(@Param("customerId") Long customerId);
}
