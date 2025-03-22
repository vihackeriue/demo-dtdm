package com.example.dto.input;

import java.time.LocalDate;

public class EmployeeToShiftForm {

    private Long id;
    private Long userID;
    private Long shiftID;
    private LocalDate date;

    public Long getUserID() {
        return userID;
    }

    public void setUserID(Long userID) {
        this.userID = userID;
    }

    public Long getShiftID() {
        return shiftID;
    }

    public void setShiftID(Long shiftID) {
        this.shiftID = shiftID;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
