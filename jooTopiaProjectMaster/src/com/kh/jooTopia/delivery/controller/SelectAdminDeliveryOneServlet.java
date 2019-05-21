package com.kh.jooTopia.delivery.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.delivery.model.service.DeliveryAdminService;

@WebServlet("/selectAdminDelOne.do")
public class SelectAdminDeliveryOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectAdminDeliveryOneServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int dId = Integer.parseInt(request.getParameter("num"));
		
		HashMap<String, Object> hmap = new DeliveryAdminService().selectDeliveryOne(dId);
		
		String view = ""; //초기화
		
		if(hmap != null) {
			view = "views/admin/order/deliveryOne.jsp";
			request.setAttribute("hmap", hmap);
		}else {
			view = "views/common/errorPage500.jsp";
			request.setAttribute("msg", "배송중 상세보기 조회 실패");
		}
		request.getRequestDispatcher(view).forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
