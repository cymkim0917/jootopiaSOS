package com.kh.jooTopia.productreg.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.productreg.model.service.ProductregAdminService;
import com.kh.jooTopia.productreg.model.vo.ProductregAdmin;

/**
 * Servlet implementation class SelectOneAdminProductregServlet
 */
@WebServlet("/selectOneAdminProductreg.do")
public class SelectOneAdminProductregServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneAdminProductregServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//int num = Integer.parseInt(request.getParameter("num"));
		
		ProductregAdmin p = new ProductregAdminService().selectProductreg();
		
		String page = "";
		if(p != null) {
			page = "views/admin/storage/productreg.jsp";
			request.setAttribute("p", p);
			
		}else {
			page = "views/common/errorPage500.jsp";
			request.setAttribute("msg", "상세 조회 실패");
		}
		request.getRequestDispatcher(page).forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
