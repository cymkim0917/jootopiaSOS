package com.kh.jooTopia.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.jooTopia.product.model.service.ProductService;

@WebServlet("/selectProduct.do")
public class SelectProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectProductListServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<HashMap<String,Object>> productMap = new ProductService().productList();
		
	
		System.out.println(productMap);
		
		response.setContentType("application/json");
		new Gson().toJson(productMap,response.getWriter());
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
