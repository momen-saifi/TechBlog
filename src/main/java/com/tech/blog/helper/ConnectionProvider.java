package com.tech.blog.helper;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
	
	private static Connection conn=null;
	public static Connection getConn() {
		try {
			if(conn==null)
			{
				Class.forName("com.mysql.cj.jdbc.Driver");

				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

}
