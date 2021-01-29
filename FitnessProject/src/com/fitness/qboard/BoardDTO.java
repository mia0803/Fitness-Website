package com.fitness.qboard;

import java.util.Date;

public class BoardDTO {
	private int id;
	private String title;
	private String email;
	private Date post_date;
	private int post_view;
	private String content;
	private int deleted;
	private int announcement;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Date getPost_date() {
		return post_date;
	}
	public void setPost_date(Date post_date) {
		this.post_date = post_date;
	}
	public int getPost_view() {
		return post_view;
	}
	public void setPost_view(int post_view) {
		this.post_view = post_view;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getDeleted() {
		return deleted;
	}
	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}
	public int getAnnouncement() {
		return announcement;
	}
	public void setAnnouncement(int announcement) {
		this.announcement = announcement;
	}
}
