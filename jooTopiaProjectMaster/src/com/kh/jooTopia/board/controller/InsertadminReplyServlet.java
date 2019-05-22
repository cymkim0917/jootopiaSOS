package com.kh.jooTopia.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.jooTopia.board.model.service.BoardAdminService;
import com.kh.jooTopia.board.model.vo.Board;

/**
 * Servlet implementation class InsertadminReplyServlet
 */
@WebServlet("/insertadminReply.do")
public class InsertadminReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertadminReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("리플 서블릿");
		int uno = Integer.parseInt(request.getParameter("uno"));
		int bId = Integer.parseInt(request.getParameter("bid"));
		String aContent =request.getParameter("content");
		
		Board board = new Board();
		board.setbId(bId);
		board.setuNo(uno);
		board.setaContent(aContent);
		
		ArrayList<Board> reply = new BoardAdminService().insertReply(board);
		
		response.setContentType("application/json");
		new Gson().toJson(reply, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
