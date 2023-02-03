package com.techblog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

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
	public User getUserByEmailAndPassword(String email, String password) {

		
		User user = null;
		
		String query= "select * from user where email=? and password=?";
		try {
			PreparedStatement statement = con.prepareStatement(query);
			
			statement.setString(1, email);
			statement.setString(2, password);
			
			ResultSet result = statement.executeQuery();
			
			if(result.next()) {
				user = new User();
				user.setName(result.getString("name"));
				user.setEmail(result.getString("email"));
				user.setId(result.getShort("id"));
				user.setPassword(result.getString("password"));
				user.setGender(result.getString("gender"));
				user.setAbout(result.getString("About"));
				user.setDateTime(result.getTimestamp("rdate"));
				user.setProfile(result.getString("profile"));
			}
			
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return user;
	}

	public boolean updateUser(User user) {
		boolean update = false;
		try {
			String query = "update user set name = ? , email=? , password=? , gender=? , about=? , profile=? "
					+ "where id =? ";
			PreparedStatement statement = con.prepareStatement(query);
			
			statement.setString(1, user.getName());
			statement.setString(2, user.getEmail());
			statement.setString(3, user.getPassword());
			statement.setString(4, user.getGender());
			statement.setString(5, user.getAbout());
			statement.setString(6, user.getProfile());
			statement.setInt(7,user.getId());
			
			statement.executeUpdate();
			update = true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return update;
	}
}
