package com.kh.jooTopia.release.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.release.model.service.ReleaseAdminService;
import com.kh.jooTopia.release.model.vo.ReleaseAdmin;

/**
 * Servlet implementation class InsertAdminReleaseServlet
 */
@WebServlet("/insertAdminRelease.do")
public class InsertAdminReleaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertAdminReleaseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int pId = Integer.parseInt(request.getParameter("pId"));
		int poId = Integer.parseInt(request.getParameter("poId"));
		/*int dId = Integer.parseInt(request.getParameter("dId"));
		int hId = Integer.parseInt(request.getParameter("hId"));
		int lBarcode = Integer.parseInt(request.getParameter("lBarcode"));*/		
		
		ReleaseAdmin r = new ReleaseAdmin();
		r.setPoId(poId);
		r.setpId(pId);
		
				
		int result = new ReleaseAdminService().insertAdminRelease(r);
		
		String page = "";
		if(result > 0) {
			page = "/jootopia/selectAdminRelease.do";
			response.sendRedirect(page);
		}else {
			page = "views/common/errorPage500.jsp";
			request.setAttribute("msg","실패");
			request.getRequestDispatcher(page).forward(request,response);
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
