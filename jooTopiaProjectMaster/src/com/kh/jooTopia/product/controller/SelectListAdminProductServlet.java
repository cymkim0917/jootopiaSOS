package com.kh.jooTopia.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.board.model.service.BoardAdminService;
import com.kh.jooTopia.board.model.vo.PageInfo;
import com.kh.jooTopia.product.model.service.ProductAdminService;

@WebServlet("/adminProductList.do")
public class SelectListAdminProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectListAdminProductServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//판매미등록, 판매중 상품 전체조회
		
		//페이징 추가
		int currentPage; //현재 페이지를 표시할 변수
		int limit;		//한 페이지에 게시글이 몇 개 보여질 것인지
		int maxPage; 	//전체 페이지에서 가장 마지막 페이지
		int startPage;	//한번에 표지될 페이지가 시작할 페이지
		int endPage;	//한번에 표시될 페이지가 끝나는 페이지
				
		//페이지 수 처리용 변수
		currentPage = 1;
				
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
				
				
		limit = 10;
				
		int listCount = new BoardAdminService().getNoticeListCount();
				
		maxPage = (int)((double)listCount / limit+0.9);
				
		startPage = (((int)((double)currentPage/limit+0.9))-1);
				
		endPage = startPage +10 -1;
		if(maxPage<endPage) {
			endPage=maxPage;
		}
				
		PageInfo pageInfo = new PageInfo(currentPage, limit, maxPage, startPage, endPage);
		
		ArrayList<HashMap<String,Object>> list = new ProductAdminService().selectList(pageInfo);
		
		String view = "";
		if(list != null) {
			view = "views/admin/product/productList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pageInfo", pageInfo);
		}else {
			view = "views/common/errorPage500.jsp";
			request.setAttribute("msg", "상품목록 리스트 조회 실패");
		}
		request.getRequestDispatcher(view).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
