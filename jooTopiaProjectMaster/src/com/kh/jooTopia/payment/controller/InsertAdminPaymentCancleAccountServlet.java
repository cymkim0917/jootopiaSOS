package com.kh.jooTopia.payment.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.payment.model.service.PaymentAdminService;

@WebServlet("/insertPaymentCancleAcc.do")
public class InsertAdminPaymentCancleAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertAdminPaymentCancleAccountServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//계좌이체 건 결제취소
		int pymId = Integer.parseInt(request.getParameter("num"));
		
		int result = new PaymentAdminService().updatePaymentStatus(pymId);
		
		if(result > 0) {
			ServletContext context = this.getServletContext(); 
			RequestDispatcher dispatcher = context.getRequestDispatcher("/selectAdminPreList.do"); 
			dispatcher.forward(request, response); 
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
