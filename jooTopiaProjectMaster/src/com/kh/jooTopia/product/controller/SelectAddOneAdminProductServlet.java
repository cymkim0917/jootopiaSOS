package com.kh.jooTopia.product.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.product.model.service.ProductAdminService;

@WebServlet("/adminAddProductOne.do")
public class SelectAddOneAdminProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectAddOneAdminProductServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pId = Integer.parseInt(request.getParameter("num"));
		
		HashMap<String, Object> hmap = new ProductAdminService().selectAddProductOne(pId);
		
		String view = ""; //초기화
		
		if(hmap != null) {
			view = "views/admin/product/productInsertForm.jsp";
			request.setAttribute("hmap", hmap);
		}else {
			view = "views/common/errorPage500.jsp";
			request.setAttribute("msg", "상품등록 상세폼 조회 실패");
		}
		request.getRequestDispatcher(view).forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
