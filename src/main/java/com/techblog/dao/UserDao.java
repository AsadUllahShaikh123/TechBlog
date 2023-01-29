package com.techblog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.techblog.entities.User;

public class UserDao {
	
	private Connection con;
	
	public UserDao(Connection con) {
		this.con = con;
	}
	
	public boolean saveUser(User user) {
		boolean userSaved = false;
		try
		{
			
			// user --> database 
			String query = "insert into user(name,email,password,gender,about) values(?,?,?,?,?)";
			PreparedStatement statement = this.con.prepareStatement(query);
			statement.setString(1,user.getName());
			statement.setString(2, user.getEmail());
			statement.setString(3, user.getPassword());
			statement.setString(4,user.getGender());
			statement.setString(5,user.getAbout());
			
			statement.executeUpdate();
			userSaved = true;
		}
		catch(Exception exception) {
			exception.printStackTrace();
		}
		
		return userSaved;
	}
}
