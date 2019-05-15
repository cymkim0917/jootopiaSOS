package com.kh.jooTopia.heap.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.heap.model.service.HeapAdminService;
import com.kh.jooTopia.heap.model.vo.HeapAdmin;
 
/**
 * Servlet implementation class SelectAdminHeapServlet
 */
@WebServlet("/selectAdminHeap.do")
public class SelectAdminHeapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAdminHeapServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<HeapAdmin> list = new HeapAdminService().selectAdminList();
		
		System.out.println(list);
		String page = "";
		if(list != null) {
			page = "views/admin/storage/heapWait.jsp";
			request.setAttribute("list", list);
			
		}else {
			page = "views/common/errorPage500.jsp";
			request.setAttribute("msg","실패");
		}
		RequestDispatcher view = request.getRequestDispatcher(page);
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
