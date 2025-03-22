package com.example.entity;

import com.fasterxml.jackson.annotation.JsonBackReference;
import jakarta.persistence.*;

import java.time.LocalDate;

@Entity
@Table(name = "shifts_detail")
public class ShiftDetailEntity extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long Id;

    @ManyToOne
    @JoinColumn(name = "shift_id", nullable = false)
    @JsonBackReference
    private ShiftEntity shift;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private UserEntity user;

    @Column(name = "date")
    private LocalDate date;

    @Column(name = "status")
    private int status;

    public Long getId() {
        return Id;
    }

    public void setId(Long id) {
        Id = id;
    }



    public UserEntity getUser() {
        return user;
    }

    public void setUser(UserEntity user) {
        this.user = user;
    }

    public ShiftEntity getShift() {
        return shift;
    }

    public void setShift(ShiftEntity shift) {
        this.shift = shift;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
