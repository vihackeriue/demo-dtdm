package com.example.repository;

import com.example.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.List;

public interface UserRepository extends JpaRepository<UserEntity, Long> {
    UserEntity findOneByUsernameAndStatus(String username, int status);
    UserEntity findByUsername(String username);

    UserEntity findByUserId(Long id);
    List<UserEntity> findAllByRole(int role);
    UserEntity findByEmailOrEmail(String username, String email);

    UserEntity findByEmail(String email);
    @Query("SELECT u FROM UserEntity u WHERE u.userId NOT IN " +
            "(SELECT sd.user.userId FROM ShiftDetailEntity sd WHERE sd.shift.shiftId = :shiftID AND sd.date = :shiftDate) ")
    List<UserEntity> findAllUsersNotInShift(@Param("shiftID") Long shiftID, @Param("shiftDate") LocalDate shiftDate);

}
