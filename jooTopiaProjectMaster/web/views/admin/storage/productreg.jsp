<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.jooTopia.product.model.vo.*, java.util.*"%>
	
	<% ProductregAdmin p = (ProductregAdmin) request.getAttribute("p"); %> 
	
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
				<form action="<%=request.getContextPath()%>/insertAdminProductreg.do" method="get">
				<table class="separat<e></e>" border="1">
				
					<tr>
						<td width="120">매입번호</td>
						<td width="500"><%= p.getPcdId() %>
						<input type="hidden" name="pcdId" value="<%= p.getPcdId() %>"></td>
					</tr>
					<tr>
						<td width="120">대분류</td>
						<td width="500"><%= p.getcGroup() %>
						<input type="hidden" name="cGroup" value="<%= p.getcGroup() %>"></td>
					</tr>
					<tr>
						<td width="120">중분류</td>
						<td width="500"><%= p.getName() %>
						<input type="hidden" name="cName" value="<%= p.getName() %>"></td>
					</tr>
					<tr>
						<td width="120">브랜드</td>
						<td width="500"><%= p.getBrand() %>
						<input type="hidden" name="pBrand" value="<%= p.getBrand() %>"></td>
					</tr>
					<tr>
						<td width="120">모델</td>
						<td width="500"><%= p.getModel() %>
						<input type="hidden" name="pModel" value="<%= p.getModel() %>"></td>
					</tr>
					<tr>
						<td width="120">사용기간</td>
						<td width="500"><%= p.getuPeriod() %></td>
					</tr>
					<tr>
						<td width="120">구매원가</td>
						<td width="500" ><%= p.getpCost() %>
						<input type="hidden" name="pCost" value="<%= p.getpCost() %>"></td>
					</tr>
					<tr>
						<td width="120">판매희망가</td>
						<td width="500"><%= p.gethCost() %></td>
					</tr>
					<tr>
						<td width="120">메모</td>
						<td width="500"><%= p.getMemo() %></td>
					</tr>					
					<tr>
						<td width="120">상품명</td>
						<td width="500"><input name="pName" size="50"></td>
					</tr>
					<tr>
						<td width="120">상품등급</td>
						<td width="500">
						<select name="pGrade" id="">
							<option value="">---선택---</option>
							<option value="A">A</option>
							<option value="B">B</option>
							<option value="C">C</option>
							<option value="D">D</option>
						</select>
						</td>
					</tr>
					<tr>
						<td width="120">치수 및 비고</td>
						<td width="500"><textarea name="pContent" cols="120px" rows="5"></textarea></td>
					</tr>					
				</table>
				<div align="center" class="btnArea">
					<button type="submit">등록</button>
				</div>
				</form>
				<br>
			</div>
		</div>
			
		
		
	</section>
	<%@ include file="/views/common/adminFooter.jsp"%>
</body>
</html>