package com.example.entity;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;

import java.util.Set;

@Entity
@Table(name = "users")
public class UserEntity extends BaseEntity{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private Long userId;
    @Column(name = "username",length = 20, nullable = false, unique = true)
    private String username;
    @Column(name = "password",length = 255, nullable = false)
    private String password;
    @Column(name = "full_name",columnDefinition = "VARCHAR(255)")
    private String fullName;
    @Column(name = "email",length = 50, unique = true)
    private String email;
    @Column(name = "role", nullable = false)
    private int role;
    @Column(name = "status", nullable = false)
    private int status;
    @Column(name = "phone", length = 15)
    private String phone;
    @Column(name = "manager_id")
    private Long IDManager;

    @OneToMany(mappedBy = "user", fetch = FetchType.EAGER)
    private Set<OrderEntity> orderDetail;
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "user", cascade = CascadeType.ALL)
    @JsonManagedReference
    private Set<ShiftDetailEntity> shiftDetail;

    public Long getUser_id() {
        return userId;
    }

    public void setUser_id(Long user_id) {
        this.userId = user_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }


    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Long getIDManager() {
        return IDManager;
    }

    public void setIDManager(Long IDManager) {
        this.IDManager = IDManager;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Set<OrderEntity> getOrderDetail() {
        return orderDetail;
    }

    public void setOrderDetail(Set<OrderEntity> orderDetail) {
        this.orderDetail = orderDetail;
    }

    public Set<ShiftDetailEntity> getShiftDetail() {
        return shiftDetail;
    }

    public void setShiftDetail(Set<ShiftDetailEntity> shiftDetail) {
        this.shiftDetail = shiftDetail;
    }
}
