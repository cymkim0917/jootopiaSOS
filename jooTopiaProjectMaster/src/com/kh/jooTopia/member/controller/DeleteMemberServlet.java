package com.kh.jooTopia.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.member.model.service.MemberService;
import com.kh.jooTopia.member.model.vo.Member;

/**
 * Servlet implementation class DeleteMemberServlet
 */
@WebServlet("/deleteMember.do")
public class DeleteMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteMemberServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		Member delMember = (Member) request.getSession().getAttribute("loginUser");

		int result = new MemberService().deleteUser(delMember);

		String view = "";
		String msg = "";	
		PrintWriter out = response.getWriter();

		if (result > 0) {
			view = "views/member/deleteMemberPage.jsp";
			request.getSession().invalidate();
			response.sendRedirect(view);
		} else {
			view = "index.jsp";
			msg = "회원 탈퇴에 실패했습니다.";
			out.println("<script>alert('"+ msg +"'); location.href='"+ view +"';</script>");
		}//
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
