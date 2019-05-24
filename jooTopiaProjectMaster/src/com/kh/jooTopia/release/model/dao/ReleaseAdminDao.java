package com.kh.jooTopia.release.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.jooTopia.common.JDBCTemplate.*;

import com.kh.jooTopia.heap.model.vo.PageInfo;
import com.kh.jooTopia.release.model.vo.ReleaseAdmin;


public class ReleaseAdminDao {
	 
	private Properties prop = new Properties();
	
	public ReleaseAdminDao() {
		
		String fileName = ReleaseAdminDao.class.getResource("/sql/release/release-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
			
			
		} catch (IOException e) {			
			e.printStackTrace();
		}
	}

	public ArrayList<ReleaseAdmin> selectAdminList(Connection con) {
		
		/*Statement stmt = null;
		ResultSet rset = null;
		ArrayList<ReleaseAdmin> list = null;
		
		String query = prop.getProperty("selectList");
		try {
			stmt = con.createStatement();			
			rset = stmt.executeQuery(query);			
			list = new ArrayList<ReleaseAdmin>();
			System.out.println(list);
			
			while(rset.next()) {
				ReleaseAdmin r = new ReleaseAdmin();
				
				r.setStatus(rset.getString("STATUS"));
				r.setPoId(rset.getInt("POID"));
				r.setdId(rset.getInt("DID"));
				r.setpId(rset.getInt("PID"));
				r.sethId(rset.getInt("HID"));
				r.setlBarcode(rset.getInt("LBARCODE"));				
				
				list.add(r);
			}
			System.out.println(list);
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		
		return list;*/
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReleaseAdmin> list = null;
		
		String query = prop.getProperty("selectList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "배송준비중");
			rset = pstmt.executeQuery();
			list = new ArrayList<ReleaseAdmin>();
			System.out.println(list);
			
			while(rset.next()) {
				ReleaseAdmin r = new ReleaseAdmin();
				
				r.setStatus(rset.getString("STATUS"));
				r.setPoId(rset.getInt("POID"));
				r.setdId(rset.getInt("DID"));
				r.setpId(rset.getInt("PID"));
				r.sethId(rset.getInt("HID"));
				r.setlBarcode(rset.getInt("LBARCODE"));				
				
				list.add(r);
			}
			System.out.println(list);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
		
	}

	public ArrayList<ReleaseAdmin> selectAdminReleaseList(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<ReleaseAdmin> rlist = null;
		
		String query = prop.getProperty("selectReleaseList");
		try {
			stmt = con.createStatement();			
			rset = stmt.executeQuery(query);			
			rlist = new ArrayList<ReleaseAdmin>();
			System.out.println(rlist);
			
			while(rset.next()) {
				ReleaseAdmin r = new ReleaseAdmin();
				
				r.setPoId(rset.getInt("POID"));
				r.setdId(rset.getInt("DID"));
				r.setRlId(rset.getInt("RLID"));
				r.setRlDate(rset.getDate("RLDATE"));
				
				
				
				rlist.add(r);
			}
			System.out.println(rlist);
			
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		
		
		return rlist;
	}

	public ReleaseAdmin selectOneAdminRelease(Connection con, int num) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ReleaseAdmin r = null;
		
		String query = prop.getProperty("selectOneReleaseAdmin");
		 
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				r = new ReleaseAdmin();
				
				r.setpId(rset.getInt("PID"));
				r.setPoId(rset.getInt("POID"));
				r.setdId(rset.getInt("DID"));
				r.sethId(rset.getInt("HID"));
				r.setlBarcode(rset.getInt("LBARCODE"));
				r.setChangeName(rset.getString("CHANGE_NAME"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
			
		}
		
		return r;
	}

	public int insertAdminRelease(Connection con, ReleaseAdmin r) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAdminRelease");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, r.getPoId());
			pstmt.setInt(2, r.getpId());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	//출고리스트 페이징
	public ArrayList<ReleaseAdmin> selectAdminList(Connection con, PageInfo pi) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReleaseAdmin> rlist = null;
		
		String query = prop.getProperty("selectListAfterPaging");
		
		int startRow = (pi.getCurrentPage() -1) * pi.getLimit() +1;
		int endRow = startRow + pi.getLimit() -1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			rlist = new ArrayList<ReleaseAdmin>();
			
			while(rset.next()) {
				ReleaseAdmin r = new ReleaseAdmin();
				
				//r.setpId(rset.getInt("PID"));
				//r.sethId(rset.getInt("HID"));
				r.setRlId(rset.getInt("RLID"));
				//r.setPcdId(rset.getInt("PCDID"));
				//r.setcGroup(rset.getString("CGROUP"));
				//r.setName(rset.getString("NAME"));
				r.setPoId(rset.getInt("POID"));
				r.setdId(rset.getInt("DID"));
				//r.setlBarcode(rset.getInt("LBARCODE"));
				r.setRlDate(rset.getDate("RLDATE"));
				//r.setpContent(rset.getString("PCONTENT"));
				
				rlist.add(r);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return rlist;
	}

	//출고리스트 카운트
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

	//출고대기 카운트
	public int getListCountWait(Connection con) {
		
		PreparedStatement pstmt = null;
		int listCountWait = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("listCountWait");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "배송준비중");
			rset = pstmt.executeQuery();
			/*stmt = con.createStatement();
			rset = stmt.executeQuery(query);*/
			
			if(rset.next()) {
				listCountWait = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return listCountWait;
		
		
	}

	//출고대기 페이징
	public ArrayList<ReleaseAdmin> selectAdminWait(Connection con, PageInfo pi) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<ReleaseAdmin> list = null;
		
		String query = prop.getProperty("selectListAfterPagingWait");
		
		int startRow = (pi.getCurrentPage() -1) * pi.getLimit() +1;
		int endRow = startRow + pi.getLimit() -1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "배송준비중");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<ReleaseAdmin>();
			
			while(rset.next()) {
				ReleaseAdmin r = new ReleaseAdmin();
				
				//r.setpId(rset.getInt("PID"));
				//r.sethId(rset.getInt("HID"));
				//r.setRlId(rset.getInt("RLID"));
				//r.setPcdId(rset.getInt("PCDID"));
				//r.setcGroup(rset.getString("CGROUP"));
				//r.setName(rset.getString("NAME"));
				r.setPoId(rset.getInt("POID"));
				r.setdId(rset.getInt("DID"));
				//r.setlBarcode(rset.getInt("LBARCODE"));
				//r.setRlDate(rset.getDate("RLDATE"));
				//r.setpContent(rset.getString("PCONTENT"));
				r.setStatus(rset.getString("STATUS"));
				
				list.add(r);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
		
		
	}

	
	
	/*public int insertAdminRelease(Connection con, ReleaseAdmin r) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertRelease");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, r.getReleaseNo());
			pstmt.setDate(2, r.getReleaseDate());
			
			result = pstmt.executeUpdate();			
			System.out.println(result);
		} catch (SQLException e) {			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}*/



}
