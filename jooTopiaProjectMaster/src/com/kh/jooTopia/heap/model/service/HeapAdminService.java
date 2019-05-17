package com.kh.jooTopia.heap.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jooTopia.heap.model.dao.HeapAdminDao;
import com.kh.jooTopia.heap.model.vo.HeapAdmin;


import static com.kh.jooTopia.common.JDBCTemplate.*;

 
public class HeapAdminService {

	public ArrayList<HeapAdmin> selectAdminList() {
		
		Connection con = getConnection();
		
		ArrayList<HeapAdmin> list = new HeapAdminDao().selectAdminList(con);
		
		close(con);
		
		return list;
	}

	public int insertAdminHeap(HeapAdmin h) {
		
		Connection con = getConnection();
		
		int result = new HeapAdminDao().insertAdminHeap(con, h);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
				
		
		return result;
	}

	public HeapAdmin selectOneAdminHeap(int num) {
		
		Connection con = getConnection();
		
		HeapAdmin h = new HeapAdminDao().selectOneAdminHeap(con, num);
		
		close(con);
		
		return h;
	}

	
}
