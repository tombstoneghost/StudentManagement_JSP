package com.Login.dao;

import java.sql.*;

public class LoginDao {
	String url = "jdbc:sqlite:/home/simardeep/eclipse-workspace/StudentManagement/MainDB";
	
	String sql = "SELECT * FROM Credentials WHERE username=? and password=?";
	
	public boolean checkCreds(String uname, String pass) {
		try {
			Class.forName("org.sqlite.JDBC");
			Connection conn = DriverManager.getConnection(url);
			
			Statement st = conn.createStatement();
			
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, uname);
			ps.setString(2, pass);
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next())
			{
				return true;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
