package com.app.nursery.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.app.nursery.model.Category;
import com.app.nursery.model.Product;
import com.app.nursery.repository.CategoryRepository;
import com.app.nursery.repository.ProductRepository;

@Controller

public class HomeController {
	@Autowired
	CategoryRepository categoryRepository;
	@Autowired
	ProductRepository productRepository;
	@RequestMapping("/")
	public String home(Model model) {
		
		
		List<Category> categories =  categoryRepository.findAll();
		System.out.println("Categories list : "+categories);
		model.addAttribute("cats",categories);
		List<Product> products =  productRepository.findAll();
		System.out.println("miultipule products : "+products);
		model.addAttribute("products",products);
		return "index";
	}
	
	
}
