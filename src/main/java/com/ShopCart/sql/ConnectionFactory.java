package com.ShopCart.sql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
	public static Connection requestConnection()  
	{ 
	Connection con=null; 
	String url="jdbc:mysql://gateway01.ap-southeast-1.prod.aws.tidbcloud.com:4000/test"; 
	String user="2mMmQxjSTcE9em6.root"; 
	String password="TbJrE2g0VA2kflzA"; 
	try { 
		Class.forName("com.mysql.cj.jdbc.Driver"); 
		con=DriverManager.getConnection(url, user, password); 
	} catch (ClassNotFoundException | SQLException e) { 
		e.printStackTrace();
		}
	return con;
	} 

}
