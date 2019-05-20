package com.kh.jooTopia.delivery.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.delivery.model.service.DeliveryAdminService;

@WebServlet("/adminInsertDelivery.do")
public class InsertAdminDeliveryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertAdminDeliveryServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("실행");
		
		String numArr = request.getParameter("numArr");
		String[] num = numArr.split("\\|");
		int poId[] = new int[num.length];

		for(int i = 0; i < num.length; i++) {
			poId[i] = Integer.parseInt(num[i]);
		}
		int result = new DeliveryAdminService().insertDelivery(poId);

		String msg = "";
		if(result > 0) {
			msg = "해당 상품을 배송준비중 처리했습니다.";
		}else {
			msg = "해당 상품 배송준비중 처리 실패";
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
