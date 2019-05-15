package com.kh.jooTopia.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.board.model.service.BoardService;
import com.kh.jooTopia.board.model.vo.Attachment;
import com.kh.jooTopia.board.model.vo.Board;

@WebServlet("/updateQaA.do")
public class UpdateQaAServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateQaAServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bid = Integer.parseInt(request.getParameter("num"));
		HashMap<String,Object> quesMap = new BoardService().selectQaAMap(bid);
		Board quesDetail = (Board)quesMap.get("board");
		ArrayList<Attachment> quesFile = (ArrayList<Attachment>) quesMap.get("attachment");
		
		String view = "";
		
		if(quesMap != null) {
			//System.out.println(quesMap);
			view = "views/member/updateQaAPage.jsp";
			request.setAttribute("quesDetail", quesDetail);
			request.setAttribute("quesFile", quesFile);
		}else {
			System.out.println("게시글 조회에 실패했습니당.");
		}
		request.getRequestDispatcher(view).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
