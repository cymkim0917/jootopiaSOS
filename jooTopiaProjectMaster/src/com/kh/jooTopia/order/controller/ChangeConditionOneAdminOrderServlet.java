package com.kh.jooTopia.order.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.order.model.service.OrderAdminService;

@WebServlet("/changeConditionOne.do")
public class ChangeConditionOneAdminOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChangeConditionOneAdminOrderServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String condition = request.getParameter("condition");
		int poId = Integer.parseInt(request.getParameter("poId"));
		String changeValue = request.getParameter("changeValue");
		
		String changeQuery = " " + condition + " = '" + changeValue + "' WHERE POID = " + poId;
		
		System.out.println(changeQuery);
		
		int result = new OrderAdminService().changeConditionOne(changeQuery);
		
		String msg = "";
		switch(condition) {
		case "DMESSAGE" : msg = "배송메시지"; break;
		}
		if(result > 0) {
			msg += " 변경 성공";
		}else {
			msg += " 변경 실패";
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
