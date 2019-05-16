package com.kh.jooTopia.purchase.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Properties;

import static com.kh.jooTopia.common.JDBCTemplate.*;

public class PurchaseDetailDao {
	private Properties prop = new Properties();
	
	public PurchaseDetailDao() {
		String fileName = PurchaseDetailDao.class.getResource("/sql/purchase/purchaseDetail-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// 매입신청서 작성시 PurchaseDetial상태 추가
	public int insertPCDWhenApply(Connection con, int pcid) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertWhenApply");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, pcid);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// PurchaseDetail의 신청 수락 대기
	public HashMap<String, Object> selectPCDstatus(Connection con, HashMap<String, Object> hmap, String status) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectPCDstatus");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(String.valueOf(hmap.get("pcid"))));
			pstmt.setString(2, status);
			
			rset = pstmt.executeQuery();
			
			if(rset.next() && rset.getInt(1) > 0) {
				hmap.put(status, "Y");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return hmap;
	}
}
