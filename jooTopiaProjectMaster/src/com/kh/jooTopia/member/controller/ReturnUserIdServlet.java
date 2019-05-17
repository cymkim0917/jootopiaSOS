package com.kh.jooTopia.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.collections.SynchronizedStack;

/**
 * Servlet implementation class ReturnUserIdServlet
 */
@WebServlet("/returnUserId.do")
public class ReturnUserIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReturnUserIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String securityNum = request.getParameter("reqNum");
		String writerNum = request.getParameter("writerNum");
		
		System.out.println(securityNum.equals(writerNum));
		System.out.println("securityNum" + securityNum);
		System.out.println("writerNum" + writerNum);
		
		securityNum = securityNum.trim();
		writerNum = writerNum.trim();
		
		System.out.println(securityNum.equals(writerNum));
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
