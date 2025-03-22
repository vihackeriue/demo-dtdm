package com.example.dto;

import java.time.LocalTime;
import java.util.Set;

public class ShiftDTO {
    private Long shiftId;
    private String shiftName;
    private LocalTime startTime;
    private LocalTime endTime;
    private float salary;
    private Set<ShiftDetailDTO> shiftDetail; // DTO cho ShiftDetailEntity

    public Long getShiftId() {
        return shiftId;
    }

    public void setShiftId(Long shiftId) {
        this.shiftId = shiftId;
    }

    public String getShiftName() {
        return shiftName;
    }

    public void setShiftName(String shiftName) {
        this.shiftName = shiftName;
    }

    public LocalTime getStartTime() {
        return startTime;
    }

    public void setStartTime(LocalTime startTime) {
        this.startTime = startTime;
    }

    public LocalTime getEndTime() {
        return endTime;
    }

    public void setEndTime(LocalTime endTime) {
        this.endTime = endTime;
    }

    public float getSalary() {
        return salary;
    }

    public void setSalary(float salary) {
        this.salary = salary;
    }

    public Set<ShiftDetailDTO> getShiftDetail() {
        return shiftDetail;
    }

    public void setShiftDetail(Set<ShiftDetailDTO> shiftDetail) {
        this.shiftDetail = shiftDetail;
    }
}
