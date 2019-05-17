package com.kh.jooTopia.order.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.order.model.service.OrderAdminService;
import com.kh.jooTopia.product.model.service.ProductAdminService;

@WebServlet("/adminChangeStatusOrder.do")
public class ChangeStatusAdminOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChangeStatusAdminOrderServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String numArr = request.getParameter("numArr");
		String[] num = numArr.split("\\|");
		int poId[] = new int[num.length];
		
		for(int i = 0; i < num.length; i++) {
			poId[i] = Integer.parseInt(num[i]);
		}
		int result = 0;
		String status = "";
		String text = request.getParameter("text");
		switch (text) {
		case "주문취소" : status = "주문취소"; break;
		case "입금완료" : status = "상품준비중"; break;
		}
		
		result = new OrderAdminService().changeStatusOrder(status, poId);
		
		String msg = "";
		if(result > 0) {
			msg = "해당 상품을 " + text + " 처리했습니다.";
		}else {
			msg = "해당 상품 " + text + "처리 실패";
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
