package com.kh.jooTopia.cart.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.cart.model.service.CartService;
import com.kh.jooTopia.member.model.vo.Member;

/**
 * Servlet implementation class DeleteCartServlet
 */
@WebServlet("/delCart.do")
public class DeleteCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteCartServlet() {
        super();
        // TODO Auto-generated constructor stub//
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member member = (Member) request.getSession().getAttribute("loginUser");
		int uno = member.getUno();
		String tempList[] = request.getParameterValues("selectCart");
		int delList[] = new int[tempList.length];
		
		for (int i = 0; i < tempList.length; i++) {
			delList[i] = Integer.parseInt(tempList[i]);
			System.out.println("delList[" + i + "] : " + delList[i]);
		}

		
		int result = new CartService().deleteCart(delList,uno);
		
		response.sendRedirect("views/member/cartListPage.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
