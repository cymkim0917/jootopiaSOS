package com.kh.jooTopia.heap.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.jooTopia.common.JDBCTemplate.close;

import com.kh.jooTopia.heap.model.vo.HeapAdmin;
 

public class HeapAdminDao {
	
private Properties prop = new Properties();
	
	public HeapAdminDao() {
		
		String fileName = HeapAdminDao.class.getResource("/sql/heap/heap-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
			
			
		} catch (IOException e) {			
			e.printStackTrace();
		}
	}

	public ArrayList<HeapAdmin> selectAdminList(Connection con) {

		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<HeapAdmin> list = null;
		
		String query = prop.getProperty("selecHeaptList");
		try {
			stmt = con.createStatement();			
			rset = stmt.executeQuery(query);			
			list = new ArrayList<HeapAdmin>();
			System.out.println(list);
			
			while(rset.next()) {
				HeapAdmin h = new HeapAdmin();
				
				//h.setPcdId(rset.getInt("PCDID"));
				h.setpId(rset.getInt("PID"));
				h.setpName(rset.getString("PNAME"));
				h.setcGroup(rset.getString("CGROUP"));
				h.setName(rset.getString("NAME"));									
				
				list.add(h);
			}
			System.out.println(list);
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		
		return list;
	}

	public int insertAdminHeap(Connection con, HeapAdmin h) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAdminHeap");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, h.getlBarcode());
			
			pstmt.setInt(2, h.getpId());
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public HeapAdmin selectOneAdminHeap(Connection con, int num) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		HeapAdmin h = null;
		
		String query = prop.getProperty("selectOneHeapAdmin");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				h = new HeapAdmin();
				
				h.setpId(rset.getInt("PID"));
				
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return h;
	}

}
