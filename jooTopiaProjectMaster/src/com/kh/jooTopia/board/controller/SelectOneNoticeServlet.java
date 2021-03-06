package com.kh.jooTopia.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.board.model.service.BoardService;
import com.kh.jooTopia.board.model.vo.Notice;

@WebServlet("/selectNoticeOne.do")
public class SelectOneNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectOneNoticeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println("selectOneNotice : " + num);
		System.out.println("서블릿 실행");
		Notice n = new BoardService().selectOne(num);
		System.out.println("노티스 확인! " + n);
		
		String page="";
		if(n != null) {
			System.out.println("조회성공");
			page="views/notice/noticeListPlus.jsp";
			request.setAttribute("n", n);
			
		}else {
			System.out.println("조회실패");
			page="views/common/errorPage500.jsp";
			request.setAttribute("msg", "게시글 상세 보기 실패");
		}
		
		
		request.getRequestDispatcher(page).forward(request, response);
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
