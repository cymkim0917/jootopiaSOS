package com.kh.jooTopia.delivery.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.jooTopia.delivery.model.dao.DeliveryAdminDao;
import com.kh.jooTopia.delivery.model.service.DeliveryAdminService;

@WebServlet("/selectDeliveryModal.do")
public class SelectAdminDeliveryModalOneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectAdminDeliveryModalOneServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int dId = Integer.parseInt(request.getParameter("dId"));
		System.out.println(dId);
		
		HashMap<String, Object> hmap = new DeliveryAdminService().selectDeliveryModal(dId);
		
		if(hmap != null) {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(hmap, response.getWriter());
		}else {
			System.out.println("ㅠㅠ");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
