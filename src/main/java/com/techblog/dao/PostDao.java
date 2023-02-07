package com.techblog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.techblog.entities.Category;
import com.techblog.entities.Post;

public class PostDao {
	Connection con;
	
	public PostDao(Connection con) {
		this.con = con;
	}
	
	public ArrayList<Category> getAllCategories() {
		ArrayList<Category> list = new ArrayList<>();
		
		try {
			String query = "select * from categories";
			Statement st = this.con.createStatement();
			ResultSet set = st.executeQuery(query);
			while(set.next()) {
				int cid = set.getInt("cid");
				String name = set.getString("name");
				String description = set.getString("description");
				
				Category  c = new Category(cid, name, description);
				list.add(c);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		return list;
	}

	public boolean savePost(Post post) {
		boolean save = false;
		
		String query = "insert into posts (pTitle, pContent, pCode,pPic, cid, userId) values(?,?,?,?,?,?)";
		try {
			PreparedStatement statement = con.prepareStatement(query);
			
			statement.setString(1, post.getpTitle());
			statement.setString(2, post.getpContent());
			statement.setString(3, post.getpCode());
			statement.setString(4, post.getpPic());
			statement.setInt(5, post.getCatId());
			statement.setInt(6, post.getUserId());
			
			statement.executeUpdate();
			save = true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		return save;
	}
	
	
	// get All Posts 
	public List<Post> getAllPosts(){
		List<Post> list = new ArrayList<>();
		// fetch All Posts 
		
		try {
			PreparedStatement statement = con.prepareStatement("select * from posts order by pid desc");
			ResultSet set = statement.executeQuery();
			while(set.next()) {
				int pid = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp date = set.getTimestamp("pDate");
				int cid = set.getInt("cid");
				int userId = set.getInt("userId");
				Post post = new Post(pid,pTitle,pContent,pCode,pPic,date,cid,userId);
				
				list.add(post);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	// get a  Post by specific id  
	public List<Post> getPostByCatId(int cid){
		List<Post> list = new ArrayList<>();
		// fetch specific post by id  
		try {
			PreparedStatement statement = con.prepareStatement("select * from posts where cid =?");
			statement.setInt(1, cid);
			ResultSet set = statement.executeQuery();
			while(set.next()) {
				int pid = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp date = set.getTimestamp("pDate");
				int userId = set.getInt("userId");
				Post post = new Post(pid,pTitle,pContent,pCode,pPic,date,cid,userId);
				
				list.add(post);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
	}
	public Post getPostByPostId(int postId) {
		Post post = null;
		String query = "select * from posts where pid=?";
		try {
			PreparedStatement statement = this.con.prepareStatement(query);
			statement.setInt(1,postId);
			ResultSet set = statement.executeQuery();
			
			if(set.next()) {
				int pid = set.getInt("pid");
				String pTitle = set.getString("pTitle");
				String pContent = set.getString("pContent");
				String pCode = set.getString("pCode");
				String pPic = set.getString("pPic");
				Timestamp date = set.getTimestamp("pDate");
				int userId = set.getInt("userId");
				int cid = set.getInt("cid");
				post = new Post(pid,pTitle,pContent,pCode,pPic,date,cid,userId);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return post;
	}
}
