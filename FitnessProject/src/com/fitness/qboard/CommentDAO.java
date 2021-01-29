package com.fitness.qboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import orcl.db.connection.DatabaseConnection;

public class CommentDAO {
	private Connection conn = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	private void closeAll() {
		if(rs !=null) {try {rs.close();} catch(SQLException s) {}}
		if(ps !=null) {try {ps.close();} catch(SQLException s) {}}
		if(conn !=null) {try {conn.close();} catch(SQLException s) {}}
	}
	
	public int getCommentCount(int post_id) {
		int post_comment = 0;
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select count(*) from comments where post_id=?");
			ps.setInt(1, post_id);
			rs = ps.executeQuery();
			if(rs.next()) {
				post_comment = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return post_comment;
	}
	
	public void addComment(CommentDTO dto) {
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("insert into comments values(comments_id_seq.nextval,?,?,?,0,comments_id_seq.currval,sysdate)");
			ps.setInt(1, dto.getPost_id());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getPost_comment());
			ps.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
	}
	
	public void addReply(CommentDTO dto) {
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("insert into comments values(comments_id_seq.nextval,?,?,?,1,?,sysdate)");
			ps.setInt(1, dto.getPost_id());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getPost_comment());
			ps.setInt(4, dto.getOriginal_comment_id());
			ps.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
	}
	
	public ArrayList<CommentDTO> getComment(int post_id) {
		ArrayList<CommentDTO> comments = new ArrayList<CommentDTO>();
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("select * from comments where post_id=? order by original_comment_id desc, comment_date asc");
			ps.setInt(1, post_id);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				CommentDTO dto = new CommentDTO();
				dto.setId(rs.getInt(1));
				dto.setPost_id(post_id);
				dto.setEmail(rs.getString(3));
				dto.setPost_comment(rs.getString(4));
				dto.setReply(rs.getInt(5));
				dto.setOriginal_comment_id(rs.getInt(6));
				dto.setComment_date(rs.getDate(7));
				comments.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
		return comments;
	}
	
	
	public void delete(int comment_id) {
		try {
			conn = DatabaseConnection.getConnection();
			ps = conn.prepareStatement("update comments set post_comment='This comment was deleted.' where id=?");
			ps.setInt(1, comment_id);
			ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll();
		}
	}
}
