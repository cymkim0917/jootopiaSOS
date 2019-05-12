<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
					<tr>
						<th>No.</th>
						<th>상품명</th>
						<th>결제 금액</th>
						<th>주문일</th>
						<th>배송 정보</th>
					</tr>
					<tr style="color:black;">
						<td>1</td>
						<td><a href="detailOrderPage.jsp">멀미나는 쇼파</a></td>
						<td>200,000</td>
						<td>2019-04-17</td>
						<td><a href="#" id="delBtn">조회</a></td>
					</tr>
					<tr>
						<td>2</td>
						<td><a href="#">스치면 부러지는 의자</a></td>
						<td>100,000</td>
						<td>2019-04-12</td>
						<td><a href="#" id="delBtn">조회</a></td>
					</tr>	
					<tr>
						<td>3</td>
						<td><a href="#">흔들리지 않는 흔들 의자</a></td>
						<td>50,000</td>
						<td>2019-03-17</td>
						<td><a href="#" id="delBtn">조회</a></td>
					</tr>
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