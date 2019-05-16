package com.kh.jooTopia.purchase.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.purchase.model.service.PurchaseAdminService;

@WebServlet("/selectPurchaseDetail.do")
public class SelectPurchaseDetailAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectPurchaseDetailAdminServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pcid = Integer.parseInt(request.getParameter("no"));
		
		HashMap<String, Object> hmap = new PurchaseAdminService().selectPurchaseOne(pcid);
		
		if(hmap != null) {
			request.setAttribute("hmap", hmap);
			request.getRequestDispatcher("views/admin/purchase/purchaseDetail.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "매입상세페이지 조회 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
