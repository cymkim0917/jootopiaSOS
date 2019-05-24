package com.kh.jooTopia.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.jooTopia.board.model.vo.PageInfo;
import com.kh.jooTopia.product.model.service.CategoryService;
import com.kh.jooTopia.product.model.service.ProductService;

@WebServlet("/orderByProduct.do")
public class SortProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SortProductServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int orderType = Integer.parseInt(request.getParameter("orderType"));
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
		ArrayList<HashMap<String, Object>> list = new CategoryService().sortProductList(cid,pi,orderType);
		
		HashMap<String,Object> resultList = new HashMap<String,Object>();
		
		System.out.println(list);
		System.out.println(pi);
		
		if(list != null) {
			resultList.put("procList", list);
			resultList.put("pi", pi);
			resultList.put("cid",cid);
			request.setAttribute("resultList", resultList);
			System.out.println(resultList);
			response.setContentType("application/json");
			new Gson().toJson(resultList,response.getWriter());			
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
