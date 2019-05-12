package com.kh.jooTopia.member.model.service;

import com.kh.jooTopia.member.model.dao.MemberDao;
import com.kh.jooTopia.member.model.vo.Member;
import static com.kh.jooTopia.common.JDBCTemplate.*;

import java.sql.Connection;

public class MemberService {

	public int insertMember(Member member) {
		Connection con = getConnection();
		
		int result = new MemberDao().insertMember(con,member);
		
		if(result >0) {
			commit(con);
		}else {
			rollback(con);
		}		
		return result;
	}

}
