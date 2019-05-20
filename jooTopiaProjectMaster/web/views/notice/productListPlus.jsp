<%@page import="com.kh.jooTopia.product.model.vo.*"%>
<%@page import="com.kh.jooTopia.board.model.vo.Attachment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% HashMap<String, Object> detailProc = (HashMap<String, Object>)request.getAttribute("detailProc"); 
	ArrayList<Attachment> attList = (ArrayList<Attachment>)detailProc.get("attachment");	
	
	Product product = (Product)detailProc.get("product");
	Category category = (Category)detailProc.get("category");
	String useDate = String.valueOf(detailProc.get("useDate"));

%>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="/jootopia/js/external/jquery-3.4.0.min.js">
<link rel="stylesheet" href="/jootopia/css/user/common.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<title>JooTopia</title>
</head>
<body>
<%@ include file="/views/common/navigation.jsp" %>
	<section>
		
		<br>
		<div class="product" align="center" style="text-align:center;">
		
		<table border="1px" class="table">
		<tr>
			<td style="text-align:right;" colspan="2">카테고리 <span> <%= category.getcGroup() %> > </span> <span><%= category.getName() %></span></td>
		</tr>
		<tr>
			<td rowspan="4"><img src="<%= request.getContextPath() %>/images_upload/<%= attList.get(0).getChangeName() %>" width="300px" height="300px"alt="" /></td>
			<td><label for=""><%= product.getpBrand() %> <%= product.getpName() %></label></td>
		</tr>
		<tr><td><label for="">모델명 : <%= product.getpModelName() %> </label></td></tr>
		<tr><td><label for="">가격 : <%= product.getpPrice() %></label></td></tr>
		<tr>
		<td><label for="">분류 : <%= category.getName() %></label></td>		
		</tr>
		<!-- <img src="/jootopia/images/desk1.jpg" width="600px" height="600px"> -->
		<tr>
		<td colspan="2">
		<p>--------------------------------------------------------------------------</p>
		
		<h3><%= product.getpBrand() %> <%= product.getpName() %> ( <%= product.getpModelName() %> )</h3>
		<h5>중고품가격 : <%= product.getpPrice() %> 원</h5>
		<p>제조사 : <%= product.getpBrand() %></p>
		<p>사용 일수 :  <%= useDate %> </p>
		<br>
		<button type="submit">장바구니 넣기</button>
		<br><br>
		<button type="submit">구매하기</button>
		<br><br>
		<p>--------------------------------------------------------------------------</p>
		</td>
		</tr>
		</table>
		</div>
		
		<div class ="productMenual" align="center">
		<table>
		<tr>
			<td><h3><%= product.getpContent()  %></h3></td>
		</tr>
		
		<% if(attList.size() >1){ %>
			<% for(int i=1; i<attList.size();i++) { %>
			
			<tr>
				<td><img src="<%= request.getContextPath() %>/images_upload/<%= attList.get(i).getChangeName() %>" alt="" /></td>
			</tr>
			<% } 
			
			} %>
		</table>
		</div>
		
		
		
		
		
	</section>
	

<%@ include file="/views/common/footer.jsp" %>
</body>
</html>