<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<!-- bootStrap -->
<link rel="stylesheet" href="/jootopia/css/external/bootstrap.min.css">
<script src="/jootopia/js/external/jquery-3.4.0.min.js"></script>
<script src="/jootopia/js/external/bootstrap.min.js"></script>

<link rel="stylesheet" href="/jootopia/css/admin/adminCommon.css">
<style>
.separate {
	border-collapse: separate;
	border-spacing: 3px;
	border: 1px solid #ccc;
	margin-left: 100px;
	margin-right: 10px;
}

.separate tr {
	height: 50px;
	padding: 5px;
}

.separate td {
	padding: 5px;
	background-color: #fafafa;
	border: 1px solid #ccc;
}

.imgArea img {
	width: 500px;
	height: 400px;
	margin-bottom: 20px;
	border: 2px solid orangered;
}

.btnArea {
	margin-bottom: 30px;
}

 #listArea1{
	 padding:10px; 	
} 
</style>
<title>JooTopia</title>
</head>
<body>
	<%@ include file="/views/common/adminNavigation.jsp"%>
	<section class="row">
		<%@ include file="/views/common/adminSideMenu.jsp"%>
		<div id="adminSection" class="col-sm-10">
		
		<h3 class="title">상품등록</h3>
	    	<hr>
			<br /> <br /> <br />
			
			<div class="col-sm-6 imgArea">
				<div id="ImgArea1">
					<img src="/jootopia/images/flower1.PNG" id="Img1">
				</div>
				<div id="ImgArea2">
					<img src="/jootopia/images/flower1.PNG" id="Img2">
				</div>
			</div>

			<div class="col-sm-6" id="listArea1">
				<table class="separate" border="1">
					<tr>
						<th colspan="3"
							style="background: rgb(224, 224, 224); height: 35px;">상품등록</th>
					</tr>
					<tr>
						<td width="120">상품코드</td>
						<td width="500">a123</td>
					</tr>
					<tr>
						<td width="120">브랜드</td>
						<td width="500">KH가구</td>
					</tr>

					<tr>
						<td width="120">상품등급</td>
						<td width="500">하</td>
					</tr>
					<tr>
						<td width="120">매입가</td>
						<td width="500">50,000</td>
					</tr>
				</table>
				<br />

				<table class="separate" border="1" align="center">
					<tr>
						<td width="120">상세치수</td>
						<td width="500"><textarea id="text1" cols="70" rows="15"></textarea></td>
					</tr>

					<tr>
						<td width="120">비고</td>
						<td width="500"><textarea id="text2" cols="70" rows="10"></textarea></td>
					</tr>
				</table>
				<br />

				<div align="center" class="btnArea">
					<button type="button">등록</button>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="/views/common/adminFooter.jsp"%>
</body>
</html>