package com.dto;

public class Cartitemget {
	private int cartid;
	private int productid;
	private String name;
	private double price;
	private int quantity;
	private String img;
	private String email;
	private double total;
	
	
	public Cartitemget() {
		//body
	}
	
	
	public Cartitemget(int cartid, int productid, String name, double price, int quantity, String img, String email, double total) {
		this.cartid=cartid;
		this.productid=productid;
		this.name=name;
		this.price=price;
		this.quantity=quantity;
		this.img=img;
		this.email=email;
		this.total=total;
	}

	public int getCartid() {
		return cartid;
	}


	public void setCartid(int cartid) {
		this.cartid = cartid;
	}


	public int getProductid() {
		return productid;
	}

	public void setProductid(int productid) {
		this.productid = productid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	
	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public double getTotal() {
		return total;
	}


	public void setTotal(double total) {
		this.total = total;
	}

}
