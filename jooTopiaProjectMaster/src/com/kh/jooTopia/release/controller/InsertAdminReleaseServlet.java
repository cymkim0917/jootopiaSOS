package com.kh.jooTopia.release.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.GregorianCalendar;

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
		
		String releaseNo = request.getParameter("releaseNo");
		String releaseDate = request.getParameter("releaseDate");
		
		java.sql.Date day = null;
		
		if(releaseDate != "") {
			day = Date.valueOf(releaseDate);
		}else {
			day = new java.sql.Date(new GregorianCalendar().getTimeInMillis());
		}
		
		ReleaseAdmin r = new ReleaseAdmin();
		
		r.setReleaseNo(releaseNo);
		r.setReleaseDate(day);
		
		int result = new ReleaseAdminService().insertAdminRelease(r);
		
		String page = "";
		if(result > 0) {
			//response.sendRedirect("/jooTopia/listAdminRelease.do");
			response.sendRedirect("views/admin/storage/releaseList");
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
