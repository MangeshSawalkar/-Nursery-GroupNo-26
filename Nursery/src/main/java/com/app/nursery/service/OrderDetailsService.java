package com.app.nursery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.nursery.model.OrderDetails;
import com.app.nursery.repository.OrderDetailsRepository;


@Service
public class OrderDetailsService {

	@Autowired private OrderDetailsRepository odrepo;
	
	public List<OrderDetails> allItemsinOrder(int orderid){
		return odrepo.findByOrderid(orderid);
	}
	public double totalSale(){
		double totalSale =0.0;
		List<OrderDetails> odlist = odrepo.findAll();
		for(OrderDetails ol : odlist) {
			totalSale += ol.getPrice();
		}
		return totalSale;
	}
	public void saveItem(OrderDetails od) {		
		odrepo.save(od);
	}
	
	public void deleteAllItems(int orderid) {
		odrepo.deleteByOrderid(orderid);
	}
}