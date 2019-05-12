package com.kh.jooTopia.common;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JDBCTemplate {
	// create connection
	public static Connection getConnection() {
		Connection con = null;
		Properties prop = new Properties();
		
		String fileName = JDBCTemplate
					.class
					.getResource("/sql/driver.properties")
					.getPath();
		
		try {
			prop.load(new FileReader(fileName));
			
			String driver = prop.getProperty("driver");
			String url = prop.getProperty("url");
			String user = prop.getProperty("user");
			String password = prop.getProperty("password");
			
			Class.forName(driver);
			
			con = DriverManager.getConnection(url, user, password);
			
			con.setAutoCommit(false);
					
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	// close Connection
	public static void close(Connection con) {
		// 커넥션이 null이 아니고 닫혀있지 않을 때만 커넥션을 닫아준다.
		try {
			if(con != null && !con.isClosed()) {
				con.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// close Statement
	public static void close(Statement stmt) {
		// statement가 null이 아니고 닫혀있지 않을 때만 커넥션을 닫아준다.
		try {
			if(stmt != null && !stmt.isClosed()) {
				stmt.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// close ResultSet
	public static void close(ResultSet rset) {
		// resultset이 null이 아니고 닫혀있지 않을 때만 커넥션을 닫아준다.
		try {
			if(rset != null && !rset.isClosed()) {
				rset.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// commit Connection
	public static void commit(Connection con) {
		// 커넷션이 null이 아니고 닫혀있지 않을 때만 commit실행
		try {
			if(con != null && !con.isClosed()) {
				con.commit();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// rollback Connection
	public static void rollback(Connection con) {
		// 커넷션이 null이 아니고 닫혀있지 않을 때만 rollback실행
		try {
			if(con != null && !con.isClosed()) {
				con.rollback();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
