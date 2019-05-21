package com.kh.jooTopia.cart.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.cart.model.service.CartService;
import com.kh.jooTopia.member.model.vo.Member;

@WebServlet("/insertCart.do")
public class InsertCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public InsertCartServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member member=  (Member)request.getSession().getAttribute("loginUser");
		int pid = Integer.parseInt(request.getParameter("num"));
		int result = new CartService().insertCart(member.getUno(),pid);
		
		PrintWriter out = response.getWriter();
		
		if(result > 0) {
			out.print("success");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
