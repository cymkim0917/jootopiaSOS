package com.kh.jooTopia.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.board.model.service.BoardService;
import com.kh.jooTopia.board.model.vo.Board;

/**
 * Servlet implementation class SelectFaqCategoryListPlus
 */
@WebServlet("/selectFaqCList.do")
public class SelectOneFaqCategoryListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneFaqCategoryListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int num = Integer.parseInt(request.getParameter("num"));
		//String fCategory = request.getParameter("fCategory");
		
		System.out.println("num : " +num);
		//System.out.println("fCategory : " +fCategory);
		
		Board b = new BoardService().selectOneFaqCategoryList(num);
		//Board b = new BoardService().selectOneFaqCategoryList(fCategory);
		
		System.out.println("b in selectOneFaqCategoryListServlet : " + b);
		
		String page="";
		
		if(b != null) {
			System.out.println("조회성공");
			page="views/notice/selectOneFaqCategoryList.jsp";
			request.setAttribute("b", b);
			
		}else {
			System.out.println("조회실패");
			page="views/common/errorPage500.jsp";
			request.setAttribute("msg", "게시글 상세 보기 실패");
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
