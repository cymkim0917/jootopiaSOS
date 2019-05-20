package com.kh.jooTopia.product.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.product.model.service.ProductService;

@WebServlet("/detailProduct.do")
public class SelectOneProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectOneProductServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pid = Integer.parseInt(request.getParameter("num"));
		HashMap<String, Object> detailProc = new ProductService().detailProduct(pid);
		
		System.out.println(detailProc);
		
		if(detailProc != null) {
			request.setAttribute("detailProc", detailProc);
			request.getRequestDispatcher("views/notice/productListPlus.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
