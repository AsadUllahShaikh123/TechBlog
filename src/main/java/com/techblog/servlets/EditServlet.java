package com.techblog.servlets;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.techblog.dao.UserDao;
import com.techblog.entities.Message;
import com.techblog.entities.User;
import com.techblog.helper.ConnectionProvider;
import com.techblog.helper.Helper;

@MultipartConfig
public class EditServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String about = request.getParameter("about");
		Part part = request.getPart("profile");
		String imageName = part.getSubmittedFileName();

		HttpSession session = request.getSession();

		User user = (User) session.getAttribute("currentUser");

		user.setEmail(email);
		user.setName(name);
		user.setPassword(password);
		user.setAbout(about);
		user.setProfile(imageName);

		// update database

		UserDao dao = new UserDao(ConnectionProvider.getConnection());

		boolean answer = dao.updateUser(user);
		PrintWriter out = response.getWriter();
		if (answer) {

			String path = request.getRealPath("/" + "pics" + File.separator + user.getProfile());
			Helper.deleteFile(path);

			if (Helper.saveFile(part.getInputStream(), path)) {
				
				Message message = new Message("Profile Updated ......","success","alert-success");
				session.setAttribute("message", message);
			}else {
				Message message = new Message("Something went wrong ....","error","alert-danger");
				session.setAttribute("message", message);
			}

		} else {
			
			Message message = new Message("Something went wrong ....","error","alert-danger");
			session.setAttribute("message", message);
		}
		response.sendRedirect("profile.jsp");

	}

}
