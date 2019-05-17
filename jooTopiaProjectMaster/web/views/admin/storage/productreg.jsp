<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.jooTopia.productreg.model.vo.*, java.util.*"%>
	
	<% ArrayList<ProductregAdmin> list = (ArrayList<ProductregAdmin>) request.getAttribute("list"); %>
	
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

.imgArea1 img {
	width: 500px;
	height: 400px;
	margin-bottom: 20px;
	border: 2px solid orangered;

}

.imgArea2 img {
	width: 165px;
	height: 120px;
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

			<h3 class="title">상품등록</h3>
			<hr>
			<br />

			<div class="imgArea1" align="center">
				<div id="ImgArea1">
					<img src="/jootopia/images/so.jpg" id="Img1">					
				</div>
			</div>
			<div class="imgArea2" align="center">
				<div id="ImgArea1">
					<img src="/jootopia/images/so.jpg" id="Img1">
					<img src="/jootopia/images/so.jpg" id="Img2">
					<img src="/jootopia/images/so.jpg" id="Img3">				
				</div>
				<div id="ImgArea1">
					<img src="/jootopia/images/so.jpg" id="Img4">
					<img src="/jootopia/images/so.jpg" id="Img5">
					<img src="/jootopia/images/so.jpg" id="Img6">				
				</div>
			</div>

			<div class="listArea1" align="center">
				<table class="separate" border="1">
				<%-- for(ProductregAdmin p : list){ --%>
					<tr>
						<td width="120">매입번호</td>
						<td width="500"><%--= p.getPcdId() --%></td>
					</tr>
					<!-- <tr>
						<td width="120">매입가</td>
						<td width="500"><input type="text" placeholder="매입가입력" size="117"></td>
					</tr> -->
					<!-- <tr>
						<td width="120">상품등급</td>
						<td width="500">
						<select name='level'>
								<option value='' selected>-- 선택 --</option>
								<option value='high'>상</option>
								<option value='middle'>중</option>
								<option value='row'>하</option>
						</select>
						</td>
					</tr> -->
					<%-- } --%>
					<tr>
						<td width="120">치수 및 비고</td>
						<td width="500"><textarea id="pcontent" cols="120px" rows="5"></textarea></td>
					</tr>
					<!-- <tr>
						<td width="120">비고</td>
						<td width="500"><textarea id="text2" cols="120px" rows="5"></textarea></td>
					</tr> -->
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