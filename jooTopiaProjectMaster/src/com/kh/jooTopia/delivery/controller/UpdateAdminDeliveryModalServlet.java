package com.kh.jooTopia.delivery.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.delivery.model.service.DeliveryAdminService;
import com.kh.jooTopia.delivery.model.vo.Delivery;
import com.kh.jooTopia.order.model.vo.POrder;

@WebServlet("/updateAdminDeliveryModal.do")
public class UpdateAdminDeliveryModalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateAdminDeliveryModalServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int poId = Integer.parseInt(request.getParameter("poId"));
		
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String dMessage = request.getParameter("dMessage");
		Date startDate = Date.valueOf(request.getParameter("startDate"));
		
		System.out.println(poId);
		System.out.println(name);
		System.out.println(phone);
		System.out.println(address);
		System.out.println(dMessage);
		System.out.println(startDate);
		
		POrder modiOrder = new POrder();
		modiOrder.setPoId(poId);
		modiOrder.setName(name);
		modiOrder.setPhone(phone);
		modiOrder.setAddress(address);
		modiOrder.setdMessage(dMessage);
		
		Delivery modiDelivery = new Delivery();
		modiDelivery.setStartDate(startDate);
		modiDelivery.setStatus("배송중");
		
		int result = new DeliveryAdminService().updateAdminDeliveryModal(modiOrder, modiDelivery);
		
		String msg = "";
		if(result > 1) {
			msg += "배송정보 변경 성공";
		}else {
			msg += "배송정보 변경 실패";
		}
		
		PrintWriter out = response.getWriter();
		out.println(msg);
		out.flush();
		out.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
