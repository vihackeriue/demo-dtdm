package com.example.service;

import com.example.dto.input.EmployeeToShiftForm;
import com.example.entity.ShiftDetailEntity;
import com.example.entity.ShiftEntity;
import com.example.repository.ShiftRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;


public interface IShiftService {
    public List<ShiftEntity> getShifts();
    public ShiftEntity getShift(Long id);
    public ShiftEntity addShift(ShiftEntity shift);
    public void deleteShift(Long id);

    List<ShiftDetailEntity> getDetailShift(Long shiftID, LocalDate localDate);

    Boolean addEmployeeToShift(EmployeeToShiftForm employeeToShiftForm);

    List<ShiftDetailEntity> listShiftToDay(LocalDate localDate);

    List<ShiftDetailEntity> listShiftOfEmployee(String employeeUsername);

    ShiftDetailEntity findShiftDetailByIDCurrentTime(String username, LocalDate date, LocalTime currentTime);

    Boolean RollAttendance(Long shiftDetailID);




}
