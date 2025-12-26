package com.dto;

public class Allsubcategoryget {
	private int subid;
	private String subcategory_name;
	private int cid;
	private String categoryname;
	
	public Allsubcategoryget() {
		//default constructor
	}
	
	public Allsubcategoryget(int subid,String subcategory_name,int cid,String categoryname)
	{
		this.subid = subid;
		this.subcategory_name = subcategory_name;
		this.cid = cid;
		this.categoryname = categoryname;
		
	}

	public int getSubid() {
		return subid;
	}

	public void setSubid(int subid) {
		this.subid = subid;
	}

	public String getSubcategory_name() {
		return subcategory_name;
	}

	public void setSubcategory_name(String subcategory_name) {
		this.subcategory_name = subcategory_name;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getCategoryname() {
		return categoryname;
	}

	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}

}
