package com.example.repository;


import com.example.entity.ShiftEntity;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalTime;
import java.util.List;

public interface ShiftRepository extends JpaRepository<ShiftEntity, Long> {
    @Query(value = "SELECT shift_id FROM shifts WHERE " +
            "(CAST(:currentTime AS TIME) BETWEEN start_time AND end_time) " +
            "OR (start_time > end_time AND (CAST(:currentTime AS TIME) >= start_time OR CAST(:currentTime AS TIME) <= end_time))",
            nativeQuery = true)
    List<Long> findShiftIdsByCurrentTime(@Param("currentTime") LocalTime currentTime);
}
