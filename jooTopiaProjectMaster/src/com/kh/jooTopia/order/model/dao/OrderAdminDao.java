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
		HashMap<String, Object> orderDetailHmap = null;
		
		//주문 테이블에 배송정보 추가 후 쿼리문에 추가할 것!
		String query = prop.getProperty("selectPaymentOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, poId);
			
			rset = pstmt.executeQuery();
			
			hmap = new HashMap<String, Object>();
			orderDetail = new ArrayList<HashMap<String, Object>>();
			while(rset.next()) {
				orderDetailHmap = new HashMap<String, Object>();
				//주문 상세 조회 : D.ODID, P.PNAME, (P.PPRICE + (P.PPRICE * G.GRADESALES)), O.STATUS, PY.DELIVERY_PRICE
				orderDetailHmap.put("odId", rset.getInt("ODID"));
				orderDetailHmap.put("pName", rset.getString("PNAME"));
				orderDetailHmap.put("pPrice", rset.getInt(3));
				orderDetailHmap.put("status", rset.getString(4));
				orderDetailHmap.put("deliveryPrice", rset.getInt("DELIVERY_PRICE"));
				
				orderDetail.add(orderDetailHmap);
				
				//그 외 조회 : O.POID, O.PODATE, PY.DEPOSIT_NAME, PY.PAYMENT_OPTION, M.USER_NAME, M.PHONE, O.DMESSAGE
				//배송정보 추가되면 추가로 넣을 것
				hmap.put("poId", rset.getInt("POID"));
				hmap.put("poDate", rset.getDate("PODATE"));
				hmap.put("depositName", rset.getString("DEPOSIT_NAME"));
				hmap.put("paymentOption", rset.getString("PAYMENT_OPTION"));
				hmap.put("userName", rset.getString("USER_NAME"));
				hmap.put("phone", rset.getString("PHONE"));
				hmap.put("dMessage", rset.getString("DMESSAGE"));
				hmap.put("deliveryPrice", rset.getInt("DELIVERY_PRICE"));
				
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

}
