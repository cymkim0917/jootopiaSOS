package com.kh.jooTopia.product.model.service;

import static com.kh.jooTopia.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.jooTopia.board.model.vo.PageInfo;
import com.kh.jooTopia.product.model.dao.CategoryDao;
import com.kh.jooTopia.product.model.dao.ProductDao;

public class CategoryService {

	public ArrayList<String> selectNameList(String group) {
		Connection con = getConnection();
		
		ArrayList<String> list = new CategoryDao().selectNameList(con, group);
		
		close(con);
		
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectProductList(int cid,PageInfo pi) {
		Connection con = getConnection();
		
		ArrayList<HashMap<String, Object>> list = null;
		
		switch(cid){
			case 6:
				list = new CategoryDao().selectProductList(con,cid,pi);break;
			case 16:	
				list = new CategoryDao().selectProductList2(con,cid,pi);break;
			case 26:
				list = new CategoryDao().selectProductList3(con,cid,pi);break;
			case 36:
				list = new CategoryDao().selectProductList4(con,cid,pi);break;
			default:
				list = new CategoryDao().selectOneProductList(con,cid,pi); break;
		}		
		close(con);
		
		return list;
	}

	public int getListCount(int cid) {
		Connection con = getConnection();
		int listCount = new CategoryDao().getListCount(con,cid);
	
		close(con);
		return listCount;
	}

	public ArrayList<HashMap<String, Object>> sortProductList(int cid, PageInfo pi,int orderType) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = null;
		
		switch(orderType) {
		case 3:list = new CategoryDao().sortProductList(con,cid,pi,orderType);break;
		case 1:list = new CategoryDao().sortProductList2(con, cid, pi, orderType);break;
		case 2:list = new CategoryDao().sortProductList3(con, cid, pi, orderType);break;
		}
	
		
		close(con);
		
		return list;
	}

}
