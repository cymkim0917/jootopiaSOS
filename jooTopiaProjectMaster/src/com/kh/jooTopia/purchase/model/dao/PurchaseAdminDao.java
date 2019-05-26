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

import com.kh.jooTopia.board.model.vo.Attachment;
import com.kh.jooTopia.board.model.vo.PageInfo;
import com.kh.jooTopia.purchase.model.vo.PurchaseDetail;

import sun.font.CreatedFontTracker;

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
		System.out.println("selectPurchaseOne Dao");
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
				hmap.put("distance", rset.getObject("APPLICANT_DISTANCE"));
				System.out.println("hmap dao : " + hmap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return hmap;
	}

	public ArrayList<Attachment> selectAttachment(Connection con, int pcid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Attachment> list = null;
		Attachment at = null;
		
		String query = prop.getProperty("selectPurchaseAttachment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pcid);
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Attachment>();
			while(rset.next()) {
				at = new Attachment();
				System.out.println("at 생성");
				at.setfId(rset.getInt("FID"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setFilePath(rset.getString("FILE_PATH"));
				at.setUploadDate(rset.getDate("UPLOAD_DATE"));
				list.add(at);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectPagingList(Connection con, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		
		String query = prop.getProperty("selectPagingList");
		
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			while(rset.next()) {
				HashMap<String, Object> hmap = new HashMap<String, Object>();
				
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
			close(pstmt);
			close(rset);
		}
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectSearchList(Connection con, PageInfo pi, String searchQuery) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		int startRow = (pi.getCurrentPage() - 1) * pi.getLimit() + 1;
		int endRow = startRow + pi.getLimit() - 1;
		
		String query = "SELECT * FROM (SELECT PCID, BNO, UNO, APPLICANT, APPLICANT_PHONE, CATEGORY, BDATE, ROWNUM RNUM "
					 + "FROM (SELECT PC.PCID, B.BNO, M.UNO, PC.APPLICANT, PC.APPLICANT_PHONE, C.CGROUP || ' / ' || C.NAME AS CATEGORY, "
					 + "TO_CHAR(B.BDATE, 'YYYY-MM-DD') BDATE "
					 + " FROM PURCHASE PC "
					 + " JOIN BOARD B ON(PC.PCID = B.PCID)"
					 + " JOIN MEMBER M ON(M.UNO = B.UNO)"
					 + " JOIN CATEGORY C ON(C.CID = PC.CID)"
					 + " WHERE B.STATUS = 'Y'"
					 + " AND " + searchQuery
					 + " ORDER BY PC.PCID DESC))"
					 + " WHERE RNUM BETWEEN " + startRow + " AND " + endRow;
		
		System.out.println("query : " +  query);
		
		try {
			System.out.println("try 시작 : ");
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<HashMap<String, Object>>();
			while(rset.next()) {
				HashMap<String, Object> hmap = new HashMap<String, Object>();
				
				hmap.put("pcid", rset.getObject("PCID"));
				hmap.put("bno", rset.getObject("BNO"));
				hmap.put("uno", rset.getObject("UNO"));
				hmap.put("applicant", rset.getObject("APPLICANT"));
				hmap.put("appPhone", rset.getObject("APPLICANT_PHONE"));
				hmap.put("category", rset.getObject("CATEGORY"));
				hmap.put("bDate", rset.getObject("BDATE"));
				
				list.add(hmap);
			}
			System.out.println("list Dao : " + list);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return list;
	}

	public int insertPersonAccept(Connection con, PurchaseDetail pcd) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("selectPersonAccept");
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pcd.getPcPrice());
			pstmt.setString(2, pcd.getMessage());
			pstmt.setInt(3, pcd.getPcid());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}



