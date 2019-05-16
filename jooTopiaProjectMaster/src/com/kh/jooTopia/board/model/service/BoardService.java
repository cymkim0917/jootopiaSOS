package com.kh.jooTopia.board.model.service;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

import static com.kh.jooTopia.common.JDBCTemplate.*;
import static com.kh.jooTopia.common.JDBCTemplate.getConnection;

import com.kh.jooTopia.board.model.dao.BoardDao;
import com.kh.jooTopia.board.model.vo.Attachment;
import com.kh.jooTopia.board.model.vo.Board;
import com.kh.jooTopia.board.model.vo.Notice;


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
			int bId = new BoardDao().selectCurrval(con);
			
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
	public ArrayList<Board> selectBoardList(int uno) {
		
		Connection con = getConnection();
		ArrayList<Board> list = new BoardDao().selectBoardList(uno,con);
		
		close(con);
		
		return list;
		
	}

	public HashMap<String, Object> selectQaAMap(int bid) {
		Connection con = getConnection();
		HashMap<String, Object> queMap = null;
		int ctnResult = new BoardDao().updateCount(con, bid);
		
		if(ctnResult > 0) {
			commit(con);
			
			queMap = new BoardDao().selectQaA(con, bid);
		}else {
			rollback(con);
		}

		return queMap;
	}
	public int updateQaA(Board board, ArrayList<Attachment> fileList) {
	Connection con = getConnection();
		
		int returnResult = 0;
		
		int boardResult = new BoardDao().upDateQaAContent(con,board);
		System.out.println("boardResult" + boardResult);
		if(boardResult>0) {
			/*int bId = new BoardDao().selectCurrval(con);*/
			
			for (int i = 0; i < fileList.size(); i++) {
				fileList.get(i).setbId(board.getbId());
			}
		}
		
		int updateResult = new BoardDao().updateQaAPhoto(con,fileList);
		System.out.println("updateResult" + updateResult);
		if(boardResult > 0 && updateResult == fileList.size()) {
			commit(con);
			returnResult = 1;
		}else {
			rollback(con);
			returnResult = 0;
		}
		
		close(con);
		
		return returnResult;
	}
	public int updateQaAContent(Board board) {
		Connection con= getConnection();
		
		int boardResult = new BoardDao().upDateQaAContent(con,board);
		
		if(boardResult >0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return boardResult;
	}
	public String[] deleteFiles(int[] fid) {
		Connection con= getConnection();
		
		String[] files = new BoardDao().deleteFiles(con,fid);
		
		close(con);
		
		return files;
	}

}
