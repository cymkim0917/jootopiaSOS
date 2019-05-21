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

/**
 * Servlet implementation class SelectOneReviewServlet
 */
@WebServlet("/selectOneReview.do")
public class SelectOneReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		HashMap<String, Object> hmap = new BoardService().reviewReadPage(num);
		//HashMap<Board, ArrayList<Attachment>> hmap = new BoardService().selectOneThumbnail(num);
		
		Board b = (Board) hmap.get("board");
		ArrayList<Attachment> fileList = (ArrayList<Attachment>) hmap.get("attachment");
		
		String page="";
		if(hmap != null) {
			page="views/reviewReadPage.jsp";
			request.setAttribute("b", b);
			request.setAttribute("fileList", fileList);
		}else {
			page="views/common/errorPage.jsp";
			request.setAttribute("msg", "사진게시판 상세보기 실패!");
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
