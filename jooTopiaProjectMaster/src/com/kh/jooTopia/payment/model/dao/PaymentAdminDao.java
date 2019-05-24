package com.kh.jooTopia.payment.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.jooTopia.board.model.vo.PageInfo;
import com.kh.jooTopia.payment.model.vo.Payment;
import com.kh.jooTopia.payment.model.vo.PaymentCancle;
import com.kh.jooTopia.payment.model.vo.Refund;

import static com.kh.jooTopia.common.JDBCTemplate.*;

public class PaymentAdminDao {
	
	private Properties prop = new Properties();

	public PaymentAdminDao() {
		String fileName = PaymentAdminDao.class.getResource("/sql/payment/paymentAdmin-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int updatePaymentStatus(Connection con, int pymId) {
		//상품준비중-계좌이체 주문취소 상태 업데이트
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updatePaymentStatus");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "결제취소");
			pstmt.setInt(2, pymId);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertPaymentCancle(Connection con, int pymId) {
		//상품준비중-계좌이체에 대한 주문취소 INSERT
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertPaymentCancle");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "상품준비중 단계에서 계좌이체 결제취소");
			pstmt.setInt(2, pymId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectRefundList(Connection con, PageInfo pageInfo) {
		//환불목록 전체 리스트 조회
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		
		String query = prop.getProperty("selectRefundList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "결제취소");
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>> ();
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				//PYMC.PYMCID, PYMC.PYMCDATE, PYMC.REASON, PYMC.REFUND_NY
				PaymentCancle cancle = new PaymentCancle();
				cancle.setPymCId(rset.getInt("PYMCID"));
				cancle.setPymCDate(rset.getDate("PYMCDATE"));
				cancle.setReason(rset.getString("REASON"));
				cancle.setRefundNY(rset.getString("REFUND_NY"));
				
				hmap.put("cancle", cancle);

				//PYM.PYMID, PYM.PRODUCT_PRICE, PYM.DELIVERY_PRICE, PYM.PAYMENT_OPTION
				Payment pym = new Payment();
				pym.setPymId(rset.getInt("PYMID"));
				pym.setProductPrice(rset.getInt("PRODUCT_PRICE"));
				pym.setDeliveryPrice(rset.getInt("DELIVERY_PRICE"));
				pym.setPaymentOption(rset.getString("PAYMENT_OPTION"));
				
				hmap.put("pym", pym);
				
				//RE.RFID, RE.RFDATE, RE.PGNO
				Refund r = new Refund();
				r.setRfId(rset.getInt("RFID"));
				r.setRfDate(rset.getDate("RFDATE"));
				r.setPgNo(rset.getInt("PGNO"));
				
				hmap.put("r", r);
				
				list.add(hmap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public int insertRefund(Connection con, ArrayList<Integer> pymCId, ArrayList<Integer> rfPrice) {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertRefund");
		
		try {
			pstmt = con.prepareStatement(query);
			
			for(int i = 0; i < pymCId.size(); i++) {
				pstmt.setInt(1, rfPrice.get(i));
				pstmt.setInt(2, pymCId.get(i));
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
