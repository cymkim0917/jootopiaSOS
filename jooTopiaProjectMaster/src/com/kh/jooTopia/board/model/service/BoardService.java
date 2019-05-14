package com.kh.jooTopia.board.model.service;

import static com.kh.jooTopia.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;



import com.kh.jooTopia.board.model.dao.BoardDao;
import com.kh.jooTopia.board.model.vo.Notice;
import com.kh.jooTopia.board.model.vo.PageInfo;

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
	
	
	
}
