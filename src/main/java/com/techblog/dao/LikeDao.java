package com.techblog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LikeDao {

	Connection con;
	
	public LikeDao(Connection con) {
		this.con = con;
	}
	
	public boolean insertLike(int pid , int uid) {
		boolean insert = false;
		try {
			String query = "insert into liked(pid,uid) values(?,?)";
			PreparedStatement statement = con.prepareStatement(query);
			statement.setInt(1, pid);
			statement.setInt(2, uid);
			statement.executeUpdate();
			insert = true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return insert;
	}
	
	public int countLikeOnPost(int pid) {
		int count = 0;
		
		String query = "select count(*) from liked where pid=? ";
		try {
			PreparedStatement statement = this.con.prepareStatement(query);
			statement.setInt(1, pid);
			ResultSet result  = statement.executeQuery();
			
			if(result.next()) {
				count = result.getInt("count(*)");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return count; 
	}
	
	public boolean isLikedByUser(int pid , int uid) {
		boolean liked = false;
		
		String query = "select * from liked where pid = ? and uid = ? ";
		try {
			PreparedStatement statement = this.con.prepareStatement(query);
			statement.setInt(1, pid);
			statement.setInt(2, uid);
			ResultSet set = statement.executeQuery();
			
			if(set.next()) {
				liked = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return liked;
	}
	
	public boolean deleteLike(int pid , int uid) {
		boolean deleteLike = false;
		
		String query = "delete from liked where pid = ? and uid = ? ";
		try {
			PreparedStatement statement = this.con.prepareStatement(query);
			statement.setInt(1, pid);
			statement.setInt(2, uid);
			
			statement.executeUpdate();
			deleteLike = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return deleteLike;
	}
}
