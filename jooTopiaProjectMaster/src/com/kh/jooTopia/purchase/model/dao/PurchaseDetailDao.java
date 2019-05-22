package com.kh.jooTopia.purchase.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Properties;

import com.kh.jooTopia.purchase.model.vo.PurchaseDetail;

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
	public String selectPCDstatus(Connection con, int pcid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String status = "";
		
		String sql = prop.getProperty("selectPCDstatus");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, pcid);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				status = rset.getString("STATUS");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return status;
	}

	public String selectPCDbarcode(Connection con, int pcid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String barcode = "";
		
		String sql = prop.getProperty("selectPCDbarcode");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pcid);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				barcode = rset.getString("pBarcode");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return barcode;
	}

	public Object selectPCDdenyReason(Connection con, int pcid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String denyReason = "";
		
		String sql = prop.getProperty("selectPCDdenyReason");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pcid);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				denyReason = rset.getString("APPLY_DENY_REASON");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return denyReason;
	}

	public int insertPCDaccept(Connection con, PurchaseDetail pcd) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertPCDaccept");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, pcd.getPcid());
			pstmt.setString(2, pcd.getpBarcode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertPCDdeny(Connection con, PurchaseDetail pcd) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertPCDdeny");
		
		try {
			pstmt = con.prepareStatement(query);
			
			// INSERT INTO PURCHSE_DETAIL(PCDID, PCID, STATUS, DENY_REASON) VALUES (SEQ_PCDID.NEXTVAL, ?, '', ?)
			pstmt.setInt(1, pcd.getPcid());
			pstmt.setString(2, pcd.getApplydenyReason());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
