package com.kh.jooTopia.notice.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.notice.model.service.NoticeService;
import com.kh.jooTopia.notice.model.vo.Notice;

/**
 * Servlet implementation class SelectNoticeListServlet
 */
@WebServlet("/selectList.do")
public class selectNoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public selectNoticeListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ArrayList<Notice> list = new NoticeService().selectList();
		
		System.out.println(list);
		
		String page = "";
		
		if(list != null) {
			page="views/notice/noticeList.jsp";
			request.setAttribute("list", list);
		}else {
			page="views/common/errorPage500.jsp";
			request.setAttribute("msg", "공지사항 조회 실패");
		}
		
		RequestDispatcher view = request.getRequestDispatcher(page);
		
		view.forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
