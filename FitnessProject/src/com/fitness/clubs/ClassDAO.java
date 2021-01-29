package com.fitness.clubs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import orcl.db.connection.DatabaseConnection;

public class ClassDAO {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	private void closeAll() {
		if(rs !=null) {try {rs.close();} catch(SQLException s) {}}
		if(ps !=null) {try {ps.close();} catch(SQLException s) {}}
		if(conn !=null) {try {conn.close();} catch(SQLException s) {}}
	}
	
	
	public int getTotalCount(String name) {
		int total = 0;
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select count(*) from classes where club=?");
			ps.setString(1, name);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				total = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return total;
	}
	
	public ArrayList<ClassDTO> getClasses(String name, String today) {
		ArrayList<ClassDTO> classes = new ArrayList<ClassDTO>();
		
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select * from classes where club=? and c_day=? order by c_id asc");
			ps.setString(1, name);
			ps.setString(2, today);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				
				ClassDTO dto = new ClassDTO();
				
				dto.setC_id(rs.getInt("c_id"));
				dto.setC_day(rs.getString("c_day"));
				dto.setTitle(rs.getString("title"));
				dto.setTeacher(rs.getString("teacher"));
				dto.setC_time(rs.getString("c_time"));
				dto.setClub(rs.getString("club"));
				
				classes.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return classes;
	}
	
	public ArrayList<ClassDTO> getClasses() {
		ArrayList<ClassDTO> classes = new ArrayList<ClassDTO>();
		
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select * from classes order by c_id asc");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				
				ClassDTO dto = new ClassDTO();
				
				dto.setC_id(rs.getInt("c_id"));
				dto.setC_day(rs.getString("c_day"));
				dto.setTitle(rs.getString("title"));
				dto.setTeacher(rs.getString("teacher"));
				dto.setC_time(rs.getString("c_time"));
				dto.setClub(rs.getString("club"));
				
				classes.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return classes;
	}
	
	public ClassDTO getClass(String class_id) {
		ClassDTO dto = new ClassDTO();
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select * from classes where c_id=?");
			int int_id = Integer.parseInt(class_id);
			ps.setInt(1, int_id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				dto.setC_id(int_id);
				dto.setC_day(rs.getString("c_day"));
				dto.setTitle(rs.getString("title"));
				dto.setTeacher(rs.getString("teacher"));
				dto.setC_time(rs.getString("c_time"));
				dto.setClub(rs.getString("club"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return dto;
	}
	
	
	public boolean check(ClassDTO dto) {
		boolean result = false;
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select * from classes where c_day=? and teacher=? and c_time=? and club=? ");
			ps.setString(1, dto.getC_day());
			ps.setString(2, dto.getTeacher());
			ps.setString(3, dto.getC_time());
			ps.setString(4, dto.getClub());
			rs = ps.executeQuery();
			
			if(rs.next()) {
				result = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return result;
	}
	
	public void addClass(ClassDTO dto) {
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("insert into classes values(7,?,?,?,?,?)");
			ps.setString(1, dto.getC_day());
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getTeacher());
			ps.setString(4, dto.getC_time());
			ps.setString(5, dto.getClub());
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		
	}
	
	public void updateClass(ClassDTO dto) {
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("update classes set c_day = ?, title = ?, teacher=?, c_time=? where c_id = ?");
			ps.setString(1, dto.getC_day());
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getTeacher());
			ps.setString(4, dto.getC_time());
			ps.setInt(5, dto.getC_id());
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
	}
	
	public void deleteClass(String class_id) {
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("delete from classes where c_id = ?");
			int a = Integer.parseInt(class_id);
			ps.setInt(1, a);
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
	}
}
