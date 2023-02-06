package com.techblog.helper;

import java.sql.*;
public class ConnectionProvider {
	private static Connection con;
	
	public static Connection getConnection() {
		
		if(con == null) {
			try 
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog","root","Admin");
			} catch (Exception e) 
			{
				
				e.printStackTrace();
			}
			
		}
		return con;
	}
}
