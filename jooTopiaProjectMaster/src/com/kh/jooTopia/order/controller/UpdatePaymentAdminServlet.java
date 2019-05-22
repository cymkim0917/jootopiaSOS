package com.kh.jooTopia.order.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.order.model.service.OrderAdminService;

@WebServlet("/updatePayment.do")
public class UpdatePaymentAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdatePaymentAdminServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int poId = Integer.parseInt(request.getParameter("poId"));
		/*String depositName = request.getParameter("depositName");*/
		
		int result = 0;
		int result1 = new OrderAdminService().updatePayment(poId);
		int result2 = 0;
		
		if(result1 > 0) {
			int[] poIds = {poId}; 
			result2 = new OrderAdminService().changeStatusOrder("상품준비중", poIds);
			if(result2 > 0) {
				result = 1;
			}
		}
		
		System.out.println("업데이트 페이먼트 : " + result);

		String msg = "";
		if(result > 0) {
			msg = "입금처리 완료";
		}else {
			msg = "입금처리 실패";
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
