package com.kh.jooTopia.productreg.model.service;

import com.kh.jooTopia.productreg.model.dao.ProductregAdminDao;
import com.kh.jooTopia.productreg.model.vo.ProductregAdmin;

import static com.kh.jooTopia.common.JDBCTemplate.*;

import java.sql.Connection;

public class ProductregAdminService {

	public ProductregAdmin selectOneProductreg(int num) {
		
		Connection con = getConnection();
		
		ProductregAdmin p = new ProductregAdminDao().selectOneProductregAdmin(con, num);		
		
		close(con);		
		
		return p;
	}
}
