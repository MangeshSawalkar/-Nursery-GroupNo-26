package com.app.nursery.service;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Optional;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.app.nursery.model.Category;
import com.app.nursery.model.Product;
import com.app.nursery.repository.CategoryRepository;


@Service
public class CategoryService  {
	
	@Autowired
	private CategoryRepository catrepo;
	@Autowired ServletContext ctx;
	
	public List<Category> getAllCategories(){		
		//return catrepo.findAll(Sort.by(Sort.Direction.DESC,"catid"));
		List<Category> categories =  catrepo.findAll();
		return categories;
	}
	
	/*public void saveCategory(Category cat) {
		if(catrepo.existsById(cat.getCatid())) {
			Category cc=catrepo.findById(cat.getCatid()).get();
			cc.setCatName(cat.getCatName());
			catrepo.save(cc);
		}else {
			catrepo.save(cat);
		}
	}*/
	
	public void saveCategory(Category cat,MultipartFile photo) {
		try {
			Files.copy(photo.getInputStream(), Paths.get(ctx.getRealPath("/img/cat/"), photo.getOriginalFilename()),StandardCopyOption.REPLACE_EXISTING);
		
		}catch(Exception ex) {
			System.err.println("Error "+ex.getMessage());
		}
		System.out.println("Cat Image Name :: "+photo.getOriginalFilename());
		cat.setCatImage("img/cat/"+photo.getOriginalFilename());
		if(catrepo.existsById(cat.getCatid())) {
			Category cc=catrepo.findById(cat.getCatid()).get();
			cc.setCatName(cat.getCatName());
			cc.setCatImage(cat.getCatImage());
			catrepo.save(cc);
		}else {
			catrepo.save(cat);
		}
		System.out.println(cat);
	}
	
	public Category findByCatId(int id) {
		Optional<Category> cat=catrepo.findById(id);
		return cat.get();
	}
	
	public long generateCatId() {
		return catrepo.count()==0 ? 1 : catrepo.count()+1;
	}
	
	public long totalCategories() {
		return catrepo.count();
	}
}
