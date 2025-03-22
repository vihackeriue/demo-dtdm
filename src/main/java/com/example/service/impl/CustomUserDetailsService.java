package com.example.service.impl;

import com.example.dto.MyUser;
import com.example.entity.UserEntity;
import com.example.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CustomUserDetailsService implements UserDetailsService {
    @Autowired
    UserRepository userRepository;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserEntity userEntity = userRepository.findOneByUsernameAndStatus(username,  1);

        if(userEntity == null){
            throw new UsernameNotFoundException("User not found!");
        }
        List<GrantedAuthority> authorities = new ArrayList<>();

        int role = userEntity.getRole();
        if (role == 0) {
            authorities.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
        } else if (role == 1) {
            authorities.add(new SimpleGrantedAuthority("ROLE_MANAGER"));
        }else if (role == 2) {
            authorities.add(new SimpleGrantedAuthority("ROLE_EMPLOYEE"));
        }else {
            throw new UsernameNotFoundException("Role not found for user!");
        }
        MyUser user = new MyUser(userEntity.getUsername(), userEntity.getPassword(),
                true, true, true,true, authorities);
        user.setFullName(userEntity.getFullName());
        user.setEmail(userEntity.getEmail());
        user.setPhone(userEntity.getPhone());
        System.out.println(user.getAuthorities());
        return user;
    }
}
