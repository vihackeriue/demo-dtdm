package com.example.service.impl;

import com.example.converter.UserConverter;
import com.example.dto.UserDTO;
import com.example.dto.input.UserChangeProfileForm;
import com.example.entity.UserEntity;
import com.example.repository.UserRepository;
import com.example.security.SecurityUtils;
import com.example.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class UserServiceImp implements IUserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private UserConverter userConverter;

    @Autowired
    private PasswordEncoder bcryptEncoder;
    @Override
    public List<UserEntity> findAll() {

        return userRepository.findAll();
    }

    @Override
    public int getTotalItem() {
        return (int) userRepository.count();
    }



    @Override
    public UserDTO save(UserDTO userDTO) {
        UserEntity userEntity = new UserEntity();
        if(userDTO.getId() != null){
            Optional<UserEntity> optionalGenre = userRepository.findById(userDTO.getId());
            if (optionalGenre.isPresent()) {
//                get data before update
                UserEntity oldDataEntity = optionalGenre.get();
                userEntity = userConverter.toEntity(oldDataEntity, userDTO);
            }else {
            }
        }else {
            userEntity = userConverter.toEntity(userDTO);
        }

//        save in database
        userEntity = userRepository.save(userEntity);

        return userConverter.toDTO(userEntity);
    }

    @Override
    public List<UserEntity> getAllManager() {
        return userRepository.findAllByRole(1);
    }

    @Override
    public Boolean changePassword(String username, String oldPassword, String newPassword) {
        UserEntity userEntity = userRepository.findByUsername(username);
        System.out.println("pass 1:"+ userEntity.getPassword());
        System.out.println("pass 2:"+ bcryptEncoder.encode(oldPassword));
        if(userEntity != null && bcryptEncoder.matches(oldPassword, userEntity.getPassword())){
            userEntity.setPassword(bcryptEncoder.encode(newPassword));
            System.out.println(bcryptEncoder.encode(newPassword));
            userRepository.save(userEntity);
            return true;

        }
        return false;
    }

    @Override
    public Boolean changeProfile(String username,UserChangeProfileForm userChangeProfileForm) {
        UserEntity userEntity = userRepository.findByUsername(username);
        if(userEntity != null){
            userEntity.setPhone(userChangeProfileForm.getPhone());
            userEntity.setEmail(userChangeProfileForm.getEmail());
            userEntity.setFullName(userChangeProfileForm.getFullName());

            userRepository.save(userEntity);
            SecurityUtils.getPrincipal().setEmail(userChangeProfileForm.getEmail());
            SecurityUtils.getPrincipal().setFullName(userChangeProfileForm.getFullName());
            SecurityUtils.getPrincipal().setPhone(userChangeProfileForm.getPhone());
            return true;
        }else{
            return false;
        }

    }

    @Override
    public UserEntity findByUsername(String username) {
        return userRepository.findByUsername(username);
    }

    @Override
    public Boolean deleteUser(Long id) {
        if(userRepository.findByUserId(id) != null){
            userRepository.deleteById(id);
            return true;
        }
        return false;
    }

    @Override
    public Boolean lockUser(Long id) {
        UserEntity userEntity = userRepository.findByUserId(id);
        if(userRepository.findByUserId(id) != null){
            userEntity.setStatus(0);
            userRepository.save(userEntity);
            return true;
        }
        return null;
    }

    @Override
    public Boolean editRoleUser(Long id, int role) {
        UserEntity userEntity = userRepository.findByUserId(id);
        if(userRepository.findByUserId(id) != null){
            userEntity.setRole(role);
            userRepository.save(userEntity);
            return true;
        }
        return null;
    }

    @Override
    public Boolean addEmployee(UserEntity userEntity) {
        UserEntity userCheck = userRepository.findByEmailOrEmail(userEntity.getUsername(), userEntity.getUsername());
        if(userCheck == null){
            userRepository.save(userEntity);
            return true;
        }

        return false;
    }

    @Override
    public List<UserEntity> findAllUsersNotInShift(Long shiftID , LocalDate shiftDate) {
        return userRepository.findAllUsersNotInShift(shiftID, shiftDate);
    }
}
