package com.kh.jooTopia.product.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
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
			pstmt.setInt(4, p.getcNo());
			pstmt.setInt(5, p.getpNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int insertAttachment(Connection con, ArrayList<Attachment> fileList) {
		////미등록상품의 상품등록(내용수정)시 사진 등록(대표, 상세)
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAttachment");
		System.out.println(query);
		
		try {
			for(int i = 0; i < fileList.size(); i++) {
				pstmt = con.prepareStatement(query);
				System.out.println("pstmt : " + pstmt);
				pstmt.setString(1, fileList.get(i).getOriginName());
				pstmt.setString(2, fileList.get(i).getChangeName());
				pstmt.setString(3, fileList.get(i).getFilePath());
				int level = 0;
				if(i == 0) level = 0;
				else level = 1;
				pstmt.setInt(4, level);
				pstmt.setInt(5, fileList.get(i).getpNo());
				
				System.out.println(i + "번째 사진");
				System.out.println(fileList.get(i).getOriginName());
				System.out.println(fileList.get(i).getChangeName());
				System.out.println(fileList.get(i).getFilePath());
				System.out.println(level);
				System.out.println(fileList.get(i).getpNo());
				
				result += pstmt.executeUpdate();
			}
			System.out.println("dao result : " + result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
