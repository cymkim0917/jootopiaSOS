package com.kh.jooTopia.order.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.order.model.service.OrderAdminService;

@WebServlet("/adminPaymentOne.do")
public class SelectAdminPaymentOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectAdminPaymentOneServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int poId = Integer.parseInt(request.getParameter("num"));
		
		HashMap<String, Object> hmap = new OrderAdminService().selectPaymentOne(poId);
		
		String view = ""; //초기화
		
		if(hmap != null) {
			view = "views/admin/order/paymentOne.jsp";
			request.setAttribute("hmap", hmap);
		}else {
			view = "views/common/errorPage500.jsp";
			request.setAttribute("msg", "입금전 상세보기 조회 실패");
		}
		request.getRequestDispatcher(view).forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
