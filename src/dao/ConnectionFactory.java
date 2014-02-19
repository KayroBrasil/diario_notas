package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {
	
	
	public static Connection getConnection() throws SQLException{
		String url = "jdbc:mysql://localhost/autos";
		
		try {
			return DriverManager.getConnection(url,"root","root");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			throw new SQLException(e.getMessage());
		}
		
	}
	
}
