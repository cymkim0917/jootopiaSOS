package com.kh.jooTopia.member.model.service;

import static com.kh.jooTopia.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.jooTopia.board.model.vo.PageInfo;
import com.kh.jooTopia.member.model.dao.MemberAdminDao;
import com.kh.jooTopia.member.model.vo.Member;

public class MemberAdminService {

	public int getMemberListCount() {
		Connection con = getConnection();
		
		int listCount = new MemberAdminDao().getMemberListCount(con);
		
		close(con);
		
		return listCount;
	}

	public ArrayList<Member> selectMemberList(PageInfo pageInfo) {
		Connection con = getConnection();
		
		ArrayList<Member> list = new MemberAdminDao().selectMemberList(con, pageInfo);
		
		close(con);
		
		return list;
	}

	public Member detailMember(int num) {
		Connection con = getConnection();
		
		Member member = new MemberAdminDao().detailMember(con, num);
		
		close(con);
		
		return member;
	}

	public ArrayList<Member> deleteMemberList(PageInfo pageInfo) {
		Connection con = getConnection();
		
		ArrayList<Member> list = new MemberAdminDao().deleteMemberList(con, pageInfo);
		
		close(con);
		
		return list;
	}

	public int getDeleteMemberCount() {
		Connection con = getConnection();
		
		int listCount = new MemberAdminDao().getDeleteMemberCount(con);
		
		close(con);
		
		return listCount;
	}

}
