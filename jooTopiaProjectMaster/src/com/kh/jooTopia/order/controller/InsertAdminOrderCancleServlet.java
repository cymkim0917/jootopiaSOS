package com.kh.jooTopia.order.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.order.model.service.OrderAdminService;
import com.kh.jooTopia.order.model.vo.OrderCancle;

@WebServlet("/insertAdminOrderCancle.do")
public class InsertAdminOrderCancleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertAdminOrderCancleServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int poId = Integer.parseInt(request.getParameter("poId"));
		String reason = request.getParameter("reason");
		
		OrderCancle oc = new OrderCancle();
		oc.setPoId(poId);
		oc.setReason(reason);
		
		int result = new OrderAdminService().adminOrderCancle(oc);
		
		String msg = "";
		if(result > 0) {
			msg = "해당 주문을 주문취소 처리했습니다.";
		}else {
			msg = "해당 상품 주문취소 처리 실패";
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
