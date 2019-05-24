package com.kh.jooTopia.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.product.model.service.CategoryService;
import com.kh.jooTopia.product.model.service.ProductService;
import com.kh.jooTopia.product.model.vo.Product;
import com.kh.jooTopia.board.model.vo.PageInfo;

@WebServlet("/productList.do")
public class MainProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MainProductListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int cid = Integer.parseInt(request.getParameter("cid"));
		

		int currentPage;
		int limit;
		int maxPage;
		int startPage;
		int endPage;

		currentPage = 1;

		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));

		}

		limit = 9;

		int listCount = new CategoryService().getListCount(cid);

		System.out.println(listCount);

		maxPage = (int) ((double) listCount / limit + 0.9);

		startPage = (currentPage -1) * limit + 1;

		endPage = startPage + limit - 1;

	

		PageInfo pi = new PageInfo(currentPage, limit, maxPage, startPage, endPage);
		
		ArrayList<HashMap<String, Object>> list = new CategoryService().selectProductList(cid,pi);
		
		System.out.println(list);
		System.out.println(pi);
		
		if(list != null) {
			request.setAttribute("procList", list);
			request.setAttribute("pi", pi);
			request.setAttribute("cid", cid);
			request.getRequestDispatcher("views/member/userProductList.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
