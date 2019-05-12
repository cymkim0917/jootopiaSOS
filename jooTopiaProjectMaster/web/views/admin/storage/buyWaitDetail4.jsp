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
	width: 230px;
	height: 230px;
	margin-bottom: 20px;
	border:2px solid orangered;
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
		<h3 class="title">매입대기_상세</h3>
	    	<hr>
			<br /> <br /> <br />
			<div class="col-sm-6 imgArea">
				<div id="ImgArea1">
					<img src="/jootopia/images/c1.jpg" id="Img1">					
					&nbsp;&nbsp;&nbsp; <img src="/jootopia/images/c1.jpg" id="Img2">
				</div>
				<div id="ImgArea2">
					<img src="/jootopia/images/c1.jpg" id="Img3">
					&nbsp;&nbsp;&nbsp; <img src="/jootopia/images/c1.jpg" id="Img4">
				</div>
				<div id="ImgArea3">
					<img src="/jootopia/images/c1.jpg" id="Img5">
					&nbsp;&nbsp;&nbsp; <img src="/jootopia/images/c1.jpg" id="Img6">
				</div>
			</div>
			<div class="col-sm-6">
				<table class="separate" border="1">
					<tr>
						<th colspan="3"
							style="background: rgb(224, 224, 224); height: 35px;">검수 및
							매입</th>
					</tr>
					<tr>
						<td width="120">상품코드</td>
						<td width="500">a123</td>
					</tr>
					<tr>
						<td width="120">아이디</td>
						<td width="500">abc</td>
					</tr>
					<tr>
						<td width="120">이름</td>
						<td width="500">김채굼</td>
					</tr>
					<tr>
						<td width="120">PHONE</td>
						<td width="500">010-0101-1010</td>
					</tr>
					<tr>
						<td width="120">주소</td>
						<td width="500">서울 강남</td>
					</tr>
					<tr>
						<td width="120">종류</td>
						<td width="500">침대</td>
					</tr>
					<tr>
						<td width="120">브랜드</td>
						<td width="500">KH가구</td>
					</tr>
					<tr>
						<td width="120">구매시기</td>
						<td width="500">00/01/01</td>
					</tr>
					<tr>
						<td width="120">희망가격</td>
						<td width="500">1,000,000</td>
					</tr>
					<tr>
						<td width="120">방문날짜</td>
						<td width="500">19/01/01</td>
					</tr>
					<tr>
						<td width="120">특이사항</td>
						<td width="500">실사용 2번뿐이 안한 상품</td>
					</tr>
					<tr>
						<td width="120">비고</td>
						<td width="500">방문하실때 연락주세요</td>
					</tr>

				</table>				
				<br />
			</div>
			<div align="center" class="btnArea">
				<button type="button">매입진행</button>				
			</div>
		</div>
	</section>
	<%@ include file="/views/common/adminFooter.jsp"%>
</body>
</html>