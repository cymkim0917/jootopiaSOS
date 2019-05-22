package com.kh.jooTopia.payment.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import com.kh.jooTopia.order.model.vo.POrder;
import com.kh.jooTopia.payment.model.vo.Payment;

import static com.kh.jooTopia.common.JDBCTemplate.*;

public class PaymentDao {
	
	private Properties prop = new Properties();

	public PaymentDao() {
		String fileName = PaymentDao.class.getResource("/sql/payment/payment-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertAccountPayment(Connection con, Payment pym) {
		//계좌이체용 PAYMENT INSERT
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAccountPayment");
		
		try {
			pstmt = con.prepareStatement(query);
			//PRODUCT_PRICE, DELIVERY_PRICE, PAYMENT_OPTION, UNO, DEPOSIT_NAME
			pstmt.setInt(1, pym.getProductPrice());
			pstmt.setInt(2, pym.getDeliveryPrice());
			pstmt.setString(3, "계좌이체");
			pstmt.setInt(4, pym.getUno());
			pstmt.setString(5, pym.getDepositName());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
				
		return result;
	}

	public int selectCurrvalPymId(Connection con) {
		//INSERT한 PAYMENT의 PYMID 값을 CURRVAL로 가져오기
		//SELECT SEQ_BID.CURRVAL FROM DUAL
		Statement stmt = null;
		ResultSet rset = null;
		int pymId = 0;
		
		String query = prop.getProperty("selectCurrvalPymId");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				pymId = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		
		System.out.println(pymId);
		
		return pymId;
	}

	public int insertOrderDetail(Connection con, int poId, int pId) {
		//ORDER_DETAIL INSERT
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertOrderDetail");
		
		try {
			pstmt = con.prepareStatement(query);
			//POID, PID
			pstmt.setInt(1, poId);
			pstmt.setInt(2, pId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertAccountPOrder(Connection con, POrder o) {
		//계좌이체용 PORDER INSERT
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAccountPOrder");
		
		try {
			pstmt = con.prepareStatement(query);
			//UNO, PYMID, NAME, PHONE, ADDRESS, DMESSAGE
			pstmt.setInt(1, o.getuNo());
			pstmt.setInt(2, o.getPymId());
			pstmt.setString(3, o.getName());
			pstmt.setString(4, o.getPhone());
			pstmt.setString(5, o.getAddress());
			pstmt.setString(6, o.getdMessage());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int selectCurrvalPoId(Connection con) {
		//INSERT한 PORDER의 POID 값을 CURRVAL로 가져오기
		//SELECT SEQ_POID.CURRVAL FROM DUAL
		Statement stmt = null;
		ResultSet rset = null;
		int poId = 0;
		
		String query = prop.getProperty("selectCurrvalPoId");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				poId = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return poId;
	}

}
