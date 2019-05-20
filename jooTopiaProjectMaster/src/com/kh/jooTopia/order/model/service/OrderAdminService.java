package com.kh.jooTopia.order.model.service;

import java.sql.Connection; 
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.jooTopia.board.model.vo.PageInfo;
import com.kh.jooTopia.order.model.dao.OrderAdminDao;
import com.kh.jooTopia.order.model.vo.POrder;

import static com.kh.jooTopia.common.JDBCTemplate.*;

public class OrderAdminService {

	public ArrayList<POrder> selectAdminTotalOrder() {
		//주문 메인 전체 갯수 조회
		Connection con = getConnection();
		ArrayList<POrder> list = new OrderAdminDao().selectAdminTotalOrder(con);

		close(con);

		return list;
	}

	public int getOrderListCount(String query) {
		//페이징 처리용
		Connection con = getConnection();

		int listCount = new OrderAdminDao().getProductListCount(con, query);

		close(con);

		return listCount;
	}

	public ArrayList<HashMap<String, Object>> selectPaymentList(PageInfo pageInfo) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new OrderAdminDao().selectPaymentList(con, pageInfo);

		close(con);

		return list;
	}

	public int changeStatusOrder(String status, int[] poId) {
		//주문상태 변경
		Connection con = getConnection();
		int result = new OrderAdminDao().changeStatusOrder(con, status, poId);

		close(con);

		return result;
	}

	public HashMap<String, Object> selectPaymentOne(int poId) {
		//입금전 주문 상세보기
		Connection con = getConnection();
		HashMap<String, Object> hmap = new OrderAdminDao().selectPaymentOne(con, poId);
		
		close(con);
		
		return hmap;
	}

	public int changeConditionOne(String changeQuery) {
		//배송메시지, 배송지주소 등 한가지만 변경
		Connection con = getConnection();
		int result = new OrderAdminDao().changeConditionOne(con, changeQuery);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		return result;
	}

}