package com.kh.jooTopia.purchase.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jooTopia.board.model.vo.Attachment;
import com.kh.jooTopia.board.model.vo.Board;
import com.kh.jooTopia.purchase.model.vo.Purchase;
import static com.kh.jooTopia.common.JDBCTemplate.*;

public class PurchaseDao {
	Properties prop = new Properties();
	
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
			pstmt.setInt(3, p.getAppDistance());
			pstmt.setString(4, p.getAppPhone());
			pstmt.setString(5, p.getBrand());
			pstmt.setString(6, p.getModel());
			pstmt.setString(7, p.getUsePeriod());
			pstmt.setInt(8, p.getPrimeCost());
			pstmt.setInt(9, p.getHopeCost());
			pstmt.setString(10, p.getMemo());
			pstmt.setInt(11, cid);
			
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
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return result;
	}

	public int insertPurchaseImage(Connection con, int bid, ArrayList<Attachment> fileList) {
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
				
				pstmt.setInt(1, fileList.get(i).getbId());
				pstmt.setString(2, fileList.get(i).getOriginName());
				pstmt.setString(3, fileList.get(i).getChangeName());
				pstmt.setString(4, fileList.get(i).getFilePath());
				
				int level = 0;
				if(i == 0) level = 0;
				else level = 1;
				
				pstmt.setInt(5, level);
				
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
}











