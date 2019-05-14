package com.kh.jooTopia.board.model.service;

import java.sql.*;
import java.util.ArrayList;
import static com.kh.jooTopia.common.JDBCTemplate.*;

import com.kh.jooTopia.board.model.dao.BoardDao;
import com.kh.jooTopia.board.model.vo.Attachment;
import com.kh.jooTopia.board.model.vo.Board;

public class BoardService {

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
