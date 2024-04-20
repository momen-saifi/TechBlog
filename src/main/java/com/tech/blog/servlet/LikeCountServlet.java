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

@WebServlet("/LikeCountServlet")
public class LikeCountServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int postId = Integer.parseInt(request.getParameter("postId"));

        LikeDao likeDao = new LikeDao(ConnectionProvider.getConn());
        int likeCount = likeDao.countLikeOnPost(postId);

        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        out.print(likeCount);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
