package com.kh.jooTopia.stock.model.service;

import static com.kh.jooTopia.common.JDBCTemplate.close;
import static com.kh.jooTopia.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jooTopia.heap.model.vo.PageInfo;
import com.kh.jooTopia.stock.model.dao.StockAdminDao;
import com.kh.jooTopia.stock.model.vo.StockAdmin;
 

public class StockAdminService {

	public ArrayList<StockAdmin> selectAdminList() {
		
		Connection con = getConnection();
		
		ArrayList<StockAdmin> list = new StockAdminDao().selectAdminList(con);
		
		close(con);
		
		return list;
	}

	public int getListCount() {
		
		Connection con = getConnection();
		
		int listCount = new StockAdminDao().getListCount(con);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<StockAdmin> selectAdminList(PageInfo pi) {
		
		Connection con = getConnection();
		
		ArrayList<StockAdmin> list = new StockAdminDao().selectAdminList(con, pi);
		
		close(con);
		
		return list;
	}

}
