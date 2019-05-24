package com.kh.jooTopia.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.member.model.service.MemberAdminService;

/**
 * Servlet implementation class ReturnAdminMemberServlet
 */
@WebServlet("/returnAdminMember.do")
public class ReturnAdminMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReturnAdminMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String [] suNo = request.getParameterValues("checkUno");
		
		for(int i=0; i<suNo.length; i++) {
			System.out.println(suNo[i]);
		}
		
		int [] uNo = new int[suNo.length];
		
		for(int i=0; i<suNo.length; i++) {
			uNo[i] = Integer.parseInt(suNo[i]);
			System.out.println("포문"+uNo[i]);
		}
		
		
		int result = 0;
		
		for(int i=0; i<uNo.length; i++) {
			System.out.println("인티져 확인"+(uNo[0]+uNo[1]));
			
			result += new MemberAdminService().comeBackMember(uNo[i]);
		}
		
		
		if(result==uNo.length) {
			 response.sendRedirect(request.getContextPath()+"/deleteAdminMember.do");
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
