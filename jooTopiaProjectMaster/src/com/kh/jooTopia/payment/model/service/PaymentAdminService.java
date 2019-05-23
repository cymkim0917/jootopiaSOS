package com.kh.jooTopia.payment.model.service;

import static com.kh.jooTopia.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.jooTopia.board.model.vo.PageInfo;
import com.kh.jooTopia.payment.model.dao.PaymentAdminDao;
import com.kh.jooTopia.product.model.dao.ProductAdminDao;

public class PaymentAdminService {

	public int updatePaymentStatus(int pymId) {
		//계좌이체 주문취소건 : 상태를 주문취소로 변경
		Connection con = getConnection();
		int result = 0;
		int result1 = new PaymentAdminDao().updatePaymentStatus(con, pymId);
		int result2 = 0;
		if(result1 > 0) {
			//주문상태를 주문취소로 변경 시 주문취소 테이블 INSERT
			result2 = new PaymentAdminDao().insertPaymentCancle(con, pymId);
			if(result2 > 0) {
				commit(con);
				result = 1;
			}else {
				rollback(con);
			}
		}else {
			rollback(con);
		}
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectRefundList(PageInfo pageInfo) {
		//환불목록 전체리스트 조회
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new PaymentAdminDao().selectRefundList(con, pageInfo);
		
		close(con);
		
		return list;
	}

	public int insertRefund(ArrayList<Integer> pymCId, ArrayList<Integer> rfPrice) {
		//환불REFUND INSERT
		Connection con = getConnection();
		
		int result = 0;
		int result1 = new PaymentAdminDao().insertRefund(con, pymCId, rfPrice);
		int result2 = 0;
		
		if(result1 > 0 && result1 == pymCId.size()) {
			//해당 주문건에 대한 상품 상태를 '환불완료'로 수정
			result2 = new ProductAdminDao().updateRefundProductStatus(con, pymCId);
			if(result2 > 0 && result2 == pymCId.size()) {
				commit(con);
			}else {
				rollback(con);
			}
		}else {
			rollback(con);
		}
		
		return result;
	}

}
