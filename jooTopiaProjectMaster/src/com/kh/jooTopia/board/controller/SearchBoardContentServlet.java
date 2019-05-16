package com.kh.jooTopia.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.jooTopia.board.model.service.BoardService;
import com.kh.jooTopia.board.model.vo.Board;
import com.kh.jooTopia.member.model.vo.Member;

@WebServlet("/searchBoard.do")
public class SearchBoardContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public SearchBoardContentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int searchType = Integer.parseInt(request.getParameter("searchType"));
		String searchText = request.getParameter("searchText");
		Board board = new Board();
		
		
		Member loginUser = (Member) request.getSession().getAttribute("loginUser");
		
		board.setuNo(loginUser.getUno());
		board.setbType(Integer.parseInt(request.getParameter("btype")));
		
		System.out.println("board : "  + board);
		System.out.println("searchType : " + searchType);
		System.out.println("searchText : " + searchText);//
		
		ArrayList<Board> list = new BoardService().searchList(board,searchType,searchText);
		
		
		
		System.out.println("return list : " + list);
		PrintWriter out = response.getWriter();
		
		if(list != null) {
			response.setContentType("application/json");
			new Gson().toJson(list,response.getWriter());
		}
		
		out.flush();
		out.close();
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
