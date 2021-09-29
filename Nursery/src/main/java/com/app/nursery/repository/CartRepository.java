package com.app.nursery.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.app.nursery.model.Cart;

public interface CartRepository extends JpaRepository<Cart, Integer>{
public void deleteCartProductById(int id);
List<Cart> getItemsByUserId(int id);
List<Cart> findByUserId(String userId);

void deleteByUserId(String userId);

}
