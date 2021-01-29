package com.fitness.payment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import orcl.db.connection.DatabaseConnection;

public class RefundDAO {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	private void closeAll() {
		if(rs !=null) {try {rs.close();} catch(SQLException s) {}}
		if(ps !=null) {try {ps.close();} catch(SQLException s) {}}
		if(conn !=null) {try {conn.close();} catch(SQLException s) {}}
	}
	
	public ArrayList<RefundDTO> getRefundHistory(){
		ArrayList<RefundDTO> refund_list = new ArrayList<RefundDTO>();
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select * from refund order by id desc");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				RefundDTO dto = new RefundDTO();
				dto.setId(rs.getInt(1));
				dto.setTransaction_id(rs.getInt(2));
				dto.setMember_id(rs.getInt(3));
				dto.setPayment_info_id(rs.getInt(4));
				dto.setTitle(rs.getString(5));
				dto.setAmount(rs.getString(6));
				java.util.Date utilDate = rs.getDate(7);
				dto.setRefund_date(utilDate);
				
				refund_list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return refund_list;
	}
}
