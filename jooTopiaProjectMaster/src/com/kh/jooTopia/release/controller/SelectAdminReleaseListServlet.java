package com.kh.jooTopia.release.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.release.model.service.ReleaseAdminService;
import com.kh.jooTopia.release.model.vo.ReleaseAdmin;

 
/**
 * Servlet implementation class SelectAdminReleaseListServlet
 */
@WebServlet("/selectAdminReleaseList.do")
public class SelectAdminReleaseListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAdminReleaseListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ArrayList<ReleaseAdmin> rlist = new ReleaseAdminService().selectAdminReleaseList();
		System.out.println(rlist);
		String page = "";
		if(rlist != null) {
			page = "views/admin/storage/releaseList.jsp";
			request.setAttribute("rlist", rlist);
			
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
