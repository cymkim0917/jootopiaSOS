package com.kh.jooTopia.buy.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.buy.model.service.BuyWaitAdminService;
import com.kh.jooTopia.buy.model.vo.BuyWaitAdmin;
 

@WebServlet("/selectAdminBuy.do")
public class SelectAdminBuyWaitServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectAdminBuyWaitServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<BuyWaitAdmin> list = new BuyWaitAdminService().selectAdminList();
		
		String page = "";
		if(list != null) {
			page = "views/admin/storage/buyWait.jsp";
			request.setAttribute("list", list);
		}else {
			page = "views/common/errorPage500.jsp";
			request.setAttribute("msg","실패");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
