package com.kh.jooTopia.payment.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.payment.model.service.PaymentAdminService;

@WebServlet("/insertAdminRefund.do")
public class InsertAdminRefundServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertAdminRefundServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String numArr = request.getParameter("numArr");
		String[] num = numArr.split("\\|");
		ArrayList<Integer> pymCId = new ArrayList<Integer>();
		String priceArr = request.getParameter("price");
		String[] price = priceArr.split("\\|");
		ArrayList<Integer> rfPrice = new ArrayList<Integer>();

		for(int i = 0; i < num.length; i++) {
			pymCId.add(Integer.parseInt(num[i]));
			rfPrice.add(Integer.parseInt(price[i]));
			System.out.println(pymCId.get(i));
			System.out.println(rfPrice.get(i));
		}
		
		int result = new PaymentAdminService().insertRefund(pymCId, rfPrice);
		
		String msg = "";
		if(result > 0) {
			msg = "해당 주문을 환불처리했습니다.";
		}else {
			msg = "해당 상품 환불처리 실패";
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
