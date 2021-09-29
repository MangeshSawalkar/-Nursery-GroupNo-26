package com.app.nursery.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.app.nursery.model.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer>{
}
