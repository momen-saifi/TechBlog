package com.tech.blog.dao;

import java.sql.*;
import com.tech.blog.entities.*;

public class UserDao {

	private Connection con;

	public UserDao(Connection con) {
		super();
		this.con = con;
	}

	// methos to inser user to database

	public boolean saveUser(User user) {
		boolean f = false;
		try {
			String query = "insert into user(name,email,password,gender,about) values(?,?,?,?,?)";

			PreparedStatement pstmt = con.prepareStatement(query);

			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getAbout());

			int a = pstmt.executeUpdate();
			if (a == 1)
				f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	// get user by useremail and userpassword:

	public User getUserByEmailAndPassword(String email, String password) {
		User user = null;

		try {
			String query = "select * from user where email=? and password=?";

			PreparedStatement pstmt = con.prepareStatement(query);

			pstmt.setString(1, email);
			pstmt.setString(2, password);

			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				user = new User();

				user.setName(rs.getString("name"));
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setAbout(rs.getString("about"));
				user.setDateTime(rs.getTimestamp("rdate"));
				user.setProfile(rs.getString("profile"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	public boolean updateUser(User user) {
		boolean f = false;
		try {
			String query = "update user set name=?, email=?,password=?,gender=?,about=?,profile=? where id=?";

			PreparedStatement pstmt = con.prepareStatement(query);

			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			pstmt.setString(5, user.getAbout());

			pstmt.setString(6, user.getProfile());

			pstmt.setInt(7, user.getId());

			int a = pstmt.executeUpdate();
			if (a == 1)
				f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public User getUserByUserId(int userId) {
		User user = null;

		try {
			String query = "select * from user where id=?";

			PreparedStatement pstmt = con.prepareStatement(query);

			pstmt.setInt(1, userId);

			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				user = new User();

				user.setName(rs.getString("name"));
				user.setId(rs.getInt("id"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setAbout(rs.getString("about"));
				user.setDateTime(rs.getTimestamp("rdate"));
				user.setProfile(rs.getString("profile"));

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;

	}
}
