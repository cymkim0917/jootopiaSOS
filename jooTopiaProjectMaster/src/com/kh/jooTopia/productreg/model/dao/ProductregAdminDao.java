package com.kh.jooTopia.productreg.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import static com.kh.jooTopia.common.JDBCTemplate.*;
import com.kh.jooTopia.productreg.model.vo.ProductregAdmin;

public class ProductregAdminDao {
	private Properties prop = new Properties();
	
	public ProductregAdminDao() {
		
		String fileName = ProductregAdminDao.class
				.getResource("/sql/productreg/productreg-query.properties")
				.getPath();
		
		try {
			prop.load(new FileReader(fileName));
		
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	

	public ProductregAdmin selectOneProductregAdmin(Connection con, int num) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ProductregAdmin p = null;
		
		String query = prop.getProperty("selectOneProductreg");
		
		try {
			pstmt = con.prepareStatement(query);			
			pstmt.setInt(1,num);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				p = new ProductregAdmin();
				
				p.setPcdId(rset.getInt("PCDID"));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return null;
	}

}
