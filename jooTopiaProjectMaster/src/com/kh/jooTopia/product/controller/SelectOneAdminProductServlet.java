package com.kh.jooTopia.product.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.product.model.service.ProductAdminService;

@WebServlet("/adminProductOne.do")
public class SelectOneAdminProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectOneAdminProductServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("실행");
		int pId = Integer.parseInt(request.getParameter("num"));
		
		HashMap<String, Object> hmap = new ProductAdminService().selectProductOne(pId);
		
		String view = ""; //초기화
		
		if(hmap != null) {
			System.out.println("조회성공");
			view = "views/admin/product/productDetail.jsp";
			request.setAttribute("hmap", hmap);
		}else {
			System.out.println("조회실패");
			view = "views/common/errorPage500.jsp";
			request.setAttribute("msg", "상품상세폼 조회 실패");
		}
		request.getRequestDispatcher(view).forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}