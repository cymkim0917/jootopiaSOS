﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String root = request.getRequestURI().split("/")[4];
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JooTopia</title>
<link rel="stylesheet" type="text/css" href="/jootopia/css/admin/adminCommon.css">
</head>
<body> 
	<nav class="sideNav col-sm-2" align="center">
		<div class="sideMenuImg" id="sideMenuImg">
			<img src="/jootopia/images/sideMenuImg.png" width="100%">
		</div>
		<br>
		<% if(root.equals("member")) { %>
		
		<div class="sideMenu" id="sideMenu1">
			<div class="sideMenuBtn" id="memberSide1" onclick="location.href='/jootopia/selectAdminMember.do'">회원조회</div>
		</div>
		<div class="sideMenu" id="sideMenu2">
			<div class="sideMenuBtn" id="memberSide2" onclick="location.href='/jootopia/deleteAdminMember.do'">탈퇴회원 조회</div>
		</div>
		
		<% }else if(root.equals("board")) { %>
		
		<div class="sideMenu" id="sideMenu1">
			<div class="sideMenuBtn" id="boardSide1" onclick="location.href='/jootopia/adminBoardList.do'">공지사항</div>
		</div>
		<div class="sideMenu" id="sideMenu2">
			<div class="sideMenuBtn" id="boardSide1" onclick="location.href='/jootopia/views/admin/board/review.jsp'">후기게시판</div>
		</div>
		<div class="sideMenu" id="sideMenu3">
			<div class="sideMenuBtn" id="boardSide1" onclick="location.href='/jootopia/views/admin/board/qna.jsp'">1:1질문게시판</div>
		</div>
		
		<% }else if(root.equals("product")) { %>
		
		<div class="sideMenu" id="sideMenu1">
		<div class="sideMenuBtn" id="" onclick="location.href='/jootopia/adminProductList.do'">상품목록</div>
		</div>
		<div class="sideMenu" id="sideMenu2">
		<div class="sideMenuBtn" id="" onclick="location.href='/jootopia/adminAddProductList.do'">상품등록</div>
		</div>
		<div class="sideMenu" id="sideMenu3">
		<div class="sideMenuBtn" id="" onclick="location.href='/jootopia/adminDeleteProductList.do'">삭제상품</div>
		</div>	
		
		<% }else if(root.equals("order")) { %>
		
		<div class="sideMenu" id="sideMenu1">
		<div class="sideMenuBtn" id="" onclick="location.href='/jootopia/selectAdminPaymentList.do'">입금전 관리</div></div>
		<div class="sideMenu" id="sideMenu2">
		<div class="sideMenuBtn" id="" onclick="location.href='/jootopia/selectAdminPreList.do'">상품준비중 관리</div></div>
		<div class="sideMenu" id="sideMenu3">
		<div class="sideMenuBtn" id="" onclick="location.href='/jootopia/selectAdminDeliveryList.do'">배송중 관리</div></div>
		<div class="sideMenu" id="sideMenu4">
		<div class="sideMenuBtn" id="" onclick="location.href='views/admin/order/deliveryCompletedList.jsp'">배송완료 관리</div></div>
		<div class="sideMenu" id="sideMenu5">
		<div class="sideMenuBtn" id="" onclick="location.href='views/admin/order/orderCancelList.jsp'">주문취소 관리</div></div>
		<div class="sideMenu" id="sideMenu6">
		<div class="sideMenuBtn" id="" onclick="location.href='views/admin/order/refundList.jsp'">환불 관리</div></div>
		
		<% }else if(root.equals("storage")) { %>
		
		

		<div class="sideMenu" id="sideMenu1"><div class="sideMenuBtn" id="" onclick="location.href='<%=request.getContextPath()%>/selectAdminBuy.do'">상품등록 대기</div></div>
		<div class="sideMenu" id="sideMenu2"><div class="sideMenuBtn" id="" onclick="location.href='<%=request.getContextPath()%>/selectAdminHeap.do'">적치등록 대기</div></div>
		<div class="sideMenu" id="sideMenu3"><div class="sideMenuBtn" id="" onclick="location.href='<%=request.getContextPath()%>/selectAdminRelease.do'">출고등록 대기</div></div>
		<div class="sideMenu" id="sideMenu4"><div class="sideMenuBtn" id="" onclick="location.href='<%=request.getContextPath()%>/selectAdminReleaseList.do'">출고리스트</div></div>
		<div class="sideMenu" id="sideMenu5"><div class="sideMenuBtn" id="" onclick="location.href='<%=request.getContextPath()%>/selectAdminStock.do'">재고리스트</div></div>
		
		<% } %>
	</nav>
</body>
</html>