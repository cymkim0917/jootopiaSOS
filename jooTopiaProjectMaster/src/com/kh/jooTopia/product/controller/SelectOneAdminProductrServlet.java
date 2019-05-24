package com.kh.jooTopia.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.product.model.service.ProductAdminService;
import com.kh.jooTopia.product.model.vo.ProductregAdmin;

@WebServlet("/selectOneAdminProductr.do")
public class SelectOneAdminProductrServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectOneAdminProductrServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int num = Integer.parseInt(request.getParameter("num"));
		
		ProductregAdmin p = new ProductAdminService().selectOneAdminProductreg(num);
		
		
		String page = "";
		if(p != null) {
			page = "views/admin/storage/productreg.jsp";
			request.setAttribute("p", p);
		}else {
			page = "views/common/errorPage.jsp";
			request.setAttribute("msg", "상세보기실패");
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
