<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%
	HashMap<String, Object> hmap = (HashMap<String, Object>) request.getAttribute("hmap");
	System.out.println("hmap: " + hmap);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="/jootopia/js/external/jquery-3.4.0.min.js">
<link rel="stylesheet" href="/jootopia/css/user/common.css">
<link rel="stylesheet" href="/jootopia/css/user/purchase.css">
<title>JooTopia</title>
</head>
<body>
	<%@ include file="/views/common/navigation.jsp"%>
	<section class="purchaseFin">
		<h3 align="center" style="font-weight:bold;">매입신청이 완료되셨습니다.</h3>
		<div>
			<table border="1">
				<tr>
					<th>항목</th>
					<th>상세정보</th>
				<tr>
				<tr>
					<td>신청자</td>
					<td><%= hmap.get("applicnat") %></td>
				<tr>
				<tr>
					<td>신청일자</td>
					<td><%= hmap.get("bDate") %></td>
				<tr>
				<tr>
					<td>주소</td>
					<td><%= hmap.get("appAddress") %></td>
				<tr>
				<tr>
					<td>거리 / 배송비</td>
					<td><%= hmap.get("appDistance") %> / <%= hmap.get("dPrice") %></td>
				<tr>
				<tr>
					<td>연락처</td>
					<td><%= hmap.get("appPhone") %></td>
				<tr>
				<tr>
					<td>신청 카테고리</td>
					<td><%= hmap.get("category") %></td>
				<tr>
				<tr>
					<td>브랜드</td>
					<td><%= hmap.get("brand") %></td>
				<tr>
				<tr>
					<td>모델명</td>
					<td><%= hmap.get("model") %></td>
				<tr>
				<tr>
					<td>사용기간</td>
					<td><%= hmap.get("usePeriod") %></td>
				<tr>
				<tr>
					<td>제품정가</td>
					<td><%= hmap.get("primeCost") %></td>
				<tr>
				<tr>
					<td>판매희망가격</td>
					<td><%= hmap.get("hopeCost") %></td>
				<tr>
				<tr>
					<td>상품특이사항</td>
					<td><%= hmap.get("bContent") %></td>
				<tr>
				<tr>
					<td>매입 요청 사항</td>
					<td><%= hmap.get("memo")  %></td>
				<tr>
			</table>
		</div>
		<div class="btnArea" align="center">
			<button onclick="location.href='/jootopia/views/member/boardListPage.jsp'"class="jBtn">마이페이지에서 확인하기</button>
		</div>

	</section>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>