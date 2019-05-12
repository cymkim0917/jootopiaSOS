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
		<br /><br />
		<h1>주문 취소</h1>
		<br /><br />
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<table class="table">
					<tr>
						<td><label for="">제품명</label></td>
						<td>멀미나는 소파</td>
					</tr>
					<tr>
						<td><label for="">주문일</label></td>
						<td>2019-04-17</td>
					</tr>		
					<tr>
						<td><label for="">환불 금액</label></td>
						<td>200,000</td>
					</tr>	
					<tr>
						<td><label for="">환불 사유</label></td>
						<td>
							<select name="" id="">
								<option value="1">단순 변심</option>
								<option value="2">취소 후 재주문</option>
								<option value="3">기타</option>
							</select>
						</td>
					</tr>
					<tr>
						<td> </td>
						<td> </td>
					</tr>
				</table>			
			</div>
			
			
			<div class="col-sm-3"></div>	
			
			</div>
			/
			<div align="center">
			<div class="btnArea" id="btnArea">
				<a href="orderCancelSuccessPage.jsp" id="modifyBtn">확인</a>					
		</div>		
		</div>
	</section>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>