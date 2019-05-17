package com.kh.jooTopia.purchase.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.purchase.model.service.PurchaseAdminService;
import com.kh.jooTopia.purchase.model.service.PurchaseDetailService;
import com.kh.jooTopia.purchase.model.vo.PurchaseDetail;

// @WebServlet("/insertPurchasAccept.do")
public class InsertPurchaseAcceptAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertPurchaseAcceptAdminServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pcid = Integer.parseInt(request.getParameter("no"));
		String pBarcode = "barcode111";
		
		PurchaseDetail pcd = new PurchaseDetail();
		pcd.setpBarcode(pBarcode);
		pcd.setPcid(pcid);
		
		// 바코드 api를 이용해서 바코드 생성
		int result = new PurchaseDetailService().insertPCDaccept(pcd);
		
		if(result > 0) {
			request.setAttribute("hmap", new PurchaseAdminService().selectPurchaseOne(pcid));
			request.getRequestDispatcher("views/admin/purchase/purchaseDetail.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "매입신청 수락 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
