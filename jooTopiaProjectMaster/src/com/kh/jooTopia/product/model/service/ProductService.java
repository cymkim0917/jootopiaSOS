package com.kh.jooTopia.product.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import static com.kh.jooTopia.common.JDBCTemplate.*;

import com.kh.jooTopia.board.model.vo.PageInfo;
import com.kh.jooTopia.product.model.dao.ProductDao;

public class ProductService {

	public ArrayList<HashMap<String,Object>> productList() {
		Connection con = getConnection();
		
		
		ArrayList<HashMap<String,Object>> productList = new ProductDao().productList(con);
		
		
		close(con);
		
		return productList;
	}

	public HashMap<String, Object> detailProduct(int pid) {
		Connection con = getConnection();
		
		int result = new ProductDao().updateCount(con,pid);
		HashMap<String, Object> detailProc = null;
		if(result > 0 ) {
			commit(con);
			detailProc = new ProductDao().detailProduct(con,pid);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return detailProc;
	}


	

}
