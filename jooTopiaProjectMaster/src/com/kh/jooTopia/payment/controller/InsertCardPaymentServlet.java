package com.kh.jooTopia.payment.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.order.model.vo.POrder;
import com.kh.jooTopia.payment.model.service.PaymentAdminService;
import com.kh.jooTopia.payment.model.vo.Payment;

@WebServlet("/cardPayment.do")
public class InsertCardPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertCardPaymentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("카드결제 내용 확인");
		
		//PAYMENT
		int productPrice = Integer.parseInt(request.getParameter("productPrice"));
		int deliveryPrice = Integer.parseInt(request.getParameter("deliveryPrice"));
		String paymentOption = request.getParameter("paymentOption");
		switch (paymentOption) {
		case "card" : paymentOption = "카드"; break;
		}
		String status = request.getParameter("status");
		switch (status) {
		case "paid" : status = "결제완료"; break;
		case "cancelled" : status = "결제취소"; break;
		case "failed" : status = "결제실패"; break;
		}
		String cardCompany = request.getParameter("cardCompany");
		String cardKind = request.getParameter("cardKind");
		int installment = Integer.parseInt(request.getParameter("installment"));
		int uno = Integer.parseInt(request.getParameter("uno"));
		String tId = request.getParameter("tId");
		
		Payment pym = new Payment();
		pym.setProductPrice(productPrice);
		pym.setDeliveryPrice(deliveryPrice);
		pym.setPaymentOption(paymentOption);
		pym.setStatus(status);
		pym.setCardCompany(cardCompany);
		pym.setCardKind(cardKind);
		pym.setInstallment(installment);
		pym.setUno(uno);
		pym.settId(tId);
		
		//PORDER
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String dMessage = request.getParameter("dMessage");
		
		POrder o = new POrder();
		o.setuNo(uno);
		o.setName(name);
		o.setPhone(phone);
		o.setAddress(address);
		o.setdMessage(dMessage);
		
		String pIdArr = request.getParameter("pIdArr");
		String[] pIds = pIdArr.split("\\|");
		ArrayList<Integer> pIdList = new ArrayList<Integer>();
		for(int i = 0; i < pIds.length; i++) {
			pIdList.add(Integer.parseInt(pIds[i]));
			System.out.println("pId : " + pIdList.get(i));
		}
		
		int result = new PaymentAdminService().insertCardPayment(pym, o, pIdList);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
