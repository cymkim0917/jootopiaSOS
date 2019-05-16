package com.kh.jooTopia.cart.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.SendResult;

import com.kh.jooTopia.cart.model.service.CartService;
import com.kh.jooTopia.cart.model.vo.Cart;
import com.kh.jooTopia.member.model.vo.Member;

@WebServlet("/selectAllCart.do")//
public class SelectCartList extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectCartList() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member member = (Member)request.getSession().getAttribute("loginUser");
		
		if(member==null) {return;}
		int uno = member.getUno();
		
		System.out.println(uno);
		
		ArrayList<Cart> list = new CartService().selectCartList(uno);
		
		System.out.println(list);
		
		String view = "";
		PrintWriter out = response.getWriter();
		
		 if(list != null) {
			 request.setAttribute("cart", list);
			 view = "views/member/cartListPage.jsp";
		 }else {
			 view = "views/member/cartListPage.jsp";
		 }
		 request.getRequestDispatcher(view).forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
