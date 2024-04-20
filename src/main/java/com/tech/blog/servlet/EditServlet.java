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

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;

@WebServlet("/EditServlet")
@MultipartConfig
public class EditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public EditServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        String userEmail = request.getParameter("user_email");
        String userName = request.getParameter("user_name");
        String userPassword = request.getParameter("user_password");
        String userAbout = request.getParameter("user_about");
        Part part = request.getPart("profile-image");
        String imageName = part.getSubmittedFileName();

        // get the user from session..
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("currentUser");
        user.setEmail(userEmail);
        user.setName(userName);
        user.setPassword(userPassword);
        user.setAbout(userAbout);
        String oldFile = user.getProfile();
        user.setProfile(imageName);

        UserDao dao = new UserDao(ConnectionProvider.getConn());

        boolean f = dao.updateUser(user);
        if (f) {
            ServletContext context = request.getServletContext();
            String picsDirectory = context.getRealPath("") + File.separator + "pics";
          //  System.out.print("before: " + picsDirectory);
            String path = picsDirectory + File.separator + user.getProfile();
            //System.out.print("after: " + path);
            
            String pathOldFile = picsDirectory + File.separator + oldFile;

            if (!oldFile.equals("default.png")) {
                Helper.deleteFile(pathOldFile);
            }
            if (Helper.saveFile(part.getInputStream(), path)) {
                Message msg = new Message("Profile details updated successfully.", "success", "alert-success");
                session.setAttribute("msg", msg);
            } else {
                Message msg = new Message("Something went wrong..", "error", "alert-danger");
                session.setAttribute("msg", msg);
            }
        }
        response.sendRedirect("profile.jsp");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
