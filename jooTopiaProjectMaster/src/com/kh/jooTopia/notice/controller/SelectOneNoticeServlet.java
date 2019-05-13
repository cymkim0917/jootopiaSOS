package com.kh.jooTopia.notice.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.notice.model.service.NoticeService;
import com.kh.jooTopia.notice.model.vo.Notice;

/**
 * Servlet implementation class SelectOneNoticeServlet
 */
@WebServlet("/SelectOne.do")
public class SelectOneNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		Notice n = new NoticeService().selectOne(num);
		
		String page="";
		if(n != null) {
			page="views/notice/noticeListPlus";
			request.setAttribute("n", n);
			
		}else {
			page="views/common/errorPage500";
			request.setAttribute("msg", "게시글 상세 보기 실패");
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
