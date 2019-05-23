package com.kh.jooTopia.delivery.controller;

import java.io.IOException;
import java.io.PrintWriter;

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
		
		System.out.println("배송상태 변경 서블릿");
		
		String numArr = request.getParameter("numArr");
		String[] num = numArr.split("\\|");
		int dId[] = new int[num.length];

		for(int i = 0; i < num.length; i++) {
			dId[i] = Integer.parseInt(num[i]);
		}
		
		int result = 0;
		
		String status = "";
		String text = request.getParameter("text");
		switch (text) {
		case "배송중" : status = "배송중"; break;
		case "배송완료" : status = "배송완료"; break;
		}
		
		System.out.println(text);
		System.out.println(status);
		
		int result1 = new DeliveryAdminService().changeStatusDelivery(status, dId);
		int result2 = 0;
		//배송완료면 상품을 판매완료 처리 한다
		//UPDATE PRODUCT SET STATUS = ? WHERE PID = (SELECT P.PID FROM PORDER O JOIN ORDER_DETAIL OD ON (O.POID = OD.POID) JOIN DELIVERY D ON (O.POID = D.POID) JOIN MEMBER M ON (O.UNO = M.UNO) JOIN PAYMENT PY ON (O.PYMID = PY.PYMID) JOIN PRODUCT P ON (OD.PID = P.PID) JOIN PRODUCT_GRADE G ON (P.PGRADE = G.GID) WHERE D.DID = ?)
		if(result1 > 0 && result1 == dId.length && text.equals("배송완료")) {
			System.out.println("배송완료 일때만 판매완료 수정 시작");
			
			String pStatus = "판매완료";
			result2 = new DeliveryAdminService().changeStatusProduct(pStatus, dId);
			if(result2 > 0 && result1 == result2) {
				System.out.println("성공");
				result = 1;
			}
		}else if(result1 > 0 && result1 == dId.length && status.equals("배송중")) {
			result = 1;
		}
		
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
