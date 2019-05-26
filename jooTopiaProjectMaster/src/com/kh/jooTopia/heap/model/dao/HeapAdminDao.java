package com.kh.jooTopia.heap.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.jooTopia.common.JDBCTemplate.close;

import com.kh.jooTopia.heap.model.vo.PageInfo;
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
			
			pstmt.setString(1, h.getlBarcode());
			
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
				h.setChangeName(rset.getString("CHANGE_NAME"));
				h.setpBarcode(rset.getString("PBARCODE"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return h;
	}

	//게시물 수 조회
	public int getListCount(Connection con) {
		
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		return listCount;
	}

	//게시물 목록 조회용 메소드
	public ArrayList<HeapAdmin> selectAdminList(Connection con, PageInfo pi) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<HeapAdmin> list = null;
		
		String query = prop.getProperty("selectListAfterPaging");
		
		int startRow = (pi.getCurrentPage() -1) * pi.getLimit() +1;
		int endRow = startRow + pi.getLimit() -1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<HeapAdmin>();
			
			while(rset.next()) {
				HeapAdmin h = new HeapAdmin();
				
				h.setpId(rset.getInt("PID"));
				//h.sethId(rset.getInt("HID"));
				//h.setRlId(rset.getInt("RLID"));
				//h.setPcdId(rset.getInt("PCDID"));
				h.setcGroup(rset.getString("CGROUP"));
				h.setName(rset.getString("NAME"));
				//h.setPoId(rset.getInt("POID"));
				//h.setdId(rset.getInt("DID"));
				//h.setlBarcode(rset.getInt("LBARCODE"));
				//h.setpContent(rset.getString("PCONTENT"));
				h.setpName(rset.getString("PNAME"));
				//h.setChangeName(rset.getString("CHANGE_NAME"));
				
				list.add(h);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public String checkPBarcode(Connection con, int pid) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String pBarcode = null;
		
		String query = prop.getProperty("checkPBarcode");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pid);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				pBarcode = rset.getString("PBARCODE");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return pBarcode;
	}

}
