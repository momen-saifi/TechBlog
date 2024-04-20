package com.tech.blog.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.Post;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

@WebServlet("/AddPostServlet")
@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddPostServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();

		int cid = Integer.parseInt(request.getParameter("cid"));
		String pTitle = request.getParameter("pTitle");
		String pContent = request.getParameter("pContent");
		String pCode = request.getParameter("pCode");
		Part part = request.getPart("pic");
		String imageName = part.getSubmittedFileName();

		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentUser");

		Post p = new Post(pTitle, pContent, pCode, imageName, null, cid, user.getId());

		PostDao dao = new PostDao(ConnectionProvider.getConn());
		boolean f = dao.savePost(p);

		if (f) {

			ServletContext context = request.getServletContext();
			String picsDirectory = context.getRealPath("") + "blog_pics";
			System.out.print("befour" + picsDirectory);
			String path = picsDirectory + File.separator + imageName;
			System.out.print("after" + path);

			Helper.saveFile(part.getInputStream(), path);
			out.println("done");
		} else {
			out.println("error");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
