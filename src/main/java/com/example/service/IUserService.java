package com.example.service;

import com.example.dto.UserDTO;
import com.example.dto.input.UserChangeProfileForm;
import com.example.entity.UserEntity;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Bool;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.time.LocalDate;
import java.util.List;

public interface IUserService {

    List<UserEntity> findAll();
    int getTotalItem();


    UserDTO save(UserDTO userDTO);
    List<UserEntity>  getAllManager();
    Boolean changePassword(String username, String oldPassword, String newPassword);

    Boolean changeProfile(String username,UserChangeProfileForm userChangeProfileForm);

    UserEntity findByUsername(String username);

    Boolean deleteUser(Long id);
    Boolean lockUser(Long id);

    Boolean editRoleUser(Long id, int role);

    Boolean addEmployee(UserEntity userEntity);

    List<UserEntity> findAllUsersNotInShift(Long shiftID, LocalDate shiftDate);

}
