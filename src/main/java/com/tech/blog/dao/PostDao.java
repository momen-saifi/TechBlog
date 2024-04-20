package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;

public class PostDao {
	Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}

	public ArrayList<Category> getAllCategories() {
		ArrayList<Category> list = new ArrayList<>();

		try {
			String q = "select * from categories";
			Statement st = con.createStatement();

			ResultSet rs = st.executeQuery(q);

			while (rs.next()) {
				int cid = rs.getInt("cid");
				String name = rs.getString("name");
				String description = rs.getString("description");

				Category c = new Category(cid, name, description);
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	public boolean savePost(Post p) {
		boolean f = false;
		try {
			String q = "insert into posts(ptitle,pcontent,pcode,ppic,cid,userId) values(?,?,?,?,?,?)";

			PreparedStatement pstmt = con.prepareStatement(q);

			pstmt.setString(1, p.getpTitle());
			pstmt.setString(2, p.getpContent());
			pstmt.setString(3, p.getpCode());
			pstmt.setString(4, p.getpPic());
			pstmt.setInt(5, p.getCid());
			pstmt.setInt(6, p.getUserId());

			int a = pstmt.executeUpdate();
			if (a == 1)
				f = true;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;

	}

	public List<Post> getAllPosts() {
		List<Post> list = new ArrayList<>();

		try {
			String q = "select * from posts order by pid desc";
			Statement st = con.createStatement();

			ResultSet rs = st.executeQuery(q);

			while (rs.next()) {

				int pid = rs.getInt("pid");
				String pTitle = rs.getString("ptitle");
				String pContent = rs.getString("pcontent");
				String pCode = rs.getString("pCode");
				String pPic = rs.getString("ppic");
				Timestamp date = rs.getTimestamp("pdate");
				int cid = rs.getInt("cid");
				int userId = rs.getInt("userId");

				Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, cid, userId);
				list.add(post);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public List<Post> getPostByCId(int cid) {
		List<Post> list = new ArrayList<>();

		try {
			String q = "select * from posts Where cid=?";
			PreparedStatement st = con.prepareStatement(q);

			st.setInt(1, cid);
			ResultSet rs = st.executeQuery();

			while (rs.next()) {

				int pid = rs.getInt("pid");
				String pTitle = rs.getString("ptitle");
				String pContent = rs.getString("pcontent");
				String pCode = rs.getString("pCode");
				String pPic = rs.getString("ppic");
				Timestamp date = rs.getTimestamp("pdate");

				int userId = rs.getInt("userId");

				Post post = new Post(pid, pTitle, pContent, pCode, pPic, date, cid, userId);
				list.add(post);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	public Post getPostByPostId(int postId) {
		Post post = null;
		try {
			String q = "select * from posts Where pid=?";
			PreparedStatement st = con.prepareStatement(q);

			st.setInt(1, postId);
			ResultSet rs = st.executeQuery();

			if (rs.next()) {

				int pid = rs.getInt("pid");
				String pTitle = rs.getString("ptitle");
				String pContent = rs.getString("pcontent");
				String pCode = rs.getString("pCode");
				String pPic = rs.getString("ppic");
				Timestamp date = rs.getTimestamp("pdate");

				int cid = rs.getInt("cid");
				int userId = rs.getInt("userId");

				post = new Post(pid, pTitle, pContent, pCode, pPic, date, cid, userId);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return post;

	}

}
