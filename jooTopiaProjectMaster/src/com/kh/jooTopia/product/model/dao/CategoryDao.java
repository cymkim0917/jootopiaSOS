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

import com.kh.jooTopia.product.model.vo.Product;

import static com.kh.jooTopia.common.JDBCTemplate.*;

public class CategoryDao {
	private Properties prop = new Properties();
	
	public CategoryDao() {
		String fileName = CategoryDao
							.class
							.getResource("/sql/product/category-query.properties")
							.getPath(); 
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public ArrayList<String> selectNameList(Connection con, String group) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<String> list = null;
		
		String query = prop.getProperty("selectNameList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, group);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<String>();
			while(rset.next()) {
				list.add(rset.getString("NAME"));
			}
			System.out.println("categoryName : " + list);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public int selectCid(Connection con, String cName) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int cid = 0;
		
		String query = prop.getProperty("selectCid");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, cName);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				cid = rset.getInt("CID");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return cid;
	}

	public ArrayList<HashMap<String, Object>> selectProductList(Connection con, int cid) {
		ArrayList<HashMap<String, Object>> productList = null;
		HashMap<String, Object> procList = null;
		PreparedStatement pstmt=  null;
		ResultSet rs = null;
		String sql = prop.getProperty("getBedProductList");
		System.out.println(sql);
		
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			productList = new ArrayList<HashMap<String,Object>>();
			while(rs.next()) {
				procList = new HashMap<String, Object>();
				procList.put("pid", rs.getInt("pid"));
				procList.put("cid", rs.getInt("cid"));
				procList.put("pname", rs.getString("pname"));
				procList.put("pprice",rs.getInt("pprice"));
				procList.put("change_name", rs.getString("change_name"));
				procList.put("pbrand", rs.getString("pbrand"));
				procList.put("cgroup", rs.getString("cgroup"));
				
				productList.add(procList);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return productList;
	}

	public ArrayList<HashMap<String, Object>> selectProductList2(Connection con, int cid) {
		ArrayList<HashMap<String, Object>> productList = null;
		HashMap<String, Object> procList = null;
		PreparedStatement pstmt=  null;
		ResultSet rs = null;
		String sql = prop.getProperty("getStudyProductList");
		System.out.println(sql);
		
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			productList = new ArrayList<HashMap<String,Object>>();
			while(rs.next()) {
				procList = new HashMap<String, Object>();
				procList.put("pid", rs.getInt("pid"));
				procList.put("cid", rs.getInt("cid"));
				procList.put("pname", rs.getString("pname"));
				procList.put("pprice",rs.getInt("pprice"));
				procList.put("change_name", rs.getString("change_name"));
				procList.put("pbrand", rs.getString("pbrand"));
				procList.put("cgroup", rs.getString("cgroup"));
				
				productList.add(procList);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return productList;
	}
	
	public ArrayList<HashMap<String, Object>> selectProductList3(Connection con, int cid) {
		ArrayList<HashMap<String, Object>> productList = null;
		HashMap<String, Object> procList = null;
		PreparedStatement pstmt=  null;
		ResultSet rs = null;
		String sql = prop.getProperty("getKitchenProductList");
		System.out.println(sql);
		
		
		try {
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			productList = new ArrayList<HashMap<String,Object>>();
			while(rs.next()) {
				procList = new HashMap<String, Object>();
				procList.put("pid", rs.getInt("pid"));
				procList.put("cid", rs.getInt("cid"));
				procList.put("pname", rs.getString("pname"));
				procList.put("pprice",rs.getInt("pprice"));
				procList.put("change_name", rs.getString("change_name"));
				procList.put("pbrand", rs.getString("pbrand"));
				procList.put("cgroup", rs.getString("cgroup"));
				
				productList.add(procList);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return productList;
	}

	public ArrayList<HashMap<String, Object>> selectOneProductList(Connection con, int cid) {
		ArrayList<HashMap<String, Object>> productList = null;
		HashMap<String, Object> procList = null;
		PreparedStatement pstmt=  null;
		ResultSet rs = null;
		String sql = prop.getProperty("getOneProductList");
		
		System.out.println(sql);
		
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cid);
			rs = pstmt.executeQuery();
			
			productList = new ArrayList<HashMap<String,Object>>();
			while(rs.next()) {
				procList = new HashMap<String, Object>();
				procList.put("pid", rs.getInt("pid"));
				procList.put("cid", rs.getInt("cid"));
				procList.put("pname", rs.getString("pname"));
				procList.put("pprice",rs.getInt("pprice"));
				procList.put("change_name", rs.getString("change_name"));
				procList.put("pbrand", rs.getString("pbrand"));
				procList.put("cgroup", rs.getString("cgroup"));
				
				productList.add(procList);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return productList;
	}
	
}
