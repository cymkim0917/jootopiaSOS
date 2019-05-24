package com.kh.jooTopia.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.board.model.service.BoardService;
import com.kh.jooTopia.board.model.vo.Board;
import com.kh.jooTopia.member.model.vo.Member;

@WebServlet("/selectBoardList.do")
public class SelectBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectBoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member member = (Member)request.getSession().getAttribute("loginUser");
		int uno = member.getUno();
		ArrayList<Board> list = new BoardService().selectBoardList(uno);
		
		System.out.println(list);
		//
		PrintWriter out = response.getWriter();
		String view = "";
		
		
		if(list != null) {
			request.setAttribute("list", list);
			view = "views/member/boardListPage.jsp";
		}else {

			out.println("<script>alert('게시글  조회에 실패했습니다.');</script>");	
		}
		
		request.getRequestDispatcher(view).forward(request,response);
		
		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
