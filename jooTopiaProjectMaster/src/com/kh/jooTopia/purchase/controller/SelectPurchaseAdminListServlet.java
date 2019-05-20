package com.kh.jooTopia.purchase.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.board.model.vo.PageInfo;
import com.kh.jooTopia.purchase.model.service.PurchaseAdminService;
import com.kh.jooTopia.purchase.model.service.PurchaseService;

@WebServlet("/selectPurchaseAdminList.do")
public class SelectPurchaseAdminListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectPurchaseAdminListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 페이징 처리 
		int currentPage = 1;
		int limit;
		int maxPage;
		int startPage;
		int endPage;
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		// 한 페이지에 노출할 리스트 갯수
		limit = 10;
		
		// 전체 게시물 갯수
		int listCount = new PurchaseService().getListCount();
		
		if(listCount < 0) {
			System.out.println("listCount : " + listCount);
			request.setAttribute("msg", "리스트 갯수 조회 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
		maxPage = (int)((double)listCount / limit + (1 - ((double)1 / limit)));
		
		// startPage = (int)((currentPage) / limit) * limit + 1;
		startPage = (((int)((double) currentPage / limit + 0.9)) - 1) * 10 + 1;
		
		// endPage = ((int)(currentPage / limit) + 1) * limit;
		endPage = startPage + limit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		System.out.println("currentPage : " + currentPage);
		System.out.println("maxPage : " + maxPage);
		System.out.println("startPage : " + startPage);
		System.out.println("endPage : " + endPage);
		
		PageInfo pi = new PageInfo(currentPage, limit, maxPage, startPage, endPage);
		
		// list 조회
		ArrayList<HashMap<String, Object>> list;
		// list = new PurchaseAdminService().selectList();
		list = new PurchaseAdminService().selectPagingList(pi);
		
		if(list != null) {
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			request.getRequestDispatcher("views/admin/purchase/purchaseList.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "매입신청 리스트 조회 실패!");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}





