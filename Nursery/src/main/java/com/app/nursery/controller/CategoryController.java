package com.app.nursery.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.app.nursery.model.Category;
import com.app.nursery.repository.CategoryRepository;

@Controller
public class CategoryController {

	
	@Autowired
	CategoryRepository categoryRepository;
	@RequestMapping("/catlist")
	public String getAllProducts(Model model){
		List<Category> categories =  categoryRepository.findAll();
		System.out.println("CategoryController :: "+categories);
		model.addAttribute("cats",categories);
		return "partial/head";
		
	}
}
