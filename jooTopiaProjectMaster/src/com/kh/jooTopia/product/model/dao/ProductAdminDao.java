package com.kh.jooTopia.product.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.jooTopia.board.model.vo.Attachment;
import com.kh.jooTopia.product.model.vo.Product;

import static com.kh.jooTopia.common.JDBCTemplate.*;

public class ProductAdminDao {
	
	private Properties prop = new Properties();
	
	public ProductAdminDao() {
		String fileName = ProductAdminDao.class.getResource("/sql/product/productAdmin-query.properties").getPath();
		 
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int updateProduct(Connection con, Product p) {
		//미등록상품의 상품등록(내용수정)
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateProduct");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, p.getpName());
			pstmt.setInt(2, p.getpPrice());
			pstmt.setString(3, p.getpContent());
			pstmt.setInt(4, p.getcId());
			pstmt.setString(5, "판매안함");
			pstmt.setInt(6, p.getpId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertAttachment(Connection con, ArrayList<Attachment> fileList) {
		//미등록상품의 상품등록(내용수정)시 사진 등록(대표, 상세)
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAttachment");
		
		try {
			for(int i = 0; i < fileList.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, fileList.get(i).getOriginName());
				pstmt.setString(2, fileList.get(i).getChangeName());
				pstmt.setString(3, fileList.get(i).getFilePath());
				int level = 0;
				if(i == 0) level = 0;
				else level = 1;
				pstmt.setInt(4, level);
				pstmt.setInt(5, fileList.get(i).getpNo());
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<HashMap<String, Object>> selectAddList(Connection con) {
		//상품등록 리스트 출력
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		HashMap<String,Object> hmap = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectAddList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "미등록상품");
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String,Object>>();
			
			while(rset.next()) {
				hmap = new HashMap<String,Object>();
				
				hmap.put("status", rset.getString("STATUS"));
				hmap.put("big", rset.getString("CGROUP"));
				hmap.put("small", rset.getString("CATEGORY_NAME"));
				hmap.put("pId", rset.getInt("PID"));
				hmap.put("fId", rset.getInt("FID"));
				hmap.put("originName", rset.getString("ORIGIN_NAME"));
				hmap.put("changeName", rset.getString("CHANGE_NAME"));
				hmap.put("filePath", rset.getString("FILE_PATH"));
				hmap.put("pName", rset.getString("PNAME"));
				hmap.put("pPrice", rset.getInt("PPRICE"));
				
	            list.add(hmap);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public HashMap<String, Object> selectAddOne(Connection con, int pId) {
		//상품등록 수정 폼 조회
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		Product p = null;
		Attachment a = null;
		
		String query = prop.getProperty("selectAddOne");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pId);
			
			rset = pstmt.executeQuery();
			
			hmap = new HashMap<String, Object>();
			
			if(rset.next()) {
				hmap.put("big", rset.getString("CGROUP"));
				hmap.put("small", rset.getString("CATEGORY_NAME"));
				hmap.put("pName", rset.getString("PNAME"));
				hmap.put("pId", rset.getInt("PID"));
				hmap.put("pcPrice", rset.getInt("PCPRICE"));
				hmap.put("pGrade", rset.getString("PGRADE"));
				hmap.put("pPrice", rset.getInt("PPRICE"));
				hmap.put("pContent", rset.getString("PCONTENT"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return hmap;
	}

}
