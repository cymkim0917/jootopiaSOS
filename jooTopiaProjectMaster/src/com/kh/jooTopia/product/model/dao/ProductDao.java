package com.kh.jooTopia.product.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;

import com.kh.jooTopia.board.model.vo.Attachment;
import com.kh.jooTopia.product.model.vo.Category;
import com.kh.jooTopia.product.model.vo.Product;
import static com.kh.jooTopia.common.JDBCTemplate.*;

public class ProductDao {
	private Properties prop = new Properties();
	
	public ProductDao() {
		String fileName = CategoryDao.class.getResource("/sql/product/product-query.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	

	public ArrayList<HashMap<String,Object>> productList(Connection con) {
		ArrayList<HashMap<String,Object>> productList = null;
		HashMap<String,Object> getProduct = null;

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select p.pid,p.pname,a.change_name,p.pprice from product p ,attachment a where p.pid = a.pid and file_level = 0 and  p.status='판매중'";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			System.out.println(sql);
			
			productList = new ArrayList<HashMap<String,Object>>();
			while(rs.next()) {
				getProduct = new HashMap<String,Object>();
				getProduct.put("pid", rs.getInt("PID"));
				getProduct.put("pname", rs.getString("PNAME"));
				getProduct.put("change_name", rs.getString("CHANGE_NAME"));
				getProduct.put("pprice", rs.getInt("pprice"));	
				productList.add(getProduct);
			}
			
			/*productList.get(1).get("pid");*/
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return productList;
	}


	public HashMap<String, Object> detailProduct(Connection con, int pid) {
		HashMap<String, Object> detailProc = null;
		ArrayList<Attachment> attList = null;
		Category category = null;
		Attachment att = null;
		Product product = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT DISTINCT ATTACHMENT.FILE_LEVEL,PRODUCT.PID,PRODUCT.PNAME , PPRICE, PRODUCT.PBRAND,PRODUCT.PCONTENT,ATTACHMENT.CHANGE_NAME,PRODUCT.PMODELNAME,CATEGORY.CID,CATEGORY.CGROUP,CATEGORY.NAME,PURCHASE.USE_PERIOD FROM PRODUCT,CATEGORY,ATTACHMENT,PURCHASE WHERE CATEGORY.CID = PRODUCT.CID AND PRODUCT.PID = ATTACHMENT.PID AND CATEGORY.CID = PURCHASE.CID AND PRODUCT.PID = ? AND PRODUCT.STATUS = '판매중' AND ATTACHMENT.STATUS = 'Y' ORDER BY ATTACHMENT.FILE_LEVEL ASC";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pid);
			rs = pstmt.executeQuery();
			String useDate = "";
			attList = new ArrayList<Attachment>();
			while(rs.next()) {
				product = new Product();			
				product.setcId(rs.getInt("CID"));
				product.setpBrand(rs.getString("PBRAND"));
				product.setpId(rs.getInt("PID"));
				product.setpName(rs.getString("PNAME"));
				product.setpPrice(rs.getInt("PPRICE"));
				product.setpContent(rs.getString("PCONTENT"));
				product.setpModelName(rs.getString("PMODELNAME"));
				
				category = new Category();
				category.setCid(rs.getInt("CID"));
				category.setcGroup(rs.getString("CGROUP"));
				category.setName(rs.getString("NAME"));
				
				att = new Attachment();
				att.setChangeName(rs.getString("CHANGE_NAME"));
				attList.add(att);
				
				useDate = rs.getString("USE_PERIOD");
			}
			detailProc = new HashMap<String,Object>();
			detailProc.put("product", product);
			detailProc.put("category", category);
			detailProc.put("attachment", attList);
			detailProc.put("useDate", useDate);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return detailProc;
	}

}
