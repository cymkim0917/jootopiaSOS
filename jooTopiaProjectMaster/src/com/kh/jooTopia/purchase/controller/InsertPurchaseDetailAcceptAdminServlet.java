package com.kh.jooTopia.purchase.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Out;

import com.kh.jooTopia.product.model.service.ProductAdminService;
import com.kh.jooTopia.product.model.vo.ProductregAdmin;
import com.kh.jooTopia.purchase.model.service.PurchaseAdminService;
import com.kh.jooTopia.purchase.model.vo.PurchaseDetail;

@WebServlet("/insertPCDAccept.do")
public class InsertPurchaseDetailAcceptAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public InsertPurchaseDetailAcceptAdminServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pcid = Integer.parseInt(request.getParameter("no"));
		String message = request.getParameter("message");
		int buyPrice = Integer.parseInt(request.getParameter("buyPrice"));
		
		System.out.println("pcid : " + pcid);
		System.out.println("message : " + message);
		System.out.println("buyPrice : " + buyPrice);
		
		PurchaseDetail pcd = new PurchaseDetail();
		pcd.setMessage(message);
		pcd.setPcPrice(buyPrice);
		pcd.setPcid(pcid);
		
		ProductregAdmin p = new PurchaseAdminService().insertPersonAccept(pcd);
		
		if(p != null) {
			// request.setAttribute("p", p);
			// request.getRequestDispatcher("/views/admin/storage/productreg.jsp").forward(request, response);
			// request.setAttribute("hmap", new PurchaseAdminService().selectPurchaseOne(pcid));
			request.getRequestDispatcher("/selectAdminBuy.do").forward(request, response);
		} else {
			request.setAttribute("msg", "현장 매입 요청 실패!");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
