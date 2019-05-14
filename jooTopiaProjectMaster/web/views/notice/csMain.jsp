<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<!-- <link rel="stylesheet" href="/jootopia/js/external/jquery-3.4.0.min.js"> -->
<link rel="stylesheet" href="/jootopia/css/user/common.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<title>JooTopia</title>
<style>
.bgstick {
  background-color: coral;
  
  height:200px;
 /*  width:2000px; */
  
}

.notice {
	text-align: center;
	
	padding: 50px;
}
 .notice button {
	width:100px;
	height:100px;
	border:1px solid black;
	margin-left: 100px;
	
} 
</style>


</head>
<body>
<%@ include file="/views/common/navigation.jsp" %>
	<section>
		<br>
		<h1 align="center">고객센터</h1><br><br>
		
		 <div class = "bgstick" align="center">
			<!-- 
			<button style="submit" height="100px" width="200px">공지사항</button>&nbsp;
			<!-- <button style="submit">상품후기</button>&nbsp;
			<button style="submit">FAQ</button>
			<input type="submit" value="공지사항" style="height:100px; width:200px; margin-top:50px;" a href="/jootopia/views/notice/productListPlus.jsp">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" value="상품후기" style="height:100px; width:200px; margin-top:50px;">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="submit" value="FAQ" style="height:100px; width:200px; margin-top:50px;"> -->
			 
			
			<div class="notice">
			<%-- <button onclick="location.href='<%=request.getContextPath()%>/views/notice/noticeList.jsp'">공지사항</button> --%>
			
			<button onclick="location.href='<%=request.getContextPath()%>/selectList.do'">공지사항</button>
			<button onclick="location.href='<%=request.getContextPath()%>/views/notice/reviewList.jsp'">상품후기</button>
			<button onclick="location.href='<%=request.getContextPath()%>/selectFaqList.do'">FAQ</button>
			</div>
			
			
		</div>
		
	
		
		<br><br>
		<div class="csMain" align="center">
		<h2>고객 상담 응대 시간</h2>
		<p>평일 : 7시~19시</p>
		<br><br>
		<p>이메일 : jootopia@gmail.com</p>
		<p>전화번호 : 02)3333 - 3333</p>
		</div>
		


		
		
		
	</section>
	<br><br>
<%@ include file="/views/common/footer.jsp" %>
<%--  <script>
	$(function(){
		$("#notice").click(function(){
			location.href="<%=request.getContextPath()%>/views/notice/noticeList.jsp";
		});
	});
	
	
	$(function(){
		$("#notice").click(function(){
			location.href="<%=request.getContextPath()%>/views/notice/reviewList.jsp";
		});
	});
	
	
	$(function(){
		$("#notice").click(function(){
			location.href="<%=request.getContextPath()%>/views/notice/faqList.jsp";
		});
	});
	
	
	
	
	
</script>  --%>
</body>
</html>