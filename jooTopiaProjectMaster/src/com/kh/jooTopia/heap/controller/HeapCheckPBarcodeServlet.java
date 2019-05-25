package com.kh.jooTopia.heap.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.jooTopia.heap.model.service.HeapAdminService;

@WebServlet("/checkPBarcode.do")
public class HeapCheckPBarcodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HeapCheckPBarcodeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pid = Integer.parseInt(request.getParameter("pid"));
		System.out.println("바코드 체크 서블릿 : " + pid);
		String pBarcode = new HeapAdminService().checkPBarcode(pid);
		
		System.out.println("바코드값 : " + pBarcode);
		response.setContentType("application/json");
		response.setCharacterEncoding("utf-8");
		new Gson().toJson(pBarcode, response.getWriter());
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
