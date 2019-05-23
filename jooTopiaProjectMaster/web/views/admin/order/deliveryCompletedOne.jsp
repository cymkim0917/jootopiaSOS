<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" 
    import="java.util.*, java.lang.*, com.kh.jooTopia.order.model.vo.*, com.kh.jooTopia.payment.model.vo.*,
    com.kh.jooTopia.delivery.model.vo.*"%>
<%
	HashMap<String, Object> hmap = (HashMap<String, Object>) request.getAttribute("hmap");
	POrder o = (POrder) hmap.get("o");
	Payment pym = (Payment) hmap.get("pym");
	Delivery d = (Delivery) hmap.get("d");
	ArrayList<HashMap<String, Object>> orderDetail = (ArrayList<HashMap<String, Object>>) hmap.get("orderDetail");
	
	int totalPPrice = 0;
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
		<h3 class="title">배송완료 주문상세</h3>
		<hr>
		
		<div id="infoArea">
		<table id="pInfo1">
			<tr>
				<th>주문코드</th>
				<td><%= o.getPoId() %></td>
			</tr>
			<tr>
				<th>주문상태</th>
				<td><%= o.getStatus() %></td>
			</tr>
		</table>
		</div>
		
		<br><br>
		
		<div id="infoArea">
		<table id="pInfo1">
			<tr>
				<th>배송코드</th>
				<td><%= d.getdId() %></td>
			</tr>
			<tr>
				<th>배송상태</th>
				<td><%= d.getStatus() %></td>
			</tr>
			<tr>
				<th>배송완료일</th>
				<td><%= d.getArriveDate() %></td>
			</tr>
			<tr>
				<th>배송지 주소</th>
				<td><%= o.getAddress() %></td>
			</tr>
		</table>
		</div>
		
		<br><br>
		
		<div class="selectListArea">
			<table id="selectList" class="selectList" border="1">
				<tr>
					<th colspan="6">주문내역</th>
				</tr>
				<tr>
					<th width="50px">상세 주문번호</th>
					<th width="50px">상품번호</th>
					<th width="150px">상품명</th>
					<th width="100px">판매가(원)</th>
					<th width="100px">배송비(원)</th>
					<th width="100px">주문상태</th>
				</tr>
				<% for(int i = 0; i < orderDetail.size(); i++) { 
				%>
				<tr>
					<td><%= orderDetail.get(i).get("odId") %></td>
					<td><%= orderDetail.get(i).get("pId") %></td>
					<td><%= orderDetail.get(i).get("pName") %></td>
					<td><%= orderDetail.get(i).get("pPrice") %></td>
					<% if(i == 0) { %>
					<td><%= pym.getDeliveryPrice() %></td>
					<% }else { %>
					<td>0</td>
					<% } %>
					<td><%= o.getStatus() %></td>
				</tr>
				<% } %>
				<tr>						
					<th colspan="3">계</th>
					<th><%= pym.getProductPrice() %></th>
					<th><%= pym.getDeliveryPrice() %></th>
					<th></th>
				</tr>
			</table>
		</div>
		
		<br><br>
		
		<div class="pInfo2Area">
		<table id="pInfo2">
			<tr><th colspan="2" height="40px">결제정보</th></tr>
			<tr>
				<th>상품구매금액</th>
				<td><%= pym.getProductPrice() %> (원)</td>
			</tr>
			<tr>
				<th>배송비</th>
				<td><%= pym.getDeliveryPrice() %> (원)</td>
			</tr>
			<tr>
				<th>총 실결제금액</th>
				<td><%= pym.getProductPrice() + pym.getDeliveryPrice() %> (원)</td>
			</tr>
		</table>
		</div>
		
		<br><br>
		
		<div class="pInfo2Area">
		<table id="pInfo2">
			<tr><th colspan="2" height="40px">결제수단</th></tr>
			<% if(pym.getPaymentOption().equals("카드")) { %>
			<tr>
				<th>결제수단</th>
				<td><%= pym.getPaymentOption() %></td>
			</tr>
			<tr>
				<th>TID</th>
				<td><%= pym.gettId() %></td>
			</tr>
			<tr>
				<th>카드정보</th>
				<td><%= pym.getCardCompany() %> / <%= pym.getCardKind() %></td>
			</tr>
			<tr>
				<th>결제정보</th>
				<td>결제일 : <%= pym.getPymDate() %> / <%= pym.getInstallment() %>개월 할부</td>
			</tr>
			<% }else { %>
			<tr>
				<th>결제수단</th>
				<td><%= pym.getPaymentOption() %></td>
			</tr>
			<tr>
				<th>입금자명</th>
				<td><%= pym.getDepositName() %></td>
			</tr>
			<tr>
				<th>입금일</th>
				<td><%= pym.getDepositDate() %></td>
			</tr>
			<% } %>
		</table>
		</div>
		
		<br><br>
		
		<div class="pInfo2Area">
		<table id="pInfo2">
			<tr><th colspan="2" height="40px">주문자 정보</th></tr>
			<tr>
				<th>주문자명</th>
				<td><%= hmap.get("userName") %> (회원)</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><%= hmap.get("mPhone") %></td>
			</tr>
		</table>
		</div>
		
		<br><br>
		
		<div class="pInfo2Area">
		<table id="pInfo2">
			<tr><th colspan="2" height="40px">수령자 정보</th></tr>
			<tr>
				<th>수령자명</th>
				<td><%= o.getName() %></td>
			</tr>
			<tr>
				<th>연락처</th>
				<td><%= o.getPhone() %></td>
			</tr>
			<tr>
				<th>배송주소</th>
				<td><%= o.getAddress() %></td>
			</tr>
			<tr>
				<th>배송메시지</th>
				<td><%= o.getdMessage() %></td>
			</tr>
		</table>
		</div>
		
		<br>
		
		<div class="btnArea" align="center">
			<button onclick="location.href='selectAdminDelCompletedList.do'">확인</button>
		</div>
		<br><br>
		
		</div> <!-- col-sm-10 -->
	</section>
<%@ include file="/views/common/adminFooter.jsp" %>

</body>
</html>