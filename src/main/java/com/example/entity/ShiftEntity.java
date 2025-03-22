package com.example.entity;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;

import java.time.LocalTime;
import java.util.Set;

@Entity
@Table(name = "shifts")
public class ShiftEntity extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "shift_id")
    private Long shiftId;
    @Column(name = "shift_name", columnDefinition = "VARCHAR(255)", nullable = false)
    private String shiftName;
    @Column(name = "start_time")
    private LocalTime startTime;
    @Column(name = "end_time")
    private LocalTime endTime;
    @Column(name = "salary")
    private float Salary;
    @OneToMany(fetch = FetchType.EAGER, mappedBy = "shift", cascade = CascadeType.ALL)
    @JsonManagedReference
    private Set<ShiftDetailEntity> shiftDetail;

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
        return Salary;
    }

    public void setSalary(float salary) {
        Salary = salary;
    }

    public Set<ShiftDetailEntity> getShiftDetail() {
        return shiftDetail;
    }

    public void setShiftDetail(Set<ShiftDetailEntity> shiftDetail) {
        this.shiftDetail = shiftDetail;
    }
}
