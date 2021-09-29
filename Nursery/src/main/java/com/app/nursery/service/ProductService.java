package com.app.nursery.service;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Optional;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.app.nursery.model.Product;
import com.app.nursery.repository.ProductRepository;

@Service
public class ProductService {
	
	@Autowired private ProductRepository productrepo;
	@Autowired ServletContext ctx;
	
	
	public List<Product> allProducts(){
		return productrepo.findAll();
	}
	
	public List<Product> allCategoryProducts(int catid){
		return productrepo.findByCatidOrderByProdidDesc(catid);
	}
	
	public Product findProductById(int prodid) {
		Optional<Product> p=productrepo.findById(prodid);
		if(p.isPresent())
			return p.get();
		else 
			return null;
	}
	
	
	
	public Product saveProduct(Product p,MultipartFile photo) {
		try {
			Files.copy(photo.getInputStream(), Paths.get(ctx.getRealPath("img/product/"), photo.getOriginalFilename()),StandardCopyOption.REPLACE_EXISTING);
		}catch(Exception ex) {
			System.err.println("Error "+ex.getMessage());
		}
		
		p.setPic("img/product/"+photo.getOriginalFilename());
		System.out.println(p);
		return productrepo.save(p);
	}
	public long totalProducts() {
		return productrepo.count();
	}

}
