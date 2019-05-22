package com.kh.jooTopia.order.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.order.model.service.OrderAdminService;

@WebServlet("/selectCartOrderOne.do")
public class SelectAdminOrderCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectAdminOrderCartServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("실행!!");
		String pIdArr = request.getParameter("pIdArr");
		String[] pId = pIdArr.split("\\|");
		int orderPId[] = new int[pId.length];
		System.out.println(pIdArr);
		
		for(int i = 0; i < pId.length; i++) {
			orderPId[i] = Integer.parseInt(pId[i]);
			System.out.println(orderPId[i]);
		}
		
		ArrayList<HashMap<String, Object>> productList = new OrderAdminService().selectOrderProductList(orderPId);
		
		if(productList != null) {
			System.out.println("하는중~~~");
		}else {
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
