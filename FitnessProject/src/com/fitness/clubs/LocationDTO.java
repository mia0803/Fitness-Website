package com.fitness.clubs;

public class LocationDTO {
	private int location_id;
	private int total_n;
	private String location;
	private String loc_desc;
	private String img;
	
	
	public int getTotal_n() {
		return total_n;
	}
	public void setTotal_n(int total_n) {
		this.total_n = total_n;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getLoc_desc() {
		return loc_desc;
	}
	public void setLoc_desc(String loc_desc) {
		this.loc_desc = loc_desc;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getLocation_id() {
		return location_id;
	}
	public void setLocation_id(int location_id) {
		this.location_id = location_id;
	}
}
