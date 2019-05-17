package com.kh.jooTopia.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.product.model.service.ProductAdminService;
import com.kh.jooTopia.product.model.vo.Product;

/**
 * Servlet implementation class InsertAdminProductregServlet
 */
@WebServlet("/insertAdminProductreg.do")
public class InsertAdminProductregServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertAdminProductregServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String pName = request.getParameter("pName");
		int pPrice = Integer.parseInt(request.getParameter("pCost"));
		String pContent = request.getParameter("pContent");
		String pGrade = request.getParameter("pGrade");
		String pBrand = request.getParameter("pBrand");
		String pModel = request.getParameter("pModel");
		String cGroup = request.getParameter("cGroup");
		String cName = request.getParameter("cName");
		int pcdId = Integer.parseInt(request.getParameter("pcdId"));
		
		int cId = 0;
		
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
		
		Product p = new Product();
		p.setpName(pName);
		p.setpPrice(pPrice);
		p.setpContent(pContent);
		p.setpGrade(pGrade);
		p.setpBrand(pBrand);
		p.setpModelName(pModel);
		p.setcId(cId);
		p.setPcDId(pcdId);
		
		int result = new ProductAdminService().insertAdminProductreg(p);
		
		String page="";
		if(result >0) {
			page = "/jootopia/selectAdminBuy.do";
			response.sendRedirect(page);
			
		}else {
			page = "views/common/errorPage500.jsp";
			request.setAttribute("msg", "실패");
			request.getRequestDispatcher(page).forward(request, response);
		}
		
	}

	/*
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
