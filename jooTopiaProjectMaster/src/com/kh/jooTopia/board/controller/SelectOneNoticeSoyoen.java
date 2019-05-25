package com.kh.jooTopia.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.board.model.service.BoardService;
import com.kh.jooTopia.board.model.vo.Notice;

/**
 * Servlet implementation class SelectOneNoticeSoyoen
 */
@WebServlet("/selectOneNotice2.do")
public class SelectOneNoticeSoyoen extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectOneNoticeSoyoen() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		
		Notice notice = new BoardService().selectOneNotice(num);
		
		if(notice!=null ) {
			request.setAttribute("n", notice);
			request.getRequestDispatcher("views/notice/noticeListPlus.jsp").forward(request, response);
		}else {
			response.sendRedirect(request.getContextPath()+"/selectList.do");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
