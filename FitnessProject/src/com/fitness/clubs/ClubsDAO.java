package com.fitness.clubs;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;

import orcl.db.connection.DatabaseConnection;

public class ClubsDAO {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	private void closeAll() {
		if(rs !=null) {try {rs.close();} catch(SQLException s) {}}
		if(ps !=null) {try {ps.close();} catch(SQLException s) {}}
		if(conn !=null) {try {conn.close();} catch(SQLException s) {}}
		
	}
	
	public int getAllClubCount() {
		int total = 0;
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select count(*) from clubs");
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
	
	public int getClubCount(String location) {
		int total = 0;
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select count(*) from clubs where location=?");
			ps.setString(1, location);
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
	
	public ArrayList<ClubsDTO> getClubs(String location) {
		ArrayList<ClubsDTO> clubs = new ArrayList<ClubsDTO>();
		
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select * from clubs where location=? order by club_name asc");
			ps.setString(1, location);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String img = null;
				ClubsDTO dto = new ClubsDTO();
				
				dto.setName(rs.getString("club_name"));
				dto.setAddress(rs.getString("address"));
				dto.setPhone(rs.getString("phone"));
				
				Blob b = rs.getBlob("club_img");
				if(b != null) {
					InputStream inputStream = b.getBinaryStream();
					ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
					byte[] buffer = new byte[4096];
					int bytesRead = -1;
					 
					while ((bytesRead = inputStream.read(buffer)) != -1) {
					    outputStream.write(buffer, 0, bytesRead);
					}
					
					byte[] imageBytes = outputStream.toByteArray();
					 
					img = Base64.getEncoder().encodeToString(imageBytes);
					
					inputStream.close();
	                outputStream.close();
				}
				dto.setImg(img);
				
				clubs.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return clubs;
	}
	
	
	public  ArrayList<ClubsDTO> getClubs() {
		ArrayList<ClubsDTO> clubs = new ArrayList<ClubsDTO>();
		
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select * from clubs order by club_name asc");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String img = null;
				ClubsDTO dto = new ClubsDTO();
				
				dto.setId(rs.getInt("club_id"));
				dto.setLocation(rs.getString("location"));
				dto.setName(rs.getString("club_name"));
				dto.setAddress(rs.getString("address"));
				dto.setPhone(rs.getString("phone"));
				dto.setDesc(rs.getString("club_desc"));
				
				Blob b = rs.getBlob("club_img");
				if(b != null) {
					InputStream inputStream = b.getBinaryStream();
					ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
					byte[] buffer = new byte[4096];
					int bytesRead = -1;
					 
					while ((bytesRead = inputStream.read(buffer)) != -1) {
					    outputStream.write(buffer, 0, bytesRead);
					}
					
					byte[] imageBytes = outputStream.toByteArray();
					 
					img = Base64.getEncoder().encodeToString(imageBytes);
					
					inputStream.close();
	                outputStream.close();
				}
				dto.setImg(img);
				
				
				clubs.add(dto);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return clubs;
	}
	
	public ClubsDTO getClub(String name) {
		String img = null;
		ClubsDTO dto = new ClubsDTO();
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select * from clubs where club_name=?");
			ps.setString(1, name);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				dto.setId(rs.getInt("club_id"));
				dto.setName(rs.getString("club_name"));
				dto.setAddress(rs.getString("address"));
				dto.setPhone(rs.getString("phone"));
				dto.setLocation(rs.getString("location"));
				dto.setDesc(rs.getString("club_desc"));
				
				Blob b = rs.getBlob("club_img");
				if(b != null) {
					InputStream inputStream = b.getBinaryStream();
					ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
					byte[] buffer = new byte[4096];
					int bytesRead = -1;
					 
					while ((bytesRead = inputStream.read(buffer)) != -1) {
					    outputStream.write(buffer, 0, bytesRead);
					}
					
					byte[] imageBytes = outputStream.toByteArray();
					 
					img = Base64.getEncoder().encodeToString(imageBytes);
					
					inputStream.close();
	                outputStream.close();
				}
				dto.setImg(img);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return dto;
	}
	
	public void updateClub(ClubsDTO dto, FileInputStream fis, File f) {
		try {
			conn = DatabaseConnection.getConnection();
			
			if(fis == null || f == null) {
				ps = conn.prepareStatement("update clubs set club_name = ?, address = ?, phone=?, club_desc=? where club_id = ?");
				ps.setString(1, dto.getName());
				ps.setString(2, dto.getAddress());
				ps.setString(3, dto.getPhone());
				ps.setString(4, dto.getDesc());
				ps.setInt(5, dto.getId());
				
				ps.executeUpdate();
			} else {
				ps = conn.prepareStatement("update clubs set club_name = ?, address = ?, phone=?, club_desc=?, club_img = ? where club_id = ?");
				ps.setString(1, dto.getName());
				ps.setString(2, dto.getAddress());
				ps.setString(3, dto.getPhone());
				ps.setString(4, dto.getDesc());
				
				if(fis != null && f != null) {
					ps.setBinaryStream(5,fis,(int)f.length());
				} else {
					ps.setNull(5, java.sql.Types.BLOB);
				}
				ps.setInt(6, dto.getId());
				ps.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
	}
	
	public boolean checkClub(String name) {
		boolean result = false;
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select * from clubs where club_name = ?");
			ps.setString(1, name);
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
	
	public boolean checkDelete(String name) {
		boolean result = false;
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select * from classes where club = ?");
			ps.setString(1, name);
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
	
	public void addClub(ClubsDTO dto, FileInputStream fis, File f) {
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("insert into clubs values(7,?,?,?,?,?,?)");
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getAddress());
			ps.setString(3, dto.getPhone());
			ps.setString(4, dto.getLocation());
			ps.setString(5, dto.getDesc());
			
			if(fis != null || f != null) {
				ps.setBinaryStream(6,fis,(int)f.length());
			} else {
				ps.setNull(6, java.sql.Types.BLOB);
			}
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
	}
	
	public void deleteClub(String name) {
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("delete from clubs where club_name=?");
			ps.setString(1, name);
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		
	}
}
