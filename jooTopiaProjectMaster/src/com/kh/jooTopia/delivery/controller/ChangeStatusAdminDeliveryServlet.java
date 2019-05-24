package com.kh.jooTopia.delivery.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.delivery.model.service.DeliveryAdminService;
import com.kh.jooTopia.order.model.service.OrderAdminService;

@WebServlet("/changeDeliveryStatus.do")
public class ChangeStatusAdminDeliveryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChangeStatusAdminDeliveryServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String numArr = request.getParameter("numArr");
		String[] num = numArr.split("\\|");
		ArrayList<Integer> dId = new ArrayList<Integer>();

		for(int i = 0; i < num.length; i++) {
			dId.add(Integer.parseInt(num[i]));
		}
		
		int result = 0;
		
		String status = "배송완료";
		
		int result1 = new DeliveryAdminService().changeStatusDelivery(status, dId);
		int result2 = 0;
		
		if(result1 > 0) {
			if(result1 == dId.size()) {
				
				String pStatus = "판매완료";
				result2 = new DeliveryAdminService().changeStatusProduct(pStatus, dId);
				if(result2 > 0) {
					result = 1;
				}
			}
		}
		
		String msg = "";
		if(result > 0) {
			msg = "해당 상품을 배송완료 처리했습니다.";
		}else {
			msg = "해당 상품 배송완료 처리 실패";
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
