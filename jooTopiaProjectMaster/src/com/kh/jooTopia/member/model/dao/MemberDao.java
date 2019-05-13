package com.kh.jooTopia.member.model.dao;

import java.util.Properties;

import com.kh.jooTopia.member.model.vo.Member;
import static com.kh.jooTopia.common.JDBCTemplate.*;

import java.io.FileReader;
import java.io.IOException;
import java.sql.*;

public class MemberDao {
	private Properties prop = new Properties();
	public  MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int insertMember(Connection con, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertMember");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getUserPwd());
			pstmt.setString(3, member.getUserName());
			pstmt.setDate(4, member.getUserDate());
			pstmt.setString(5, member.getPhone());
			pstmt.setString(6, member.getGender());
			pstmt.setString(7, member.getAddress());
			pstmt.setString(8, member.getEmail());
			result = pstmt.executeUpdate();	
			System.out.println(result);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public Member loginCheck(Connection con, String userId, String userPwd) {
		Member member = null;		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("loginCheck");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new Member();
				member.setUserId(userId);
				member.setUserPwd(userPwd);
				member.setUno(rs.getInt("UNO"));
				member.setUserName(rs.getString(4));
				member.setPhone(rs.getString(6));
				member.setGender(rs.getString(7));
				member.setAddress(rs.getString(8));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return member;
	}

	public int idCheck(Connection con, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("idCheck");
		int result = 0;
		
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}

	public Member userCheck(String userName, String email, Connection con) {
		Member member = null;		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("userCheck");
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, userName);
			pstmt.setString(2, email);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new Member();
				member.setUserName(userName);
				member.setEmail(email);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return member;
	}

}
