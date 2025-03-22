package com.example.controller.api;

import com.example.dto.ShiftDTO;
import com.example.dto.ShiftDetailDTO;
import com.example.dto.UserDTO;
import com.example.dto.input.EmployeeToShiftForm;
import com.example.entity.ShiftDetailEntity;
import com.example.entity.ShiftEntity;
import com.example.service.IShiftService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/manage/manager/shift/api")
public class ShiftAPI {
    @Autowired
    private IShiftService shiftService;
    @GetMapping(value="/detail/{shiftID}/{date}", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<ShiftDetailDTO> listShiftDetailApi(@PathVariable Long shiftID ,
                                                   @PathVariable @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate date){
        List<ShiftDetailDTO> list = new ArrayList<>();
        List<ShiftDetailEntity> shiftDetailEntities = shiftService.getDetailShift(shiftID, date);
        System.out.println(shiftDetailEntities);

        for (ShiftDetailEntity item: shiftDetailEntities) {
            ShiftDetailDTO shiftDetailDTO = new ShiftDetailDTO();
            shiftDetailDTO.setId(item.getId());
            shiftDetailDTO.setDate(item.getDate());

            UserDTO userDTO = new UserDTO();
            userDTO.setUsername(item.getUser().getUsername());

            shiftDetailDTO.setUser(userDTO);
            shiftDetailDTO.setStatus(item.getStatus());
            list.add(shiftDetailDTO);
        }
        return list;
    }
    @PostMapping(value = "/add-employee", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<String> addEmployeeToShift(@RequestBody EmployeeToShiftForm employeeToShiftForm) {
        boolean check = shiftService.addEmployeeToShift(employeeToShiftForm);
        if(check){
            return ResponseEntity.ok("Nhân viên đã được thêm vào ca làm việc.");
        }else {
            return ResponseEntity.badRequest().body("Nhân viên không được thêm vào ca làm việc.");
        }

    }
    @PostMapping(value = "/roll-attendance/{shiftDetailID}", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<String> RollAttendance(@PathVariable Long shiftDetailID){
        boolean check = shiftService.RollAttendance(shiftDetailID);
        if(check){
            System.out.println("Đã điểm danh");
            return ResponseEntity.ok("Nhân viên đã được thêm vào ca làm việc.");
        }else {
            System.out.println("Chưa được điểm danh");
            return ResponseEntity.badRequest().body("Nhân viên không được thêm vào ca làm việc.");
        }
    }
}
