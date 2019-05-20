package com.kh.jooTopia.delivery.model.service;

import static com.kh.jooTopia.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.jooTopia.board.model.vo.PageInfo;
import com.kh.jooTopia.delivery.model.dao.DeliveryAdminDao;

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

}
