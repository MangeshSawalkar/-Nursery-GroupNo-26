package com.app.nursery.controller;

import java.util.List;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import com.app.nursery.model.Category;
import com.app.nursery.model.Order;
import com.app.nursery.model.OrderDetails;
import com.app.nursery.model.Product;
import com.app.nursery.service.AdminUserService;
import com.app.nursery.service.CategoryService;
import com.app.nursery.service.OrderDetailsService;
import com.app.nursery.service.OrderService;
import com.app.nursery.service.ProductService;
import com.app.nursery.service.UserService;


@Controller
public class AdminController {
	@Autowired
	private CategoryService catsrv;
	@Autowired private ProductService prodsrv;
	@Autowired private UserService custsrv;
	@Autowired private AdminUserService adminsrv;
	@Autowired private OrderService ordersrv;
	@Autowired private OrderDetailsService odsrv;
	@Autowired private HttpSession session;
	
	/*
	 * get login-page for admin
	 */
	@GetMapping("/admin")   
	public String homepage() {
		
		return "admin-login";
	}
	/*
	 * validate admin user during login process
	 */
	@PostMapping("/adminlogin")
	public String validate(String userid,String password,Model model) { 	//if validation is successful then object is created
		
		if(adminsrv.validate(userid, password)) {
			return "redirect:/dashboard";    //redirect to dashboard if validation successful.
		}else {
			session.setAttribute("error", "Please enter valid userid and password");
		return "redirect:/admin"; //redirect to admin login if validation is unsuccessful.
		}
	}	
	
	@GetMapping("/dashboard")
	public String dashboard(Model model) {
		model.addAttribute("totalusers", custsrv.allCustomers().size());//control goes to customer service.
		model.addAttribute("totalsale", odsrv.totalSale());
		model.addAttribute("totalproducts", prodsrv.allProducts().size());
		model.addAttribute("totalorders", ordersrv.allOrders().size());
		return "dashboard";
	}
	
	@GetMapping("/users")
	public String customerlist(Model model){	
		model.addAttribute("users",custsrv.allCustomers());
		return "customers";
	}
	
	@GetMapping("/orders")
	public String orderslist(Model model){
		model.addAttribute("orders", ordersrv.allOrders());
		return "orders";
	}
	
	@GetMapping("/confirm/{id}")
	public String confirmOrder(@PathVariable("id") int orderid){
		ordersrv.confirmOrder(orderid);
		session.setAttribute("msg", "");
		session.setAttribute("msg", "Order Confirmed successfully");
		return "redirect:/orders";
	}
	
	@GetMapping("/ocancel/{id}")
	public String cancelOrder(@PathVariable("id") int orderid){
		ordersrv.cancelledOrder(orderid);
		session.setAttribute("msg", "");
		session.setAttribute("msg", "Your Order is canceled");
		return "redirect:/orders";
	}
	@GetMapping("/oreturn/{id}")
	public String returnOrder(@PathVariable("id") int orderid){
		ordersrv.returnOrder(orderid);
		session.setAttribute("msg", "");
		session.setAttribute("msg", "Your order is return");
		return "redirect:/orders";
	}
	@GetMapping("/deliver/{id}")
	public String deliverOrder(@PathVariable("id") int orderid){
		ordersrv.deliverOrder(orderid);
		session.setAttribute("msg", "");
		session.setAttribute("msg", "Order Delivered successfully");
		return "redirect:/orders";
	}
	
	@GetMapping("/details/{id}")
	public String orderdetails(@PathVariable("id") int orderid, Model model){
		Order order=ordersrv.getOrderDetails(orderid);
		List<OrderDetails> odlist=odsrv.allItemsinOrder(orderid);
		System.out.println("Total items : "+odlist.size()); 
		model.addAttribute("o", order);
		model.addAttribute("items",odlist);		
		model.addAttribute("cqty", odlist.size());
		return "orderdetails";
	}
	
	
	
	@GetMapping("/changepwd")
	public String changepassword(){		
		session.setAttribute("msg", "");
		return "achangepwd";
	}
	
	@GetMapping("/categorylist")
	public String getCategoryList(Model model) {
		List<Category> catlist = catsrv.getAllCategories();
		model.addAttribute("catlist", catlist);
		return "catlist"; 
	}
	
	@GetMapping("/addcategory")
	public String addCategory() {
		//model.addAttribute(new Category());
		return "addCategory";
	}
	
	
	
	@PostMapping("/changepwd")
	public String changepassword(String opwd,String password) {		
		if(adminsrv.updatePassword(opwd, password)) {
			session.setAttribute("msg", "Password updated successfully");
		}
		else {
			session.setAttribute("error", "Incorrect current password");
		}
		return "redirect:/changepwd";
	}
	
	
	@GetMapping("/productslist")
	public String getProductList(Model model) {
		List<Product> prodlist = prodsrv.allProducts();
		model.addAttribute("prodlist", prodlist);
		return "prodlist"; 
	}
	@GetMapping("/products")
	public String products(Model model) {
		model.addAttribute("prods", prodsrv.allProducts());
		model.addAttribute("totalprods", prodsrv.allProducts().size());
		model.addAttribute("cats", catsrv.getAllCategories());
		return "addProduct";
	}
	
	@PostMapping("/products")
	public String saveProduct(MultipartFile photo,Product p) {
		Category cat=catsrv.findByCatId(p.getCatid());
		p.setCategory(cat);
		System.err.println(p);
		prodsrv.saveProduct(p, photo);
		session.setAttribute("msg", "Product saved successfully");
		return "redirect:/productslist";
	}
	
	
	@PostMapping("/categories")
	public String saveCategory(MultipartFile photo,Category cat, Model model) {
		System.out.println("Uploaded file : : "+photo);
		System.out.println("Category :: "+cat);
		if(cat != null && photo != null) {
		catsrv.saveCategory(cat,photo);
		}
		List<Category> catlist = catsrv.getAllCategories();
		model.addAttribute("catlist", catlist);
		session.setAttribute("msg", "Category saved successfully");
		return "redirect:/categorylist";
	}
	
	@GetMapping("/admin/logout")
	public String logout(){
		session.invalidate();
		return "redirect:/admin";
	}

}
