package com.kh.jooTopia.release.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.heap.model.vo.PageInfo;
import com.kh.jooTopia.release.model.service.ReleaseAdminService;
import com.kh.jooTopia.release.model.vo.ReleaseAdmin;
import com.kh.jooTopia.stock.model.service.StockAdminService;


/**
 * Servlet implementation class SelectAdminReleaseListServlet
 */
@WebServlet("/selectAdminReleaseList.do")
public class SelectAdminReleaseListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAdminReleaseListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//--페이징 시작
		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		currentPage = 1;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		limit = 10;
		
		int listCount = new ReleaseAdminService().getListCount();
		
		System.out.println(listCount);
		
		maxPage = (int)((double)listCount / limit + 0.9);
		
		startPage = (((int)((double)currentPage / limit + 0.9)) -1) *10 +1;
		
		endPage = startPage +10 -1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, limit, maxPage, startPage, endPage);
		//페이징처리
		
		//ArrayList<ReleaseAdmin> rlist = new ReleaseAdminService().selectAdminReleaseList();
		ArrayList<ReleaseAdmin> rlist = new ReleaseAdminService().selectAdminReleaseList(pi);
		System.out.println(rlist);
		System.out.println(pi);
		
		String page = "";
		if(rlist != null) {
			page = "views/admin/storage/releaseList.jsp";
			request.setAttribute("rlist", rlist);
			request.setAttribute("pi", pi);
		}else {
			page = "views/common/errorPage500.jsp";
			request.setAttribute("msg","실패");
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
