package com.tech.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.LikeDao;
import com.tech.blog.helper.ConnectionProvider;

@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LikeServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 //response.getWriter().append("Served at: ").append(request.getContextPath());
		 PrintWriter out=response.getWriter();

		String operation = request.getParameter("operation");
		int uid = Integer.parseInt(request.getParameter("uid"));
		int pid = Integer.parseInt(request.getParameter("pid"));
//		
//		out.print(operation);
//		out.print(uid);
//		out.print(pid);
//		
		LikeDao ldao=new LikeDao(ConnectionProvider.getConn());
		if(operation.equals("like")) {
			boolean f=ldao.insertLike(pid, uid);
			out.println(f);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
