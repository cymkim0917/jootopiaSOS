package com.kh.jooTopia.product.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.jooTopia.board.model.vo.Attachment;
import com.kh.jooTopia.product.model.dao.ProductAdminDao;
import com.kh.jooTopia.product.model.vo.Product;

import static com.kh.jooTopia.common.JDBCTemplate.*;

public class ProductAdminService {


	public ArrayList<HashMap<String, Object>> selectAddList() {
		//미등록상품 전체 조회
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new ProductAdminDao().selectAddList(con);
		
		close(con);
		
		return list;
	}

	public HashMap<String, Object> selectAddProductOne(int pId) {
		//상품등록 수정 폼 조회
		Connection con = getConnection();
		HashMap<String, Object> hmap = new ProductAdminDao().selectAddOne(con, pId);
		
		close(con);
		
		return hmap;
	}
	
	public int updateProduct(Product p, int fId, ArrayList<Attachment> fileList) {
		//미등록상품의 상품등록(내용수정)
		Connection con = getConnection();
		int result;
		
		int result1 = new ProductAdminDao().updateProduct(con, p);
		
		if(result1 > 0) {
			for(int i = 0; i < fileList.size(); i++) {
				fileList.get(i).setpNo(p.getpId());
			}
		}else {
			rollback(con);
			return -1;
		}
		
		//매입단계에 설정된 mainImg 레벨 조정
		int result2 = new ProductAdminDao().addUpdateAttachment(con, fId);
		
		if(result2 > 0) {
			//미등록상품의 상품등록(내용수정)시 사진 등록(대표, 상세)
			int result3 = new ProductAdminDao().insertAttachment(con, fileList);
			
			if(result1 > 0 && result3 == fileList.size()) {
				commit(con);
				result = 1;
			}else {
				rollback(con);
				result = 0;
			}
		}else {
			rollback(con);
			return -1;
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectList() {
		//판매미등록, 판매중 상품 전체조회
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new ProductAdminDao().selectList(con);
		
		close(con);
		
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectDeleteList() {
		//삭제상품 전체조회
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new ProductAdminDao().selectDeleteList(con);
		
		close(con);
		
		return list;
	}
}
