package com.kh.jooTopia.board.model.service;

import com.kh.jooTopia.board.model.dao.BoardAdminDao;
import com.kh.jooTopia.board.model.vo.Attachment;
import com.kh.jooTopia.board.model.vo.Board;
import com.kh.jooTopia.board.model.vo.PageInfo;

import static com.kh.jooTopia.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

public class BoardAdminService {

	public int insertBoard(Board board, ArrayList<Attachment> fileList) {
		Connection con = getConnection();
		int result;
		
		
		int result1 = new BoardAdminDao().insertBoard(con, board);
		
		if(result1>0) {
			int bId = new BoardAdminDao().selectNoticeCurrval(con);
			
			for(int i =0; i<fileList.size(); i++) {
				fileList.get(i).setbId(bId);
			}
		}
		
		int result2 = new BoardAdminDao().insertNoticeAttachment(con, fileList);
		
		if(result1>0 && result2 ==fileList.size()) {
			commit(con);
			result=1;
		}else {
			rollback(con);
			result=0;
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<Board> selectNoticeList(PageInfo pageInfo) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardAdminDao().selectNoticeList(con, pageInfo);
		//System.out.println("서비스 리스트" );
		
		close(con);
		
		return list;
	}

	public int getNoticeListCount() {
		Connection con = getConnection();
	
		int listCount = new BoardAdminDao().getNoticeListCount(con);
		//System.out.println("서비스 카운트" + listCount);
		
		close(con);
		
		return listCount;
	}

	public int insertEventBoard(Board board, ArrayList<Attachment> fileList) {
		Connection con = getConnection();
		int result;
		
		
		int result1 = new BoardAdminDao().insertEventBoard(con, board);
		
		if(result1>0) {
			int bId = new BoardAdminDao().selectNoticeCurrval(con);
			System.out.println("Bid : " +bId);
			
			for(int i =0; i<fileList.size(); i++) {
				fileList.get(i).setbId(bId);
			}
		}
		
		int result2 = new BoardAdminDao().insertNoticeAttachment(con, fileList);
		
		if(result1>0 && result2 ==fileList.size()) {
			commit(con);
			result=1;
		}else {
			rollback(con);
			result=0;
		}
		
		close(con);
		
		return result;
		
	}

	public ArrayList<Board> searchNotice(PageInfo pageInfo, int bType, String searchTitle) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardAdminDao().searchNotice(con, pageInfo, bType, searchTitle);
		
		close(con);
		
		
		return list;
	}

	public HashMap<String, Object> selectOneNotice(int num) {
		Connection con = getConnection();
		HashMap<String, Object> hmap = null;
		
		int result = new BoardAdminDao().updateCount(con,num);
		
		if(result>0) {
			commit(con);
			hmap = new BoardAdminDao().selectOneNotice(con,num);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return hmap;
	}

	public int updateNotice(Board board, ArrayList<Attachment> fileList) {
		Connection con = getConnection();
		int result;
		
		int result1 = new BoardAdminDao().updateNotice(con, board);
		
		if(result1>0) {
			for(int i = 0; i<fileList.size(); i++) {
				fileList.get(i).setbId(board.getbId());
			}
		}
		
		int result2 = new BoardAdminDao().updateNoticeAttachment(con, fileList);
		
		if(result1>0 && result2 ==fileList.size()) {
			commit(con);
			result=1;
		}else {
			rollback(con);
			result=0;
		}
		
		close(con);
		
		
		return result;
	}

}
