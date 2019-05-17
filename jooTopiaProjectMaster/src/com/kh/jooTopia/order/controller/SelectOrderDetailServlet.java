package com.kh.jooTopia.order.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.member.model.vo.Member;
import com.kh.jooTopia.order.model.service.OrderService;
import com.kh.jooTopia.order.model.vo.Order;

@WebServlet("/selectOrder.do")
public class SelectOrderDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectOrderDetailServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int poid = Integer.parseInt(request.getParameter("num"));
		Member member = (Member)request.getSession().getAttribute("loginUser");
		int uno = member.getUno();
		
		Order order = new OrderService().orderDetail(poid,uno);
		
		System.out.println(order);
		
		if(order != null) {
			request.setAttribute("order", order);
			request.getRequestDispatcher("views/member/detailOrderPage.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
