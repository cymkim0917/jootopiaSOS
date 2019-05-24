package com.kh.jooTopia.payment.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.order.model.vo.POrder;
import com.kh.jooTopia.payment.model.service.PaymentService;
import com.kh.jooTopia.payment.model.vo.Payment;
import com.kh.jooTopia.product.model.service.ProductAdminService;

@WebServlet("/insertAccountPayment.do")
public class InsertAccountPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertAccountPaymentServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//계좌이체 PAYMENT INSERT + PORDER INSERT
		int productPrice = Integer.parseInt(request.getParameter("productPrice"));
		int deliveryPrice = Integer.parseInt(request.getParameter("deliveryPrice"));
		int uno = Integer.parseInt(request.getParameter("uno"));
		String depositName = request.getParameter("depositName");
		
		Payment pym = new Payment();
		pym.setProductPrice(productPrice);
		pym.setDeliveryPrice(deliveryPrice);
		pym.setUno(uno);
		pym.setDepositName(depositName);
	
		//PORDER INSERT용
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String dMessage = request.getParameter("dMessage");
		
		POrder o = new POrder();
		o.setName(name);
		o.setPhone(phone);
		o.setAddress(address);
		o.setdMessage(dMessage);
		o.setuNo(uno);
		
		int poId = new PaymentService().insertAccountPayment(pym, o);
		int result1 = 0;
		int result2 = 0;
		
		if(poId > 0) {
			//PYMID 조회에 성공하면 ORDER_DETAIL INSERT 실행
			System.out.println("ORDER_DETAIL INSERT 실행");
			String pIdArr = request.getParameter("pIdArr");
			System.out.println("pIdArr : " + pIdArr);
			String[] pIds = pIdArr.split("\\|");
			ArrayList<Integer> pId = new ArrayList<Integer>();
			for(int i = 0; i < pIds.length; i++) {
				pId.add(Integer.parseInt(pIds[i]));
			}
			result1 = new PaymentService().insertOrderDetail(poId, pId);
			
			if(result1 > 0) {
				//주문에 성공하면 상품 상태를 '판매중'에서 '판매중지'로 변경한다.
				result2 += new ProductAdminService().changeStatusProduct("판매중지", pId);
			}
			
			String view = "";
			if(result2 > 0 && result2 == pId.size()) {
				System.out.println("주문 성공!!!!!!!!");
				//연결을 어디로...?
				view = "views/member/orderListPage.jsp";
				/*request.setAttribute("list", list);
				request.setAttribute("pageInfo", pageInfo);*/
			}else {
				System.out.println("주문 실패!!!!!!!!");
				view = "views/common/errorPage500.jsp";
				request.setAttribute("msg", "주문결제 실패");
			}
			request.getRequestDispatcher(view).forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
