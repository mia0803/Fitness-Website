package com.fitness.qboard;

import java.util.Date;

public class CommentDTO {
	private int id;
	private int post_id;
	private String email;
	private String post_comment;
	private int reply;
	private int original_comment_id;
	private Date comment_date;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPost_id() {
		return post_id;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPost_comment() {
		return post_comment;
	}
	public void setPost_comment(String post_comment) {
		this.post_comment = post_comment;
	}
	public int getReply() {
		return reply;
	}
	public void setReply(int reply) {
		this.reply = reply;
	}
	public int getOriginal_comment_id() {
		return original_comment_id;
	}
	public void setOriginal_comment_id(int original_comment_id) {
		this.original_comment_id = original_comment_id;
	}
	public Date getComment_date() {
		return comment_date;
	}
	public void setComment_date(Date comment_date) {
		this.comment_date = comment_date;
	}
}
