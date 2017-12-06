package com.zappyfoods.dboperation;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

	public Connection start()
	{
		Connection con=null;
		  try {
				Class.forName("com.mysql.jdbc.Driver");
				con=DriverManager.getConnection("jdbc:mysql://localhost:3306/zappyfood","root","");	
		  }catch(ClassNotFoundException | SQLException e)
		  {
			  System.out.println(e);
		  }
		
		return con;
	}
	
	
}
