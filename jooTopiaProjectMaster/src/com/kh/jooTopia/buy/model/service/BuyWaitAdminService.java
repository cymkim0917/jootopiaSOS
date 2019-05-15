package com.kh.jooTopia.buy.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jooTopia.buy.model.dao.BuyWaitAdminDao;
import com.kh.jooTopia.buy.model.vo.BuyWaitAdmin;
import static com.kh.jooTopia.common.JDBCTemplate.*;
 
public class BuyWaitAdminService {

	public ArrayList<BuyWaitAdmin> selectAdminList() {
		
		Connection con = getConnection();
		
		ArrayList<BuyWaitAdmin> list = new BuyWaitAdminDao().selectAdminList(con);
		
		close(con);
		
		return list;
	}

}
