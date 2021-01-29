package com.fitness.payment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import orcl.db.connection.DatabaseConnection;

public class TransactionDAO {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	private void closeAll() {
		if(rs !=null) {try {rs.close();} catch(SQLException s) {}}
		if(ps !=null) {try {ps.close();} catch(SQLException s) {}}
		if(conn !=null) {try {conn.close();} catch(SQLException s) {}}
	}
	
	
	public void addTransaction(TransactionDTO dto) {
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("insert into transaction values(7,?,?,?,?,?,sysdate,?,0)");
			ps.setInt(1, dto.getMember_id());
			ps.setInt(2, dto.getPayment_info_id());
			ps.setString(3, dto.getAmount());
			ps.setString(4, dto.getTitle());
			ps.setString(5, dto.getMembership());
			ps.setInt(6, dto.getInitiation_fee());
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
	}
	
	public ArrayList<TransactionDTO> getTransactions(){
		ArrayList<TransactionDTO> transactions = new ArrayList<TransactionDTO>();
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select * from transaction order by id desc");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				TransactionDTO dto = new TransactionDTO();
				dto.setId(rs.getInt(1));
				dto.setMember_id(rs.getInt(2));
				dto.setPayment_info_id(rs.getInt(3));
				dto.setAmount(rs.getString(4));
				dto.setTitle(rs.getString(5));
				dto.setMembership(rs.getString(6));
				dto.setPaid_date(rs.getString(7));
				dto.setInitiation_fee(rs.getInt(8));
				dto.setRefund_check(rs.getInt(9));
				
				transactions.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return transactions;
	}
	
	public void refund(int transaction_id) {
		try {
			// change state of transaction to refunded
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("update transaction set refund_check = 1 where id = ?");
			ps.setInt(1, transaction_id);
			ps.executeUpdate();
			
			ps = conn.prepareStatement("select * from transaction where id = ?");
			ps.setInt(1, transaction_id);
			rs = ps.executeQuery();
			TransactionDTO dto = new TransactionDTO();
			if(rs.next()) {
				dto.setId(rs.getInt("id"));
				dto.setMember_id(rs.getInt("member_id"));
				dto.setPayment_info_id(rs.getInt("payment_info_id"));
				dto.setTitle(rs.getString("title"));
				dto.setAmount(rs.getString("amount"));
			}
			
			// add record in refund table
			ps = conn.prepareStatement("insert into refund values(1,?,?,?,?,?,sysdate)");
			ps.setInt(1, dto.getId());
			ps.setInt(2, dto.getMember_id());
			ps.setInt(3, dto.getPayment_info_id());
			ps.setString(4, dto.getTitle());
			ps.setString(5, dto.getAmount());
			
			ps.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
	}
}
