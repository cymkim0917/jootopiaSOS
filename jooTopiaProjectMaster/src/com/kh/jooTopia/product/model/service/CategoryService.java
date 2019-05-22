package com.kh.jooTopia.product.model.service;

import static com.kh.jooTopia.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.jooTopia.product.model.dao.CategoryDao;

public class CategoryService {

	public ArrayList<String> selectNameList(String group) {
		Connection con = getConnection();
		
		ArrayList<String> list = new CategoryDao().selectNameList(con, group);
		
		close(con);
		
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectProductList(int cid) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = null;
		
		switch(cid){
			case 6:
				list = new CategoryDao().selectProductList(con,cid);break;
			case 16:	
				list = new CategoryDao().selectProductList2(con,cid);break;
			case 26:
				list = new CategoryDao().selectProductList3(con,cid);break;
			default:
				list = new CategoryDao().selectOneProductList(con,cid); break;
		}
		
		
		
		close(con);
		
		return list;
	}

}
