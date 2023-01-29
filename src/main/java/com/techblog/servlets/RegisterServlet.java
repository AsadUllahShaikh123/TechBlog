package com.techblog.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.techblog.dao.UserDao;
import com.techblog.entities.User;
import com.techblog.helper.ConnectionProvider;

public class RegisterServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String check = request.getParameter("check");
		PrintWriter out = response.getWriter();
		if (check == null) {
			out.println("Box not checked");
		} else {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String gender = request.getParameter("gender");
			String about = request.getParameter("about");
			
			UserDao dao = new UserDao(ConnectionProvider.getConnection());
			User user = new User(name,email,password,gender,about);
			if(dao.saveUser(user)) {
				out.println("saved");
			}else {
				out.print("error");
			}
		}
	}

}
