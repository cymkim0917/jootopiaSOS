package com.kh.jooTopia.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.board.model.service.BoardAdminService;
import com.kh.jooTopia.board.model.vo.Board;

/**
 * Servlet implementation class InsertAdminNoticeServlet
 */
@WebServlet("/insertAdminNotice.do")
public class InsertAdminNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertAdminNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		System.out.println(category);
		System.out.println(title);
		System.out.println(content);
		
		
		
		
		Board board = new Board();
		board.setbContent(content);
		board.setbTitle(title);
		
		int result = new BoardAdminService().insertBoard(board);
		
		if(result>0) {
			response.sendRedirect("views/admin/board/notice.jsp");
			
		}else {
			request.getRequestDispatcher("views/common/errorPage500.jsp").forward(request, response);;
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
