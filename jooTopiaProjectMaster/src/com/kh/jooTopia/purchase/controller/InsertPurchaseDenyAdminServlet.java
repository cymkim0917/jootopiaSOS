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

@WebServlet("/insertPCAdminDeny.do")
public class InsertPurchaseDenyAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertPurchaseDenyAdminServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String denyReason = request.getParameter("denyReason");
		int pcid = Integer.parseInt(request.getParameter("no"));
		
		PurchaseDetail pcd = new PurchaseDetail();
		pcd.setDenyReason(denyReason);
		pcd.setPcid(pcid);
		
		int result = new PurchaseDetailService().insertPCDdeny(pcd);
		
		String page = "";
		if(result > 0) {
			request.setAttribute("hmap", new PurchaseAdminService().selectPurchaseOne(pcid));
			page = "/views/admin/purhcase/purchaseDetail.jsp"; 
		}else {
			request.setAttribute("msg", "매입신청 거절 실패!");
			page = "/views/common/errorPage.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
