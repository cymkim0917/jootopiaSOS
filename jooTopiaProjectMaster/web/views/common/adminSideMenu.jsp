<%@ page language="java" contentType="text/html; charset=UTF-8"
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
			<div class="sideMenuBtn" id="memberSide1" onclick="location.href='member.jsp'">회원조회</div>
		</div>
		<div class="sideMenu" id="sideMenu2">
			<div class="sideMenuBtn" id="memberSide2" onclick="location.href='deleteMemberList.jsp'">탈퇴회원 조회</div>
		</div>
		
		<% }else if(root.equals("board")) { %>
		
		<div class="sideMenu" id="sideMenu1">
			<div class="sideMenuBtn" id="boardSide1" onclick="location.href='/jootopia/adminBoardList.do'">공지사항</div>
		</div>
		<div class="sideMenu" id="sideMenu2">
			<div class="sideMenuBtn" id="boardSide1" onclick="location.href='review.jsp'">후기게시판</div>
		</div>
		<div class="sideMenu" id="sideMenu3">
			<div class="sideMenuBtn" id="boardSide1" onclick="location.href='qna.jsp'">1:1질문게시판</div>
		</div>
		
		<% }else if(root.equals("product")) { %>
		
		<div class="sideMenu" id="sideMenu1">
		<div class="sideMenuBtn" id="" onclick="location.href='productList.jsp'">상품목록</div>
		</div>
		<div class="sideMenu" id="sideMenu2">
		<div class="sideMenuBtn" id="" onclick="location.href='productInsertList.jsp'">상품등록</div>
		</div>
		<div class="sideMenu" id="sideMenu3">
		<div class="sideMenuBtn" id="" onclick="location.href='productDeleteList.jsp'">삭제상품</div>
		</div>	
		
		<% }else if(root.equals("order")) { %>
		
		<div class="sideMenu" id="sideMenu1">
		<div class="sideMenuBtn" id="" onclick="location.href='paymentList.jsp'">입금전 관리</div></div>
		<div class="sideMenu" id="sideMenu2">
		<div class="sideMenuBtn" id="" onclick="location.href='preparingProductList.jsp'">상품준비중 관리</div></div>
		<div class="sideMenu" id="sideMenu3">
		<div class="sideMenuBtn" id="" onclick="location.href='deliveryList.jsp'">배송중 관리</div></div>
		<div class="sideMenu" id="sideMenu1">
		<div class="sideMenuBtn" id="" onclick="location.href='deliveryCompletedList.jsp'">배송완료 관리</div></div>
		<div class="sideMenu" id="sideMenu2">
		<div class="sideMenuBtn" id="" onclick="location.href='orderCancelList.jsp'">주문취소 관리</div></div>
		<div class="sideMenu" id="sideMenu3">
		<div class="sideMenuBtn" id="" onclick="location.href='refundList.jsp'">환불 관리</div></div>
		
		<% }else if(root.equals("storage")) { %>
		
		

		<div class="sideMenu" id="sideMenu1"><div class="sideMenuBtn" id="" onclick="location.href='buyWait.jsp'">상품등록</div></div>
		<div class="sideMenu" id="sideMenu2"><div class="sideMenuBtn" id="" onclick="location.href='heapWait.jsp'">적치등록</div></div>
		<div class="sideMenu" id="sideMenu3"><div class="sideMenuBtn" id="" onclick="location.href='releaseWait.jsp'">출고등록</div></div>
		<div class="sideMenu" id="sideMenu4"><div class="sideMenuBtn" id="" onclick="location.href='releaseList.jsp'">출고리스트</div></div>
		<div class="sideMenu" id="sideMenu5"><div class="sideMenuBtn" id="" onclick="location.href='stockList.jsp'">재고리스트</div></div>
		
		<% } %>
	</nav>
</body>
</html>