<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="/jootopia/css/external/bootstrap.min.css">
<script src="/jootopia/js/external/jquery-3.4.0.min.js"></script>
<script src="/jootopia/js/external/bootstrap.min.js"></script>
<link rel="stylesheet" href="/jootopia/css/user/common.css">
<link rel="stylesheet" href="/jootopia/css/user/purchase.css">
<title>JooTopia</title>
</head>
<body>
<%@ include file="/views/common/navigation.jsp" %>
	<section>
		<h2 class="title">매입 신청 안내</h2>
		<div class="imgArea">
			<img src="#" alt="매입신청 안내에 대한 이미지가 들어가는 자리입니다." class="infoImg"><br>
		</div>
		<div class="btnArea" align="center">
			<button onclick="location.href='/jootopia/views/purchase/purchaseRequestForm.jsp'" class="jBtn">매입신청</button> &nbsp;
			<button onclick="location.href='/jootopia'" class="jBtn">돌아가기</button>	
		</div>
		
	</section>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>