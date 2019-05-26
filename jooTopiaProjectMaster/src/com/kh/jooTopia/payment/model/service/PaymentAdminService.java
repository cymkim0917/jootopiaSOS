package com.kh.jooTopia.payment.model.service;

import static com.kh.jooTopia.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.jooTopia.board.model.vo.PageInfo;
import com.kh.jooTopia.order.model.vo.POrder;
import com.kh.jooTopia.payment.model.dao.PaymentAdminDao;
import com.kh.jooTopia.payment.model.vo.Payment;
import com.kh.jooTopia.product.model.dao.ProductAdminDao;

public class PaymentAdminService {

	public int updatePaymentStatus(int pymId) {
		
		Connection con = getConnection();
		int result = 0;
		
		//결제를 결제취소 상태로 변경
		int result1 = new PaymentAdminDao().updatePaymentStatus(con, pymId);
		if(result1 <= 0) {
			System.out.println("결제취소 변경 실패");
			rollback(con);
			return result;
		}
		
		//주문상태를 주문취소로 변경 시 결제취소 테이블 INSERT
		int result2 = new PaymentAdminDao().insertPaymentCancle(con, pymId);
		if(result2 <= 0) {
			System.out.println("결제취소 인서트 실패");
			rollback(con);
			return result;
		}
		
		//결제번호를 통해 주문번호 조회
		int poId = new PaymentAdminDao().selectCanclePoId(con, pymId);
		if(poId <= 0) {
			System.out.println("주문번호 조회 실패");
			rollback(con);
			return result;
		}
		
		//계좌이체 주문취소건 : 상태를 주문취소로 변경
		int result3 = new PaymentAdminDao().updateOrderCancleStatus(con, poId);
		if(result3 <= 0) {
			System.out.println("주문취소로 변경 실패");
			rollback(con);
			return result;
		}
		
		//주문취소 테이블 추가
		int result4 = new PaymentAdminDao().insertOrderCancle(con, poId);
		if(result4 <= 0) {
			System.out.println("주문취소 테이블 추가 실패");
			rollback(con);
			return result;
		}
		
		if(result1 > 0 && result2 > 0 && result3 > 0 && result4 > 0) {
			System.out.println("성공");
			commit(con);
			result = 1;
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
		Connection con = getConnection();
		
		//환불 테이블에 INSERT
		int result = new PaymentAdminDao().insertRefund(con, pymCId, rfPrice);
		System.out.println(result);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public int insertCardPayment(Payment pym, POrder o, ArrayList<Integer> pIdList) {
		Connection con = getConnection();
		int result = 0;
		
		//1. PAYMENT INSERT
		int result1 = new PaymentAdminDao().insertCardPayment(con, pym);
		if(result1 <= 0) {
			System.out.println("PAYMENT INSERT 실패");
			rollback(con);
			return result;
		}
		
		//2. 방금 INSERT한 PAYMENT의 PYMID를 CURRVAL로 조회
		int pymId = new PaymentAdminDao().selectPymIdCurrval(con);
		if(pymId == 0) {
			System.out.println("PYMID 조회 실패");
			rollback(con);
			return result;
		}
		

		//3. PYMID를 찾아오면 PORDER INSERT
		o.setPymId(pymId);
		int result2 = new PaymentAdminDao().insertCardOrder(con, o);
		if(result2 <= 0) {
			System.out.println("PORDER INSERT 실패");
			rollback(con);
			return result;
		}
		
		//4. PORDER INSERT 성공하면 POID를 CURRVAL로 조회
		int poId = new PaymentAdminDao().selectPoIdCurrval(con);
		if(poId == 0) {
			System.out.println("POID 조회 실패");
			rollback(con);
			return result;
		}
		
		//5. POID 조회하면 ORDER_DETAIL INSERT
		int result3 = new PaymentAdminDao().insertOrderDetail(con, poId, pIdList);
		if(result3 <= 0 || result3 != pIdList.size()) {
			System.out.println("ORDER_DETAIL INSERT 실패");
			rollback(con);
			return result;
		}
	
		//6. ORDER_DETAIL INSERT에 성공하면 해당 상품의 상태를 판매중지로 변경
		int result4 = new PaymentAdminDao().updatePymProductStatus(con, pIdList);
		
		if(result4 <= 0 || result4 != pIdList.size()) {
			System.out.println("상품상태 판매중지 변경 실패");
			rollback(con);
			return result;
		}
		
		if(result1 == result2 && result4 == pIdList.size()) {
			System.out.println("성공~~~");
			commit(con);
			result = 1;
		}
		
		close(con);
		
		return result;
	}

}
