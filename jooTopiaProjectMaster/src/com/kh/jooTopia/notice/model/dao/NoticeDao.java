package com.kh.jooTopia.notice.model.dao;

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

import com.kh.jooTopia.member.model.dao.MemberDao;
import com.kh.jooTopia.notice.model.vo.Notice;

import static com.kh.jooTopia.common.JDBCTemplate.*;

public class NoticeDao {
	private Properties prop = new Properties();
	
	public NoticeDao() {
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
	public ArrayList<Notice> selectList(Connection con){
		ArrayList<Notice> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = prop.getProperty("selectList");
		
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
				n.setEnroll_date(rset.getDate("ENROLL_DATE"));
				n.setModify_date(rset.getDate("MODIFY_DATE"));
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
		
	}

	//상세보기
	public Notice selectOne(Connection con, int num) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Notice n = null;
		
		String query = prop.getProperty("selectOne");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, num);
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				n=new Notice();
				
				n.setbId(rset.getInt("BID"));
				n.setbNo(rset.getInt("BNO"));
				n.setbType(rset.getInt("BTYPE"));
				n.setbTitle(rset.getString("BTITLE"));
				n.setbContent(rset.getString("BCONTENT"));
				n.setStatus(rset.getString("STATUS"));
				n.setEnroll_date(rset.getDate("ENROLL_DATE"));
				n.setModify_date(rset.getDate("MODIFY_DATE"));
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

	//조회수용
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
