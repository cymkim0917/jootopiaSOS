package com.kh.jooTopia.order.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.order.model.service.OrderAdminService;
import com.kh.jooTopia.order.model.vo.POrder;

@WebServlet("/selectAdminTotalOrder.do")
public class SelectTotalOrderAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectTotalOrderAdminServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<POrder> list = new OrderAdminService().selectAdminTotalOrder();

		String view = "";
		if(list != null) {
			view = "views/admin/order/orderMain.jsp";
			request.setAttribute("list", list);
		}else {
			view = "views/common/errorPage500.jsp";
			request.setAttribute("msg", "상품목록 리스트 조회 실패");
		}
		request.getRequestDispatcher(view).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}