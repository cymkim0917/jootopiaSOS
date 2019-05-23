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
import com.kh.jooTopia.board.model.vo.Board;
import com.kh.jooTopia.purchase.model.vo.Purchase;
import com.kh.jooTopia.purchase.model.vo.PurchaseDetail;

import static com.kh.jooTopia.common.JDBCTemplate.*;

public class PurchaseDao {
	private Properties prop = new Properties();
	
	public PurchaseDao() {
		String fileName = PurchaseDao
				.class
				.getResource("/sql/purchase/purchase-query.properties")
				.getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertPurchase(Connection con, Purchase p, int cid) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertPurchase");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, p.getApplicant());
			pstmt.setString(2, p.getAppAddress());
			pstmt.setDouble(3, p.getAppDistance());
			pstmt.setString(4, p.getAppPhone());
			pstmt.setString(5, p.getBrand());
			pstmt.setString(6, p.getModel());
			pstmt.setString(7, p.getUsePeriod());
			pstmt.setInt(8, p.getPrimeCost());
			pstmt.setInt(9, p.getHopeCost());
			pstmt.setString(10, p.getMemo());
			pstmt.setInt(11, cid);
			pstmt.setInt(12, p.getDelivaryPrice());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int selectCurrval(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int pcid = 0;
		
		String query = prop.getProperty("selectCurrval");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				pcid = rset.getInt("CURRVAL");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return pcid;
	}

	public int insertBoardBno5(Connection con, Board b, int pcid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = prop.getProperty("insertBoardBno5");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, b.getbContent());
			pstmt.setInt(2, pcid);
			pstmt.setInt(3, b.getuNo());
			System.out.println("b.getuNO : " + b.getuNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return result;
	}

	public int insertPurchaseImage(Connection con, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAttachment");
		
		try {
			for(int i = 0; i < fileList.size(); i++) {
				System.out.println();
				System.out.println("넣는 값 : " + fileList.get(i).getbId() + ", " 
						+ fileList.get(i).getOriginName() + ", "
						+ fileList.get(i).getChangeName() + ", "
						+ fileList.get(i).getFilePath());
				 
				pstmt = con.prepareStatement(query);
				

				pstmt.setString(1, fileList.get(i).getOriginName());
				pstmt.setString(2, fileList.get(i).getChangeName());
				pstmt.setString(3, fileList.get(i).getFilePath());
				pstmt.setInt(4, fileList.get(i).getbId());
					
				result += pstmt.executeUpdate();
				
			} 
			System.out.println("dao result : " + result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public HashMap<String, Object> selectPurchaseFin(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		
		String query = prop.getProperty("selectPurchaseFin");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				System.out.println("rset 존재함");
				// PC.APPLICANT, PC.APPLICANT_ADDRESS, PC.APPLICANT_DISTANCE, PC.APPLICANT_PHONE, PC.BRAND, PC.MODEL, PC.USE_PERIOD, PC.PRIME_COST, PC.HOPE_COST, PC.USE_YEAR,
				// PC.CID, B.BID, B.BNO, B.BCONTENT, B.BDATE, B.UNO FROM PURCHASE PC JOIN BOARD B ON (B.PCID = PC.PCID) WHERE PC.PCID = (SELECT MAX(PCID) FROM PURCHASE)
				hmap = new HashMap<String, Object>();
				
				hmap.put("applicnat", rset.getObject("APPLICANT"));
				hmap.put("appAddress", rset.getObject("APPLICANT_ADDRESS"));
				hmap.put("appDistance", rset.getObject("APPLICANT_DISTANCE"));
				hmap.put("appPhone", rset.getObject("APPLICANT_PHONE"));
				hmap.put("brand", rset.getObject("BRAND"));
				hmap.put("model", rset.getObject("MODEL"));
				hmap.put("usePeriod", rset.getObject("USE_PERIOD"));
				hmap.put("primeCost", rset.getObject("PRIME_COST"));
				hmap.put("hopeCost", rset.getObject("HOPE_COST"));
				hmap.put("useYear", rset.getObject("USE_YEAR"));
				hmap.put("category", rset.getObject("CATEGORY"));
				hmap.put("bid", rset.getObject("BID"));
				hmap.put("bno", rset.getObject("BNO"));
				hmap.put("bContent", rset.getObject("BCONTENT"));
				hmap.put("bDate", rset.getObject("BDATE"));
				hmap.put("uno", rset.getObject("UNO"));
				hmap.put("memo", rset.getObject("MEMO"));
				hmap.put("dPrice", rset.getObject("DELIVARY_PRICE"));
			}
			System.out.println("dao에서 hmap : " + hmap);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return hmap;
	}

	public int getListCount(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int listCount = -2;
		
		String query = prop.getProperty("getListCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return listCount;
	}

}










