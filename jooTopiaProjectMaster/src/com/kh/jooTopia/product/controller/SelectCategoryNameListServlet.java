package com.kh.jooTopia.product.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.jooTopia.product.model.service.CategoryService;

@WebServlet("/selectNameList.do")
public class SelectCategoryNameListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectCategoryNameListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String group = request.getParameter("cGroup");
		System.out.println("cGroup : " +  group);
		ArrayList<String> list = new CategoryService().selectNameList(group);
		
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(list, response.getWriter());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
