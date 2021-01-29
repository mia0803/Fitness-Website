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

public class LocationDAO {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	private void closeAll() {
		if(rs !=null) {try {rs.close();} catch(SQLException s) {}}
		if(ps !=null) {try {ps.close();} catch(SQLException s) {}}
		if(conn !=null) {try {conn.close();} catch(SQLException s) {}}
		
	}
	
	public int getClubCount() {
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
	
	public ArrayList<LocationDTO> getLocations() {
		ArrayList<LocationDTO> locations = new ArrayList<LocationDTO>();
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select * from locations order by location asc");
			rs = ps.executeQuery();
			
			while(rs.next()) {
				String img = null;
				LocationDTO dto = new LocationDTO();
				dto.setLoc_desc(rs.getString("loc_desc"));
				dto.setLocation(rs.getString("location"));
				dto.setLocation_id(rs.getInt("id"));
				Blob b = rs.getBlob("loc_img");
				if(b != null) {
					int blobLength = (int) b.length();  
					byte[] blobAsBytes = b.getBytes(1, blobLength);
					img = Base64.getEncoder().encodeToString(blobAsBytes);
					b.free();
				}
				dto.setImg(img);
				locations.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return locations;
	}
	
	public LocationDTO getLocation(String location) {
		String img = null;
		LocationDTO dto = new LocationDTO();
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select * from locations where location=?");
			ps.setString(1, location);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				dto.setLoc_desc(rs.getString("loc_desc"));
				dto.setLocation(rs.getString("location"));
				dto.setLocation_id(rs.getInt("id"));
				Blob b = rs.getBlob("loc_img");
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
		
	public int getBranch_n(String location) {
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
	
	public boolean checkLocation(String location) {
		boolean result=false;
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select id from locations where location=?");
			ps.setString(1, location);
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
	
	public boolean checkDelete(String location) {
		boolean result=false;
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select * from clubs where location=?");
			ps.setString(1, location);
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
	
	public void addLocation(LocationDTO dto, FileInputStream fis, File f) {
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("insert into locations values(7, ?,?,?)");
			ps.setString(1, dto.getLocation());
			ps.setString(2, dto.getLoc_desc());
			
			if(fis != null && f != null) {
				ps.setBinaryStream(3,fis,(int)f.length());
			} else {
				ps.setNull(3, java.sql.Types.BLOB);
			}
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
	}
	
	public void updateLocation(LocationDTO dto, FileInputStream fis, File f) {
		try {
			conn = DatabaseConnection.getConnection();
			
			if(fis == null || f == null) {
				ps = conn.prepareStatement("update locations set location = ?, loc_desc = ? where id = ?");
				ps.setString(1, dto.getLocation());
				ps.setString(2, dto.getLoc_desc());
				ps.setInt(3, dto.getLocation_id());
				ps.executeUpdate();
			} else {
				ps = conn.prepareStatement("update locations set location = ?, loc_desc = ?, loc_img = ? where id = ?");
				ps.setString(1, dto.getLocation());
				ps.setString(2, dto.getLoc_desc());
				
				if(fis != null && f != null) {
					ps.setBinaryStream(3,fis,(int)f.length());
				} else {
					ps.setNull(3, java.sql.Types.BLOB);
				}
				ps.setInt(4, dto.getLocation_id());
				ps.executeUpdate();
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
	}
	
	public void deleteLocation(String name) {
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("delete from locations where location=?");
			ps.setString(1, name);
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
	}
}
