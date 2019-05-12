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
			System.out.println("1");
			pstmt.setString(2, member.getUserPwd());
			System.out.println("2");
			pstmt.setString(3, member.getUserName());
			System.out.println("3");
			pstmt.setDate(4, member.getUserDate());
			System.out.println("4	");
			pstmt.setString(5, member.getPhone());
			System.out.println("5");
			pstmt.setString(6, member.getGender());
			System.out.println("6");
			pstmt.setString(7, member.getAddress());
			System.out.println("7");
			pstmt.setString(8, member.getEmail());
			System.out.println("8");
			result = pstmt.executeUpdate();	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

}
