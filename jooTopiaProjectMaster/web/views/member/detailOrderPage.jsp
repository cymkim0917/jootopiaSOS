<%@page import="com.kh.jooTopia.order.model.vo.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% Order order = (Order)request.getAttribute("order"); %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="jquery-3.4.0.min.js">
<link rel="stylesheet" href="/jootopia/css/common.css">
<title>JooTopia</title>
<style>
	div>h1{
		text-align:center;
		font-weight:bold;
	}
	
	table{
		text-align:center;
	}
	
	#modifyBtn{
		width:100px;
		background-color: #FFBB00;
	   border: none;
	   color:#fff;
	   padding: 15px 0;
	   text-align: center;
	   text-decoration: none;
	   display: inline-block;
	   font-size: 15px;
	   margin: 4px;
	   cursor: pointer;
	   border-radius:10px;
	}
	
	#delBtn{
		width:100px;
		background-color: #7A7A7A;
		border: none;
		color:#fff;
		padding: 15px 0;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 15px;
		margin: 4px;
		cursor: pointer;
		border-radius:10px;
	}
	
	#btnArea{
		text-align:center;
	}	
</style>
</head>
<body>
<%@ include file="/views/common/navigation.jsp" %>
	<section>
		<div class="row">
		<h1>주문 내역 상세 페이지</h1>
		<div class="col-sm-2"></div>
		<div class="col-sm-5">
		<br /><br /><br />
		
			<table class="table">
				<% if(order != null){ %>
			
				<tr>
					<td><label for="">제품명</label></td>
					<td><%= order.getPname() %></td>
				</tr>
				<tr>
					<td><label for="">주문일</label></td>
					<td><%= order.getpDate() %></td>
				</tr>
				<tr>
					<td><label for="">주문 상태</label></td>
					<td><%= order.getStatus() %></td>
				</tr>
				<tr>
					<td><label for="">주문 금액</label></td>
					<td><%= order.getPpice() %></td>
				</tr>
				<tr>
					<td><label for="">배송지</label></td>
					<td><%= order.getAddress() %></td>
				</tr>
				<tr>
					<td> </td>
					<td> </td>
				</tr>
				
				<% } %>
			</table>	

		</div>		
		<div class="col-sm-3">
		<br /><br />
			<table>
				
				<tr>
					<td rowspan="4">
					
					<img src="<%= request.getContextPath() %>/images_upload/<%= order.getChange_name() %>" alt="" style="width:280px; heihgt:200px;"/>
					</td>
				</tr>
			</table>
			
		</div>
		<div class="col-sm-2"></div>
		</div>
		
		
		<div align="center">
			<div class="btnArea" id="btnArea">
				<a href="<%= request.getContextPath() %>/orderList.do" id="modifyBtn">확인</a>
				<a onclick="orderCancle()" id="delBtn">주문취소</a>						
			</div>	
		</div>
		
	</section>
<%@ include file="/views/common/footer.jsp" %>
<script>
	function orderCancle() {
		var answer = window.confirm("주문을 취소 하시겠습니까?");
		
		if(answer) {
			console.log("dd");
			var poId = "<%=order.getPoid()%>";
			var reason = "입금 전 주문 취소";
			$.ajax({
				url : "insertAdminOrderCancle.do",
				type : "post",
				data : {poId : poId, reason : reason},
				success : function(data) {
					alert(data);
					location.href='orderList.do';
				},
				error : function(data) {
					alert("해당상품 주문취소 처리 실패");
				}
			});
		}
	}
</script>
</body>
</html>