package com.app.nursery.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="category")
public class Category {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int catid;
	@Column(name="catimage")
	private String catImage;
	@Column(name="catname")
	private String catName;
	
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Category(String catName, String catImage) {
		super();
		this.catName = catName;
		this.catImage = catImage;
	}
	
	
	public int getCatid() {
		return catid;
	}
	public void setCatid(int catid) {
		this.catid = catid;
	}
	public String getCatName() {
		return catName;
	}
	public void setCatName(String catName) {
		this.catName = catName;
	}
	public String getCatImage() {
		return catImage;
	}
	public void setCatImage(String catImage) {
		this.catImage = catImage;
	}
	@Override
	public String toString() {
		return "Category [id=" + catid + ", name=" + catName + ", catImage=" + catImage + "]";
	}
	
	
	
	
}
