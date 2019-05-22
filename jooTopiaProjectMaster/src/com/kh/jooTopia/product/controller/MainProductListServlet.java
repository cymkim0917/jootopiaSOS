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
import com.kh.jooTopia.product.model.vo.Product;

@WebServlet("/productList.do")
public class MainProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MainProductListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int cid = Integer.parseInt(request.getParameter("cid"));
		ArrayList<HashMap<String, Object>> list = new CategoryService().selectProductList(cid);
		
		System.out.println(list);
		
		if(list != null) {
			request.setAttribute("procList", list);
			request.getRequestDispatcher("views/member/userProductList.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
