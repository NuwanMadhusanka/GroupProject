package com.gp.service;

import java.sql.Connection;
import java.sql.DriverManager;

public class DB {
	
	public static Connection getConnection() throws Exception {
		
		String url="jdbc:mysql://localhost/project?autoReconnect=true&useSSL=false";
		Class.forName("com.mysql.jdbc.Driver");
		
		Connection con=DriverManager.getConnection(url,"root","1234");
		
		return con;
	}
	
}

