package com.fitness.payment;

import java.util.Date;

public class RefundDTO {
	private int id;
	private int transaction_id;
	private int member_id;
	private int payment_info_id;
	private String title;
	private String amount;
	private Date refund_date;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getTransaction_id() {
		return transaction_id;
	}
	public void setTransaction_id(int transaction_id) {
		this.transaction_id = transaction_id;
	}
	public int getMember_id() {
		return member_id;
	}
	public void setMember_id(int member_id) {
		this.member_id = member_id;
	}
	public int getPayment_info_id() {
		return payment_info_id;
	}
	public void setPayment_info_id(int payment_info_id) {
		this.payment_info_id = payment_info_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public Date getRefund_date() {
		return refund_date;
	}
	public void setRefund_date(Date refund_date) {
		this.refund_date = refund_date;
	}
}
