package com.kh.jooTopia.product.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import com.kh.jooTopia.board.model.vo.Attachment;
import com.kh.jooTopia.board.model.vo.PageInfo;
import com.kh.jooTopia.product.model.dao.ProductAdminDao;
import com.kh.jooTopia.product.model.vo.Product;
import com.kh.jooTopia.product.model.vo.ProductregAdmin;

import static com.kh.jooTopia.common.JDBCTemplate.*;

public class ProductAdminService {


	public ArrayList<HashMap<String, Object>> selectAddList(PageInfo pageInfo) {
		//미등록상품 전체 조회
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new ProductAdminDao().selectAddList(con, pageInfo);
		
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

	public ArrayList<HashMap<String, Object>> selectList(PageInfo pageInfo) {
		//판매미등록, 판매중 상품 전체조회
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new ProductAdminDao().selectList(con, pageInfo);
		
		close(con);
		
		return list;
	}

	public ArrayList<HashMap<String, Object>> selectDeleteList(PageInfo pageInfo) {
		//삭제상품 전체조회
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new ProductAdminDao().selectDeleteList(con, pageInfo);
		
		close(con);
		
		return list;
	}

	public HashMap<String, Object> selectProductOne(int pId) {
		//상품상세 조회
		Connection con = getConnection();
		HashMap<String, Object> hmap = null;
		
		//상품정보 조회
		HashMap<String, Object> pmap = new ProductAdminDao().selectProOne(con, pId);
		
		if(pmap != null) {
			System.out.println("pmap 조회성공");
			//상품이미지 조회
			ArrayList<Attachment> imgList = new ProductAdminDao().selectAttOne(con, pId);
			
			if(pmap != null && imgList.size() == 2) {
				System.out.println("imgList 조회성공");
				
				hmap = new HashMap<String, Object>();
				hmap.put("p", pmap);
				hmap.put("img", imgList);
			}else {
				System.out.println("imgList 조회실패");
			}
			
		}else {
			System.out.println("pmap 조회실패");
		}
		
		close(con);
				
		return hmap;
	}

	public int getProductListCount(String query) {
		Connection con = getConnection();
		
		int listCount = new ProductAdminDao().getProductListCount(con, query);
		
		close(con);
		
		return listCount;
	}

	public int changeStatusProduct(String status, int[] pId) {
		Connection con = getConnection();
		int result = new ProductAdminDao().changeStatusProduct(con, status, pId);
		
		close(con);
		
		return result;
	}

	public Attachment selectAtt(int fId) {
		Connection con = getConnection();
		Attachment a = new ProductAdminDao().selectAtt(con, fId);
		
		close(con);
		
		return a;
	}

	public int updateDetailProduct(Product p, ArrayList<Attachment> fileList) {
		//상품상세 수정
		Connection con = getConnection();
		int result = 0;
				
		//상품상세 내용 수정
		int result1 = new ProductAdminDao().updateDetailProduct(con, p);
				
		if(result1 > 0) {
			System.out.println("--------------상품 상세내용 수정 완료");
			//이미지 오리진네임, 체인지네임, 패스 수정 (메인, 상세 두번)
			if(fileList.size() > 0) {
				int result2 = new ProductAdminDao().updateDetailAttachment(con, fileList);
						
				if(result2 > 0) {
					System.out.println("--------------상품 사진내용 수정 완료");
					commit(con);
					result = 1;
				}else {
					System.out.println("--------------상품 사진내용 수정 실패");
					rollback(con);
				}
			}
			result = 1;
					
		}else {
			System.out.println("--------------상품 상세내용 수정 완료");
			rollback(con);
		}
				
		close(con);
				
		return result;
	}

	public ProductregAdmin selectOneAdminProductreg(int num) {
		
		Connection con = getConnection();
		
		ProductregAdmin p = new ProductAdminDao().selectOneAdminProductreg(con, num);
		
		if(p != null) {
			int result = new ProductAdminDao().updateCount(con, p.getPcdId());
			
			if(result > 0) {
				commit(con);
			}else {
				rollback(con);
			}
		}
		close(con);
		
		return p;
	}

	public int insertAdminProductreg(Product p) {
	
		Connection con = getConnection();
		
		int result = new ProductAdminDao().insertAdminProductreg(con, p);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);		
		
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectSearchProduct(PageInfo pageInfo, String query) {
		Connection con = getConnection();
		ArrayList<HashMap<String, Object>> list = new ProductAdminDao().selectSearchProduct(pageInfo, query);
		
		System.out.println("서비스의 list : " + list);
		close(con);
		
		return list;
	}

	public int insertPAttachment(Product p, ArrayList<Attachment> fileList) {
		
		Connection con = getConnection();
		int result = 0;		
		
		//상품 insert
		int resultP = new ProductAdminDao().insertAdminProductreg(con, p);
		
		if(resultP > 0) {
			
			for (int i = 0; i < fileList.size(); i++) {
				fileList.get(i).setpNo(p.getpId());				
			}
		}else {
			rollback(con);
			return -1;
		}		
		//사진 insert
		int resultA = new ProductAdminDao().insertPAttachment(con, fileList);
		
		if(resultP > 0 && resultA == fileList.size()) {
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
