<%@page import="com.kh.jooTopia.order.model.vo.Order, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% ArrayList<Order> orderList = (ArrayList<Order>)request.getAttribute("orderList"); %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="jquery-3.4.0.min.js">
<link rel="stylesheet" href="/jootopia/css/common.css">
<title>JooTopia</title>
</head>
<style>
	#delBtn{
		width:50px;
		height:20px;
		background-color: #7A7A7A;
		border: none;
		color:#fff;
		padding: 15px 0;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 10px;
		margin: 4px;
		cursor: pointer;
		border-radius:10px;
	}
	
	table{
		text-align:center;
	}
	
	div>h1{
		text-align:center;
		font-weight:bold;
	}
	
	table>th{
		
	}
	
	table>tr>td{
		font-color:black;
	}
	
</style>
<body>
<%@ include file="/views/common/navigation.jsp" %>
	<section>
	<br /><br />
		<div class="row">
			<div class="col-sm-2"></div>
			<div class="col-sm-8">
			<br />
			<h1>주문 내역</h1>
			
			<br /><br />
				<table class="table table-striped">
	
					
					<% for(int i=0; i<orderList.size(); i++){ %>
					<tr>
						<td><%= i+1 %></td>
						<td>
						
						<input type="hidden" value="<%= orderList.get(i).getPoid() %>" name="poid" />
						<a href="#"><%= orderList.get(i).getPname() %></a>
						</td>
						<td><label for=""><%= orderList.get(i).getPpice() %></label></td>
						<td><label for=""><%= orderList.get(i).getpDate() %></label></td>
						<td><a href="#" id="delBtn">조회</a></td>
					</tr>
					
					<% } %>
				</table>
			
			<div class="text-center">
				<ul class="pagination">
					<li><a href="">1</a> </li>
					<li><a href="">2</a></li>
					<li><a href="">3</a></li>
					<li><a href="">4</a></li>
					<li><a href="">5</a></li>
				</ul>
			</div>
			</div>
			<div class="col-sm-2"></div>
		</div>
	</section>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>