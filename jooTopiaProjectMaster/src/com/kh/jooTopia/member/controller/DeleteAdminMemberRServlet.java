package com.kh.jooTopia.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.member.model.service.MemberAdminService;

/**
 * Servlet implementation class DeleteAdminMemberRServlet
 */
@WebServlet("/deleteAdminMemberR.do")
public class DeleteAdminMemberRServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAdminMemberRServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String withdrawal =request.getParameter("withdrawal");
		int uNo = Integer.parseInt(request.getParameter("no"));
		
		int result = new MemberAdminService().deleteMemberReason(withdrawal, uNo);
		
		if(result>0) {
			response.sendRedirect(request.getContextPath()+"/selectAdminMember.do");
		}else {
			request.getRequestDispatcher("views/common/errorPage500.jsp");
		}
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
