package com.kh.jooTopia.purchase.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import static com.kh.jooTopia.common.JDBCTemplate.*;

public class PurchaseAdminDao {
	Properties prop = new Properties();
	
	public PurchaseAdminDao() {
		String fileName = 
				PurchaseAdminDao
					.class
					.getResource("/sql/purchase/purchaseAdmin-query.properties")
					.getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<HashMap<String, Object>> selectPurchaseList(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		
		String query = prop.getProperty("selectPurchaseList");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			// PC.PCID, B.BNO, M.UNO, PC.APPLICANT, PC.APPLICANT_PHONE,
			// C.CGROUP || ' / ' || C.NAME AS CATEGORY, TO_CHAR(B.BDATE, 'YYYY-MM-DD') BDATE
			list = new ArrayList<HashMap<String, Object>>();
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				hmap.put("pcid", rset.getObject("PCID"));
				hmap.put("bno", rset.getObject("BNO"));
				hmap.put("uno", rset.getObject("UNO"));
				hmap.put("applicant", rset.getObject("APPLICANT"));
				hmap.put("appPhone", rset.getObject("APPLICANT_PHONE"));
				hmap.put("category", rset.getObject("CATEGORY"));
				hmap.put("bDate", rset.getObject("BDATE"));
				
				list.add(hmap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return list;
	}

	public HashMap<String, Object> selectPurchaseOne(Connection con, int pcid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		
		String sql = prop.getProperty("selectPurchaseOne");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pcid);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				hmap = new HashMap<String, Object>();
				
				hmap.put("applicant", rset.getObject("APPLICANT"));
				hmap.put("bDate", rset.getObject("BDATE"));
				hmap.put("appAddress", rset.getObject("APPLICANT_ADDRESS"));
				hmap.put("appDistance", rset.getObject("APPLICANT_DISTANCE"));
				hmap.put("appPhone", rset.getObject("APPLICANT_PHONE"));
				hmap.put("category", rset.getObject("CATEGORY"));
				hmap.put("usePeriod", rset.getObject("USE_PERIOD"));
				hmap.put("brand", rset.getObject("BRAND"));
				hmap.put("model", rset.getObject("MODEL"));
				hmap.put("primeCost", rset.getObject("PRIME_COST"));
				hmap.put("hopeCost", rset.getObject("HOPE_COST"));
				hmap.put("bContent", rset.getObject("BCONTENT"));
				hmap.put("memo", rset.getObject("MEMO"));
				hmap.put("pcid", rset.getObject("PCID"));
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



