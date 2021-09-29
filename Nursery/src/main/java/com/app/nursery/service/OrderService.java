package com.app.nursery.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Service;

import com.app.nursery.model.Cart;
import com.app.nursery.model.Order;
import com.app.nursery.model.OrderDetails;
import com.app.nursery.model.Product;
import com.app.nursery.model.UserRegister;
import com.app.nursery.repository.OrderRepository;
import com.app.nursery.repository.ProductRepository;


@Service
public class OrderService {

	@Autowired private OrderRepository orepo;
	@Autowired private CartService cartsrv;
	@Autowired private UserService custsrv;
	@Autowired private OrderDetailsService odsrv;
	@Autowired private ProductRepository prodrep;
	public List<Order> allOrders(){
		return orepo.findAll(Sort.by(Direction.DESC,"id"));
	}
	
	public List<Order> pendingOrders(){
		return orepo.findByStatusOrderByIdDesc("Pending");
	}
	
	public List<Order> allUserOrders(String userid){
		return orepo.findByUseridOrderByIdDesc(userid);
	}
	
	public Order getOrderDetails(int orderid) {
		return orepo.findById(orderid).get();
	}
	
	public void cancelOrder(int orderid) {
		odsrv.deleteAllItems(orderid);
		orepo.deleteById(orderid);
	}
	
	public void confirmOrder(int orderid) {
		Order order=orepo.getById(orderid);
		order.setStatus("Confirmed");
		orepo.save(order);
	}
	
	public void deliverOrder(int orderid) {
		Order order=orepo.getById(orderid);
		order.setStatus("Delivered");
		orepo.save(order);
	}
	public void returnOrder(int orderid) {
		Order order=orepo.getById(orderid);
		order.setStatus("Return");
		orepo.save(order);
	}
	
	public void cancelledOrder(int orderid) {
		Order order=orepo.getById(orderid);
		order.setStatus("Canceled");
		orepo.save(order);
	}
	
	public int placeOrder(Order o,String userid) {
		UserRegister customer=custsrv.findByUserId(userid);
		o.setUserid(userid);
		o.setCustomer(customer);
		Order order=orepo.save(o);
		List<Cart> cartitems=cartsrv.findItemsByUserId(userid);
		for(Cart c : cartitems) {
			OrderDetails od=new OrderDetails();
			od.setOrder(order);
			od.setOrderid(o.getId());
			od.setProduct(c.getProduct());
			od.setQty(c.getProductQty());
			od.setProdid(c.getProductId());
			od.setPrice(c.getRate());
			odsrv.saveItem(od);
		}
		cartsrv.emptyCart(userid);
		return o.getId();
	}
}