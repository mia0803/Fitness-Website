package com.fitness.members;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import orcl.db.connection.DatabaseConnection;

public class MembersDAO {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	private void closeAll() {
		if(rs !=null) {try {rs.close();} catch(SQLException s) {}}
		if(ps !=null) {try {ps.close();} catch(SQLException s) {}}
		if(conn !=null) {try {conn.close();} catch(SQLException s) {}}
	}
	
	public void updatePw(String email, String pw) {
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("update members set pw=? where email=?");
			ps.setString(1, pw);
			ps.setString(2, email);
			ps.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
	}
	
	
	public String getPw(String email, String phone) {
		String pw = null;
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select pw from members where email=? and phone=?");
			ps.setString(1, email);
			ps.setString(2, phone);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				pw = rs.getString(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return pw;
	}
	
	public String getEmail(String phone, String fname, String lname) {
		String email = null;
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select email from members where phone=? and fname=? and lname=?");
			ps.setString(1, phone);
			ps.setString(2, fname);
			ps.setString(3, lname);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				email = rs.getString(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return email;
	}
	
	
	public void addMember(MembersDTO dto) {
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("insert into members values(7,?,?,?,?,?,?,0,0,sysdate,'basic_user.png',?,?,?,0)");
			ps.setString(1, dto.getPw());
			ps.setString(2, dto.getFname());
			ps.setString(3, dto.getLname());
			ps.setString(4, dto.getEmail());
			ps.setString(5, dto.getPhone());
			ps.setString(6, dto.getMembership());
			ps.setString(7, dto.getClub());
			ps.setString(8, dto.getLocation());
			ps.setString(9, dto.getPayment());
			
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
	}
	
	
	public int getId(String email) {
		int id = 0;
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select id from members where email=?");
			ps.setString(1, email);
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
	
	
	public MembersDTO checkLogin(String email, String pw) {
		MembersDTO dto = new MembersDTO();
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select * from members where email=? and pw=?");
			ps.setString(1, email);
			ps.setString(2, pw);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getInt("id"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return dto;
	}
	
	
	public ArrayList<MembersDTO> getMembers(){
		ArrayList<MembersDTO> members = new ArrayList<MembersDTO>();
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select * from members where teacher=0 and admin=0");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MembersDTO dto = new MembersDTO();
				dto.setId(rs.getInt(1));
				dto.setPw(rs.getString(2));
				dto.setFname(rs.getString(3));
				dto.setLname(rs.getString(4));
				dto.setEmail(rs.getString(5));
				dto.setPhone(rs.getString(6));
				dto.setMembership(rs.getString(7));
				dto.setAdmin(rs.getInt(8));
				dto.setTeacher(rs.getInt(9));
				java.util.Date utilDate = rs.getDate(10);
				dto.setRegisteredAt(utilDate);
				dto.setProfile(rs.getString(11));
				dto.setClub(rs.getString(12));
				dto.setLocation(rs.getString(13));
				dto.setPayment(rs.getString(14));
				dto.setDeactivate(rs.getInt(15));
				
				members.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return members;
	}
	
	public MembersDTO getMember(int mem_id) {
		MembersDTO dto = new MembersDTO();
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select * from members where id=?");
			ps.setInt(1, mem_id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				
				dto.setId(rs.getInt(1));
				dto.setPw(rs.getString(2));
				dto.setFname(rs.getString(3));
				dto.setLname(rs.getString(4));
				dto.setEmail(rs.getString(5));
				dto.setPhone(rs.getString(6));
				dto.setMembership(rs.getString(7));
				dto.setAdmin(rs.getInt(8));
				dto.setTeacher(rs.getInt(9));
				java.util.Date utilDate = rs.getDate(10);
				dto.setRegisteredAt(utilDate);
				dto.setProfile(rs.getString(11));
				dto.setClub(rs.getString(12));
				dto.setLocation(rs.getString(13));
				dto.setPayment(rs.getString(14));
				dto.setDeactivate(rs.getInt(15));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return dto;
	}
	
	public void deactivateMember(int id) {
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("update members set deactivate=1 where id=?");
			ps.setInt(1, id);
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
	}
	
	public void activateMember(int id) {
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("update members set deactivate=0 where id=?");
			ps.setInt(1, id);
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
	}
	
	public ArrayList<MembersDTO> getTeachers(){
		ArrayList<MembersDTO> members = new ArrayList<MembersDTO>();
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select * from members where teacher=1");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				MembersDTO dto = new MembersDTO();
				dto.setId(rs.getInt(1));
				dto.setPw(rs.getString(2));
				dto.setFname(rs.getString(3));
				dto.setLname(rs.getString(4));
				dto.setEmail(rs.getString(5));
				dto.setPhone(rs.getString(6));
				dto.setMembership(rs.getString(7));
				dto.setAdmin(rs.getInt(8));
				dto.setTeacher(rs.getInt(9));
				java.util.Date utilDate = rs.getDate(10);
				dto.setRegisteredAt(utilDate);
				dto.setProfile(rs.getString(11));
				dto.setClub(rs.getString(12));
				dto.setLocation(rs.getString(13));
				dto.setPayment(rs.getString(14));
				dto.setDeactivate(rs.getInt(15));
				
				members.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return members;
	}
	
	
	public void updateMember(MembersDTO dto) {
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("update members set pw=?,fname=?,lname=?,phone=?,profile=? where id=?");
			ps.setString(1, dto.getPw());
			ps.setString(2, dto.getFname());
			ps.setString(3, dto.getLname());
			ps.setString(4, dto.getPhone());
			ps.setString(5, dto.getProfile());
			ps.setInt(6, dto.getId());
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
	}
	
	public void updateMemberMembership(MembersDTO dto) {
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("update members set membership=?,club=?,location=?,payment=? where id=?");
			ps.setString(1, dto.getMembership());
			ps.setString(2, dto.getClub());
			ps.setString(3, dto.getLocation());
			ps.setString(4, dto.getPayment());
			ps.setInt(5, dto.getId());
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
	}
	
	public String whoIsUser(int mem_id) {
		String user = null;
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select teacher, admin from members where id=?");
			ps.setInt(1, mem_id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				int teacher = rs.getInt(1);
				int admin = rs.getInt(2);
				if(teacher == 1) {
					user = "teacher";
				} else if(admin == 1) {
					user = "admin";
				} else {
					user = "member";
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return user;
	}
	
	public boolean checkPayment(int mem_id) {
		boolean paid = false;
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select * from transaction where member_id=?");
			ps.setInt(1, mem_id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				paid = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return paid;
	}
	
	public int checkActive(int mem_id) {
		int active = 0;
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select deactivate from members where id=?");
			ps.setInt(1, mem_id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				active = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return active;
	}
	
	public boolean checkDuplicate(String email, String phone) {
		boolean result = false;
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select * from members where email=?");
			ps.setString(1, email);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				result = true;
			}
			
			ps = conn.prepareStatement("select * from members where phone=?");
			ps.setString(1, phone);
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
	
	public boolean emailValidation(String email) {
		boolean result = false;
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select * from members where email=?");
			ps.setString(1, email);
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
}
