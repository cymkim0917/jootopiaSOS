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
		Connection con = getConnection();
		int result = new OrderAdminDao().changeStatusOrder(con, status, poId);

		close(con);

		return result;
	}

}