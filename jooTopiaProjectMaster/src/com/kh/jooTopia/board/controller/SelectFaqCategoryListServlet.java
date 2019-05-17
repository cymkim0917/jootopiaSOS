package com.kh.jooTopia.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.kh.jooTopia.board.model.service.BoardService;
import com.kh.jooTopia.board.model.vo.Board;

import jdk.nashorn.api.scripting.JSObject;

/**
 * Servlet implementation class SelectFaqTotalList
 */
@WebServlet("/selectFaqCategoryList.do")
public class SelectFaqCategoryListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectFaqCategoryListServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String fCategory = request.getParameter("fCategory");
		System.out.println("fCategory in servlet : " + fCategory);
		ArrayList<Board> list = new BoardService().selectFaqCategoryList(fCategory);
		System.out.println("list in SelectFaqCategoryListServlet : " + list);
		
		String page = "";
		if(list != null) {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(list, response.getWriter());
		}else {
			page="views/common/errorPage500.jsp";
			request.setAttribute("msg", "공지사항 조회 실패");
			RequestDispatcher view = request.getRequestDispatcher(page);
			view.forward(request, response);
			System.out.println("request : " + request );
			System.out.println("response : "  + response);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
