package com.kh.jooTopia.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.board.model.service.BoardService;
import com.kh.jooTopia.board.model.vo.Notice;

@WebServlet("/updateNotice.do")
public class UpdateNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public UpdateNoticeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Notice notice = new Notice();
		notice.setbTitle(request.getParameter("title"));
		System.out.println(request.getParameter("content"));
		notice.setbContent(request.getParameter("content"));
		notice.setbId(Integer.parseInt(request.getParameter("bid")));
		
		int result = new BoardService().updateNotice(notice);
		
		PrintWriter out = response.getWriter();

		if (result > 0) {
			System.out.println("업로드 성공");
			out.println("<script>alert('게시글 수정이 완료되었습니다.'</script>");
			response.sendRedirect(request.getContextPath()+"/selectOneNotice2.do?num="+notice.getbId());
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
