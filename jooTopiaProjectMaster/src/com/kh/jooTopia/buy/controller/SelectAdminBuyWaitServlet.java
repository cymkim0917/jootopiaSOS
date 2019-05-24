package com.kh.jooTopia.buy.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.buy.model.service.BuyWaitAdminService;
import com.kh.jooTopia.buy.model.vo.BuyWaitAdmin;

import com.kh.jooTopia.heap.model.vo.PageInfo;
 

@WebServlet("/selectAdminBuy.do")
public class SelectAdminBuyWaitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectAdminBuyWaitServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
/*	//--페이징 시작
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
			
			int listCount = new BuyWaitAdminService().getBuyWaitListCount();
			
			System.out.println(listCount);
			
			maxPage = (int)((double)listCount / limit + 0.9);
			
			startPage = (((int)((double)currentPage / limit + 0.9)) -1) *10 +1;
			
			endPage = startPage +10 -1;
			
			if(maxPage < endPage) {
				endPage = maxPage;
			}
			
			PageInfo pi = new PageInfo(currentPage, limit, maxPage, startPage, endPage);
			//--여기까지 페이징 처리
*/		
		ArrayList<BuyWaitAdmin> list = new BuyWaitAdminService().selectAdminList();
		// ArrayList<BuyWaitAdmin> list = new BuyWaitAdminService().selectBuyWaitAdminList(pi);
		String page = "";
		if(list != null) {
			page = "views/admin/storage/buyWait.jsp";
			request.setAttribute("list", list);
			// request.setAttribute("pi", pi);
		}else {
			page = "views/common/errorPage500.jsp";
			request.setAttribute("msg","실패");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
