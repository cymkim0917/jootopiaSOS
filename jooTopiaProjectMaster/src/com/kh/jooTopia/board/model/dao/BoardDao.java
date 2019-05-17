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
import java.util.HashMap;
import java.util.Properties;
import static com.kh.jooTopia.common.JDBCTemplate.*;

import com.kh.jooTopia.member.model.dao.MemberDao;
import com.kh.jooTopia.member.model.vo.Member;
import com.kh.jooTopia.board.model.vo.Attachment;
import com.kh.jooTopia.board.model.vo.Board;
import com.kh.jooTopia.board.model.vo.Notice;
import com.kh.jooTopia.board.model.vo.PageInfo;


public class BoardDao {
	private Properties prop = new Properties();
	
	public BoardDao() {
	  String fileName = BoardDao.class.getResource("/sql/board/board-query.properties").getPath();
		
			try {
				prop.load(new FileReader(fileName));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
	}
	
	//전체출력
	public HashMap<String, Object> selectList(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		HashMap<String, Object> hmap = null;
		ArrayList<Notice> nList = null;
		ArrayList<Member> mList = null;
		
		String query = prop.getProperty("selectList");
		
		/*int startRow = (pageInfo.getCurrentPage()-1)*pageInfo.getLimit()+1;
		int endRow = startRow + pageInfo.getLimit()-1;
		*/
		try {
			stmt = con.createStatement();
			/*pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);*/
			
			rset = stmt.executeQuery(query);
			
			nList = new ArrayList<Notice>();
			mList = new ArrayList<Member>();
			hmap = new HashMap<String, Object>();
			
			while(rset.next()) {
				Notice n = new Notice();
				n.setbId(rset.getInt("BID"));
				n.setbType(rset.getInt("BTYPE"));
				n.setbTitle(rset.getString("BTITLE"));
				n.setbCount(rset.getInt("BCOUNT"));
				n.setModifyDate(rset.getDate("MODIFY_DATE"));
				
				nList.add(n);
				
				Member m = new Member();
				m.setUserId(rset.getString("USER_ID"));
				
				mList.add(m);
				
			}
			
			hmap.put("nList", nList);
			hmap.put("mList", mList);
			
			
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		System.out.println("Dao 페이징 : " + hmap);
		return hmap;
		
	}
		
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
				/*n.setEnrollDate(rset.getDate("ENROLL_DATE"));*/
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
		System.out.println("n : " + n);
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

	public int insertQaAContent(Connection con, Board board) {
		// insertQaAContent = INSERT INTO
		// BOARD(BID,BNO,BTYPE,BTITLE,BCONTENT,STATUS,ENROLL_DATE,MODIFY_DATE,UNO)
		// VALUES (SEQ_BID.NEXTVAL,SEQ_BNO3_PRIVATE.NEXTVAL,3,?,?,'Y',SYSDATE,SYSDATE,?)
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertQaAContent");

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getbTitle());
			pstmt.setString(2, board.getbContent());
			pstmt.setInt(3, board.getuNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int insertQaAPhoto(Connection con, ArrayList<Attachment> fileList) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertQaAPhoto");

		try {
			for (int i = 0; i < fileList.size(); i++) {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, fileList.get(i).getbId());
				pstmt.setString(2, fileList.get(i).getOriginName());
				pstmt.setString(3, fileList.get(i).getChangeName());
				pstmt.setString(4, fileList.get(i).getFilePath());
				
				result += pstmt.executeUpdate();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return result;
	}



	public int selectCurrval(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int bid = 0;
		
		String query = prop.getProperty("selectCurrval");

		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);

			if (rset.next()) {
				bid = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(stmt);
			close(rset);
		}
		return bid;
	}

	public ArrayList<Board> selectBoardList(int uno, Connection con) {
		ArrayList<Board> list = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board board = null;
		String sql = prop.getProperty("selectQaAList");

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, uno);
			rs = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rs.next()) {
				board = new Board();
				board.setuNo(uno);
				board.setbId(rs.getInt("BID"));
				board.setbNo(rs.getInt("BNO"));
				board.setbTitle(rs.getString("BTITLE"));
				board.setbDate(rs.getDate("BDATE"));
				board.setbCount(rs.getInt("BCOUNT"));
				board.setbType(rs.getInt("BTYPE"));
				
				list.add(board);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public HashMap<String,Object> selectQaA(Connection con, int bid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board board = null;
		HashMap<String,Object> quesMap = null;
		Attachment att = null;
		ArrayList<Attachment> attList = null;
		
		String sql = prop.getProperty("selectQaA");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bid);
			rs = pstmt.executeQuery();
			
			attList = new ArrayList<Attachment>();
			
			while(rs.next()) {
				board = new Board();
				board.setbId(rs.getInt("BID"));
				board.setbNo(rs.getInt("BNO"));
				board.setbTitle(rs.getString("BTITLE"));
				board.setbCount(rs.getInt("BCOUNT"));
				board.setbContent(rs.getString("BCONTENT"));
				board.setbDate(rs.getDate("BDATE"));
				
				att = new Attachment();
				att.setfId(rs.getInt("FID"));
				att.setOriginName(rs.getString("ORIGIN_NAME"));
				att.setChangeName(rs.getString("CHANGE_NAME"));
				att.setFilePath(rs.getString("FILE_PATH"));
				att.setUploadDate(rs.getDate("UPLOAD_DATE"));
				
				attList.add(att);
			}
			quesMap = new HashMap<String,Object>();
			
			quesMap.put("board", board);
			quesMap.put("attachment", attList);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return quesMap;
	}

	public int upDateQaAContent(Connection con, Board board) {
		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("updateQnAContent");

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getbTitle());
			pstmt.setString(2, board.getbContent());
			pstmt.setInt(3, board.getuNo());
			pstmt.setInt(4, board.getbId());
			System.out.println(board);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int updateQaAPhoto(Connection con, ArrayList<Attachment> fileList) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateQaAPhoto");
		System.out.println("DAO [fileList] : " + fileList);
		try {
			for (int i = 0; i < fileList.size(); i++) {
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, fileList.get(i).getOriginName());
				System.out.println(i+" fileList.ChangeName : "+fileList.get(i).getChangeName());
				pstmt.setString(2, fileList.get(i).getChangeName());
				pstmt.setString(3, fileList.get(i).getFilePath());
				pstmt.setInt(4, fileList.get(i).getfId());
				
				result += pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public String[] deleteFiles(Connection con, int[] fid) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("deleteFiles");
		String[] files = new String[fid.length];
		
		try {
			pstmt = con.prepareStatement(sql);
			
			for(int i = files.length -1; i>=0; i--) {
				pstmt.setInt(1,fid[i]);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					files[i] = rs.getString("CHANGE_NAME");
				}else {
					files = null;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return files;
	}

	//(s) FAQ전체 통합 메인 리스트 출력
	public ArrayList<Board> selectFaqTotalList(Connection con,String fCategory) {
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectFaqTotalList");
		
		try {
			stmt = con.createStatement();
			
			rset = stmt.executeQuery(query);
			
			list = new ArrayList<Board>();
			
			while(rset.next()) {
				Board b = new Board();
				b.setbId(rset.getInt("BID"));
				b.setfCategory(rset.getString("FCATEGORY"));
				b.setbTitle(rset.getString("BTITLE"));
				b.setbDate(rset.getDate("BDATE"));
				b.setbCount(rset.getInt("BCOUNT"));
				list.add(b);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		System.out.println("Dao 페이징 : " + list);
		return list;
	}

	public ArrayList<Board> selectFaqMembershipList(Connection con) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectFaqMembershipList");
		
	
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "회원가입");
			
			rset = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			while(rset.next()) {
				Board b = new Board();
				b.setbId(rset.getInt("BID"));
				b.setfCategory(rset.getString("FCATEGORY"));
				b.setbType(rset.getInt("BTYPE"));
				b.setbTitle(rset.getString("BTITLE"));
				b.setbCount(rset.getInt("BCOUNT"));
				b.setbDate(rset.getDate("BDATE"));
				b.setuNo(rset.getInt("UNO"));
				
				list.add(b);
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Board> titleSearchList(Connection con, Board board, String searchText) {
		ArrayList<Board> list = null;
		Board addBoard = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("titleSearchList");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board.getuNo());
			pstmt.setInt(2, board.getbType());
			pstmt.setString(3,searchText);
			rs = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			//No	제목	작성 일자	조회수	게시글 타입
			while(rs.next()) {
				addBoard = new Board();
				addBoard.setbId(rs.getInt("BID"));
				addBoard.setbTitle(rs.getString("BTITLE"));
				addBoard.setbDate(rs.getDate("BDATE"));
				addBoard.setbCount(rs.getInt("BCOUNT"));
				addBoard.setbType(rs.getInt("BTYPE"));
				list.add(addBoard);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public ArrayList<Board> contentSearchList(Connection con, Board board, String searchText) {
		ArrayList<Board> list = null;
		Board addBoard = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("contentSearchList");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board.getuNo());
			pstmt.setInt(2, board.getbType());
			pstmt.setString(3,searchText);
			rs = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			//No	제목	작성 일자	조회수	게시글 타입
			while(rs.next()) {
				addBoard = new Board();
				addBoard.setbId(rs.getInt("BID"));
				addBoard.setbTitle(rs.getString("BTITLE"));
				addBoard.setbDate(rs.getDate("BDATE"));
				addBoard.setbCount(rs.getInt("BCOUNT"));
				addBoard.setbType(rs.getInt("BTYPE"));
				list.add(addBoard);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Board> contentAllSearchList(Connection con, Board board, String searchText) {
		ArrayList<Board> list = null;
		Board addBoard = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = prop.getProperty("contentSearchList");
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board.getuNo());
			pstmt.setInt(2, board.getbType());
			pstmt.setString(3,searchText);
			pstmt.setString(4,searchText);
			rs = pstmt.executeQuery();
			
			list = new ArrayList<Board>();
			
			//No	제목	작성 일자	조회수	게시글 타입
			while(rs.next()) {
				addBoard = new Board();
				addBoard.setbId(rs.getInt("BID"));
				addBoard.setbTitle(rs.getString("BTITLE"));
				addBoard.setbDate(rs.getDate("BDATE"));
				addBoard.setbCount(rs.getInt("BCOUNT"));
				addBoard.setbType(rs.getInt("BTYPE"));
				list.add(addBoard);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	
	//(s) FAQ 전체리스트에서 버튼눌러서 각 카테고리별로 게시글이 갈리는 기능 
	public ArrayList<Board> selectFaqCategoryList(Connection con, String fCategory) {
		PreparedStatement pstmt=null;
		ResultSet rset = null;
		ArrayList<Board> list = null;
		
		String query = prop.getProperty("selectFaqCategoryList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, fCategory);
			rset = pstmt.executeQuery();
			list = new ArrayList<Board>();
			System.out.println("list in dao : " + list);
			
			
			while(rset.next()) {
				Board b =new Board();
				b.setbId(rset.getInt("BID"));
				b.setfCategory(rset.getString("FCATEGORY"));
				b.setbType(rset.getInt("BTYPE"));
				b.setbTitle(rset.getString("BTITLE"));
				b.setbCount(rset.getInt("BCOUNT"));
				b.setbDate(rset.getDate("BDATE"));
				b.setuNo(rset.getInt("UNO"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		
		return list;
	}



	public Board selectOneFaqTotalList(Connection con, int num) {

		PreparedStatement pstmt=null;
		ResultSet rset = null;
		Board b = null;
		
		String query = prop.getProperty("selectOne");
		
		try {
			pstmt=con.prepareStatement(query);
			pstmt.setInt(1, num);
			rset=pstmt.executeQuery();
			
			if(rset.next()) {
				b=new Board();
				
				b.setbId(rset.getInt("BID"));
				b.setbNo(rset.getInt("BNO"));
				b.setbType(rset.getInt("BTYPE"));
				b.setbTitle(rset.getString("BTITLE"));
				b.setbContent(rset.getString("BCONTENT"));
				b.setStatus(rset.getString("STATUS"));
				/*n.setEnrollDate(rset.getDate("ENROLL_DATE"));*/
				b.setModifyDate(rset.getDate("MODIFY_DATE"));
				b.setbCount(rset.getInt("BCOUNT"));
				b.setuNo(rset.getInt("UNO"));
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		}finally {
			close(pstmt);
			close(rset);
		}
		System.out.println("b : " + b);
		return b;
		
	}

}
