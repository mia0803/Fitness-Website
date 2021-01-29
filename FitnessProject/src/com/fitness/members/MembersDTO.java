package com.fitness.members;

import java.util.Date;

public class MembersDTO {
	private int id;
	private String pw;
	private String fname;
	private String lname;
	private String email; // U
	private String phone; // U
	private String membership;
	private int admin;
	private int teacher;
	private Date registeredAt;
	private String profile;
	private String club;
	private String location;
	private String payment;
	private int deactivate;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	public int getTeacher() {
		return teacher;
	}
	public void setTeacher(int teacher) {
		this.teacher = teacher;
	}
	public Date getRegisteredAt() {
		return registeredAt;
	}
	public void setRegisteredAt(Date registeredAt) {
		this.registeredAt = registeredAt;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getClub() {
		return club;
	}
	public void setClub(String club) {
		this.club = club;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getMembership() {
		return membership;
	}
	public void setMembership(String membership) {
		this.membership = membership;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public int getDeactivate() {
		return deactivate;
	}
	public void setDeactivate(int deactivate) {
		this.deactivate = deactivate;
	}
}
