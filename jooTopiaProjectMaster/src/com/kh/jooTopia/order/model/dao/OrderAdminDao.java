package com.kh.jooTopia.order.model.dao;

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
import com.kh.jooTopia.product.model.dao.ProductAdminDao;

import static com.kh.jooTopia.common.JDBCTemplate.*;

public class OrderAdminDao {
	private Properties prop = new Properties();

	public OrderAdminDao() {
		String fileName = ProductAdminDao.class.getResource("/sql/order/orderAdmin-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<POrder> selectAdminTotalOrder(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<POrder> list = null;
		POrder o = null;

		String query = prop.getProperty("selectAdminTotalOrder");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			while(rset.next()) {
				o = new POrder();
				o.setStatus(rset.getString("STATUS"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}

		return list;
	}

	public int getProductListCount(Connection con, String query) {
		//페이징 처리용

		Statement stmt = null;
		ResultSet rset = null;
		int listCount = 0;

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return listCount;
	}

	public ArrayList<HashMap<String, Object>> selectPaymentList(Connection con, PageInfo pageInfo) {
		//입금전 리스트 출력
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String,Object> hmap = null;
		ResultSet rset = null;

		String query = prop.getProperty("selectPaymentList");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "주문완료");

			rset = pstmt.executeQuery();

			list = new ArrayList<HashMap<String, Object>>();
			while(rset.next()) {
				POrder o = new POrder();

				o.setStatus(rset.getString("STATUS"));
				o.setPoDate(rset.getDate("PODATE"));
				o.setPoId(rset.getInt("POID"));
				o.setdMessage(rset.getString("DMESSAGE"));

				hmap = new HashMap<String,Object>();

				hmap.put("o", o);
				hmap.put("userName", rset.getString("USER_NAME"));
				hmap.put("pName", rset.getString("PNAME"));

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

	public int changeStatusOrder(Connection con, String status, int[] poId) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("changeStatusOrder");

		try {
			pstmt = con.prepareStatement(query);

			for(int i = 0; i < poId.length; i++) {
				pstmt.setString(1, status);
				pstmt.setInt(2, poId[i]);

				result += pstmt.executeUpdate();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public HashMap<String, Object> selectPaymentOne(Connection con, int poId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		ArrayList<HashMap<String, Object>> orderDetail = null;
		HashMap<String, Object> orderDetailMap = null;
		
		String query = prop.getProperty("selectPaymentOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, poId);
			
			rset = pstmt.executeQuery();
			
			hmap = new HashMap<String, Object>();
			orderDetail = new ArrayList<HashMap<String, Object>>();
			orderDetailMap = new HashMap<String, Object>();
			while(rset.next()) {
				POrder o = new POrder();
				//주문 정보 : O.NAME, O.PHONE, O.ADDRESS, O.DMESSAGE, O.STATUS, O.POID, O.PODATE
				o.setName(rset.getString("NAME"));
				o.setPhone(rset.getString("OPHONE"));
				o.setAddress(rset.getString("ADDRESS"));
				o.setdMessage(rset.getString("DMESSAGE"));
				o.setStatus(rset.getString("STATUS"));
				o.setPoId(rset.getInt("POID"));
				o.setPoDate(rset.getDate("PODATE"));
				hmap.put("o", o);
				
				//결제 정보 : PY.DEPOSIT_NAME, PY.PAYMENT_OPTION, PY.CARD_COMPANY, PY.CARD_KIND,
				//PY.INSTALLMENT, PY.TID, PY.PRODUCT_PRICE, PY.DELIVERY_PRICE
				Payment pym = new Payment();
				pym.setDepositName(rset.getString("DEPOSIT_NAME"));
				pym.setPaymentOption(rset.getString("PAYMENT_OPTION"));
				pym.setCardCompany(rset.getString("CARD_COMPANY"));
				pym.setCardKind(rset.getString("CARD_KIND"));
				pym.setInstallment(rset.getInt("INSTALLMENT"));
				pym.settId(rset.getInt("TID"));
				pym.setProductPrice(rset.getInt("PRODUCT_PRICE"));
				pym.setDeliveryPrice(rset.getInt("DELIVERY_PRICE"));
				hmap.put("pym", pym);
				
				//그 외 : M.USER_NAME, M.PHONE
				hmap.put("userName", rset.getString("USER_NAME"));
				hmap.put("mPhone", rset.getString("MPHONE"));
				
				//상세조회 : P.PNAME, TRUNC(P.PPRICE + (P.PPRICE * G.GRADESALES)), D.ODID, PY.DELIVERY_PRICE
				orderDetailMap.put("pName", rset.getString("PNAME"));
				orderDetailMap.put("pPrice", rset.getInt("PPRICE"));
				orderDetailMap.put("odId", rset.getInt("ODID"));
				orderDetailMap.put("deliveryPrice", rset.getString("DELIVERY_PRICE"));
				
				orderDetail.add(orderDetailMap);
			}
			hmap.put("orderDetail", orderDetail);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return hmap;
	}

	public int changeConditionOne(Connection con, String changeQuery) {
		Statement stmt = null;
		int result = 0;
		
		String query = prop.getProperty("changeConditionOne");
		
		try {
			stmt = con.createStatement();
			
			result = stmt.executeUpdate(query + changeQuery);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
		}
				
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectPreProductList(Connection con, PageInfo pageInfo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		
		String query = prop.getProperty("selectPreProductList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "상품준비중");
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				//O.STATUS, O.PODATE, O.POID, M.USER_NAME, O.DMESSAGE, P.PNAME, 
				//(PY.PRODUCT_PRICE + PY.DELIVERY_PRICE) AS TOTALPRICE
				
				hmap.put("status", rset.getString("STATUS"));
				hmap.put("poDate", rset.getDate("PODATE"));
				hmap.put("poId", rset.getInt("POID"));
				hmap.put("userName", rset.getString("USER_NAME"));
				hmap.put("dMessage", rset.getString("DMESSAGE"));
				hmap.put("pName", rset.getString("PNAME"));
				hmap.put("totalPrice", rset.getInt("TOTALPRICE"));
				
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

	public HashMap<String, Object> selectPreProductOne(Connection con, int poId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		ArrayList<HashMap<String, Object>> orderDetail = null;
		HashMap<String, Object> orderDetailMap = null;
		
		String query = prop.getProperty("selectPreProductOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, poId);
			
			rset = pstmt.executeQuery();
			
			hmap = new HashMap<String, Object>();
			orderDetail = new ArrayList<HashMap<String, Object>>();
			orderDetailMap = new HashMap<String, Object>();
			while(rset.next()) {
				POrder o = new POrder();
				//주문 정보 : O.NAME, O.PHONE, O.ADDRESS, O.DMESSAGE, O.STATUS, O.POID, O.PODATE
				o.setName(rset.getString("NAME"));
				o.setPhone(rset.getString("OPHONE"));
				o.setAddress(rset.getString("ADDRESS"));
				o.setdMessage(rset.getString("DMESSAGE"));
				o.setStatus(rset.getString("STATUS"));
				o.setPoId(rset.getInt("POID"));
				o.setPoDate(rset.getDate("PODATE"));
				hmap.put("o", o);
				
				//결제 정보 : PY.DEPOSIT_NAME, PY.PAYMENT_OPTION, PY.CARD_COMPANY, PY.CARD_KIND,
				//PY.INSTALLMENT, PY.TID
				Payment pym = new Payment();
				pym.setDepositName(rset.getString("DEPOSIT_NAME"));
				pym.setPaymentOption(rset.getString("PAYMENT_OPTION"));
				pym.setCardCompany(rset.getString("CARD_COMPANY"));
				pym.setCardKind(rset.getString("CARD_KIND"));
				pym.setInstallment(rset.getInt("INSTALLMENT"));
				pym.settId(rset.getInt("TID"));
				pym.setProductPrice(rset.getInt("PRODUCT_PRICE"));
				pym.setDeliveryPrice(rset.getInt("DELIVERY_PRICE"));
				hmap.put("pym", pym);
				
				//그 외 : M.USER_NAME, M.PHONE
				hmap.put("userName", rset.getString("USER_NAME"));
				hmap.put("mPhone", rset.getString("MPHONE"));
				
				//상세조회 : P.PNAME, TRUNC(P.PPRICE + (P.PPRICE * G.GRADESALES)), D.ODID, PY.DELIVERY_PRICE
				orderDetailMap.put("pName", rset.getString("PNAME"));
				orderDetailMap.put("pPrice", rset.getInt("PPRICE"));
				orderDetailMap.put("odId", rset.getInt("ODID"));
				orderDetailMap.put("deliveryPrice", rset.getString("DELIVERY_PRICE"));
				
				orderDetail.add(orderDetailMap);
			}
			hmap.put("orderDetail", orderDetail);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return hmap;
	}

}
