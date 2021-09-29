package com.app.nursery.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.app.nursery.model.UserRegister;
import com.app.nursery.service.CartService;
import com.app.nursery.service.CategoryService;
import com.app.nursery.service.UserService;

@Controller
@SessionAttributes({"qty","userid","uname"})
public class UserController {

	
	@Autowired
	private CategoryService catsrv;
	@Autowired private HttpSession session;
	@Autowired private CartService cartsrv;
	@Autowired private UserService custsrv;
	@GetMapping("/login")
	public String loginpage(Model model) {
		model.addAttribute("cats", catsrv.getAllCategories());
		return "login";
	}
	
	@PostMapping("/login")
	public String validate(String userid,String pwd,Model model) {
		
		try {
			UserRegister c=custsrv.ValidateLogin(userid, pwd);
		
			if(c!=null) {
				session.setAttribute("userid", userid);
				session.setAttribute("uname", c.getFname());
				model.addAttribute("cqty", cartsrv.getItemsinCart(userid));
				return "redirect:/";
			}
			else {
				session.setAttribute("error", "Invalid username or password");
				return "redirect:/login";
			}
			}catch(Exception e) {
				session.setAttribute("error", "User is not present.Please regiter and then try login.");
				return "redirect:/login";	
			}		
	}	
	
	@PostMapping("/register")

	public String registerUser(UserRegister c) {
	try {
		UserRegister cust=custsrv.saveCustomer(c);
		session.setAttribute("userid", cust.getUserid());
		session.setAttribute("uname", cust.getFname());	
		return "redirect:/";
	}catch(Exception e) {session.setAttribute("error", "Username is not present.Please regiter and then try login.");
	return "redirect:/login";
	}
	
	}
	
	@GetMapping("/cchangepwd")
	public String changepasswordpage(Model model) {
		model.addAttribute("cats", catsrv.getAllCategories());
		return "changepwd";
	}
	@PostMapping("/cchangepwd")
	public String changepassword(String opwd,String pwd) {
		if(session != null) {
			try {
		String userid=session.getAttribute("userid").toString();
		if(custsrv.updatePassword(userid, pwd, opwd)) {
			session.setAttribute("msg", "Password updated successfully");
		}
		else {
			session.setAttribute("error", "Incorrect current password");
		}
		return "redirect:/cchangepwd";
		
			}catch(Exception e) {
				session.setAttribute("error", "Please fill above form");
				return "redirect:/cchangepwd";
			}
			
		}else {
			return "redirect:/";
		}
	}
	
	
	@GetMapping("/logout")
	public String logout()
	{
		try
		{
		
		
		if(session != null)
		{
			
			session.invalidate();
			session.setMaxInactiveInterval(2);
			return "redirect:/";
		}
		else
		{
			System.out.println("Fail to logout");
			return "redirect:/";
		}
		}
		catch(Exception e)
		{
			System.out.println("Error occured during logout process.");
			e.printStackTrace();
			return "redirect:/";
			
		}
		
	}
	
	
	
}
