package com.kh.jooTopia.order.model.service;

import java.sql.Connection; 
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.jooTopia.board.model.vo.PageInfo;
import com.kh.jooTopia.order.model.dao.OrderAdminDao;
import com.kh.jooTopia.order.model.vo.OrderCancle;
import com.kh.jooTopia.order.model.vo.POrder;
import com.kh.jooTopia.product.model.dao.ProductAdminDao;

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
		//입금전관리 전체 리스트 출력
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new OrderAdminDao().selectPaymentList(con, pageInfo);
		
		close(con);

		return list;
	}

	public int changeStatusOrder(String status, ArrayList<Integer> poId) {
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
		//수령자명, 수령자 연락처, 배송지 주소, 배송메시지 중 한가지만 변경
		Connection con = getConnection();
		int result = new OrderAdminDao().changeConditionOne(con, changeQuery);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectPreProductList(PageInfo pageInfo) {
		//상품준비중 리스트 출력
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new OrderAdminDao().selectPreProductList(con, pageInfo);
		
		/*HashMap<String, Object> hmap = null;
		
		for(int i = 0; i < list.size(); i++) {
			hmap = list.get(i);
			new OrderAdminDao().getPOrderCount(con, hmap);
		}*/
		
		close(con);
		
		return list;
	}

	public HashMap<String, Object> selectPreProductOne(int poId) {
		//상품준비중 주문 상세보기
		Connection con = getConnection();
		HashMap<String, Object> hmap = new OrderAdminDao().selectPreProductOne(con, poId);
		
		close(con);
				
		return hmap;
	}

	public int updatePayment(int poId) {
		//입금전 정보의 입금완료 처리
		Connection con = getConnection();
		int result = new OrderAdminDao().updatePayment(con, poId);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectOrderProductList(ArrayList<Integer> orderPId) {
		//회원의 주문하려는 예비 상품목록 출력하기
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> productList = new OrderAdminDao().selectOrderProductList(con, orderPId);
		
		close(con);
		
		return productList;
	}

	public ArrayList<HashMap<String, Object>> selectOrderCancleList(PageInfo pageInfo) {
		//주문취소 전체리스트 조회
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new OrderAdminDao().selectOrderCancleList(con, pageInfo);
		
		close(con);
		
		return list;
	}

	public int adminOrderCancle(OrderCancle oc) {
		//주문취소 처리
		Connection con = getConnection();
		int result = 0;
		
		//해당 주문의 상태를 '주문취소'로 변경
		int result1 = new OrderAdminDao().updateOrderStatus(con, oc.getPoId());
		if(result1 <= 0) {
			System.out.println("주문취소 변경 실패");
			rollback(con);
			return result;
		}
		
		//해당주문의 PYMID를 조회
		int pymId = new OrderAdminDao().selectOrderCanclePymId(con, oc.getPoId());
		if(pymId <= 0) {
			System.out.println("pymId 조회 실패");
			rollback(con);
			return result;
		}
		
		//해당주문의 결제 상태를 결제취소로 변경
		int result2 = new OrderAdminDao().updateOrderCanclePaymaneStatus(con, pymId);
		if(result2 <= 0) {
			System.out.println("결제취소 변경 실패");
			rollback(con);
			return result;
		}
		
		//주문취소로 변경하면 주문취소 테이블 INSERT
		int result3 = new OrderAdminDao().insertOrderCancle(con, oc);
		if(result3 <= 0) {
			System.out.println("주문취소 테이블 추가 실패");
			rollback(con);
			return result;
		}
		
		ArrayList<Integer> poIdList = null;
		//해당 주문에 해당하는 상품 PID SELECT
		poIdList = new ProductAdminDao().selectThisOrderPid(con, oc.getPoId());
		//해당 주문에 대한 상품의 상태를 판매중으로 변경
		int result4 = new ProductAdminDao().changeStatusProduct(con, "판매중", poIdList);
		if(result4 <= 0 && result4 != poIdList.size()) {
			System.out.println("해당상품 판매중 변경 실패");
			rollback(con);
			return result;
		}
		
		if(result1 > 0 && result2 > 0 && result3 > 0 && result4 == poIdList.size()) {
			System.out.println("커밋스");
			commit(con);
			result = 1;
		}
		
		
		return result;
	}

}