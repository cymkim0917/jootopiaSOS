package com.kh.jooTopia.heap.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.heap.model.service.HeapAdminService;

@WebServlet("/checkPBarcode.do")
public class HeapCheckPBarcodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HeapCheckPBarcodeServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pid = Integer.parseInt(request.getParameter("pid"));
		
		String pBarcode = new HeapAdminService().checkPBarcode(pid);
		
		if(pBarcode != null) {
			
		}else {
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
