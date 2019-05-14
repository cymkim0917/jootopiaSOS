package com.kh.jooTopia.product.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import static com.kh.jooTopia.common.JDBCTemplate.*;

public class CategoryDao {
	Properties prop = new Properties();
	
	public CategoryDao() {
		String fileName = CategoryDao
							.class
							.getResource("/sql/product/category-query.properties")
							.getPath(); 
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<String> selectNameList(Connection con, String group) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<String> list = null;
		
		String query = prop.getProperty("selectNameList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, group);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<String>();
			while(rset.next()) {
				list.add(rset.getString("NAME"));
			}
			System.out.println("categoryName : " + list);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}
	
	
}
