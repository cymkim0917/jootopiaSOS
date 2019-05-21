package com.kh.jooTopia.product.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.board.model.vo.Attachment;
import com.kh.jooTopia.product.model.service.ProductService;
import com.kh.jooTopia.product.model.vo.Product;

@WebServlet("/detailProduct.do")
public class SelectOneProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SelectOneProductServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pid = Integer.parseInt(request.getParameter("num"));
		HashMap<String, Object> detailProc = new ProductService().detailProduct(pid);
		
		HashMap<String, Object> recentProc = null;
		
		if(detailProc!=null) {
		Product proc = (Product)detailProc.get("product");
		ArrayList<Attachment> attList = (ArrayList<Attachment>)detailProc.get("attachment");	
		Date date = new Date();

		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String toDay = format.format(date);
		
		
		Attachment att = attList.get(0);
		recentProc = new HashMap<String, Object>();
		recentProc.put("pid", proc.getpId());
		recentProc.put("att", att.getChangeName());
		recentProc.put("day", toDay);
		System.out.println(recentProc);
		}
		
		System.out.println(detailProc);
		
		if(detailProc != null) {
			request.setAttribute("detailProc", detailProc);
			
			if(recentProc!=null) {
			request.setAttribute("recentProc",recentProc);			
			}
			request.getRequestDispatcher("views/notice/productListPlus.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
