package com.app.nursery.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.app.nursery.model.Cart;
import com.app.nursery.repository.CartRepository;



@Service
public class CartService {
	
	@Autowired CartRepository crepo;
	@Autowired UserService csrv;
	@Autowired ProductService psrv;
	
	public List<Cart> findItemsByUserId(String userid){
		return crepo.findByUserId(userid);
	}
	
	public int getItemsinCart(String userid) {
		List<Cart> items=findItemsByUserId(userid);
		int count=0;
		for(Cart c : items) {
			count+=c.getProductQty();
		}
		return count;
	}
	@Transactional
	public void emptyCart(String userid) {
		crepo.deleteByUserId(userid);
	}
	
	public void saveItem(Cart c) {
		
		crepo.save(c);
	}
	
	public boolean checkItem(Cart c) {
		try {
		c.setCustomer(csrv.findByUserId(c.getUserId()));
		c.setProduct(psrv.findProductById(c.getProductId()));
		List<Cart> items=findItemsByUserId(c.getUserId());
		return items.contains(c.getProduct());
		}catch(NullPointerException e) {
			return false;
		}catch(Exception ee) {
			return false;
		}
		
	}
	
	public void deleteItem(int id) {
		Optional<Cart> cart=crepo.findById(id);
		Cart citem=cart.get();
		crepo.delete(citem);
	}
}
