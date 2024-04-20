package com.tech.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
		// fatch username and password
		String userEmail = request.getParameter("email");
		String userPassword = request.getParameter("password");

		UserDao dao = new UserDao(ConnectionProvider.getConn());

		User u = dao.getUserByEmailAndPassword(userEmail, userPassword);

		if (u == null) {
			// error
//			out.println("Invalid Details..try again");

			Message msg = new Message("Invalid Details ! try with another", "error", "alert-danger");
			
			HttpSession session=request.getSession();
			
			session.setAttribute("msg", msg);
			
			response.sendRedirect("login_page.jsp");
		} else {

			// login success
			HttpSession session = request.getSession();
			session.setAttribute("currentUser", u);
			response.sendRedirect("profile.jsp");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
