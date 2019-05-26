<%@page import="com.kh.jooTopia.cart.model.vo.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% ArrayList<Cart> cart = (ArrayList<Cart>)request.getAttribute("cart"); %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="jquery-3.4.0.min.js">
<link rel="stylesheet" href="/jootopia/css/common.css">
<link rel="stylesheet" href="/jootopia/css/user/semantic.css">	
<title>JooTopia</title>
<style>
	div>h1{
		text-align:center;
		font-weight:bold;
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
	
	table{
		text-align:center;
	}
	
	#cartTable>td{
		height:120px;
		margin-top:auto;
	}
	
	th{
		text-align:center;
	}
	
</style>
</head>
<body>
<%@ include file="/views/common/navigation.jsp" %>
	<section>
		<br /><br />
		<div class="row">
			<h1>장바구니</h1>
			<br /><br />
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<form action="" id="cartForm" method="post">
				<table class="table" id="cartTable">
					<tr>
						<th>선택</th>
						<th>이미지</th>
						<th>상품번호</th>
						<th>제품명</th>
						<th>가격</th>
						<th>재고 여부</th>
					</tr>
					<% int totalPrice = 0;
					   int money = 0;
					 if(cart != null) { 
						
					%>
					
					
					<% for(int i =0; i<cart.size(); i++) { %>
						<tr>
							<td><% if(cart.get(i).getStatus().equals("판매중")) {%>
							<input type="checkBox" class="check" name="selectCart" id="selectCart" value="<%=cart.get(i).getCartId() %>" />
							<% } else{%> 
							<input type="checkBox" class="check" name="selectCart" id="selectCart" value="<%=cart.get(i).getCartId() %>" disabled="disabled"/>
							<% } %>
							</td>
							<td>
								<img src="<%= request.getContextPath() %>/images/product/<%= cart.get(i).getChange_name() %>" alt="" style="width:100px; height:100px;" />
							</td><!--  -->
							<td><label for=""><%= cart.get(i).getPid() %></label></td>
							<td><label for=""><%= cart.get(i).getPname() %></label></td>
							<td><label for=""><%= cart.get(i).getPrice() %></label>
							
							</td>
							<td><label for=""> <% if(cart.get(i).getStatus().equals("판매중")) {%> 재고 있음 <% } else{%> 재고 없음 <% } %>
							  </label></td>
						</tr>
				
					<% 
						totalPrice += cart.get(i).getPrice();
						} 
					}else { %>
						<tr>
							<td>
								<h1>등록된 장바구니가 없습니다.</h1>
							</td>
						</tr>
					<% } %>

				</table>
				</form>
				<table class="table">
					<tr>
						<td colspan="2">상품 금액</td>
						<td><%= totalPrice %></td>
					</tr>
					<tr>
						<td colspan="2">배송비</td>
						<td> 
							<% if(totalPrice > 150000){
								money = 0;
								%></td>
							<td><%= money %></td>
							<% } else{ money = 25000; %>
								<td><%= money %></td>
							<% } %>
						
					</tr>
					<tr>
						<td colspan="2" style="color:red; height:50px; font-weight:bold;">총 상품 금액</td>
						<td colspan="2" style="color:red; height:50px; font-weight:bold;"><%= totalPrice + money %></td>
					</tr>				
				</table>			
			</div>
			<div class="col-sm-3"></div>		
		</div>
		
		<div id="btnArea" align="center">
		<!-- <a href="modifyQaAPage.jsp" id="modifyBtn">주문하기</a> -->
		<a id="modifyBtn">주문하기</a>
		<a onclick="deleteCart()" id="delBtn">삭제하기</a>
		</div>
	</section>
	
	
	<script>
		$("#modifyBtn").click(function() {
			
			//체크한 상품 번호 가져오기
			var pIdArr = new Array();
			$(".check").each(function() {
				if($(this).is(":checked")) {
					pIdArr.push( $(this).parent().parent().children().eq(2).children().text() );
			}
			});
			
			console.log(pIdArr[0]);
			
			if(pIdArr != null) {
				var queryString = "";
				for(var i = 0; i < pIdArr.length; i++) {
					if(i != pIdArr.length-1) {
						queryString += pIdArr[i] + "+";
					}else {
						queryString += pIdArr[i];
					}
				}
				
				console.log(queryString);
				if(pIdArr.length > 0) {
					location.href="<%=request.getContextPath()%>/selectCartOrderOne.do?pId="+queryString;
				}else {
					alert("선택한 상품이 없습니다.");
				}
				
			}
			
		});
	
		function deleteCart(){
			
			$("#cartForm").attr("action","<%= request.getContextPath() %>/delCart.do").submit();			
		}
	</script>
	
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>