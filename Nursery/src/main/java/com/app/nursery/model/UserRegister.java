package com.app.nursery.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity

public class UserRegister {

	@Id                                //primary key
	private String userid;             //private bcz no other person should access
	@Column(name="upassword")
	private String 	upassword;           
	private String fname;
	private String lname;
	private String dob;
	private String gender;
	private String email;
	
	public UserRegister() {
		// TODO Auto-generated constructor stub
	}	

	public String getDob() {     //get the Dob from database when you run the model
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEmail() { 
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUpassword() {
		return upassword;
	}

	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}
}
