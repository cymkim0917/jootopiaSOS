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

import com.google.gson.Gson;
import com.kh.jooTopia.order.model.service.OrderAdminService;

@WebServlet("/selectCartOrderOne.do")
public class SelectAdminOrderCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectAdminOrderCartServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("실행!!");
		String pIdArr = request.getParameter("pId");
		String[] pId = pIdArr.split(" ");
		int orderPId[] = new int[pId.length];
		System.out.println("pIdArr : " + pIdArr);
		
		for(int i = 0; i < pId.length; i++) {
			orderPId[i] = Integer.parseInt(pId[i]);
			System.out.println("주문할 PID : " + i + " dd " + orderPId[i]);
		}
		
		ArrayList<HashMap<String, Object>> productList = new OrderAdminService().selectOrderProductList(orderPId);
		
		System.out.println("productList size : " + productList.size());
		
		String view = "";
		if(productList != null) {
			view = "views/member/orderInsertPage.jsp";
			request.setAttribute("productList", productList);
		}else {
			view = "views/common/errorPage500.jsp";
			request.setAttribute("msg", "주문 실패");
		}
		request.getRequestDispatcher(view).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
