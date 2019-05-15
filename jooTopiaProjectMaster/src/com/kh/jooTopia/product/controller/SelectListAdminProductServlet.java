package com.kh.jooTopia.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.product.model.service.ProductAdminService;

@WebServlet("/adminProductList.do")
public class SelectListAdminProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectListAdminProductServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//판매미등록, 판매중 상품 전체조회
		ArrayList<HashMap<String,Object>> list = new ProductAdminService().selectList();
		
		String view = "";
		if(list != null) {
			view = "views/admin/product/productList.jsp";
			request.setAttribute("list", list);
		}else {
			view = "views/common/errorPage500.jsp";
			request.setAttribute("msg", "상품목록 리스트 조회 실패");
		}
		request.getRequestDispatcher(view).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}