package com.kh.jooTopia.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.board.model.service.BoardAdminService;

/**
 * Servlet implementation class DeleteAdminQnAServlet
 */
@WebServlet("/deleteAdminQnA.do")
public class DeleteAdminQnAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteAdminQnAServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String [] sbId = request.getParameterValues("checkBid");
		
		int [] bId = new int[sbId.length];
		
		for(int i=0; i<sbId.length; i++) {
			bId[i] = Integer.parseInt(sbId[i]);
		}
		
		
		
		int result = 0;
		
		for(int i=0; i<bId.length; i++) {
			
			result += new BoardAdminService().deleteNotice(bId[i]);
			//System.out.println("numArr 값 : " + num1[i]);
		}
		System.out.println("result: " +result);
		System.out.println("bId length" + bId.length);
		
		if(result==bId.length) {
			 response.sendRedirect(request.getContextPath()+"/selectAdminQnA.do");
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
