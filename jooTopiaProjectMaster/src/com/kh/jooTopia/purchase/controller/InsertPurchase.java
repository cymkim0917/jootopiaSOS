package com.kh.jooTopia.purchase.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.board.model.vo.Board;
import com.kh.jooTopia.purchase.model.service.PurchaseService;
import com.kh.jooTopia.purchase.model.vo.Purchase;

@WebServlet("/insertPurchase.do")
public class InsertPurchase extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertPurchase() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String majorKind = request.getParameter("majorKind");
		String subKind = request.getParameter("subKind");
		String brand = request.getParameter("brand");
		String model = request.getParameter("model");
		String usePeriod = request.getParameter("usePeriod");
		String primePrice = request.getParameter("primePrice");
		String hopePrice = request.getParameter("hopePrice");
		String content = request.getParameter("content");
		String memo = request.getParameter("memo");
		
		// category 검색해오기
		
		
		Board b = new Board();
		b.setbContent(content);
		
		Purchase p = new Purchase();
		// int result = new PurchaseService().insertPurchase(b, p);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
