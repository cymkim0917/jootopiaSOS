package com.kh.jooTopia.board.model.service;

import com.kh.jooTopia.board.model.dao.BoardAdminDao;
import com.kh.jooTopia.board.model.vo.Attachment;
import com.kh.jooTopia.board.model.vo.Board;
import com.kh.jooTopia.board.model.vo.PageInfo;

import static com.kh.jooTopia.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

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
