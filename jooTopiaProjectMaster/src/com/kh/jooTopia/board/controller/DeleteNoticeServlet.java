package com.kh.jooTopia.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.board.model.service.BoardService;

@WebServlet("/deleteNotice.do")

public class DeleteNoticeServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
    public DeleteNoticeServlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bid = Integer.parseInt(request.getParameter("bid"));
		System.out.println("del : bid : " + bid);
		
		int result = new BoardService().deleteNotice(bid);
		
		PrintWriter out = response.getWriter();
		if(result > 0) {
			out.println("<script>alert('게시글 삭제가 완료되었습니다.');location.href='" + request.getContextPath()  + "/selectList.do'</script>");
		}else {
			out.println("<script>alert('게시글 삭제가 완료되었습니다.');location.href='" + request.getContextPath()  + "/selectList.do'</script>");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
