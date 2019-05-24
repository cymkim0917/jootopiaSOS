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
 * Servlet implementation class SelectOneAdminReleaseServlet
 */
@WebServlet("/selectRLOne.do")
public class SelectOneAdminReleaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOneAdminReleaseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("num")); 
		
		ReleaseAdmin r = new ReleaseAdminService().selectOneAdminRelease(num);
		
		String page = "";
		if(r != null) {
			page = "/views/admin/storage/releaseRegist.jsp";
			request.setAttribute("r", r);
			request.getRequestDispatcher(page).forward(request, response);
		}else {
			
			page = "/views/common/errorPage500.jsp";
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
