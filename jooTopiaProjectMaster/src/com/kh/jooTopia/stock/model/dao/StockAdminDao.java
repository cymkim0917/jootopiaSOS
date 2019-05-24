package com.kh.jooTopia.stock.model.dao;

import static com.kh.jooTopia.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jooTopia.heap.model.vo.PageInfo;
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
				
				s.setcGroup(rset.getString("CGROUP"));
				s.setName(rset.getString("NAME"));
				s.setpId(rset.getInt("PID"));
				s.sethId(rset.getInt("HID"));
				s.setlBarcode(rset.getInt("LBARCODE"));
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

	public int getListCount(Connection con) {
		
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		return listCount;
	}

	public ArrayList<StockAdmin> selectAdminList(Connection con, PageInfo pi) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<StockAdmin> list = null;
		
		String query = prop.getProperty("selectListAfterPaging");
		
		int startRow = (pi.getCurrentPage() -1) * pi.getLimit() +1;
		int endRow = startRow + pi.getLimit() -1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<StockAdmin>();
			
			while(rset.next()) {
				StockAdmin s = new StockAdmin();
				
				s.setpId(rset.getInt("PID"));
				s.sethId(rset.getInt("HID"));
				//s.setRlId(rset.getInt("RLID"));
				//s.setPcdId(rset.getInt("PCDID"));
				s.setcGroup(rset.getString("CGROUP"));
				s.setName(rset.getString("NAME"));
				//s.setPoId(rset.getInt("POID"));
				//s.setdId(rset.getInt("DID"));
				s.setlBarcode(rset.getInt("LBARCODE"));
				//s.setpContent(rset.getString("PCONTENT"));
				s.sethDate(rset.getDate("HDATE"));
				
				list.add(s);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

}
