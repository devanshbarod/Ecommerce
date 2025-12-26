package com.dto;

public class Productget {
	private int product_id;
	private String product_name;
	private String image;
	private double price;
	private String category;
	private String brand;
	private String description;
	private int qty;
	private double subtotal;
	private double total;
	
	public Productget(){
		//default constructor
	}
	
	public Productget(int product_id, String product_name, String image, double price, String category, String brand, String description, int qty, double subtotal, double total){
		this.product_id = product_id;
		this.product_name = product_name;
		this.image = image;
		this.price = price;
		this.category = category;
		this.brand = brand;
		this.description = description;
		this.qty = qty;
		this.subtotal = subtotal;
		this.total = total;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public double getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(double subtotal) {
		this.subtotal = subtotal;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}
	
}
