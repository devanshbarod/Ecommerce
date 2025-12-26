package com.dto;

public class AllFeedbackget {
	private int fid;
	private String name;
	private String email;
	private String expirence;
	private int rating;
	private String ease_to_use;
	private String design;
	private String performance;
	private String suggesion;
	
	public AllFeedbackget() {
		//default constructor
	}
	
	public AllFeedbackget(int fid, String name, String email, String expirence, int rating, String ease_to_use, String design, String performance, String suggesion)
	{
		this.fid = fid;
		this.name = name;
		this.email = email;
		this.expirence = expirence;
		this.rating = rating;
		this.ease_to_use = ease_to_use;
		this.design = design;
		this.performance = performance;
		this.suggesion = suggesion;
	}

	public int getFid() {
		return fid;
	}

	public void setFid(int fid) {
		this.fid = fid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getExpirence() {
		return expirence;
	}

	public void setExpirence(String expirence) {
		this.expirence = expirence;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getEase_to_use() {
		return ease_to_use;
	}

	public void setEase_to_use(String ease_to_use) {
		this.ease_to_use = ease_to_use;
	}

	public String getDesign() {
		return design;
	}

	public void setDesign(String design) {
		this.design = design;
	}

	public String getPerformance() {
		return performance;
	}

	public void setPerformance(String performance) {
		this.performance = performance;
	}

	public String getSuggesion() {
		return suggesion;
	}

	public void setSuggesion(String suggesion) {
		this.suggesion = suggesion;
	}
}
