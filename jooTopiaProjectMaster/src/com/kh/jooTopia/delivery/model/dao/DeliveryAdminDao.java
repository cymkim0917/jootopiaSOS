package com.kh.jooTopia.delivery.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Properties;

import com.kh.jooTopia.board.model.vo.PageInfo;
import com.kh.jooTopia.delivery.model.vo.Delivery;
import com.kh.jooTopia.order.model.vo.POrder;
import com.kh.jooTopia.payment.model.vo.Payment;

import static com.kh.jooTopia.common.JDBCTemplate.*;

public class DeliveryAdminDao {

private Properties prop = new Properties();

	public DeliveryAdminDao() {
		String fileName = DeliveryAdminDao.class.getResource("/sql/delivery/deliveryAdmin-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertDelivery(Connection con, int[] poId) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertDelivery");
		
		try {
			pstmt = con.prepareStatement(query);
			
			for(int i = 0; i < poId.length; i++) {
				pstmt.setInt(1, poId[i]);
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectDeliveryList(Connection con, PageInfo pageInfo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		
		String query = prop.getProperty("selectDeliveryList");
		int startRow = (pageInfo.getCurrentPage()-1)*pageInfo.getLimit()+1;
		int endRow = startRow + pageInfo.getLimit()-1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "배송완료");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				Delivery d = new Delivery();
				//D.DID, D.STATUS
				d.setdId(rset.getInt("DID"));
				d.setStatus(rset.getString("STATUS"));
				hmap.put("d", d);
				
				//D.START_DATE (형식때문에 따로 셀렉트)
				hmap.put("startDate", rset.getString("START_DATE"));
				
				POrder o = new POrder();
				//O.POID, O.PODATE, O.NAME, O.DMESSAGE
				o.setPoId(rset.getInt("POID"));
				o.setPoDate(rset.getDate("PODATE"));
				o.setName(rset.getString("NAME"));
				o.setdMessage(rset.getString("DMESSAGE"));
				o.setName(rset.getString("NAME"));
				hmap.put("o", o);
				
				//P.PNAME
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

	public HashMap<String, Object> selectDeliveryOne(Connection con, int dId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		ArrayList<HashMap<String, Object>> orderDetail = null;
		HashMap<String, Object> orderDetailMap = null;
		
		String query = prop.getProperty("selectDeliveryOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, dId);
			
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
				o.setStatus(rset.getString("OSTATUS"));
				o.setPoId(rset.getInt("POID"));
				hmap.put("o", o);
				
				//결제 정보 : PY.DEPOSIT_NAME, PY.PAYMENT_OPTION, PY.CARD_COMPANY, PY.CARD_KIND,
				//PY.INSTALLMENT, PY.TID
				Payment pym = new Payment();
				pym.setDepositName(rset.getString("DEPOSIT_NAME"));
				pym.setDepositDate(rset.getDate("DEPOSIT_DATE"));
				pym.setPaymentOption(rset.getString("PAYMENT_OPTION"));
				pym.setCardCompany(rset.getString("CARD_COMPANY"));
				pym.setCardKind(rset.getString("CARD_KIND"));
				pym.setInstallment(rset.getInt("INSTALLMENT"));
				pym.settId(rset.getString("TID"));
				pym.setProductPrice(rset.getInt("PRODUCT_PRICE"));
				pym.setDeliveryPrice(rset.getInt("DELIVERY_PRICE"));
				hmap.put("pym", pym);
				
				//배송정보 : D.DID, D.STATUS
				Delivery d = new Delivery();
				d.setdId(rset.getInt("DID"));
				d.setStatus(rset.getString("DSTATUS"));
				hmap.put("d", d);
				//D.START_DATE
				hmap.put("startDate", rset.getString("START_DATE"));
				System.out.println(hmap.get("startDate"));
				
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
		ArrayList<HashMap<String, Object>> orderDetail22 = (ArrayList<HashMap<String, Object>>)hmap.get("orderDetail");
		
		System.out.println("디테일 사이즈 : " + orderDetail22.size());
		
		return hmap;
	}

	public HashMap<String, Object> selectDeliveryModal(Connection con, int dId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		
		String query = prop.getProperty("selectDeliveryModal");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, dId);
			
			rset = pstmt.executeQuery();
			
			hmap = new HashMap<String, Object>();
			if(rset.next()) {
				//O.POID, O.PODATE, O.NAME, O.PHONE, O.ADDRESS, O.DMESSAGE 
				POrder o = new POrder();
				o.setPoId(rset.getInt("POID"));
				o.setPoDate(rset.getDate("PODATE"));
				o.setName(rset.getString("NAME"));
				o.setPhone(rset.getString("PHONE"));
				o.setAddress(rset.getString("ADDRESS"));
				o.setdMessage(rset.getString("DMESSAGE"));
				
				hmap.put("o", o);
				
				//D.DID, D.START_DATE
				Delivery d = new Delivery();
				d.setdId(rset.getInt("DID"));
				//d.setStartDate(rset.getDate("START_DATE"));
				
				hmap.put("startDate", rset.getString("START_DATE"));
				
				hmap.put("d", d);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return hmap;
	}

	public int updateAdminDeliveryModal(Connection con, POrder modiOrder, Delivery modiDelivery) {
		//배송중 배송정보(및 주문) 모달 수정용
		PreparedStatement pstmt1 = null;
		PreparedStatement pstmt2 = null;
		int result = 0;
		
		String queryOrder = prop.getProperty("updateAdminDeliveryModalOrder");
		String querydelivery = prop.getProperty("updateAdminDeliveryModalDelivery");
		
		try {
			pstmt1 = con.prepareStatement(queryOrder);
			//POID NAME PHONE ADDRESS DMESSAGE START_DATE
			pstmt1.setString(1, modiOrder.getName());
			pstmt1.setString(2, modiOrder.getPhone());
			pstmt1.setString(3, modiOrder.getAddress());
			pstmt1.setString(4, modiOrder.getdMessage());
			pstmt1.setInt(5, modiOrder.getPoId());
			
			result += pstmt1.executeUpdate();
			
			pstmt2 = con.prepareStatement(querydelivery);
			pstmt2.setDate(1, modiDelivery.getStartDate());
			pstmt2.setString(2, modiDelivery.getStatus());
			pstmt2.setInt(3, modiOrder.getPoId());
			
			result += pstmt2.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt1);
			close(pstmt2);
		}
		
		return result;
	}

	public int changeStatusDelivery(Connection con, String status, ArrayList<Integer> dId) {
		//배송상태 변경 - 배송완료
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("changeStatusDelivery");
		try {
			pstmt = con.prepareStatement(query);
			
			for(int i = 0; i < dId.size(); i++) {
				pstmt.setString(1, status);
				pstmt.setInt(2, dId.get(i));
				result += pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int changeStatusProduct(Connection con, String pStatus, ArrayList<Integer> dId) {
		//배송완료된 상품의 상태를 판매완료로 바꾸기
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("changeStatusProduct");
		
		try {
			pstmt = con.prepareStatement(query);
			
			for(int i = 0; i < dId.size(); i++) {
				pstmt.setString(1, pStatus);
				pstmt.setInt(2, dId.get(i));
				
				result += pstmt.executeUpdate();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectDelCompletedList(Connection con, PageInfo pageInfo) {
		//배송완료 전체리스트 조회
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String, Object> hmap = null;
		
		String query = prop.getProperty("selectDelCompletedList");
		int startRow = (pageInfo.getCurrentPage()-1)*pageInfo.getLimit()+1;
		int endRow = startRow + pageInfo.getLimit()-1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "배송완료");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String, Object>>();
			while(rset.next()) {
				hmap = new HashMap<String, Object>();
				Delivery d = new Delivery();
				//D.DID, D.STATUS, D.ARRIVE_DATE
				d.setdId(rset.getInt("DID"));
				d.setStatus(rset.getString("STATUS"));
				d.setArriveDate(rset.getDate("ARRIVE_DATE"));
				hmap.put("d", d);
				
				POrder o = new POrder();
				//O.POID, O.PODATE, O.NAME, O.DMESSAGE
				o.setPoId(rset.getInt("POID"));
				o.setPoDate(rset.getDate("PODATE"));
				o.setName(rset.getString("NAME"));
				o.setdMessage(rset.getString("DMESSAGE"));
				o.setName(rset.getString("NAME"));
				hmap.put("o", o);
				
				//P.PNAME
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

	public HashMap<String, Object> selectDelCompletedOne(Connection con, int dId) {
		//배송완료 상세보기 조회
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		ArrayList<HashMap<String, Object>> orderDetail = null;
		HashMap<String, Object> orderDetailMap = null;
		
		String query = prop.getProperty("selectDelCompletedOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, dId);
			
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
				o.setStatus(rset.getString("OSTATUS"));
				o.setPoId(rset.getInt("POID"));
				hmap.put("o", o);
				
				//결제 정보 : PY.PYMID, PY.DEPOSIT_NAME, PY.PAYMENT_OPTION, PY.CARD_COMPANY, PY.CARD_KIND,
				//PY.INSTALLMENT, PY.TID
				Payment pym = new Payment();
				pym.setPymId(rset.getInt("PYMID"));
				pym.setDepositName(rset.getString("DEPOSIT_NAME"));
				pym.setDepositDate(rset.getDate("DEPOSIT_DATE"));
				pym.setPaymentOption(rset.getString("PAYMENT_OPTION"));
				pym.setCardCompany(rset.getString("CARD_COMPANY"));
				pym.setCardKind(rset.getString("CARD_KIND"));
				pym.setInstallment(rset.getInt("INSTALLMENT"));
				pym.settId(rset.getString("TID"));
				pym.setProductPrice(rset.getInt("PRODUCT_PRICE"));
				pym.setDeliveryPrice(rset.getInt("DELIVERY_PRICE"));
				hmap.put("pym", pym);
				
				//배송정보 : D.DID, D.STATUS, D.ARRIVE_DATE
				Delivery d = new Delivery();
				d.setdId(rset.getInt("DID"));
				d.setStatus(rset.getString("DSTATUS"));
				d.setArriveDate(rset.getDate("ARRIVE_DATE"));
				hmap.put("d", d);
				
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
		ArrayList<HashMap<String, Object>> orderDetail22 = (ArrayList<HashMap<String, Object>>)hmap.get("orderDetail");
		
		System.out.println("디테일 사이즈 : " + orderDetail22.size());
		
		return hmap;
	}

	public ArrayList<Integer> selectHeapPIdSearch(Connection con, int poId) {
		//해당 POID를 통해 PID 조회하기
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Integer> pIdList = null;
		
		String query = prop.getProperty("selectHeapPIdSearch");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, poId);
			
			rset = pstmt.executeQuery();
			
			pIdList = new ArrayList<Integer>();
			while(rset.next()) {
				pIdList.add(rset.getInt("PID"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		
		return pIdList;
	}

	public int updateAdminHeapStatus(Connection con, ArrayList<Integer> pIdList) {
		//적치상태 출고됨으로 변경
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateAdminHeapStatus");
		
		try {
			pstmt = con.prepareStatement(query);
			for(int i = 0; i < pIdList.size(); i++) {
				pstmt.setString(1, "출고됨");
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

	public int insertRealase(Connection con, ArrayList<Integer> pIdList, int poId, Date startDate) {
		//출고 인서트
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertRealase");
		
		try {
			pstmt = con.prepareStatement(query);
			for(int i = 0; i < pIdList.size(); i++) {
				pstmt.setDate(1, startDate);
				pstmt.setInt(2, poId);
				pstmt.setInt(3, pIdList.get(i));
				
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
