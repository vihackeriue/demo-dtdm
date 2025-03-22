package com.example.service.impl;

import com.example.dto.input.EmployeeToShiftForm;
import com.example.entity.ShiftDetailEntity;
import com.example.entity.ShiftEntity;
import com.example.entity.UserEntity;
import com.example.repository.ShiftDetailRepository;
import com.example.repository.ShiftRepository;
import com.example.repository.UserRepository;
import com.example.service.IShiftService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;
import java.util.Optional;

@Service
public class ShiftServiceImp implements IShiftService {

    @Autowired
    private ShiftRepository shiftRepository;
    @Autowired
    private ShiftDetailRepository shiftDetailRepository;
    @Autowired
    private UserRepository userRepository;

    @Override
    public List<ShiftEntity> getShifts() {
        return shiftRepository.findAll();
    }

    @Override
    public ShiftEntity getShift(Long id) {
        return shiftRepository.findById(id).orElse(null);
    }

    @Override
    public ShiftEntity addShift(ShiftEntity shift) {
        return shiftRepository.save(shift);
    }

    @Override
    public void deleteShift(Long id) {
        shiftRepository.deleteById(id);
    }

    @Override
    public List<ShiftDetailEntity> getDetailShift(Long shiftID, LocalDate localDate) {
        ShiftEntity shift = shiftRepository.getReferenceById(shiftID);
        return shiftDetailRepository.findAllByShiftAndDate(shift, localDate);
    }

    @Override
    public Boolean addEmployeeToShift(EmployeeToShiftForm employeeToShiftForm) {
        ShiftEntity shift = shiftRepository.getReferenceById(employeeToShiftForm.getShiftID());
        UserEntity user = userRepository.findByUserId(employeeToShiftForm.getUserID());

       if(shift != null && user != null){
           ShiftDetailEntity shiftDetail = new ShiftDetailEntity();
           shiftDetail.setShift(shift);
           shiftDetail.setUser(user);
           shiftDetail.setDate(employeeToShiftForm.getDate());
           shiftDetail.setStatus(0);
           shiftDetailRepository.save(shiftDetail);
           return true;
       }
        return false;
    }

    @Override
    public List<ShiftDetailEntity> listShiftToDay(LocalDate localDate) {
        return shiftDetailRepository.findAllByDateOrderByShiftStartTime(localDate);
    }

    @Override
    public List<ShiftDetailEntity> listShiftOfEmployee(String employeeUsername) {
        return shiftDetailRepository.findAllByUser_Username(employeeUsername);
    }

    @Override
    public ShiftDetailEntity findShiftDetailByIDCurrentTime(String username, LocalDate date, LocalTime currentTime) {
        List<Long> shiftIds = shiftRepository.findShiftIdsByCurrentTime(currentTime);
        if (shiftIds.isEmpty()) {
            return null; // Không có ca làm việc phù hợp
        }
        UserEntity user = userRepository.findByUsername(username);
        return shiftDetailRepository.findShiftDetailId(user.getUserId(), shiftIds, date);
    }

    @Override
    public Boolean RollAttendance(Long shiftDetailID) {
        shiftDetailRepository.updateStatusById(shiftDetailID, 1);
        return false;
    }

}
