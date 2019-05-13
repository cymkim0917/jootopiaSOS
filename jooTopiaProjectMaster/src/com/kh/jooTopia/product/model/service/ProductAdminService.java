package com.kh.jooTopia.product.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jooTopia.board.model.vo.Attachment;
import com.kh.jooTopia.product.model.dao.ProductAdminDao;
import com.kh.jooTopia.product.model.vo.Product;

import static com.kh.jooTopia.common.JDBCTemplate.*;

public class ProductAdminService {

	public int updateProduct(Product p, ArrayList<Attachment> fileList) {
		Connection con = getConnection();
		int result;
		
		int result1 = new ProductAdminDao().updateProduct(con, p);
		
		if(result1 > 0) {
			
			for(int i = 0; i < fileList.size(); i++) {
				fileList.get(i).setpNo(p.getpNo());
			}
			 
		}else {
			rollback(con);
			return -1;
		}
		
		int result2 = new ProductAdminDao().insertAttachment(con, fileList);
		
		System.out.println("result2 : " + result2);
		
		if(result1 > 0 && result2 == fileList.size()) {
			commit(con);
			result = 1;
		}else {
			rollback(con);
			result = 0;
		}
		
		close(con);
		
		return result;
	}
	
}
