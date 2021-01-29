package com.fitness.members;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.fitness.clubs.ClassDTO;

import orcl.db.connection.DatabaseConnection;

public class ClassCartDAO {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	private void closeAll() {
		if(rs !=null) {try {rs.close();} catch(SQLException s) {}}
		if(ps !=null) {try {ps.close();} catch(SQLException s) {}}
		if(conn !=null) {try {conn.close();} catch(SQLException s) {}}
	}
	
	public ArrayList<ClassCartDTO> getClassInfo(int id, String day){
		ArrayList<ClassCartDTO> classes = new ArrayList<ClassCartDTO>();
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select * from class_cart where member_id=? and c_day=?");
			ps.setInt(1, id);
			ps.setString(2, day);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				ClassCartDTO dto = new ClassCartDTO();
				dto.setId(rs.getInt(1));
				dto.setMember_id(rs.getInt(2));
				dto.setClass_id(rs.getInt(3));
				dto.setC_day(rs.getString(4));
				dto.setTitle(rs.getString(5));
				dto.setTeacher(rs.getString(6));
				dto.setC_time(rs.getString(7));
				dto.setClub(rs.getString(8));
				
				classes.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return classes;
	}
	
	public boolean checkExistance(int class_id, int member_id) {
		boolean result = false;
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select * from class_cart where class_id=? and member_id=?");
			ps.setInt(1, class_id);
			ps.setInt(2, member_id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				result=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return result;
	}
	
	
	public void addClass(int class_id, int member_id) {
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select * from classes where c_id=?");
			ps.setInt(1, class_id);
			rs = ps.executeQuery();
			ClassDTO dto1 = new ClassDTO();
			if(rs.next()) {
				dto1.setC_day(rs.getString("c_day"));
				dto1.setTitle(rs.getString("title"));
				dto1.setTeacher(rs.getString("teacher"));
				dto1.setC_time(rs.getString("c_time"));
				dto1.setClub(rs.getString("club"));
			}
			
			ps = conn.prepareStatement("insert into class_cart values(7,?,?,?,?,?,?,?)");
			ps.setInt(1, member_id);
			ps.setInt(2, class_id);
			ps.setString(3, dto1.getC_day());
			ps.setString(4, dto1.getTitle());
			ps.setString(5, dto1.getTeacher());
			ps.setString(6, dto1.getC_time());
			ps.setString(7, dto1.getClub());
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
	}
}
