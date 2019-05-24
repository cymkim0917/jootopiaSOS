package com.kh.jooTopia.member.model.dao;

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

import com.kh.jooTopia.board.model.vo.Board;
import com.kh.jooTopia.board.model.vo.PageInfo;
import com.kh.jooTopia.member.model.vo.Member;
import com.kh.jooTopia.order.model.vo.POrder;
import com.kh.jooTopia.purchase.model.vo.Purchase;

import static com.kh.jooTopia.common.JDBCTemplate.*;

public class MemberAdminDao {
	private Properties prop = new Properties();
	
	public MemberAdminDao() {
		String fileName = MemberAdminDao.class.getResource("/sql/member/memberAdmin-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int getMemberListCount(Connection con) {
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("memberListCount");
		
		try {
			stmt = con.createStatement();
			rset =stmt.executeQuery(query);
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

	public ArrayList<Member> selectMemberList(Connection con, PageInfo pageInfo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = null;
		
		String query = prop.getProperty("selectMemberListPaging");
		
		int startRow = (pageInfo.getCurrentPage()-1)*pageInfo.getLimit()+1;
		int endRow = startRow + pageInfo.getLimit()-1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Member>();
			
			while(rset.next()) {
				Member member = new Member();
				member.setUno(rset.getInt("UNO"));
				member.setUserId(rset.getString("USER_ID"));
				member.setUserName(rset.getString("USER_NAME"));
				member.setUserDate(rset.getDate("USER_DATE"));
				member.setPhone(rset.getString("PHONE"));
				member.setEmail(rset.getString("EMAIL"));
				member.setAddress(rset.getString("ADDRESS"));
				
				list.add(member);
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

	public Member detailMember(Connection con, int num) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member member = null;
		
		String query = prop.getProperty("detailMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				member = new Member();
				member.setUno(rset.getInt("UNO"));
				member.setUserId(rset.getString("USER_ID"));
				member.setUserName(rset.getString("USER_NAME"));
				member.setPhone(rset.getString("PHONE"));
				member.setEmail(rset.getString("EMAIL"));
				member.setUserDate(rset.getDate("USER_DATE"));
				member.setAddress(rset.getString("ADDRESS"));
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return member;
	}

	public ArrayList<Member> deleteMemberList(Connection con, PageInfo pageInfo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = null;
		
		String query = prop.getProperty("deleteMemberListPaging");
		
		int startRow = (pageInfo.getCurrentPage()-1)*pageInfo.getLimit()+1;
		int endRow = startRow + pageInfo.getLimit()-1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Member>();
			
			while(rset.next()) {
				Member member = new Member();
				member.setUno(rset.getInt("UNO"));
				member.setUserId(rset.getString("USER_ID"));
				member.setUserName(rset.getString("USER_NAME"));
				member.setUserDate(rset.getDate("USER_DATE"));
				member.setPhone(rset.getString("PHONE"));
				member.setEmail(rset.getString("EMAIL"));
				member.setAddress(rset.getString("ADDRESS"));
				member.setWidthDrawal_date(rset.getDate("WIDTHDRAWAL_DATE"));
				member.setWidthDrawal_reason(rset.getString("WIDTHDRAWAL_REASON"));
				
				list.add(member);
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

	public int getDeleteMemberCount(Connection con) {
		Statement stmt = null;
		int listCount = 0;
		ResultSet rset = null;
		
		String query = prop.getProperty("deleteMemberCount");
		
		try {
			stmt = con.createStatement();
			rset =stmt.executeQuery(query);
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

	public ArrayList<Member> searchMember(Connection con, PageInfo pageInfo, Member sMember) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = null;
		
		String query = prop.getProperty("searchMember");
		
		int startRow = (pageInfo.getCurrentPage()-1)*pageInfo.getLimit()+1;
		int endRow = startRow + pageInfo.getLimit()-1;
		
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, sMember.getUserId());
			pstmt.setString(2, sMember.getUserName());
			pstmt.setString(3, sMember.getPhone());
			pstmt.setString(4, sMember.getEmail());
			pstmt.setDate(5, sMember.getUserDate());
			pstmt.setString(6, sMember.getAddress());
			pstmt.setInt(7, startRow);
			pstmt.setInt(8, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Member>();
			
			while(rset.next()) {
				Member member = new Member();
				member.setUno(rset.getInt("UNO"));
				member.setUserId(rset.getString("USER_ID"));
				member.setUserName(rset.getString("USER_NAME"));
				member.setUserDate(rset.getDate("USER_DATE"));
				member.setPhone(rset.getString("PHONE"));
				member.setEmail(rset.getString("EMAIL"));
				member.setAddress(rset.getString("ADDRESS"));
				
				list.add(member);
				
			}
			
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return list;
	}

	public ArrayList selectOrderList(Connection con, int uNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList list = null;
		
		
		String query = prop.getProperty("selectOder");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, 1);
			
			rset=pstmt.executeQuery();
			
			list = new ArrayList();
			
			while(rset.next()) {
				POrder order = new POrder();
				order.setPoId(rset.getInt("POID"));
				order.setPoDate(rset.getDate("PODATE"));
				order.setStatus(rset.getString("STATUS"));
				
				HashMap<String, Object> hmap = new HashMap<String, Object>();
				hmap.put("order", order);
				hmap.put("pName", rset.getString("PNAME"));
				
				list.add(hmap);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public ArrayList selectReviewList(Connection con,int uNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList list = null;
		
		String query = prop.getProperty("selectReviewList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, 1);
			
			rset=pstmt.executeQuery();
			
			list = new ArrayList();
			
			while(rset.next()) {
				 Board board = new Board();
				 board.setbNo(rset.getInt("BNO"));
				 board.setbTitle(rset.getString("BTITLE"));
				 board.setRrating(rset.getInt("RRATING"));
				 board.setbDate(rset.getDate("BDATE"));
				 
				 HashMap<String,Object> hmap = new HashMap<String, Object>();
				 hmap.put("board", board);
				 hmap.put("pname", rset.getString("PNAME"));
				 
				 list.add(hmap);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		return list;
	}

	public ArrayList selectSellingList(Connection con, int uNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList list = null;
		
		String query = prop.getProperty("selectSellingList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, 1);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList();
			
			while(rset.next()) {
				Purchase purchase = new Purchase();
				purchase.setModel(rset.getString("MODEL"));
				purchase.setAppAddress(rset.getString("APPLICANT_ADDRESS"));
				purchase.setHopeCost(rset.getInt("HOPE_COST"));
				
				HashMap<String, Object> hmap = new HashMap<String, Object>();
				
				hmap.put("purchase", purchase);
				hmap.put("status", rset.getString("STATUS"));
				
				list.add(hmap);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}

	public ArrayList<Board> selectQnAList(Connection con, int uNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectQnAList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, 1);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rset.next()) {
				Board board = new Board();
				board.setbDate(rset.getDate("BDATE"));
				board.setbTitle(rset.getString("BTITLE"));
				board.setqCategory(rset.getString("QCATEGORY"));
				board.setaStatus(rset.getString("ASTATUS"));
				
				list.add(board);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		
		
		return list;
	}

}







