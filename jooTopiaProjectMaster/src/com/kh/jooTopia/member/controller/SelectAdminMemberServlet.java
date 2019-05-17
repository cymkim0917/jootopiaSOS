package com.kh.jooTopia.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.board.model.vo.PageInfo;
import com.kh.jooTopia.member.model.service.MemberAdminService;
import com.kh.jooTopia.member.model.vo.Member;

/**
 * Servlet implementation class SelectAdminMemberServlet
 */
@WebServlet("/selectAdminMember.do")
public class SelectAdminMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAdminMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 10;
		
		int listCount = new MemberAdminService().getMemberListCount();
		
		maxPage = (int)((double)listCount/limit+0.9);
		
		startPage = (((int)((double)currentPage/limit+0.9))-1);
		
		endPage = startPage + 10 - 1;
		
		if(maxPage<endPage) {
			endPage=maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(currentPage, limit, maxPage, startPage, endPage);
		
		ArrayList<Member> list = new MemberAdminService().selectMemberList(pageInfo);
		
		String page = "";
		
		if(list != null) {
			page="/views/admin/member/member.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pageInfo", pageInfo);
		
		}else {
			page="/views/common/eerorPage500.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
