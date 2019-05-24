package com.kh.jooTopia.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.board.model.service.BoardAdminService;
import com.kh.jooTopia.member.model.service.MemberAdminService;

/**
 * Servlet implementation class DeleteAdminMemberServlet
 */
@WebServlet("/deleteAdminM.do")
public class DeleteAdminMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAdminMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String [] suNo = request.getParameterValues("checkuNo");
		
		int [] uNo = new int[suNo.length];
		
		for(int i=0; i<suNo.length; i++) {
			uNo[i] = Integer.parseInt(suNo[i]);
		}
		int result = 0;
		
		for(int i=0; i<uNo.length; i++) {
			
			result += new MemberAdminService().deleteMember(uNo[i]);
		}
		
		if(result==uNo.length) {
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
