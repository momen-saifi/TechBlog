package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LikeDao {
	Connection con;

	public LikeDao(Connection con) {
		super();
		this.con = con;
	}

	public boolean insertLike(int pid, int uid) {
	    boolean isSuccess = false;
	    try {
	        // Check if the like already exists for the given user and post
	        String checkQuery = "SELECT COUNT(*) FROM postlike WHERE pid = ? AND uid = ?";
	        PreparedStatement checkStmt = con.prepareStatement(checkQuery);
	        checkStmt.setInt(1, pid);
	        checkStmt.setInt(2, uid);
	        ResultSet rs = checkStmt.executeQuery();
	        rs.next();
	        int existingLikes = rs.getInt(1);
	        checkStmt.close();

	        if (existingLikes > 0) {
	            // Like already exists, delete it
	            String deleteQuery = "DELETE FROM postlike WHERE pid = ? AND uid = ?";
	            PreparedStatement deleteStmt = con.prepareStatement(deleteQuery);
	            deleteStmt.setInt(1, pid);
	            deleteStmt.setInt(2, uid);
	            int rowsAffected = deleteStmt.executeUpdate();
	            if (rowsAffected > 0) {
	                isSuccess = false;
	            }
	            deleteStmt.close();
	        } else {
	            // Like does not exist, insert it
	            String insertQuery = "INSERT INTO postlike(pid, uid) VALUES (?, ?)";
	            PreparedStatement insertStmt = con.prepareStatement(insertQuery);
	            insertStmt.setInt(1, pid);
	            insertStmt.setInt(2, uid);
	            int rowsAffected = insertStmt.executeUpdate();
	            if (rowsAffected > 0) {
	                isSuccess = true;
	            }
	            insertStmt.close();
	        }
	    } catch (Exception e) {
	        // Log the exception
	        e.printStackTrace();
	    }
	    return isSuccess;
	}
	public int countLikeOnPost(int pid) {
		int count = 0;
		try {

			String q = "select count(*) from postlike where pid=?";

			PreparedStatement pstmt = con.prepareStatement(q);

			pstmt.setInt(1, pid);
		

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;

	}

	public boolean isLikedByUser(int pid, int uid) {
		boolean f = false;
		try {

			String q = "select * from postlike where pid=? and uid=?";

			PreparedStatement pstmt = con.prepareStatement(q);

			pstmt.setInt(1, pid);
			pstmt.setInt(2, uid);

			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;

	}

	public boolean deleteLike(int pid,int uid) {
		boolean f = false;
		try {

			String q = "delete from postlike where pid=? and uid=?";

			PreparedStatement pstmt = con.prepareStatement(q);

			pstmt.setInt(1, pid);
			pstmt.setInt(2, uid);

			int a=pstmt.executeUpdate();
			if (a==1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;

	}

}
