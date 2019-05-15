package com.kh.jooTopia.stock.model.dao;

import static com.kh.jooTopia.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;



import com.kh.jooTopia.stock.model.vo.StockAdmin;
 
public class StockAdminDao {
	
	private Properties prop = new Properties();
	
	public StockAdminDao() {
		
		String fileName = StockAdminDao.class.getResource("/sql/stock/stock-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
			
			
		} catch (IOException e) {			
			e.printStackTrace();
		}
	}

	public ArrayList<StockAdmin> selectAdminList(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<StockAdmin> list = null;
		
		String query = prop.getProperty("selectList");
		try {
			stmt = con.createStatement();			
			rset = stmt.executeQuery(query);			
			list = new ArrayList<StockAdmin>();
			System.out.println(list);
			
			while(rset.next()) {
				StockAdmin s = new StockAdmin();
				
				s.setsId(rset.getInt("SID"));
				s.setCate1(rset.getString("CATE1"));
				s.setCate2(rset.getString("CATE2"));
				s.setpNo(rset.getInt("PNO"));
				s.sethNo(rset.getInt("HNO"));
				s.setlNo(rset.getInt("LNO"));
				s.sethDate(rset.getDate("HDATE"));				
				
				list.add(s);
			}
			System.out.println(list);
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		
		return list;
	}

}
