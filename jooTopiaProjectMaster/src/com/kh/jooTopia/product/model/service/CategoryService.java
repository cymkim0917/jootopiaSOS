package com.kh.jooTopia.product.model.service;

import static com.kh.jooTopia.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jooTopia.product.model.dao.CategoryDao;

public class CategoryService {

	public ArrayList<String> selectNameList(String group) {
		Connection con = getConnection();
		
		ArrayList<String> list = new CategoryDao().selectNameList(con, group);
		
		close(con);
		
		return list;
	}

}
