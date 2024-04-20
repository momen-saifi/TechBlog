package com.tech.blog.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;

@WebServlet("/RegisterServlet")

@MultipartConfig
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public RegisterServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();

		String check = request.getParameter("check");

		// System.out.print(name + " " + email + "" + password + "" + gender + "" +
		// about + "" + check);

		if (check == null) {
			out.println("box not checked");
		} else {

			String name = request.getParameter("user_name");

			String email = request.getParameter("user_email");

			String password = request.getParameter("user_password");

			String gender = request.getParameter("gender");

			String about = request.getParameter("about");

			User user = new User(name, email, password, gender, about);

			// Create userDao object

			UserDao dao = new UserDao(ConnectionProvider.getConn());
			boolean f = dao.saveUser(user);
			if (f) {
				out.println("done");
			} else {
				out.println("error");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
