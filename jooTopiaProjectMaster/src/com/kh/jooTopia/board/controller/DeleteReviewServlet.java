package com.kh.jooTopia.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.board.model.service.BoardService;
import com.kh.jooTopia.member.model.vo.Member;

@WebServlet("/deleteReview.do")
public class DeleteReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteReviewServlet() {
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member member =(Member) request.getSession().getAttribute("loginUser");
		int bid = Integer.parseInt(request.getParameter("bno"));
		System.out.println(member.getUno());
		int result  = 0;
		if(member!=null) {
			System.out.println("loginUSer not null");
			int uno = member.getUno();
			result = new BoardService().deleteReview(bid,uno);
		}
		
		
		PrintWriter out = response.getWriter();
		if(result > 0) {
			out.println("<script>alert('게시글 삭제가 완료되었습니다.');location.href='" + request.getContextPath()  + "/selectReviewTotalList.do'</script>");
		}else {
			out.println("<script>alert('게시글 삭제에 실패했습니다.');location.href='" + request.getContextPath()  + "/selectReviewTotalList.do'</script>");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
