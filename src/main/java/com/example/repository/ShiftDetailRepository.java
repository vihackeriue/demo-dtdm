package com.example.repository;

import com.example.entity.ShiftDetailEntity;
import com.example.entity.ShiftEntity;
import jakarta.transaction.Transactional;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

public interface ShiftDetailRepository extends JpaRepository<ShiftDetailEntity, Long> {
    List<ShiftDetailEntity> findAllByShiftAndDate(ShiftEntity shift, LocalDate date);
    @Query("SELECT sd FROM ShiftDetailEntity sd WHERE sd.date = :date ORDER BY sd.shift.startTime ASC")
    List<ShiftDetailEntity> findAllByDateOrderByShiftStartTime(LocalDate date);

    List<ShiftDetailEntity> findAllByUser_Username(String username);

    @Query("SELECT sd FROM ShiftDetailEntity sd WHERE sd.user.userId = :userId " +
            "AND sd.shift.shiftId IN :shiftIds " +
            "AND sd.date = :date")
    ShiftDetailEntity findShiftDetailId(@Param("userId") Long userId,
                           @Param("shiftIds") List<Long> shiftIds,
                           @Param("date") LocalDate date);

    @Modifying
    @Transactional
    @Query("UPDATE ShiftDetailEntity sd SET sd.status = :status WHERE sd.Id = :id")
    void updateStatusById(@Param("id") Long id, @Param("status") int status);
}
