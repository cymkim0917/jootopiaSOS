package com.kh.jooTopia.notice.model.service;

import static com.kh.jooTopia.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jooTopia.notice.model.dao.NoticeDao;
import com.kh.jooTopia.notice.model.vo.Notice;

public class NoticeService {
	
	//전체
	public ArrayList<Notice> selectList(){
		Connection con = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectList(con);
		
		close(con);
		
		return list;
		
	}
	//상세
	public Notice selectOne(int num) {
		Connection con = getConnection();
		Notice n = new NoticeDao().selectOne(con,num);
		if(n !=null) {
			int result=new NoticeDao().updateCount(con,n.getbId());
			
			if(result > 0) {
				commit(con);
			}else {
				rollback(con);
			}
		}
		close(con);
		
		return n;
	}

}
