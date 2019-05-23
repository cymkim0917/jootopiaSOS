package com.kh.jooTopia.purchase.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/requestForm.do")
public class PurchaseRequestFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PurchaseRequestFormServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("서블릿 안전 실행!");
		String post = request.getParameter("post");
		String address = request.getParameter("address");
		double distance = Double.parseDouble(request.getParameter("distance"));
		int dPrice = Integer.parseInt(request.getParameter("dPrice")); 
		
		request.setAttribute("post", post);
		request.setAttribute("address", address);
		request.setAttribute("dPrice", dPrice);
		request.setAttribute("distance", distance);
		request.getRequestDispatcher("/views/purchase/purchaseRequestForm.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
