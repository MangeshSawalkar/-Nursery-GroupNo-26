package com.app.nursery.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.app.nursery.service.CartService;
import com.app.nursery.service.CategoryService;
import com.app.nursery.service.OrderDetailsService;
import com.app.nursery.service.OrderService;
import com.app.nursery.service.ProductService;
import com.app.nursery.model.Cart;
import com.app.nursery.model.Category;
import com.app.nursery.model.Order;
import com.app.nursery.model.OrderDetails;
import com.app.nursery.model.Product;
import com.app.nursery.model.UserRegister;
import com.app.nursery.repository.CategoryRepository;
import com.app.nursery.repository.ProductRepository;
import com.app.nursery.repository.UserRepository;


@Controller
@SessionAttributes({"qty","userid","uname"})
public class CartController {
	@Autowired private CategoryRepository categoryRepository;
	@Autowired
	private CategoryService catsrv;
	@Autowired private HttpSession session;
	@Autowired private CartService cartsrv;
	@Autowired private OrderService ordersrv;
	@Autowired private OrderDetailsService odsrv;
	@Autowired private ProductService prodsrv;
	@Autowired private UserRepository custr;
	@Autowired private ProductRepository prodresp;
	
	 @RequestMapping("/product/addtocart")
	public  String submitForm(@ModelAttribute("cart") Cart c,Model model) {
		
		 String userid=session.getAttribute("userid").toString();
			c.setUserId(userid);
			System.out.println(c);
			if(cartsrv.checkItem(c)) {
				session.setAttribute("error", "Item already in cart");
			}else {
				cartsrv.saveItem(c);
				model.addAttribute("cqty", cartsrv.getItemsinCart(userid));
				session.setAttribute("msg", "Item added to cart");
			}
			return "redirect:/cart";
	}
	
	 
	 
	 @GetMapping("/addtocart/{id}")
		public String addtocart(Model model,@PathVariable("id") int id) {
		 List<Category> categories =  categoryRepository.findAll();
			model.addAttribute("cats",categories);
			model.addAttribute("p", prodsrv.findProductById(id));
			return "addtocart";
		}
		
		
		@PostMapping("/placeorder")
		public String placeorder(@ModelAttribute("order") Order order,Model model) {
			String userid=session.getAttribute("userid").toString();
			int id=ordersrv.placeOrder(order,userid);
			int cqty = cartsrv.getItemsinCart(userid);
			
			
			model.addAttribute("cqty", cqty);
			model.addAttribute("cats", catsrv.getAllCategories());
			
			model.addAttribute("orders", ordersrv.allUserOrders(userid));
			session.setAttribute("msg", "Order Placed Successfully");
			return "thank-you";
		}
		
		@GetMapping("/history")
		public String orderhistory(Model model) {
			try {
			String userid=session.getAttribute("userid").toString();
			model.addAttribute("cats", catsrv.getAllCategories());
			model.addAttribute("orders", ordersrv.allUserOrders(userid));
			return "history";
			}catch(Exception e) {
				return "redirect:/";
			}
			
		}
		
		@GetMapping("/orderdetails/{id}")
		public String orderDetails(Model model,@PathVariable("id") int orderid) {
			String userid=session.getAttribute("userid").toString();
			Order order=ordersrv.getOrderDetails(orderid);
			List<OrderDetails> odlist=odsrv.allItemsinOrder(orderid);
			System.out.println("Total items : "+odlist.size());
			model.addAttribute("cats", catsrv.getAllCategories());
			model.addAttribute("o", order);
			model.addAttribute("items",odlist);		
			model.addAttribute("cqty", odlist.size());	
			System.out.println("Order Detail list : ");
			for(OrderDetails od : odlist) {
				System.out.println(od);
			}
			return "order-details";
		}
		
		@GetMapping("/cancel/{id}")
		public String cancelOrder(@PathVariable("id") int orderid){
			ordersrv.cancelOrder(orderid);
			session.setAttribute("msg", "Order Cancelled successfully");
			return "redirect:/history";
		}
		
		@GetMapping("/cart")
		public String viewcart(Model model) {
			String userid=session.getAttribute("userid").toString();
			List<Cart> items=cartsrv.findItemsByUserId(userid);
			int total=0;
			for(Cart i : items) {
				total+= (i.getProductQty()*i.getRate());
				
			}
			model.addAttribute("items", items);
			model.addAttribute("cqty", cartsrv.getItemsinCart(userid));
			model.addAttribute("ctotal", total);
			model.addAttribute("cgst", (total*.18));
			model.addAttribute("netamount", total+(total*.18));
			model.addAttribute("cats", catsrv.getAllCategories());
			return "cart";
		}
		
		@GetMapping("/delcart/{id}")
		public String deleteitemfromcart(@PathVariable("id") int id,Model model) {
			cartsrv.deleteItem(id);
			String userid=session.getAttribute("userid").toString();
			model.addAttribute("cqty", cartsrv.getItemsinCart(userid));
			session.setAttribute("msg", "Item deleted from cart");
			return "redirect:/cart";
		}
		
}
