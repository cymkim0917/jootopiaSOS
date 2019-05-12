<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- import="java.util.*, java.lang.*, com.kh.jooTopia.order.model.vo.*" -->
<%
	/* ArrayList<Order> list = new ArrayList<Order>();
	list.add(new Order()); */
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<!-- <link rel="stylesheet" href="/jootopia/js/external/jquery-3.4.0.min.js"> -->
<link rel="stylesheet" href="/jootopia/css/admin/adminCommon.css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<style>

</style>
<title>JooTopia</title>
</head>
<body>
<body>

	<%@ include file="/views/common/adminNavigation.jsp" %>
	
	<section class="row">
		<%@ include file="/views/common/adminSideMenu.jsp" %>
		
		<div class="col-sm-10">
		<h3 class="title">배송완료 주문상세</h3>
		<hr>
		
		<div id="infoArea">
		<table id="pInfo1">
			<tr>
				<th>상품명</th>
				<td><%= "상품명 임시" %></td>
			</tr>
			<tr>
				<th>주문코드</th>
				<td><%= "주문코드 임시" %></td>
			</tr>
			<tr>
				<th>주문상태</th>
				<td><%= "주문상태 임시" %></td>
			</tr>
		</table>
		</div>
		
		<br><br>
		
		<div id="infoArea">
		<table id="pInfo1">
			<tr>
				<th>배송코드</th>
				<td><%= "배송코드 임시" %></td>
			</tr>
			<tr>
				<th>배송예정일</th>
				<td><%= "배송예정일 임시" %></td>
			</tr>
			<tr>
				<th>배송기사 정보</th>
				<td><%= "배송기사 정보 임시" %></td>
			</tr>
			<tr>
				<th>배송지 주소</th>
				<td><%= "(우편번호) 배송지 주소 임시" %></td>
			</tr>
			<tr>
				<th>배송완료일</th>
				<td><%= "배송완료일 임시" %></td>
			</tr>
		</table>
		</div>
		
		<br><br>
		
		<div class="selectListArea">
			<form action="" method="post">
				<table id="selectList" class="selectList" border="1">
					<tr>
						<th colspan="7">주문내역</th>
					</tr>
					<tr>
						<th width="25px"><input type="checkbox" id="allCheck"></th>
						<th width="200px">품목별 주문번호</th>
						<th width="250px">상품명</th>
						<th width="30px">수량</th>
						<th width="100px">판매가(원)</th>
						<th width="100px">배송비(원)</th>
						<th width="100px">주문상태</th>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>O20190510-01</td>
						<td><a href="<%= request.getContextPath() %>/views/admin/product/productDetail.jsp">상품명</a></td>
						<td>1</td>
						<td>판매가(원)</td>
						<td>배송비(원)</td>
						<td>배송완료</td>
					</tr>
					<%-- <% for(Order o : list) { %>
					<tr>
						<td><input type="checkbox"></td>
						<td>품목별 주문번호</td>
						<td><a href="../product/productInfo.jsp">상품명</a></td>
						<td>수량</td>
						<td>판매가</td>
						<td>배송비</td>
						<td>주문상태</td>
					</tr>
					<% } %> --%>
					<tr>
						<th colspan="4">계</th>
						<th><%= "판매가 총액 임시" %></th>
						<th><%= "배송비 총액 임시" %></th>
						<th></th>
					</tr>
				</table>
				<div>
					<br>
					<button class="selectBtn" onclick="pTypeChange('주문취소')">주문취소</button>
				</div>
			</form>
		</div>
		
		<br><br>
		
		<div class="pInfo2Area">
		<table id="pInfo2">
			<tr><th colspan="2" height="40px">결제정보</th></tr>
			<tr>
				<th>상품구매금액</th>
				<td><%= "상품구매금액 임시" %> (원)</td>
			</tr>
			<tr>
				<th>배송비</th>
				<td><%= "배송비 임시" %> (원)</td>
			</tr>
			<tr>
				<th>총 실결제금액</th>
				<td><%= "총 실결제금액 임시" %></td>
			</tr>
		</table>
		</div>
		
		<br><br>
		
		<div class="pInfo2Area">
		<table id="pInfo2">
			<tr><th colspan="2" height="40px">결제수단</th></tr>
			<tr>
				<th>입금자명</th>
				<td><%= "입금자명 임시" %></td>
			</tr>
			<tr>
				<th>결제수단</th>
				<td><%= "결제수단 임시" %></td>
			</tr>
			<tr>
				<th>결제은행정보</th>
				<td><%= "결제은행정보/계좌/계좌명" %></td>
			</tr>
		</table>
		</div>
		
		<br><br>
		
		<div class="pInfo2Area">
		<table id="pInfo2">
			<tr><th colspan="2" height="40px">주문자 정보</th></tr>
			<tr>
				<th>주문자명</th>
				<td><%= "주문자명 임시" %> (회원)</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><%= "연락처 임시" %></td>
			</tr>
		</table>
		</div>
		
		<br><br>
		
		<div class="pInfo2Area">
		<table id="pInfo2">
			<tr><th colspan="2" height="40px">수령자 정보</th></tr>
			<tr>
				<th>수령자명</th>
				<td><%= "수령자명 임시" %></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><%= "연락처 임시" %></td>
			</tr>
			<tr>
				<th>배송지 주소</th>
				<td><%= "(우편번호) 배송지 주소 임시" %></td>
			</tr>
			<tr>
				<th>배송메시지</th>
				<td><%= "배송메시지 임시" %></td>
			</tr>
		</table>
		</div>
		
		<br>
		
		<div class="btnArea" align="center">
			<button onclick="location.href='paymentList.jsp'">확인</button>
		</div>
		<br><br>
		
		</div> <!-- col-sm-10 -->
	</section>
<%@ include file="/views/common/adminFooter.jsp" %>

<script>
	
</script>
</body>
</html>