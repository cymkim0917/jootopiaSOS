package com.kh.jooTopia.heap.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.heap.model.service.HeapAdminService;
import com.kh.jooTopia.heap.model.vo.HeapAdmin;
 
/**
 * Servlet implementation class InsertAdminHeapServlet
 */
@WebServlet("/insertAdminHeap.do")
public class InsertAdminHeapServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertAdminHeapServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String lBarcode = request.getParameter("lBarcode");
		System.out.println(request.getParameter("no"));
		int pId = Integer.parseInt(request.getParameter("no"));
		
		HeapAdmin h = new HeapAdmin();
		h.setlBarcode(lBarcode);
		h.setpId(pId);
		
		int result = new HeapAdminService().insertAdminHeap(h);
		
		String page="";
		if(result >0) {
			page = "/jootopia/selectAdminHeap.do";
			response.sendRedirect(page);
		}else {
			page = "views/common/errorPage500.jsp";
			request.setAttribute("msg", "실패");
			request.getRequestDispatcher(page).forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
