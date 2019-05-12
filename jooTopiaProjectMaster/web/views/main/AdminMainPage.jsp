<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="/jootopia/css/external/bootstrap.min.css">
<link rel="stylesheet" href="/jootopia/js/external/jquery-3.4.0.min.js">
<script src="/jootopia/js/external/bootstrap.min.js"></script>
<link rel="stylesheet" href="/jootopia/css/admin/adminCommon.css">
<title>JooTopia</title>
</head>
<body>
<%@ include file="/views/common/adminNavigation.jsp" %>
	<section class="row">
	<%@ include file="/views/common/adminSideMenu.jsp" %>
		<div class="col-sm-10">
	    	<h3 align="center">Admin 메인페이지 입니다.</h3>
	    	<br><br>
	    	<h3 align="center" onclick="location.href='/jootopia'">
	    		User 메인페이지로 가기
	    	</h3>
	      	
	    </div><!-- col-sm-10 -->
	</section>
<%@ include file="/views/common/adminFooter.jsp" %>
</body>
</html>







