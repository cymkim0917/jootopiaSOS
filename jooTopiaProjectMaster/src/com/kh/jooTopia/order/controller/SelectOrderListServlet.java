package com.kh.jooTopia.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.member.model.vo.Member;
import com.kh.jooTopia.order.model.service.OrderService;
import com.kh.jooTopia.order.model.vo.Order;

@WebServlet("/orderList.do")
public class SelectOrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectOrderListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member member = (Member)request.getSession().getAttribute("loginUser");
		int uno = member.getUno();
		System.out.println("uno : " + uno);
		
		ArrayList<Order> list = new OrderService().selectOrderList(uno);
		
		System.out.println(list);
		
		if(list != null) {
			request.setAttribute("orderList", list);
			request.getRequestDispatcher("views/member/orderListPage.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
