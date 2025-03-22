package com.example.controller.api;


import com.example.dto.UserDTO;
import com.example.entity.UserEntity;
import com.example.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/manage/manager/employee/api")
public class EmployeeAPI {
    @Autowired
    private IUserService userService;
    @GetMapping(value="/employee/{shiftID}/{shiftDate}", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<UserDTO> listEmployeeApi(@PathVariable Long shiftID, @PathVariable LocalDate shiftDate) {
        List<UserDTO> listUserDTO = new ArrayList<>();

        List<UserEntity> userEntities = userService.findAllUsersNotInShift(shiftID, shiftDate);

        for (UserEntity item: userEntities) {
            UserDTO userDTO = new UserDTO();
            userDTO.setId(item.getUser_id());
            userDTO.setUsername(item.getUsername());

            listUserDTO.add(userDTO);
        }
        System.out.println(listUserDTO);
        return listUserDTO;


    }
}
