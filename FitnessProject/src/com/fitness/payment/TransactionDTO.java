package com.fitness.payment;

public class TransactionDTO {
	private int id;
	private int member_id;
	private int payment_info_id;
	private String amount;
	private String title;
	private String membership;
	private String paid_date;
	private int initiation_fee;
	private int refund_check;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMembership() {
		return membership;
	}
	public void setMembership(String membership) {
		this.membership = membership;
	}
	public String getPaid_date() {
		return paid_date;
	}
	public void setPaid_date(String paid_date) {
		this.paid_date = paid_date;
	}
	public int getInitiation_fee() {
		return initiation_fee;
	}
	public void setInitiation_fee(int initiation_fee) {
		this.initiation_fee = initiation_fee;
	}
	public int getRefund_check() {
		return refund_check;
	}
	public void setRefund_check(int refund_check) {
		this.refund_check = refund_check;
	}
}
