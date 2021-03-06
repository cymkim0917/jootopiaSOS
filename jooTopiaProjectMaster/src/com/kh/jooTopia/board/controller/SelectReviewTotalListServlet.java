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

@WebServlet("/selectReviewTotalList.do")
public class SelectReviewTotalListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectReviewTotalListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		ArrayList<HashMap<String, Object>> list = new BoardService().selectReviewTotalList();	
		
		System.out.println("servlet list : " + list);
		String page="";
		if(list != null) {
			page="views/board/reviewList.jsp";
			request.setAttribute("list", list);
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "리스트 조회 실패!");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
