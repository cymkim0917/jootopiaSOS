package com.kh.jooTopia.product.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.product.model.service.ProductAdminService;

@WebServlet("/adminChangeStatusProduct.do")
public class ChangeStatusAdminProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ChangeStatusAdminProductServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String numArr = request.getParameter("numArr");
		String[] num = numArr.split("\\|");
		ArrayList<Integer> pId = new ArrayList<Integer>();
		
		for(int i = 0; i < num.length; i++) {
			pId.add(Integer.parseInt(num[i]));
		}
		
		String status = "";
		String text = request.getParameter("text");
		switch (text) {
		case "상품삭제" : status = "삭제상품"; break;
		case "판매등록" : status = "판매중"; break;
		case "판매미등록" : status = "판매미등록"; break;
		}
		
		int result = new ProductAdminService().changeStatusProduct(status, pId);
		
		String msg = "";
		if(result > 0) {
			msg = "해당 상품을 " + text + " 처리했습니다.";
		}else {
			msg = "해당 상품 " + text + "처리 실패";
		}
		
		PrintWriter out = response.getWriter();
		out.println(msg);
		out.flush();
		out.close();
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
