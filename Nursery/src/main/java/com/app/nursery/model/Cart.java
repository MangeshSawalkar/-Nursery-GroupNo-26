package com.app.nursery.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name="cart")
public class Cart {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	
	@Column(name="product_name")
	String productName;
	@OneToOne
	//@JoinColumn(name = "user_id")
	private UserRegister customer;
	@OneToOne
	//@JoinColumn(name = "product_id")
	private Product product;
	@Column(name="userid")
	private String userId;
	@Column(name="prodid")
	private int productId;
	@Column(name="rate")
	private double rate;
	@Column(name="product_qty")
	private int productQty;
	
	
	public Cart() {}

	
	public Cart(int id, String productName, UserRegister customer, Product product, 
			double rate, int productQty, double total, double cartSession) {
		super();
		this.id = id;
		this.productName = productName;
		this.rate = rate;
		this.productQty = productQty;
		
	}


	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public UserRegister getCustomer() {
		return customer;
	}
	public void setCustomer(UserRegister customer) {
		this.customer = customer;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}

	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}

	public int getProductQty() {
		return productQty;
	}

	public void setProductQty(int productQty) {
		this.productQty = productQty;
	}
	@Override
	public String toString() {
		return "Cart [id=" + id + ", productName=" + productName + ", customer=" + customer + ", product=" + product
				+ ", userId=" + userId + ", productId=" + productId + ", rate=" + rate + ", productQty=" + productQty
				+ "]";
	}
}
