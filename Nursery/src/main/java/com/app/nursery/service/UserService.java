package com.app.nursery.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.nursery.model.UserRegister;
import com.app.nursery.repository.UserRepository;

@Service
public class UserService {

	@Autowired UserRepository crepo;
	//to get all customer list
	public List<UserRegister> allCustomers(){ //control comes from admin-controller
		return crepo.findAll();
	}
	
	public UserRegister findByUserId(String i) {
		Optional<UserRegister> cust=crepo.findById(i);
		if(cust.isPresent())
			return cust.get();
		else
			return null;
	}
	
	public boolean updatePassword(String userid,String pwd,String opwd) {
		UserRegister c=findByUserId(userid);
		System.err.println(pwd);
		if(c.getUpassword().equals(opwd)) {
			c.setUpassword(pwd);
			crepo.save(c);
			return true;
		}
		return false;
	}
	
	public UserRegister ValidateLogin(String userid,String pwd) {
		UserRegister c=findByUserId(userid);
		if(c==null) {
			return null;
		}
		else  {
			if(c.getUpassword().equals(pwd))
				return c;
			else 
				return null;
		}
	}
	
	public String VerifyUser(String userid) {
		if(findByUserId(userid)==null)
			return "ok";
		else
			return "no";
	}
	
	public UserRegister saveCustomer(UserRegister c) {
		return crepo.save(c);
	}
	
	public void changePassword(String userid,String pwd) {
		UserRegister c=findByUserId(userid);
		c.setUpassword(pwd);
		crepo.save(c);
	}
	
	public boolean checkPassword(String userid,String old) {
		UserRegister c=findByUserId(userid);
		return c.getUpassword().equals(old);
	}
}
