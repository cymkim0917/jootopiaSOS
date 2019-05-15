package com.kh.jooTopia.board.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.jooTopia.board.model.vo.Attachment;
import com.kh.jooTopia.board.model.vo.Board;
import com.kh.jooTopia.board.model.vo.PageInfo;

import static com.kh.jooTopia.common.JDBCTemplate.*;

public class BoardAdminDao {
	private Properties prop = new Properties();
	
	public BoardAdminDao() {
		String fileName = BoardAdminDao.class.getResource("/sql/board/boardAdmin-query.properties").getPath();
		
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public int insertBoard(Connection con, Board board) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAdminNotice");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, board.getbTitle());
			pstmt.setString(2, board.getbContent());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	public ArrayList<Board> selectNoticeList(Connection con, PageInfo pageInfo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectNoticeListPaging");
		
		int startRow = (pageInfo.getCurrentPage()-1)*pageInfo.getLimit()+1;
		int endRow = startRow + pageInfo.getLimit()-1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rset.next()) {
				Board board = new Board();
				board.setbId(rset.getInt("BID"));
				board.setbNo(rset.getInt("BNO"));
				board.setbType(rset.getInt("BTYPE"));
				board.setbTitle(rset.getString("BTITLE"));
				board.setbContent(rset.getString("BCONTENT"));
				board.setStatus(rset.getString("STATUS"));
				board.setBDate(rset.getDate("BDATE"));
				board.setModifyDate(rset.getDate("MODIFY_DATE"));
				board.setbCount(rset.getInt("BCOUNT"));
				board.setStartDate(rset.getDate("START_DATE"));
				board.setFinishDate(rset.getDate("FINISH_DATE"));
				board.setuNo(rset.getInt("UNO"));
				
				list.add(board);
				
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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		return listCount;
	}

	public int selectNoticeCurrval(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int bId = 0;
		
		String query = prop.getProperty("selectNoticeCurrval");
		
		try {
			stmt=con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				bId=rset.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return bId;
	}

	public int insertNoticeAttachment(Connection con, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertNoticeAttachment");
		
		
			try {
				
				for(int i=0; i<fileList.size(); i++) {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, fileList.get(i).getOriginName());
				pstmt.setString(2, fileList.get(i).getChangeName());
				pstmt.setString(3, fileList.get(i).getFilePath());
				pstmt.setInt(4, fileList.get(i).getbId());
				result += pstmt.executeUpdate();
				
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
	
		
		return result;
	}

	public int insertEventBoard(Connection con, Board board) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("insertAdminEvent");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, board.getbTitle());
			pstmt.setString(2, board.getbContent());
			pstmt.setDate(3, board.getStartDate());
			pstmt.setDate(4, board.getFinishDate());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	public ArrayList<Board> searchNotice(Connection con, PageInfo pageInfo, int bType, String searchTitle) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		
		int startRow = (pageInfo.getCurrentPage()-1)*pageInfo.getLimit()+1;
		int endRow = startRow + pageInfo.getLimit()-1;
		
		System.out.println("dao 출력 비타입 : " + bType);
		
		if(bType==0) {
			System.out.println("b타입 0일때");
			String query=query = prop.getProperty("searchNoticeAll");
			
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setString(1, searchTitle);
				pstmt.setInt(2, startRow);
				pstmt.setInt(3, endRow);
				
				rset = pstmt.executeQuery();
				
				list = new ArrayList<Board>();
				
				while(rset.next()) {
					Board board = new Board();
					board.setbId(rset.getInt("BID"));
					board.setbNo(rset.getInt("BNO"));
					board.setbType(rset.getInt("BTYPE"));
					board.setbTitle(rset.getString("BTITLE"));
					board.setbContent(rset.getString("BCONTENT"));
					board.setStatus(rset.getString("STATUS"));
					board.setBDate(rset.getDate("BDATE"));
					board.setModifyDate(rset.getDate("MODIFY_DATE"));
					board.setbCount(rset.getInt("BCOUNT"));
					board.setStartDate(rset.getDate("START_DATE"));
					board.setFinishDate(rset.getDate("FINISH_DATE"));
					board.setuNo(rset.getInt("UNO"));
					
					list.add(board);
					
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			
			System.out.println("서치 출력 리스트 " + list);
			return list;
			
		}else {
			
			System.out.println("b타입 1이나 2일때");
			String query=query = prop.getProperty("searchNotice");
			try {
				pstmt = con.prepareStatement(query);
				pstmt.setInt(1, bType);
				pstmt.setString(2, searchTitle);
				pstmt.setInt(3, startRow);
				pstmt.setInt(4, endRow);
				
				rset = pstmt.executeQuery();
				
				list = new ArrayList<Board>();
				
				while(rset.next()) {
					Board board = new Board();
					board.setbId(rset.getInt("BID"));
					board.setbNo(rset.getInt("BNO"));
					board.setbType(rset.getInt("BTYPE"));
					board.setbTitle(rset.getString("BTITLE"));
					board.setbContent(rset.getString("BCONTENT"));
					board.setStatus(rset.getString("STATUS"));
					board.setBDate(rset.getDate("BDATE"));
					board.setModifyDate(rset.getDate("MODIFY_DATE"));
					board.setbCount(rset.getInt("BCOUNT"));
					board.setStartDate(rset.getDate("START_DATE"));
					board.setFinishDate(rset.getDate("FINISH_DATE"));
					board.setuNo(rset.getInt("UNO"));
					
					list.add(board);
					
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally{
				close(rset);
				close(pstmt);
			}
			
			System.out.println("서치 출력 리스트 " + list);
			return list;
			
		}
		
		
		
	}

	
}
