package com.kh.jooTopia.payment.model.dao;

import java.io.FileNotFoundException;
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

import com.kh.jooTopia.board.model.vo.PageInfo;
import com.kh.jooTopia.order.model.vo.POrder;
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

	public int insertCardPayment(Connection con, Payment pym) {
		//카드결제 PAYMENT INSERT
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertCardPayment");
		
		try {
			pstmt = con.prepareStatement(query);
			//PRODUCT_PRICE, DELIVERY_PRIVE, PAYMENT_OPTION, STATUS, 
			//CARD_COMPANY, CARD_KIND, INSTALLMENT, UNO, TID
			pstmt.setInt(1, pym.getProductPrice());
			pstmt.setInt(2, pym.getDeliveryPrice());
			pstmt.setString(3, pym.getPaymentOption());
			pstmt.setString(4, pym.getStatus());
			pstmt.setString(5, pym.getCardCompany());
			pstmt.setString(6, pym.getCardKind());
			pstmt.setInt(7, pym.getInstallment());
			pstmt.setInt(8, pym.getUno());
			pstmt.setString(9, pym.gettId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int selectPymIdCurrval(Connection con) {
		//PAYMENT PYMID 조회
		Statement stmt = null;
		ResultSet rset = null;
		int pymId = 0;
		
		String query = prop.getProperty("selectPymIdCurrval");
		
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
		
		return pymId;
	}

	public int insertCardOrder(Connection con, POrder o) {
		//카드결제 PORDER INSERT
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertCardOrder");
		
		try {
			pstmt = con.prepareStatement(query);
			//STATUS, UNO, PYMID, NAME, PHONE, ADDRESS, DMESSAGE
			pstmt.setString(1, "상품준비중");
			pstmt.setInt(2, o.getuNo());
			pstmt.setInt(3, o.getPymId());
			pstmt.setString(4, o.getName());
			pstmt.setString(5, o.getPhone());
			pstmt.setString(6, o.getAddress());
			pstmt.setString(7, o.getdMessage());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updatePymProductStatus(Connection con, ArrayList<Integer> pIdList) {
		//주문건의 상품상태 판매중지로 변경
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updatePymProductStatus");
		
		try {
			pstmt = con.prepareStatement(query);
			for(int i = 0; i < pIdList.size(); i++) {
				pstmt.setString(1, "판매중지");
				pstmt.setInt(2, pIdList.get(i));
				
				result += pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertOrderDetail(Connection con, int poId, ArrayList<Integer> pIdList) {
		//ORDER_DETAIL INSERT
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertOrderDetail");
		
		try {
			pstmt = con.prepareStatement(query);
			for(int i = 0; i < pIdList.size(); i++) {
				pstmt.setInt(1, poId);
				pstmt.setInt(2, pIdList.get(i));
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int selectPoIdCurrval(Connection con) {
		//POID의 CURRVAL 조회
		Statement stmt = null;
		ResultSet rset = null;
		int poId = 0;
		
		String query = prop.getProperty("selectPoIdCurrval");
		
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

	public int selectCanclePoId(Connection con, int pymId) {
		//POID 조회하기
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int poId = 0;
		
		String query = prop.getProperty("selectCanclePoId");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pymId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				poId = rset.getInt("POID");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return poId;
	}

	public int insertOrderCancle(Connection con, int poId) {
		//주문취소 INSERT
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertOrderCancle");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, poId);
			pstmt.setString(2, "상품준비중 단계에서 주문취소");
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}
}
