package com.kh.jooTopia.member.model.service;

import com.kh.jooTopia.member.model.dao.MemberDao;
import com.kh.jooTopia.member.model.vo.KakaoMember;
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
			
			if(member.getUserId().substring(0, 5).equals("Kakao")) {
				result = new MemberDao().insertMember(con,member,2);		
			}else {
				result = new MemberDao().insertMember(con,member);							
			}
			
			
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

	public int kakaoMemberNY(KakaoMember member) {
		Connection con = getConnection();
		int result = new MemberDao().idCheck(con, member.getUserId());
		
		
		close(con);
		
		
		return result;
	}

	public Member searchMember(KakaoMember kakao) {
		Connection con = getConnection();
		
		Member member = new MemberDao().searchMember(con,kakao);
		
		close(con);
		
		return member;
	}

	public String getUserId(String userName, String email) {
		Connection con = getConnection();
		String userId = new MemberDao().getUserId(con,userName,email);
		
		
		close(con);
		
		return userId;
	}

	public void issuancePwd(String userPwd,String userName,String email,String userId) {
		Connection con = getConnection();
		
		int result = new MemberDao().issuancePwd(userPwd, userName, email, userId, con);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		
	}

}
