package com.fitness.qboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


import orcl.db.connection.DatabaseConnection;

public class BoardDAO {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	private void closeAll() {
		if(rs !=null) {try {rs.close();} catch(SQLException s) {}}
		if(ps !=null) {try {ps.close();} catch(SQLException s) {}}
		if(conn !=null) {try {conn.close();} catch(SQLException s) {}}
	}
	
	public int getCount() {
		int total = 0;
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select count(*) from posts where deleted=0");
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
	
	public int getCount(String content) {
		int total = 0;
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select count(*) from posts where deleted=0 and title like ?");
			String sqlContent = "%" + content + "%";
			ps.setString(1, sqlContent);
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
	
	
	public ArrayList<BoardDTO> getPosts(int start, int end){
		ArrayList<BoardDTO> posts = new ArrayList<BoardDTO>();
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select * from (select post2.*, rownum r from (select * from posts where deleted=0 order by announcement desc, id desc) post2 order by rownum) where r between ? and ?");
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setId(rs.getInt(1));
				dto.setTitle(rs.getString(2));
				dto.setEmail(rs.getString(3));
				dto.setPost_date(rs.getDate(4));
				dto.setPost_view(rs.getInt(5));
				dto.setAnnouncement(rs.getInt("announcement"));
				posts.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return posts;
	}
	
	public ArrayList<BoardDTO> getPosts(int start, int end, String content){
		ArrayList<BoardDTO> posts = new ArrayList<BoardDTO>();
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select * from (select post2.*, rownum r from (select * from posts where title like ? and deleted=0 order by announcement desc, id desc) post2 order by rownum) where r between ? and ?");
			String sqlContent = "%" + content + "%";
			ps.setString(1, sqlContent);
			ps.setInt(2, start);
			ps.setInt(3, end);
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setId(rs.getInt(1));
				dto.setTitle(rs.getString(2));
				dto.setEmail(rs.getString(3));
				dto.setPost_date(rs.getDate(4));
				dto.setPost_view(rs.getInt(5));
				dto.setAnnouncement(rs.getInt("announcement"));
				posts.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return posts;
	}
	
	
	public void upView(int post_id) {
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("update posts set post_view=post_view+1 where id = ?");
			ps.setInt(1, post_id);
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
	}
	
	public BoardDTO getPost(int post_id) {
		BoardDTO post = new BoardDTO();
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select * from posts where id = ? ");
			ps.setInt(1, post_id);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				post.setId(post_id);
				post.setTitle(rs.getString(2));
				post.setEmail(rs.getString(3));
				post.setPost_date(rs.getDate(4));
				post.setPost_view(rs.getInt(5));
				post.setContent(rs.getString(6));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return post;
	}
	
	public void addPost(BoardDTO dto) {
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("insert into posts values(7,?,?,sysdate,0,?,0,?)");
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getContent());
			ps.setInt(4, dto.getAnnouncement());
			ps.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
	}
	
	public void deletePost(int post_id) {
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("update posts set deleted=1 where id=?");
			ps.setInt(1, post_id);
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
	}
	
	public void updatePost(BoardDTO dto) {
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("update posts set title=?, content=? where id=?");
			ps.setString(1, dto.getTitle());
			ps.setString(2, dto.getContent());
			ps.setInt(3, dto.getId());
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
	}
}
