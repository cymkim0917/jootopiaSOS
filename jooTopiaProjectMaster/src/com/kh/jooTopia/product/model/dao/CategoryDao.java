package com.kh.jooTopia.product.model.dao;

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

import com.kh.jooTopia.board.model.vo.PageInfo;
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

	public ArrayList<HashMap<String, Object>> selectProductList(Connection con, int cid,PageInfo pi) {
		ArrayList<HashMap<String, Object>> productList = null;
		HashMap<String, Object> procList = null;
		PreparedStatement pstmt=  null;
		ResultSet rs = null;
		String sql = prop.getProperty("getBedProductList");
		System.out.println(sql);
		
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pi.getStartPage());
			pstmt.setInt(2, pi.getEndPage());
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

	public ArrayList<HashMap<String, Object>> selectProductList2(Connection con, int cid,PageInfo pi) {
		ArrayList<HashMap<String, Object>> productList = null;
		HashMap<String, Object> procList = null;
		PreparedStatement pstmt=  null;
		ResultSet rs = null;
		String sql = prop.getProperty("getStudyProductList");
		System.out.println(sql);
		
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pi.getStartPage());
			pstmt.setInt(2, pi.getEndPage());
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
	
	public ArrayList<HashMap<String, Object>> selectProductList3(Connection con, int cid,PageInfo pi) {
		ArrayList<HashMap<String, Object>> productList = null;
		HashMap<String, Object> procList = null;
		PreparedStatement pstmt=  null;
		ResultSet rs = null;
		String sql = prop.getProperty("getKitchenProductList");
		System.out.println(sql);
		
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pi.getStartPage());
			pstmt.setInt(2, pi.getEndPage());
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

	public ArrayList<HashMap<String, Object>> selectOneProductList(Connection con, int cid,PageInfo pi) {
		ArrayList<HashMap<String, Object>> productList = null;
		HashMap<String, Object> procList = null;
		PreparedStatement pstmt=  null;
		ResultSet rs = null;
		String sql = prop.getProperty("getOneProductList");
		
		System.out.println(sql);
		
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, cid);
			pstmt.setInt(2, pi.getStartPage());
			pstmt.setInt(3, pi.getEndPage());
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

	public ArrayList<HashMap<String, Object>> selectProductList4(Connection con, int cid,PageInfo pi) {
		ArrayList<HashMap<String, Object>> productList = null;
		HashMap<String, Object> procList = null;
		PreparedStatement pstmt=  null;
		ResultSet rs = null;
		String sql = prop.getProperty("getLivingProductList");
		
		System.out.println(sql);
		
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pi.getStartPage());
			pstmt.setInt(2, pi.getEndPage());
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

	public int getListCount(Connection con,int cid) {
		PreparedStatement pstmt = null;
		int listCount = 0;
		ResultSet rs = null;
		
		String sql= "";
		switch(cid){
			case 6:  sql = prop.getProperty("category1ProductCount"); break;
			case 16: sql = prop.getProperty("category2ProductCount");break;
			case 26: sql = prop.getProperty("category3ProductCount");break;
			case 36: sql = prop.getProperty("category4ProductCount");break;
			default: sql = prop.getProperty("categoryAllProductCount");break;
		}
		
		try {
			pstmt = con.prepareStatement(sql);
			
			if(sql.equals(prop.getProperty("categoryAllProductCount"))) {
				pstmt.setInt(1, cid);
			}
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				listCount = rs.getInt(1);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return listCount;
	}

	public ArrayList<HashMap<String, Object>> sortProductList(Connection con, int cid, PageInfo pi,int orderType) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		ResultSet rs = null;
		HashMap<String, Object> procList = null;
		String sql= "";
		
		
		switch(cid){
			case 6:  sql = prop.getProperty("category1SortProduct"); break;
			case 16: sql = prop.getProperty("category2SortProduct");break;
			case 26: sql = prop.getProperty("category3SortProduct");break;
			case 36: sql = prop.getProperty("category4SortProduct");break;
			default: sql = prop.getProperty("categoryAllSortProduct");break;
		}
		System.out.println("sql : " + sql);
		try {
			pstmt = con.prepareStatement(sql);
			
			if(sql.equals(prop.getProperty("categoryAllSortProduct"))) {
				pstmt.setInt(1, cid);/*
				pstmt.setString(2,orderTypeName );*/
				pstmt.setInt(2, pi.getStartPage());
				pstmt.setInt(3, pi.getEndPage());
			}else {/*
				pstmt.setString(1, orderTypeName);*/
				pstmt.setInt(1, pi.getStartPage());
				pstmt.setInt(2, pi.getEndPage());
			}
			System.out.println("sql : " + sql);
			rs = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String,Object>>();
			while(rs.next()) {
				procList = new HashMap<String, Object>();
				procList.put("pid", rs.getInt("pid"));
				procList.put("cid", rs.getInt("cid"));
				procList.put("pname", rs.getString("pname"));
				procList.put("pprice",rs.getInt("pprice"));
				procList.put("change_name", rs.getString("change_name"));
				procList.put("pbrand", rs.getString("pbrand"));
				procList.put("cgroup", rs.getString("cgroup"));
				System.out.println(rs.getInt("PCOUNT"));
				list.add(procList);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		
		return list;
	}

	public ArrayList<HashMap<String, Object>> sortProductList2(Connection con, int cid, PageInfo pi, int orderType) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		ResultSet rs = null;
		HashMap<String, Object> procList = null;
		String sql= "";
		
		
		switch(cid){
			case 6:  sql = prop.getProperty("category1SortProduct2"); break;
			case 16: sql = prop.getProperty("category2SortProduct2");break;
			case 26: sql = prop.getProperty("category3SortProduct2");break;
			case 36: sql = prop.getProperty("category4SortProduct2");break;
			default: sql = prop.getProperty("categoryAllSortProduct2");break;
		}
		System.out.println("sql : " + sql);
		try {
			pstmt = con.prepareStatement(sql);
			
			if(sql.equals(prop.getProperty("categoryAllSortProduct"))) {
				pstmt.setInt(1, cid);/*
				pstmt.setString(2,orderTypeName );*/
				pstmt.setInt(2, pi.getStartPage());
				pstmt.setInt(3, pi.getEndPage());
			}else {/*
				pstmt.setString(1, orderTypeName);*/
				pstmt.setInt(1, pi.getStartPage());
				pstmt.setInt(2, pi.getEndPage());
			}
			System.out.println("sql : " + sql);
			rs = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String,Object>>();
			while(rs.next()) {
				procList = new HashMap<String, Object>();
				procList.put("pid", rs.getInt("pid"));
				procList.put("cid", rs.getInt("cid"));
				procList.put("pname", rs.getString("pname"));
				procList.put("pprice",rs.getInt("pprice"));
				procList.put("change_name", rs.getString("change_name"));
				procList.put("pbrand", rs.getString("pbrand"));
				procList.put("cgroup", rs.getString("cgroup"));
				System.out.println(rs.getInt("PCOUNT"));
				list.add(procList);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<HashMap<String, Object>> sortProductList3(Connection con, int cid, PageInfo pi, int orderType) {
		PreparedStatement pstmt = null;
		ArrayList<HashMap<String, Object>> list = null;
		ResultSet rs = null;
		HashMap<String, Object> procList = null;
		String sql= "";
		
		
		switch(cid){
			case 6:  sql = prop.getProperty("category1SortProduct3"); break;
			case 16: sql = prop.getProperty("category2SortProduct3");break;
			case 26: sql = prop.getProperty("category3SortProduct3");break;
			case 36: sql = prop.getProperty("category4SortProduct3");break;
			default: sql = prop.getProperty("categoryAllSortProduct3");break;
		}
		System.out.println("sql : " + sql);
		try {
			pstmt = con.prepareStatement(sql);
			
			if(sql.equals(prop.getProperty("categoryAllSortProduct"))) {
				pstmt.setInt(1, cid);/*
				pstmt.setString(2,orderTypeName );*/
				pstmt.setInt(2, pi.getStartPage());
				pstmt.setInt(3, pi.getEndPage());
			}else {/*
				pstmt.setString(1, orderTypeName);*/
				pstmt.setInt(1, pi.getStartPage());
				pstmt.setInt(2, pi.getEndPage());
			}
			System.out.println("sql : " + sql);
			rs = pstmt.executeQuery();
			
			list = new ArrayList<HashMap<String,Object>>();
			while(rs.next()) {
				procList = new HashMap<String, Object>();
				procList.put("pid", rs.getInt("pid"));
				procList.put("cid", rs.getInt("cid"));
				procList.put("pname", rs.getString("pname"));
				procList.put("pprice",rs.getInt("pprice"));
				procList.put("change_name", rs.getString("change_name"));
				procList.put("pbrand", rs.getString("pbrand"));
				procList.put("cgroup", rs.getString("cgroup"));
				System.out.println(rs.getInt("PCOUNT"));
				list.add(procList);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}
	
}
