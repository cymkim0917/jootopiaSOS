<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<table class="table" id="cartTable">
					<tr>
						<th>선택</th>
						<th>이미지</th>
						<th>상품번호</th>
						<th>제품명</th>
						<th>가격</th>
						<th>재고 여부</th>
					</tr>
					<tr>
						<td><input type="checkBox" /></td>
						<td>
						<img src="/jootopia/images/ch1.jpg" alt="" style="width:100px; heihgt:100px;"/>
						</td>
						<td>C001</td>
						<td>가로 세로 의자</td>
						<td>50,000</td>
						<td>O</td>
					</tr>
					<tr>
						<td><input type="checkBox" /></td>
						<td>
						<img src="/jootopia/images/ch2.jpg" alt="" style="width:100px; heihgt:100px;"/>
						</td>
						<td>C002</td>
						<td>옷장</td>
						<td>100,000</td>
						<td>O</td>
					</tr>
				</table>
				
				<table class="table">
					<tr>
						<td colspan="2">총 상품 금액</td>
						<td>150,000원</td>
					</tr>
					<tr>
						<td colspan="2">배송비</td>
						<td>0원</td>
					</tr>
					<tr>
						<td colspan="2" style="color:red; height:50px; font-weight:bold;">총 상품 금액</td>
						<td colspan="2" style="color:red; height:50px; font-weight:bold;">150,000원</td>
					</tr>				
				</table>			
			</div>
			<div class="col-sm-3"></div>		
		</div>
		
		<div id="btnArea" align="center">
		<a href="modifyQaAPage.jsp" id="modifyBtn">주문하기</a>
		<a href="modifyQaAPage.jsp" id="delBtn">삭제하기</a>
		</div>
	</section>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>