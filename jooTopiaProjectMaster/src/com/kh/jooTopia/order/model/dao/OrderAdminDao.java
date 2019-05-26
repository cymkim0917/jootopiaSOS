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

import com.kh.jooTopia.board.model.vo.Attachment;
import com.kh.jooTopia.board.model.vo.PageInfo;
import com.kh.jooTopia.delivery.model.vo.Delivery;
import com.kh.jooTopia.order.model.vo.OrderCancle;
import com.kh.jooTopia.order.model.vo.POrder;
import com.kh.jooTopia.payment.model.vo.Payment;
import com.kh.jooTopia.product.model.dao.ProductAdminDao;
import com.kh.jooTopia.product.model.vo.Product;

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
		int startRow = (pageInfo.getCurrentPage()-1)*pageInfo.getLimit()+1;
		int endRow = startRow + pageInfo.getLimit()-1;

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "주문완료");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

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

	public int changeStatusOrder(Connection con, String status, ArrayList<Integer> poId) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("changeStatusOrder");

		try {
			pstmt = con.prepareStatement(query);

			for(int i = 0; i < poId.size(); i++) {
				pstmt.setString(1, status);
				pstmt.setInt(2, poId.get(i));

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
				pym.settId(rset.getString("TID"));
				pym.setProductPrice(rset.getInt("PRODUCT_PRICE"));
				pym.setDeliveryPrice(rset.getInt("DELIVERY_PRICE"));
				hmap.put("pym", pym);
				
				//그 외 : M.USER_NAME, M.PHONE
				hmap.put("userName", rset.getString("USER_NAME"));
				hmap.put("mPhone", rset.getString("MPHONE"));
				
				
				orderDetailMap = new HashMap<String, Object>();
				//상세조회 : P.PNAME, P.PID, TRUNC(P.PPRICE + (P.PPRICE * G.GRADESALES)), D.ODID, PY.DELIVERY_PRICE
				orderDetailMap.put("pName", rset.getString("PNAME"));
				orderDetailMap.put("pId", rset.getInt("PID"));
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
		int startRow = (pageInfo.getCurrentPage()-1)*pageInfo.getLimit()+1;
		int endRow = startRow + pageInfo.getLimit()-1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "상품준비중");
			pstmt.setString(2, "결제완료");
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			
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
				
				//결제 정보 : PY.PYMID, PY.DEPOSIT_NAME, PY.PAYMENT_OPTION, PY.CARD_COMPANY, PY.CARD_KIND,
				//PY.INSTALLMENT, PY.TID, PY.PYMDATE
				Payment pym = new Payment();
				pym.setPymId(rset.getInt("PYMID"));
				pym.setPymDate(rset.getDate("PYMDATE"));
				pym.setDepositName(rset.getString("DEPOSIT_NAME"));
				pym.setPaymentOption(rset.getString("PAYMENT_OPTION"));
				pym.setCardCompany(rset.getString("CARD_COMPANY"));
				pym.setCardKind(rset.getString("CARD_KIND"));
				pym.setInstallment(rset.getInt("INSTALLMENT"));
				pym.settId(rset.getString("TID"));
				pym.setProductPrice(rset.getInt("PRODUCT_PRICE"));
				pym.setDeliveryPrice(rset.getInt("DELIVERY_PRICE"));
				pym.setDepositDate(rset.getDate("DEPOSIT_DATE"));
				hmap.put("pym", pym);
				
				//그 외 : M.USER_NAME, M.PHONE
				hmap.put("userName", rset.getString("USER_NAME"));
				hmap.put("mPhone", rset.getString("MPHONE"));
				
				orderDetailMap = new HashMap<String, Object>();
				//상세조회 : P.PNAME, P.PID, TRUNC(P.PPRICE + (P.PPRICE * G.GRADESALES)), D.ODID, PY.DELIVERY_PRICE
				orderDetailMap.put("pName", rset.getString("PNAME"));
				orderDetailMap.put("pId", rset.getInt("PID"));
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

	public void getPOrderCount(Connection con, HashMap<String, Object> hmap) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		POrder o = (POrder) hmap.get("o");
		
		String query = prop.getProperty("getPOrderCount");
		
		System.out.println(query);
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, o.getPoId());
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				hmap.put("count", rset.getInt(1));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
	}

	public int updatePayment(Connection con, int poId) {
		//입금완료 처리
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updatePayment");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, poId);
			pstmt.setString(2, "결제완료");
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectOrderProductList(Connection con, ArrayList<Integer> orderPId) {
		//회원의 주문하려는 예비 상품목록 출력하기
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> productList = null;
		HashMap<String, Object> detailMap = null;
		
		
		String query = prop.getProperty("selectOrderProductList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			productList = new ArrayList<HashMap<String, Object>>();
			for(int i = 0; i < orderPId.size(); i++) {
				pstmt.setInt(1, orderPId.get(i));
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					detailMap = new HashMap<String, Object>();
					//P.PID, P.PNAME, P.PPRICE, P.CID, C.CGROUP, C.NAME
					Product p = new Product();
					p.setpId(rset.getInt("PID"));
					p.setpName(rset.getString("PNAME"));
					p.setpPrice(rset.getInt("PPRICE"));
					
					//A.CHANGE_NAME, A.FILE_PATH
					Attachment a = new Attachment();
					a.setChangeName(rset.getString("CHANGE_NAME"));
					a.setFilePath(rset.getString("FILE_PATH"));
					
					detailMap.put("p", p);
					detailMap.put("a", a);
					detailMap.put("cGroup", rset.getString("CGROUP"));
					detailMap.put("cName", rset.getString("NAME"));
					
					productList.add(detailMap);
				}
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return productList;
	}

	public ArrayList<HashMap<String, Object>> selectOrderCancleList(Connection con, PageInfo pageInfo) {
		//주문취소 리스트
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		
		String query = prop.getProperty("selectOrderCancleList");
		int startRow = (pageInfo.getCurrentPage()-1)*pageInfo.getLimit()+1;
		int endRow = startRow + pageInfo.getLimit()-1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "주문취소");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				//O.POID, O.NAME
				POrder o = new POrder();
				o.setPoId(rset.getInt("POID"));
				o.setName(rset.getString("NAME"));
				
				hmap.put("o", o);
				
				//OC.OCID, OC.OCDATE, OC.REASON
				OrderCancle oc = new OrderCancle();
				oc.setOcId(rset.getInt("OCID"));
				oc.setOcDate(rset.getDate("OCDATE"));
				oc.setReason(rset.getString("REASON"));
				
				hmap.put("oc", oc);
				
				//P.PNAME
				hmap.put("pName", rset.getString("PNAME"));
				list.add(hmap);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public int updateOrderStatus(Connection con, int poId) {
		//해당 상품의 상태를 '주문취소'로 변경
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateOrderStatus");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "주문취소");
			pstmt.setInt(2, poId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertOrderCancle(Connection con, OrderCancle oc) {
		//주문취소 테이블 INSERT
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertOrderCancle");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, oc.getPoId());
			pstmt.setString(2, oc.getReason());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public int selectOrderCanclePymId(Connection con, int poId) {
		//주문취소건에 해당하는 결제 PYMID 검색
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int pymId = 0;
		
		String query = prop.getProperty("selectOrderCanclePymId");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, poId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				pymId = rset.getInt("PYMID");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return pymId;
	}

	public int updateOrderCanclePaymaneStatus(Connection con, int pymId) {
		//주문취소건 결제 결제취소로 변경
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateOrderCanclePaymaneStatus");
		
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

}
