package com.techblog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

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

}
