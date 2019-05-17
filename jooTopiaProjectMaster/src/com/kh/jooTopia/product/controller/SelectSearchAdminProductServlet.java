package com.kh.jooTopia.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.jooTopia.board.model.vo.PageInfo;
import com.kh.jooTopia.product.model.dao.ProductAdminDao;
import com.kh.jooTopia.product.model.service.ProductAdminService;

@WebServlet("/searchAdminProduct.do")
public class SelectSearchAdminProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SelectSearchAdminProductServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//검색 상품리스트 출력
		System.out.println("검색 서블릿 실행");
		
		ArrayList<String> querys = new ArrayList<String>();
		
		String searchCondition = request.getParameter("searchCondition");
		System.out.println("searchCondition : " + searchCondition);
		String conditionValue;
		if(searchCondition != null) {
			if(searchCondition.equals("pName")) {
				conditionValue = request.getParameter("searchConditionValue");
				System.out.println("P.PNAME" + " : " + conditionValue);
				searchCondition = "P.PNAME ";
			}else {
				conditionValue = request.getParameter("searchConditionValue");
				System.out.println("P.PID" + " : " + conditionValue);
				searchCondition = "P.PID ";
			}
			querys.add(searchCondition + " LIKE '%" + conditionValue + "%'");
		}
		
		String cGroup = request.getParameter("cGroup");
		System.out.println("cGroup : " + cGroup);
		String cName = request.getParameter("cName");
		System.out.println("cName : " + cName);
		int cId = 0;
		if(!cGroup.equals("-- 대분류 --") && !cName.equals("-- 중분류 --")) {
			System.out.println("카테고리 찾기~~");
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
			querys.add("C.CID = " + cId);
			System.out.println("카테고리 변화후 : " + cId);
		}
		System.out.println("카테고리 변화전 : " + cId);
		String startDate = request.getParameter("startDate");
		System.out.println("startDate : " + startDate);
		String endDate = request.getParameter("endDate");
		System.out.println("endDate : " + endDate);
		
		if(startDate != null && endDate != null) {
			querys.add("P.PDATE BETWEEN TO_DATE('"+ startDate + "', 'YYYY-MM-DD') AND TO_DATE('" + endDate + "', 'YYYY-MM-DD')");
		}
		
		String pType = request.getParameter("pType");
		System.out.println("pType : " + pType);
		
		if(pType.equals("on")) {
			querys.add("(P.STATUS = '판매중' OR P.STATUS = '판매미등록')");
		}else {
			querys.add("P.STATUS = '" + pType + "'");
		}
		
		String query = "";
		for(int i = 0; i < querys.size(); i++) {
			if(i == 0) {
				query = querys.get(i);
			}else {
				query += " AND " + querys.get(i);
			}
		}
		
		System.out.println(query);
		
		//페이징 추가
		int currentPage; //현재 페이지를 표시할 변수
		int limit;		//한 페이지에 게시글이 몇 개 보여질 것인지
		int maxPage; 	//전체 페이지에서 가장 마지막 페이지
		int startPage;	//한번에 표지될 페이지가 시작할 페이지
		int endPage;	//한번에 표시될 페이지가 끝나는 페이지
						
		//페이지 수 처리용 변수
		currentPage = 1;
		
		String pageQuery = "SELECT COUNT(*) FROM PRODUCT P JOIN CATEGORY C ON (P.CID = C.CID) WHERE " + query;
		
		System.out.println("pageQuery : " + pageQuery);
		
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
						
		limit = 10;
		
		int listCount = new ProductAdminService().getProductListCount(pageQuery);
		
		System.out.println("서블릿의 페이징용 listCount : " + listCount);
		
		maxPage = (int)((double)listCount / limit + 0.9);
						
		startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * 10 + 1;
						
		endPage = startPage + 10 - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(currentPage, limit, maxPage, startPage, endPage);
		
		ArrayList<HashMap<String,Object>> list = new ProductAdminService().selectSearchProduct(pageInfo, query);
		
		System.out.println("서블릿의 list : " + list);
		
		String view = "";
		if(list != null) {
			System.out.println("조회성공");
			view = "views/admin/product/productList.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pageInfo", pageInfo);
		}else {
			System.out.println("조회 실패");
			view = "views/common/errorPage500.jsp";
			request.setAttribute("msg", "검색 실패");
		}
		request.getRequestDispatcher(view).forward(request, response);
	}
		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
