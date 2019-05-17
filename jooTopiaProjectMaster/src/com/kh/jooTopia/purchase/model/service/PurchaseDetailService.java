package com.kh.jooTopia.purchase.model.service;

import static com.kh.jooTopia.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.jooTopia.purchase.model.dao.PurchaseDetailDao;
import com.kh.jooTopia.purchase.model.vo.PurchaseDetail;

public class PurchaseDetailService {

	public int insertPCDaccept(PurchaseDetail pcd) {
		Connection con = getConnection();
		int result = 0;
		
		result = new PurchaseDetailDao().insertPCDaccept(con, pcd);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}
}
