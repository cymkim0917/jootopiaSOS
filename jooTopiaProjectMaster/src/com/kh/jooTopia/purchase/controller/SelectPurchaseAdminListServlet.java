package com.kh.jooTopia.purchase.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.purchase.model.service.PurchaseAdminService;

@WebServlet("/selectPurchaseAdminList.do")
public class SelectPurchaseAdminListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectPurchaseAdminListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<HashMap<String, Object>> list;
		list = new PurchaseAdminService().selectList();
		
		if(list != null) {
			request.setAttribute("list", list);
			request.getRequestDispatcher("views/admin/purchase/purchaseList.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "매입신청 리스트 조회 실패!");
			RequestDispatcher view = request.getRequestDispatcher("views/common/errorPage.jsp");
			view.forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}



