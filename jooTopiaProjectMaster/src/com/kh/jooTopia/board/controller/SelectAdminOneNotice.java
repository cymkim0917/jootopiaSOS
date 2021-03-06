package com.kh.jooTopia.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.board.model.service.BoardAdminService;
import com.kh.jooTopia.board.model.vo.Attachment;
import com.kh.jooTopia.board.model.vo.Board;

/**
 * Servlet implementation class SelectAdminOneNotice
 */
@WebServlet("/selectAdminNotice.do")
public class SelectAdminOneNotice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectAdminOneNotice() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		//System.out.println("서블릿 num " + num);
		
		HashMap<String, Object> hmap = new BoardAdminService().selectOneNotice(num);
		
		Board board = (Board)hmap.get("board");
		ArrayList<Attachment> fileList = (ArrayList<Attachment>)hmap.get("attachment");
		
		String page = "";
		
		if(hmap != null) {
			page="views/admin/board/updateNotice.jsp";
			request.setAttribute("board", board);
			request.setAttribute("fileList", fileList);
		}else {
			page="views/common/errorPage500.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
