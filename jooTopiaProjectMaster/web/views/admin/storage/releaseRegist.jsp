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
<link rel="stylesheet" href="/jootopia/css/admin/adminCommon.css">
<style>
.separate {
	border-collapse: separate;
	border-spacing: 3px;
	border: 1px solid #ccc;
	width: 80%;	
}

.separate tr {
	height: 30px;
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
</style>
<title>JooTopia</title>
</head>
<body>
	<%@ include file="/views/common/adminNavigation.jsp"%>
	<section class="row">
		<%@ include file="/views/common/adminSideMenu.jsp"%>
		<div id="adminSection" class="col-sm-10">

			<h3 class="title">출고등록</h3>
			<hr>
			<br />

			<div class="imgArea" align="center">
				<div id="ImgArea1">
					<img src="/jootopia/images/so.jpg" id="Img1">
					<img src="/jootopia/images/so.jpg" id="Img2">
				</div>
			</div>

			<div class="listArea1" align="center">
				<table class="separate" border="1">
					<tr>
						<td width="120">주문번호</td>
						<td width="500">a123</td>
					</tr>
					<tr>
						<td width="120">배송번호</td>
						<td width="500">a123</td>
					</tr>
					<tr>
						<td width="120">적치코드</td>
						<td width="500">a123</td>
					</tr>
					<tr>
						<td width="120">위치번호</td>
						<td width="500">a123</td>
					</tr>
					<tr>
						<td width="120">출고번호</td>
						<td width="500">(자동생성)</td>
					</tr>
					<tr>
						<td width="120">출고일자 등록</td>
						<td id="selectDate" colspan="2">
						&nbsp;<a href="#" class="btnDate" period="0"><span>오늘</span></a>&nbsp;&nbsp;						
						<input type="date" id="releaseDate" name="releaseDate" class="date" <%-- value="<%= releaseDay %>" --%>>
						
					</td>
					</tr>		
				</table>
				<br />
			</div>
			<div align="center" class="btnArea">
				<button type="button">등록</button>
			</div>
		</div>
		
	</section>
	<%@ include file="/views/common/adminFooter.jsp"%>
</body>
</html>