<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">

<!-- bootstrap연결 -->
<link rel="stylesheet" href="/jootopia/css/external/bootstrap.min.css">
<script src="/jootopia/js/external/jquery-3.4.0.min.js"></script>
<script src="/jootopia/js/external/bootstrap.min.js"></script>

<link rel="stylesheet" href="/jootopia/css/admin/adminCommon.css">
<link rel="stylesheet" href="/jootopia/css/errorPage500.css">

<link href="https://fonts.googleapis.com/css?family=Encode+Sans+Semi+Condensed:100,200,300,400" rel="stylesheet">
<title>JooTopia</title>
<style>
header, body, html{
	width: 100%;
}
header{
	padding: 0 5%;
}
section{
	padding-bottom: 0;
	margin-bottom: 0;
}
.message{
	position:relative;
	top: -100px;
}
.message button, .btn, .btn-font{
	font-family: 'Encode Sans Semi Condensed';
}
</style>
</head>
<body class="loading">
<%@ include file="/views/common/adminNavigation.jsp" %>

	<section class="row">
	  <h1>500</h1>
	  <h2>Unexpected Error <b>:(</b></h2>
	  <div class="gears">
	    <div class="gear one">
	      <div class="bar"></div>
	      <div class="bar"></div>
	      <div class="bar"></div>
	    </div>
	    <div class="gear two">
	      <div class="bar"></div>
	      <div class="bar"></div>
	      <div class="bar"></div>
	    </div>
	    <div class="gear three">
	      <div class="bar"></div>
	      <div class="bar"></div>
	      <div class="bar"></div>
	    </div>
		  <div align="center" class="message">
		  	<button class="btn btn-lg btn-font">메인페이지로 이동</button>
		  </div>
	  </div>
	</section>
<%@ include file="/views/common/adminFooter.jsp" %>
<script>
	$(function() {
		setTimeout(function() {
			$('body').removeClass('loading');
		}, 1000);
	});
</script>
</body>
</html>







