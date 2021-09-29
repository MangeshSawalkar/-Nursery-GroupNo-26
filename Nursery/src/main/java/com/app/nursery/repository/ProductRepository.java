package com.app.nursery.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.app.nursery.model.Product;

@Repository
public interface ProductRepository  extends JpaRepository<Product, Integer>{

List<Product> findByCatidOrderByProdidDesc(int catid);

}



