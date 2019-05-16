package com.kh.jooTopia.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.kh.jooTopia.board.model.service.BoardService;
import com.kh.jooTopia.board.model.vo.Board;
import com.kh.jooTopia.board.model.vo.Notice;
import com.kh.jooTopia.board.model.vo.PageInfo;

/**
 * Servlet implementation class SelectNoticeListServlet
 */
@WebServlet("/selectList.do")
public class SelectNoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectNoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		/*ArrayList<Notice> list = new BoardService().selectList();*/
		HashMap<String, Object> hmap = new BoardService().selectList();
		//hmap 안에는 ArrayList<Notice> nList랑 ArrayList<Member> mList가 들어있다.
		
		/*System.out.println("list : " + list);
		System.out.println(list);*/
		
		String page = "";
		
		if(hmap != null) {
			page="views/notice/noticeList.jsp";
			request.setAttribute("hmap", hmap);
			
		}else {
			page="views/common/errorPage500.jsp";
			request.setAttribute("msg", "공지사항 조회 실패");
		}
		
		
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		
		view.forward(request, response);
		
		System.out.println("request : " + request );
		System.out.println("response : "  + response);
	
	}
	
	/*		int currentPage;
		int limit;		
		int maxPage; 	
		int startPage;	
		int endPage;
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		
		limit = 10;
		
		int listCount = new NoticeService().getNoticeListCount();
		
		maxPage = (int)((double)listCount / limit+0.9);
		
		startPage = (((int)((double)currentPage/limit+0.9))-1);
		
		endPage = startPage +10 -1;
		if(maxPage<endPage) {
			endPage=maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(currentPage, limit, maxPage, startPage, endPage);
		
		
		
		
		
		System.out.println("pageInfo : " + pageInfo);
		
		System.out.println("request : " + request);
	 */

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
