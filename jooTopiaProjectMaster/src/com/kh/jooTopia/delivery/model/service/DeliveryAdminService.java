package com.kh.jooTopia.delivery.model.service;

import static com.kh.jooTopia.common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.jooTopia.board.model.vo.PageInfo;
import com.kh.jooTopia.delivery.model.dao.DeliveryAdminDao;
import com.kh.jooTopia.delivery.model.vo.Delivery;
import com.kh.jooTopia.order.model.vo.POrder;

public class DeliveryAdminService {

	public int insertDelivery(int[] poId) {
		Connection con = getConnection();
		int result = new DeliveryAdminDao().insertDelivery(con, poId);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectDeliveryList(PageInfo pageInfo) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new DeliveryAdminDao().selectDeliveryList(con, pageInfo);
		
		close(con);
		
		return list;
	}

	public HashMap<String, Object> selectDeliveryOne(int dId) {
		Connection con = getConnection();
		HashMap<String, Object> hmap = new DeliveryAdminDao().selectDeliveryOne(con, dId);
		
		close(con);
		
		return hmap;
	}

	public HashMap<String, Object> selectDeliveryModal(int dId) {
		//배송중 모달 출력용
		Connection con = getConnection();
		
		HashMap<String, Object> hmap = new DeliveryAdminDao().selectDeliveryModal(con, dId);
		
		close(con);
		
		return hmap;
	}

	public int updateAdminDeliveryModal(POrder modiOrder, Delivery modiDelivery) {
		//배송중 배송정보(및 주문) 모달 수정용
		Connection con = getConnection();
		
		int result = new DeliveryAdminDao().updateAdminDeliveryModal(con, modiOrder, modiDelivery);
		
		if(result > 1) {
			commit(con);
		}else {
			rollback(con);
		}
		
		return result;
	}

	public int changeStatusDelivery(String status, ArrayList<Integer> dId) {
		//배송상태 변경 - 배송완료
		Connection con = getConnection();
		int result = 0;
		
		result += new DeliveryAdminDao().changeStatusDelivery(con, status, dId);
		if(result > 0 && result == dId.size()) {
			commit(con);
		}else {
			rollback(con);
		}
		
		return result;
	}

	public int changeStatusProduct(String pStatus, ArrayList<Integer> dId) {
		//배송완료된 상품상태 변경 - 판매완료
		Connection con = getConnection();
		int result = 0;
		
		result += new DeliveryAdminDao().changeStatusProduct(con, pStatus, dId);
		if(result > 0 && result == dId.size()) {
			commit(con);
		}else {
			rollback(con);
		}
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectDelCompletedList(PageInfo pageInfo) {
		//배송완료 전체 리스트 조회
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new DeliveryAdminDao().selectDelCompletedList(con, pageInfo);
		
		close(con);
		
		return list;
	}

	public HashMap<String, Object> selectDelCompletedOne(int dId) {
		Connection con = getConnection();
		HashMap<String, Object> hmap = new DeliveryAdminDao().selectDelCompletedOne(con, dId);
		
		close(con);
		
		return hmap;
	}

}
