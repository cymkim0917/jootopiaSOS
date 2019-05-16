package com.kh.jooTopia.buy.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<BuyWaitAdmin> list = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "매입완료");
			rset = pstmt.executeQuery();
			list = new ArrayList<BuyWaitAdmin>();
			System.out.println(list);
			
			while(rset.next()) {
				BuyWaitAdmin b = new BuyWaitAdmin();
				
				//b.setbId(rset.getInt("PCDID"));
				b.setnNo(rset.getInt("PCDID"));
				b.setbCate1(rset.getString("CGROUP"));
				b.setbCate2(rset.getString("NAME"));
				b.setStatus(rset.getString("STATUS"));
				
				list.add(b);
			}
			System.out.println(list);
			
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

}
