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

import com.techblog.dao.PostDao;
import com.techblog.entities.Post;
import com.techblog.entities.User;
import com.techblog.helper.ConnectionProvider;
import com.techblog.helper.Helper;

@MultipartConfig
public class AddPostServlet extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter();
		int cid = Integer.parseInt(request.getParameter("cid"));
		String pTitle = request.getParameter("pTitle");
		String pContent = request.getParameter("pContent");
		String pCode = request.getParameter("pCode");
		Part part = request.getPart("pic");
		String pic = part.getSubmittedFileName();
		// get Current User Id
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentUser");
		int userId = user.getId();
		
		Post p = new Post(pTitle, pContent, pCode, pic , null , cid , userId  );
		PostDao post = new PostDao(ConnectionProvider.getConnection());
		if(post.savePost(p)) {
			out.println("done");
			String path = request.getRealPath("/" + "blog_pics" + File.separator + pic);
			boolean saveFile = Helper.saveFile(part.getInputStream(), path);
			out.println("File Saved"+ saveFile);
		}
		else {
			out.println("error");
		}
		
	}

}
