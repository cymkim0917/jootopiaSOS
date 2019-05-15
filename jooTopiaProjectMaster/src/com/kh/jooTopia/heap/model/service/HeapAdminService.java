package com.kh.jooTopia.heap.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jooTopia.heap.model.dao.HeapAdminDao;
import com.kh.jooTopia.heap.model.vo.HeapAdmin;


import static com.kh.jooTopia.common.JDBCTemplate.close;
import static com.kh.jooTopia.common.JDBCTemplate.getConnection;
 
public class HeapAdminService {

	public ArrayList<HeapAdmin> selectAdminList() {
		
		Connection con = getConnection();
		
		ArrayList<HeapAdmin> list = new HeapAdminDao().selectAdminList(con);
		
		close(con);
		
		return list;
	}

}
