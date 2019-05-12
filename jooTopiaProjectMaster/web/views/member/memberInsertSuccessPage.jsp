<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  %>  
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
	<br /><br /><br /><br />
		<div class="row">
			<div class="col-sm-3"></div>
			<div class="col-sm-6">
				<h1>회원 가입에 성공했습니다.</h1>
				<br /><br />	
				<div class="btnArea" id="btnArea">
					<a href="#" id="modifyBtn">메인으로</a>
					<a href="#" id="delBtn">로그인</a>
						
				</div>
			</div>
			<div class="col-sm-3"></div>
		</div>
	</section>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>