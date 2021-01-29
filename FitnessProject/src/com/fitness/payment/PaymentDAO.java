package com.fitness.payment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import orcl.db.connection.DatabaseConnection;

public class PaymentDAO {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	private void closeAll() {
		if(rs !=null) {try {rs.close();} catch(SQLException s) {}}
		if(ps !=null) {try {ps.close();} catch(SQLException s) {}}
		if(conn !=null) {try {conn.close();} catch(SQLException s) {}}
	}
	
	public void addInfo(PaymentDTO dto) {
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("insert into payment_info values(7,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			ps.setInt(1, dto.getMember_id());
			ps.setString(2, dto.getFname());
			ps.setString(3, dto.getLname());
			ps.setString(4, dto.getCountry());
			ps.setString(5, dto.getAddress());
			ps.setString(6, dto.getAddress2());
			ps.setString(7, dto.getState());
			ps.setString(8, dto.getCity());
			ps.setString(9, dto.getPostal());
			ps.setString(10, dto.getName_on_card());
			ps.setString(11, dto.getCard_number());
			ps.setString(12, dto.getExpiration());
			ps.setString(13, dto.getCard_postal());
			ps.setString(14, dto.getCvc());
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
	}
	
	public int getId(int member_id) {
		int id = 0;
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select id from payment_info where member_id=?");
			ps.setInt(1, member_id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				id = rs.getInt("id");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return id;
	}
	
	public PaymentDTO getPaymentInfo(int mem_id) {
		PaymentDTO dto = new PaymentDTO();
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select * from payment_info where member_id=?");
			ps.setInt(1, mem_id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getInt("id"));
				dto.setMember_id(rs.getInt("member_id"));
				dto.setFname(rs.getString("fname"));
				dto.setLname(rs.getString("lname"));
				dto.setCountry(rs.getString("country"));
				dto.setAddress(rs.getString("address"));
				dto.setAddress2(rs.getString("address2"));
				dto.setState(rs.getString("state"));
				dto.setCity(rs.getString("city"));
				dto.setPostal(rs.getString("postal"));
				dto.setName_on_card(rs.getString("name_on_card"));
				dto.setCard_number(rs.getString("card_number"));
				dto.setExpiration(rs.getString("expiration"));
				dto.setCard_postal(rs.getString("card_postal"));
				dto.setCvc(rs.getString("cvc"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return dto;
	}
	
	public void update(PaymentDTO dto) {
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("update payment_info set fname=?,lname=?,address=?,address2=?,state=?,city=?,postal=?,name_on_card=?,card_number=?,expiration=?,card_postal=?,cvc=? where id=?");
			ps.setString(1, dto.getFname());
			ps.setString(2, dto.getLname());
			ps.setString(3, dto.getAddress());
			ps.setString(4, dto.getAddress2());
			ps.setString(5, dto.getState());
			ps.setString(6, dto.getCity());
			ps.setString(7, dto.getPostal());
			ps.setString(8, dto.getName_on_card());
			ps.setString(9, dto.getCard_number());
			ps.setString(10, dto.getExpiration());
			ps.setString(11, dto.getCard_postal());
			ps.setString(12, dto.getCvc());
			ps.setInt(13, dto.getId());
			ps.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
	}
}
