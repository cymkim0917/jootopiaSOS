package com.kh.jooTopia.payment.model.service;

import com.kh.jooTopia.order.model.vo.POrder;
import com.kh.jooTopia.payment.model.dao.PaymentDao;
import com.kh.jooTopia.payment.model.vo.Payment;

import static com.kh.jooTopia.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

public class PaymentService {

	public int insertAccountPayment(Payment pym, POrder o) {
		Connection con = getConnection();
		int result1 = new PaymentDao().insertAccountPayment(con, pym);
		int result2 = 0;
		
		int pymId = 0;
		int poId = 0;
		
		if(result1 > 0) {
			commit(con);
			System.out.println("PAYMENT INSERT 성공");
			//PAYMENT INSERT에 성공하면 CURRVAL로 PYMID를 가져온다
			pymId = new PaymentDao().selectCurrvalPymId(con);
			if(pymId > 0) {
				System.out.println("PYMID 찾기 성공 : " + pymId);
				//PYMID 가져오기에 성공하면 PORDER INSERT
				o.setPymId(pymId);
				result2 = new PaymentDao().insertAccountPOrder(con, o);
				
				if(result2 > 0) {
					System.out.println("PORDER INSERT 성공");
					commit(con);
					//PORDER INSERT에 성공하면 CURRVAL로 POID를 가져온다
					poId = new PaymentDao().selectCurrvalPoId(con);
					System.out.println("POID 찾기 성공 : " + poId);
				}
			}
		}else {
			rollback(con);
			return -1;
		}
		
		return poId;
	}

	public int insertOrderDetail(int poId, ArrayList<Integer> pId) {
		//ORDER_DETAIL INSERT
		Connection con = getConnection();
		int result = 0;
		
		for(int i = 0; i < pId.size(); i++) {
			result += new PaymentDao().insertOrderDetail(con, poId, pId.get(i));
		}
		
		if(result > 0 && result == pId.size()) {
			commit(con);
		}else {
			rollback(con);
		}
		
		return result;
	}

}
