package com.dto;

public class Allusersget {
	private String username;
	private String fname;
	private String lname;
	private String password;
	private String email;
	private long mobnumber;
	private String gender;
	private String dob;
	private String address;
	private String state;
	private String city;
	private int postal_code;
	private String role;
	
	public Allusersget() {
		//default constructor
	}
	
	public Allusersget(String username, String fname, String lname, String password, String email, long mobnumber,String gender, String dob, String address, String state, String city,int postal_code, String role)
	{
		this.username = username;
		this.fname = fname;
		this.lname = lname;
		this.password = password;
		this.password = password;
		this.email = email;
		this.mobnumber = mobnumber;
		this.gender = gender;
		this.dob = dob;
		this.address = address;
		this.state = state;
		this.city = city;
		this.postal_code = postal_code;
		this.role = role;
	}
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public long getMobnumber() {
		return mobnumber;
	}

	public void setMobnumber(long mobnumber) {
		this.mobnumber = mobnumber;
	}

	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public int getPostal_code() {
		return postal_code;
	}

	public void setPostal_code(int postal_code) {
		this.postal_code = postal_code;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}
	
	
	
}
