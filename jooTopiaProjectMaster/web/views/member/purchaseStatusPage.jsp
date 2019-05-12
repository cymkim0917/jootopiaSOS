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
		<br />
			<h1>매입 내역 상세 페이지</h1>
			<br />
			<div class="col-sm-2"></div>
			<div class="col-sm-3">
			
			<table>
				<tr>
					<td rowspan="4">
					<img src="/jootopia/images/so.jpg" alt="" style="width:280px; heihgt:200px;"/>
					</td>
				</tr>
			</table>
			</div>
			
			<div class="col-sm-5">
				<table class="table">
					<tr>
						<td><label for="">제품명</label></td>
						<td>다리 하나 없는 소파</td>
					</tr>
					<tr>
						<td><label for="">매입 신청일</label></td>
						<td>2019-04-17</td>
					</tr>				
					<tr>
						<td><label for="">매입 승낙일</label></td>
						<td>2019-04-19</td>						
					</tr>	
					<tr>
						<td><label for="">처리 금액</label></td>
						<td>65,000</td>
					</tr>
					<tr>						
						<td colspan="2" rowspan="2" style="text-align:center;"><label>처리 현황</label><br />
						<img src="/jootopia/images/sample.PNG" alt="" style="width:280px; heihgt:200px;"/>
						</td>
					</tr>
			<!-- 		<tr>
						<td colspan="2">
						<img src="/jootopia/images/sample.PNG" alt="" style="width:280px; heihgt:200px;"/>
						</td>
					</tr> -->
					<tr>
						<td> </td>
						<td> </td>
					</tr>
					<tr>
					
					</tr>
				</table>
			</div>
			
			<div class="col-sm-2"></div>				
		</div>
		<div align="center">
			<div class="btnArea" id="btnArea">
					<a href="boardListPage.jsp" id="modifyBtn">확인</a>
			</div>	
		</div>		
	</section>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>