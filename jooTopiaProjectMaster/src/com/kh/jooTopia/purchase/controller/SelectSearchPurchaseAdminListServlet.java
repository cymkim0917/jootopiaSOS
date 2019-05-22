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

@WebServlet("/selectSearchPCList.do")
public class SelectSearchPurchaseAdminListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectSearchPurchaseAdminListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchType = request.getParameter("searchType");
		String searchVal = request.getParameter("searchVal");
		String dateVal = request.getParameter("dateVal");
		// String purchaseStatus = request.getParameter("purchaseStatus");
		String searchQuery = "";
		System.out.println();
		System.out.println();
		System.out.println("dateval : " + dateVal);
		
		String date = dateVal;
		
		System.out.println("searchType : " + searchType);
		System.out.println("searchVal : " + searchVal);

		
		if(searchType != null && searchVal != null && !searchVal.equals("")) {
			if(searchType.equals("memberNo")) {
				searchQuery += "M.UNO LIKE '%" + Integer.parseInt(searchVal) + "%'";
			}else if(searchType.equals("pcName")) {
				searchQuery += "APPLICANT LIKE '%" + searchVal + "%'";
			}else if(searchType.equals("phone")) {
				searchQuery += "APPLICANT_PHONE LIKE '%" + searchVal + "%'";
			}else if(searchType.equals("category")) {
				searchQuery += "C.NAME LIKE '%" +  searchVal + "%' OR C.CGROUP LIKE '%" + searchVal + "%'" ;
			}
		}
		
		if(date != null && !date.equals("") && !date.equals("no")) {
			date = date.substring(1, dateVal.length() - 1);
			if(!searchQuery.equals("")) {
				searchQuery += " AND ";
			}
			searchQuery += "BDATE > TO_DATE('" + date + "', 'YYYY-MM-DD')";
		}
		
		System.out.println("QUERY : " + searchQuery);
		
		//------------------------------------------------------------------------------------------------------------------
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
		
		PageInfo pi = new PageInfo(currentPage, limit, maxPage, startPage, endPage);
		
		// list 조회
		ArrayList<HashMap<String, Object>> list;
		// list = new PurchaseAdminService().selectList();
		if(searchQuery.equals("")) {
			list = new PurchaseAdminService().selectPagingList(pi);
		}else {
			list = new PurchaseAdminService().selectSearchList(pi, searchQuery);
		}
		
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
