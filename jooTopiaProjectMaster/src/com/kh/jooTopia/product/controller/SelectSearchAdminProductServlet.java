package com.kh.jooTopia.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/searchAdminProduct.do")
public class SelectSearchAdminProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectSearchAdminProductServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("검색 서블릿 실행");
		
		String query = "";
		
		String searchCondition = request.getParameter("searchCondition");
		System.out.println("searchCondition : " + searchCondition);
		if(searchCondition != null) {
			if(searchCondition.equals("pName")) {
				String pName = request.getParameter("searchConditionValue");
				System.out.println("pName : " + pName);
			}else {
				String pCode = request.getParameter("searchConditionValue");
				System.out.println("pCode : " + pCode);
			}
		}
		
		String cGroup = request.getParameter("cGroup");
		System.out.println("cGroup : " + cGroup);
		String cName = request.getParameter("cName");
		System.out.println("cName : " + cName);
		int cId;
		if(cGroup != null & cName != null) {
			if(cGroup.equals("침실")) {
				switch (cName) {
				case "침대" : cId = 1; break;
				case "옷장" : cId = 2; break;
				case "화장대" : cId = 3; break;
				case "침실수납장" : cId = 4; break;
				case "기타" : cId = 5; break;
				}
			}else if(cGroup.equals("서재")) {
				switch (cName) {
				case "책상" : cId = 11; break;
				case "책장" : cId = 12; break;
				case "사무용의자" : cId = 13; break;
				case "서재수납장" : cId = 14; break;
				case "기타" : cId = 15; break;
				}
			}else if(cGroup.equals("주방")) {
				switch (cName) {
				case "식탁" : cId = 21; break;
				case "식탁의자" : cId = 22; break;
				case "주방수납장" : cId = 23; break;
				case "렌지대" : cId = 24; break;
				case "기타" : cId = 25; break;
				}
			}else if(cGroup.equals("거실")) {
				switch (cName) {
				case "테이블" : cId = 31; break;
				case "거실장" : cId = 32; break;
				case "쇼파" : cId = 33; break;
				case "거실수납장" : cId = 34; break;
				case "기타" : cId = 35; break;
				}
			}else {
				cId = 41;
			}
		}else if(cGroup != null & cName == null) {
			if(cGroup.equals("침실")) {
				cId = 1;
			}else if(cGroup.equals("서재")) {
				cId = 11;
			}else if(cGroup.equals("주방")) {
				cId = 21;
			}else if(cGroup.equals("거실")) {
				cId = 31;
			}else {
				cId = 41;
			}
		}
		
		
		String startDate = request.getParameter("startDate");
		System.out.println("startDate : " + startDate);
		String endDate = request.getParameter("endDate");
		System.out.println("endDate : " + endDate);
		
		String pType = request.getParameter("pType");
		System.out.println("pType : " + pType);
		
		if(pType.equals("on")) {
			
		}
		
		
		
	}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
