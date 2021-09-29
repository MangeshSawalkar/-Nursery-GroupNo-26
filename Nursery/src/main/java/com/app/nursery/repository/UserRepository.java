package com.app.nursery.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.app.nursery.model.UserRegister;


@Repository
public interface UserRepository extends JpaRepository<UserRegister, String>{

}
