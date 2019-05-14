package com.kh.jooTopia.buy.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;
import static com.kh.jooTopia.common.JDBCTemplate.*;

import com.kh.jooTopia.buy.model.vo.BuyWaitAdmin;

public class BuyWaitAdminDao {
	
	private Properties prop = new Properties();
	
	public BuyWaitAdminDao() {
		
		String fileName = BuyWaitAdminDao.class.getResource("/sql/buywait/buywaitAdmin-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
			
			
		} catch (IOException e) {			
			e.printStackTrace();
		}
		
	}

	public ArrayList<BuyWaitAdmin> selectAdminList(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<BuyWaitAdmin> list = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			list = new ArrayList<BuyWaitAdmin>();
			System.out.println(list);
			
			while(rset.next()) {
				BuyWaitAdmin b = new BuyWaitAdmin();
				
				b.setbId(rset.getInt("BID"));
				b.setnNo(rset.getInt("NNO"));
				b.setbCate1(rset.getString("CATE1"));
				b.setbCate2(rset.getString("CATE2"));
				
				
				list.add(b);
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
