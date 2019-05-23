package com.kh.jooTopia.member.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.jooTopia.member.model.service.MemberAdminService;

/**
 * Servlet implementation class SelectAdminMOrderListServlet
 */
@WebServlet("/selectAdminMOrderList.do")
public class SelectAdminMOrderListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAdminMOrderListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		int uNo = Integer.parseInt(request.getParameter("uno"));
		
		System.out.println("서블릿 확인 " + uNo);
		
		ArrayList search = new ArrayList();
		
		search.add(type);
		search.add(uNo);
		
		ArrayList list = new MemberAdminService().selectOrderList(uNo);
		
		response.setContentType("application/json");
		new Gson().toJson(list, response.getWriter());
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
