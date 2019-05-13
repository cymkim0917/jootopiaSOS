package com.kh.jooTopia.board.model.service;

import com.kh.jooTopia.board.model.dao.BoardAdminDao;
import com.kh.jooTopia.board.model.vo.Board;
import com.kh.jooTopia.board.model.vo.PageInfo;

import static com.kh.jooTopia.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

public class BoardAdminService {

	public int insertBoard(Board board) {
		Connection con = getConnection();
		
		int result = new BoardAdminDao().insertBoard(con, board);
		
		if(result>0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public ArrayList<Board> selectNoticeList(PageInfo pageInfo) {
		Connection con = getConnection();
		
		ArrayList<Board> list = new BoardAdminDao().selectNoticeList(con, pageInfo);
		System.out.println("서비스 리스트" );
		
		close(con);
		
		return list;
	}

	public int getNoticeListCount() {
		Connection con = getConnection();
	
		int listCount = new BoardAdminDao().getNoticeListCount(con);
		System.out.println("서비스 카운트" + listCount);
		
		close(con);
		
		return listCount;
	}

}
