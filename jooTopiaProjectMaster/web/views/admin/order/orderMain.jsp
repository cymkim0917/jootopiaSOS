<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%
	HashMap<String, Object> hmap;
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="/jootopia/js/external/jquery-3.4.0.min.js">
<link rel="stylesheet" href="/jootopia/css/admin/adminCommon.css">
 
<title>JooTopia</title>
</head>
<body>

	<%@ include file="/views/common/adminNavigation.jsp" %>
	
	<section class="row">
		<%@ include file="/views/common/adminSideMenu.jsp" %>
		
		<div class="col-sm-10">
		<h3 class="title">주문관리 전체</h3>
		<hr>
		
		<div class="pInfo1Area">
		<table id="pInfo1">
			<tr>
				<th>전체</th>
				<td><a href="<%=request.getContextPath()%>/selectAdminTotalOrder.do">0</a>건</td>
			</tr>
			<tr>
				<th>입금전</th>
				<td><a href="/jootopia/views/admin/order/paymentList.jsp">0</a>건</td>
			</tr>
			<tr>
				<th>상품준비중</th>
				<td><a href="/jootopia/views/admin/order/preparingProductList.jsp">0</a>건</td>
				
			</tr>
			<tr>
				<th>배송중</th>
				<td><a href="/jootopia/views/admin/order/deliveryList.jsp">0</a>건</td>
			</tr>
			<tr>
				<th>배송완료</th>
				<td><a href="/jootopia/views/admin/order/deliveryCompletedList.jsp">0</a>건</td>
				
			</tr>
			<tr>
				<th>주문취소</th>
				<td><a href="/jootopia/views/admin/order/orderCancelList.jsp">0</a>건</td>
			</tr>
			<tr>
				<th>환불중</th>
				<td><a href="/jootopia/views/admin/order/refundList.jsp">0</a>건</td>
				
			</tr>
		</table>
		</div>
		
		</div> <!-- col-sm-10 -->
	</section>
<%@ include file="/views/common/adminFooter.jsp" %>
</body>
</html>