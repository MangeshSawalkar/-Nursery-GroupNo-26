package com.app.nursery.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.app.nursery.model.Cart;
import com.app.nursery.model.Category;
import com.app.nursery.model.Product;
import com.app.nursery.repository.CategoryRepository;
import com.app.nursery.repository.ProductRepository;

@Controller

public class ProductController {
	@Autowired
	ProductRepository productRepository;
	@Autowired
	CategoryRepository categoryRepository;
	@RequestMapping("/productlist")
	public String getAllProducts(Model model){
		List<Product> products =  productRepository.findAll();
		System.out.println("miultipule products : "+products);
		model.addAttribute("products",products);
		List<Category> categories =  categoryRepository.findAll();
		System.out.println("Categories list : "+categories);
		model.addAttribute("cats",categories);
		
		return "products";
		
	}
	

	@GetMapping("/product/{productid}")
	public String getProductById(@PathVariable int productid, Model model) {
		Optional<Product> product = productRepository.findById(productid);
		Product p = product.get();//get the single product that is return current product.
		List<Category> categories =  categoryRepository.findAll();
		System.out.println("Categories list : "+categories);
		model.addAttribute("cats",categories);
		model.addAttribute("cart", new Cart());
		model.addAttribute("product", p);
		return "product-page";
	}
	
	@GetMapping("/{productcategory}")
	public String getProductsByCatName(Model model, @PathVariable int productcategory)
	{
		List<Product> productList = productRepository.findByCatidOrderByProdidDesc(productcategory);
		model.addAttribute("products", productList);
		List<Category> categories =  categoryRepository.findAll();
		System.out.println("Categories list : "+categories);
		model.addAttribute("cats",categories);
		return "products";
	}
	
	
	
	
}
