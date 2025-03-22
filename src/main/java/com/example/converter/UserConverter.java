package com.example.converter;

import com.example.dto.UserDTO;
import com.example.entity.UserEntity;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
@Component
public class UserConverter {
    // Chuyển đổi từ User entity sang UserDTO
    public UserDTO toDTO(UserEntity user) {
        UserDTO dto = new UserDTO();
        dto.setUserId(user.getUser_id());
        dto.setUsername(user.getUsername());
        dto.setPassword(user.getPassword());
        dto.setFullName(user.getFullName());
        dto.setEmail(user.getEmail());
        dto.setRole(user.getRole());
        dto.setStatus(user.getStatus());
        dto.setPhone(user.getPhone());
        dto.setIDManager(user.getIDManager());
        return dto;
    }

    // Chuyển đổi từ UserDTO sang User entity
    public UserEntity toEntity(UserDTO dto) {
        UserEntity user = new UserEntity();
        user.setUser_id(dto.getUserId());
        user.setUsername(dto.getUsername());
        user.setPassword(dto.getPassword());
        user.setFullName(dto.getFullName());
        user.setEmail(dto.getEmail());
        user.setRole(dto.getRole());
        user.setStatus(dto.getStatus());
        user.setPhone(dto.getPhone());
        user.setIDManager(dto.getIDManager());
        return user;
    }
    public UserEntity toEntity( UserEntity oldUserEntity, UserDTO newUserDT0) {

        oldUserEntity.setUser_id(newUserDT0.getUserId());
        oldUserEntity.setUsername(newUserDT0.getUsername());
        oldUserEntity.setPassword(newUserDT0.getPassword());
        oldUserEntity.setFullName(newUserDT0.getFullName());
        oldUserEntity.setEmail(newUserDT0.getEmail());
        oldUserEntity.setRole(newUserDT0.getRole());
        oldUserEntity.setStatus(newUserDT0.getStatus());
        oldUserEntity.setPhone(newUserDT0.getPhone());
        oldUserEntity.setIDManager(newUserDT0.getIDManager());
        return oldUserEntity;
    }

}
