package com.niw.common;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {
	
	public static Connection getConnection() {
		Properties driver = new Properties();
		String path = JDBCTemplate.class.getResource("/driver.properties").getPath();
		Connection conn = null;
		try(FileReader fr = new FileReader(path)) {
			driver.load(fr);
			Class.forName(driver.getProperty("driver"));
			conn = DriverManager.getConnection(driver.getProperty("url"),
					driver.getProperty("id"),
					driver.getProperty("pw"));
				conn.setAutoCommit(false);
		}catch(SQLException | ClassNotFoundException | IOException e) {
			e.printStackTrace();
		}
		return conn;
		
	}

	public static void close(Object obj) {
		try {
			if(obj instanceof Statement) {
				if(obj!=null && !((Statement) obj).isClosed()) {					
					((Statement) obj).close();
				}
			}else if(obj instanceof ResultSet) {
				if(obj!=null && !((ResultSet) obj).isClosed()) {					
					((ResultSet) obj).close();
				}
			}else if(obj instanceof Connection) {
				if(obj!=null && !((Connection) obj).isClosed()) {					
					((Connection) obj).close();
				}
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void commit(Connection val) {
		try {
			if(val!=null&&!val.isClosed()) 
				val.commit();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
	public static void rollback(Connection val) {
		try {
			if(val!=null&&!val.isClosed()) 
				val.rollback();
		}catch(SQLException e) {
			e.printStackTrace();
		}
	}
}
