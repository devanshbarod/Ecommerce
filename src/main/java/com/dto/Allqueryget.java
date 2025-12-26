package com.dto;

public class Allqueryget {

	private int cid;
	private String email;
	private String message;
	
	public Allqueryget() {
		//default constructor
	}
	
	public Allqueryget(int cid,String email,String message)
	{
		this.cid = cid;
		this.email = email;
		this.message = message;
		
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
}
