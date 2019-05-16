package com.kh.jooTopia.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.board.model.service.BoardService;
import com.kh.jooTopia.board.model.vo.Board;
import com.kh.jooTopia.board.model.vo.Notice;

/**
 * Servlet implementation class SelectFaqMembershipListServlet
 */
@WebServlet("/selectFaqMembershipList.do")
public class SelectFaqMembershipListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectFaqMembershipListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ArrayList<Board> list = new BoardService().selectFaqMembershipList();
		
		System.out.println("list : " + list);
		System.out.println(list);
		
		String page = "";
		
		if(list != null) {
			page="views/notice/faqMembership.jsp";
			request.setAttribute("list", list);
			
		}else {
			page="views/common/errorPage500.jsp";
			request.setAttribute("msg", "공지사항 조회 실패");
		}
		
		
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		
		view.forward(request, response);
		
		System.out.println("request : " + request );
		System.out.println("response : "  + response);
	
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
