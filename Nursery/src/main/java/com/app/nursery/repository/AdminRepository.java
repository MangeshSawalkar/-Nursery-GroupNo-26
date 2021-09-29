package com.app.nursery.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.app.nursery.model.AdminUser;


@Repository
public interface AdminRepository extends JpaRepository<AdminUser, String>{

}
