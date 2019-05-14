package com.kh.jooTopia.board.model.dao;

import java.io.FileNotFoundException;
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

import com.kh.jooTopia.member.model.dao.MemberDao;
import com.kh.jooTopia.board.model.vo.Notice;
import com.kh.jooTopia.board.model.vo.PageInfo;


public class BoardDao {
	private Properties prop = new Properties();
	
	public BoardDao() {
		String fileName = MemberDao.class.getResource("/sql/notice/notice-query.properties").getPath();
		
			try {
				prop.load(new FileReader(fileName));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
	}
	
	//전체출력
	public ArrayList<Notice> selectList(Connection con) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Notice> list = null;
		
		String query = prop.getProperty("selectList");
		
		/*int startRow = (pageInfo.getCurrentPage()-1)*pageInfo.getLimit()+1;
		int endRow = startRow + pageInfo.getLimit()-1;
		*/
		try {
			pstmt = con.prepareStatement(query);
			/*pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);*/
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Notice>();
			
			while(rset.next()) {
				Notice n = new Notice();
				n.setbId(rset.getInt("BID"));
				n.setbTitle(rset.getString("BTITLE"));
				n.setbType(rset.getInt("BTYPE"));
				n.setbCount(rset.getInt("BCOUNT"));
				n.setEnrollDate(rset.getDate("ENROLL_DATE"));
				n.setModifyDate(rset.getDate("MODIFY_DATE"));
				
				list.add(n);
				
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println("Dao 페이징 : " + list);
		return list;
		
	}
		
	
	/*public ArrayList<Notice> selectList(Connection con){
		ArrayList<Notice> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectList");
		
		
		System.out.println(list);
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<>();
			
			while(rset.next()) {
				Notice n = new Notice();
				
				n.setbId(rset.getInt("BID"));
				n.setbNo(rset.getInt("BNO"));
				n.setbType(rset.getInt("BTYPE"));
				n.setbTitle(rset.getString("BTITLE"));
				n.setbContent(rset.getString("BCONTENT"));
				n.setStatus(rset.getString("STATUS"));
				n.setEnrollDate(rset.getDate("ENROLL_DATE"));
				n.setModifyDate(rset.getDate("MODIFY_DATE"));
				n.setbCount(rset.getInt("BCOUNT"));
				n.setuNo(rset.getInt("UNO"));
				
				list.add(n);
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
			
		}
		return list;
		
	}*/

	//상세보기
	public Notice selectOne(Connection con, int num) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice n = null;
		
		System.out.println("n : " + n);
		
		String query = prop.getProperty("selectOne");
		
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, num);
			rset=pstmt.executeQuery();
			System.out.println("selectOne : " + query);
			
			if(rset.next()) {
				n=new Notice();
				
				n.setbId(rset.getInt("BID"));
				n.setbNo(rset.getInt("BNO"));
				n.setbType(rset.getInt("BTYPE"));
				n.setbTitle(rset.getString("BTITLE"));
				n.setbContent(rset.getString("BCONTENT"));
				n.setStatus(rset.getString("STATUS"));
				n.setEnrollDate(rset.getDate("ENROLL_DATE"));
				n.setModifyDate(rset.getDate("MODIFY_DATE"));
				n.setbCount(rset.getInt("BCOUNT"));
				n.setuNo(rset.getInt("UNO"));
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		return n;
	}

	


	//조회수(카운트)
	public int getNoticeListCount(Connection con) {
		
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("noticeListCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		System.out.println("dao 리스트 카운트 " +listCount);
		
		return listCount;
	}
	
	
	public int updateCount(Connection con, int getbId) {
		PreparedStatement pstmt = null;
		int result=0;
		String query = prop.getProperty("updateCount");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, getbId);
			pstmt.setInt(2, getbId);
			
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
}
