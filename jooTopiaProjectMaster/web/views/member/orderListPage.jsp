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
	
	#tempBtnArea{
		width:250px;
		top:0;
		left:0;
		background:rgb(53, 15, 15); 
		 margin: 0 auto;
		height:100vh;
		z-index:9999;
		
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
	#orderBtn{
		width:200px;
		background-color: white;
		border: 1px solid black;
		color:black;
		padding: 15px 0;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 15px;
		margin: 4px;
		cursor: pointer;
		border-radius:10px;
		
	}	
		#myTable{
		text-align:center;
		align:center;
		position:relative;
		left:80px; 
		
	}
</style>
<body>
<%@ include file="/views/common/navigation.jsp" %>
<%@ include file="/views/member/temp.jsp" %>
	<section>
	<br /><br />

		<div class="row">
			<div class="col-sm-7" id="myTable">
			<br />
			<h1>주문 내역</h1>
			
			<br /><br />
				<table class="table table-striped">
					<tr>
						<th>No.</th>
						<th>상품명</th>
						<th>가격</th>
						<th>주문 일자</th>
						<th>배송 조회</th>
				<!-- 		<th>배송 조회</th> -->
					</tr>
					
					<% for(int i=0; i<orderList.size(); i++){
						%>
					<tr>
						<td><%= i+1 %>
						<input type="hidden" value="<%= orderList.get(i).getOdid() %>" name="poid" />
						</td>
						<td>
						<a href="<%= request.getContextPath() %>/selectOrder.do?num=<%= orderList.get(i).getOdid() %>"><%= orderList.get(i).getPname() %></a>
						</td>
						<td><label for=""><%= orderList.get(i).getPpice() %></label></td>
						<td><label for=""><%= orderList.get(i).getpDate() %></label></td>
						<td><a href="#" id="delBtn">조회</a></td>
					</tr>
					
					<% } %>
				</table>
			
			
			</div>
			<div class="col-sm-2"></div>
		</div>
	</section>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>