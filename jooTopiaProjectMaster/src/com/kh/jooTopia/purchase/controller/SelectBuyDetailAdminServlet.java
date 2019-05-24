package com.kh.jooTopia.purchase.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.purchase.model.service.PurchaseAdminService;

@WebServlet("/selectBuyDetail.do")
public class SelectBuyDetailAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectBuyDetailAdminServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pcid = Integer.parseInt(request.getParameter("num"));
		System.out.println("num : " + pcid);
		HashMap<String, Object> hmap = new PurchaseAdminService().selectPurchaseOne(pcid);
		
		if(hmap != null) {
			request.setAttribute("hmap", hmap);
			if(hmap.get("status").equals("매입중")) {
				request.getRequestDispatcher("selectOneAdminProductr.do?num=" + hmap.get("pcid")).forward(request, response);
			}else {
				request.getRequestDispatcher("views/admin/storage/buyAccept.jsp").forward(request, response);
			}
		}else {
			request.setAttribute("msg", "상품매입 페이지 조회 실패!");
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
