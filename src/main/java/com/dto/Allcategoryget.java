package com.dto;

public class Allcategoryget {
	
	private int cid;
	private String category_name;
	
	public Allcategoryget() {
		//default constructor
	}
	
	public Allcategoryget(int cid,String category_name)
	{
		this.cid = cid;
		this.category_name = category_name;
		
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

}
