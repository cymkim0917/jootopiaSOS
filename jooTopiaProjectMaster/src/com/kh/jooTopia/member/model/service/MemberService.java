package com.kh.jooTopia.member.model.service;

import com.kh.jooTopia.member.model.dao.MemberDao;
import com.kh.jooTopia.member.model.vo.Member;
import static com.kh.jooTopia.common.JDBCTemplate.*;

import java.sql.Connection;

public class MemberService {

	public int insertMember(Member member) {
		Connection con = getConnection();
		int result = 0;
		
		int checkId = new MemberDao().idCheck(con, member.getUserId());
		System.out.println("checkId" + checkId);
		
		if(checkId == 0) {
			result = new MemberDao().insertMember(con,member);
			
			if(result >0) {
				commit(con);
			}else {
				rollback(con);
			}	
		}
		return result;
	}

	//로그인용
	public Member loginCheck(String userId, String userPwd) {
		Connection con = getConnection();
		
		Member result = new MemberDao().loginCheck(con,userId,userPwd);
		
		
		return result;
	}
	
	//아이디 찾기용(이메일 인증)
	public Member userCheck(String userName, String email) {
		Connection con = getConnection();
		
		Member member = new MemberDao().userCheck(userName,email,con);
		
		close(con);
		
		return member;
	}

	public int updateMember(Member memeber) {
		Connection con = getConnection();
		
		int result = new MemberDao().updateMember(con,memeber);
		
		
		if(result >0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

	public int deleteUser(Member delMember) {
		Connection con = getConnection();
		
		int result = new MemberDao().deleteUser(con,delMember);
		
		if(result > 0 ) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return result;
	}

}
