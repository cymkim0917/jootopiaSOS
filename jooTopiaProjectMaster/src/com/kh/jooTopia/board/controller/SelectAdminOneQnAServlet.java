package com.kh.jooTopia.board.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.board.model.service.BoardAdminService;
import com.kh.jooTopia.board.model.vo.Board;
import com.kh.jooTopia.member.model.vo.Member;

/**
 * Servlet implementation class SelectAdminOneQnAServlet
 */
@WebServlet("/selectAdminOneQnA.do")
public class SelectAdminOneQnAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAdminOneQnAServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		HashMap<String, Object> hmap = new BoardAdminService().selectOneQnA(num);
		
		Board board = (Board)hmap.get("board");
		Member member = (Member)hmap.get("member");
		
		String page ="";
		
		if(hmap != null) {
			page="views/admin/board/detailQnA.jsp";
			request.setAttribute("board", board);
			request.setAttribute("member", member);
		}else {
			page="views/common/errorPage500.jps";
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
