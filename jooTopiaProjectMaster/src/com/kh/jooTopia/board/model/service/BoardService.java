package com.kh.jooTopia.board.model.service;
import java.sql.*;
import java.util.ArrayList;
import static com.kh.jooTopia.common.JDBCTemplate.*;

import com.kh.jooTopia.board.model.dao.BoardDao;
import com.kh.jooTopia.board.model.vo.Attachment;
import com.kh.jooTopia.board.model.vo.Board;


public class BoardService {
	
	//전체 출력
	public ArrayList<Notice> selectList(){
		Connection con = getConnection();
		ArrayList<Notice> list = new BoardDao().selectList(con);
		
		close(con);
		
		return list;
		
	}
	//상세
	public Notice selectOne(int num) {
		Connection con = getConnection();
		Notice n = new BoardDao().selectOne(con,num);
		System.out.println("num :" + num);
		System.out.println("getbId :" + n.getbId());
		
		if(n !=null) {
			int result=new BoardDao().updateCount(con,n.getbId());
			
			if(result > 0) {
				commit(con);
			}else {
				rollback(con);
			}
		}
		close(con);
		
		return n;
	}

	
	//공지글 카운트(조회수)
	public int getNoticeListCount() {
		Connection con = getConnection();
	
		int listCount = new BoardDao().getNoticeListCount(con);
		System.out.println("서비스 카운트" + listCount);
		
		close(con);
		
		return listCount;
	}

	public int insertPhote(Board board, ArrayList<Attachment> fileList) {
		Connection con = getConnection();
		
		int returnResult = 0;
		
		int boardResult = new BoardDao().insertQaAContent(con,board);
		
		if(boardResult>0) {
			int bId = new BoardDao().selectcurrval(con);
			
			for (int i = 0; i < fileList.size(); i++) {
				fileList.get(i).setbId(bId);
			}
		}
		
		int insertResult = new BoardDao().insertQaAPhoto(con,fileList);
		
		if(boardResult > 0 && insertResult == fileList.size()) {
			commit(con);
			returnResult = 1;
		}else {
			rollback(con);
			returnResult = 0;
		}
		
		close(con);
		
		return returnResult;
	}

}
