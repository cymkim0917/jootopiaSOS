<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.jooTopia.heap.model.vo.*, java.util.*"%>

	<% HeapAdmin h = (HeapAdmin) request.getAttribute("h"); %> 

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

			<h3 class="title">적치등록</h3>
			<hr>
			<br />

			<div class="imgArea" align="center">
				<div id="ImgArea1">
					<!-- <img src="/jootopia/images/so.jpg" id="Img1"> -->
					<img src="/jootopia/images/product/<%= h.getChangeName() %>">				
				</div>
			</div>

			<br />
			
			<div class="listArea1" align="center">
			<form action="<%=request.getContextPath()%>/insertAdminHeap.do" method="get">
				<table class="separate" border="1">
					<%-- <tr>
						<td width="120">매입번호</td>
						<td width="500"><%= h.getPcdId() %>
						<input type="hidden" name="pcdId" value="<%= h.getPcdId() %>">
						</td>
					</tr> --%>
					<tr>
						<td width="120">상품번호</td>
						<td width="500"><%= h.getpId() %>
						<input type="hidden" name="pId" value="<%= h.getpId() %>">
						</td>
					</tr>					
					<!-- <tr>
						<td width="120">적치일자 등록</td>
						<td id="selectDate" colspan="2">
						<input type="date" name="hDate">					
					</td> 
					</tr>-->
					<tr>
						<td width="120">위치바코드</td>
						<td width="500">
						<input type="text" placeholder="위치바코드를 입력하세요" name="lbarcode">
						</td>
					</tr>										
				</table>
				<br /><br />
			<div align="center" class="btnArea">
				<button type="submit">등록</button>
			</div>
				</form>
			</div>
				
				<br />
				
		</div>
		
	</section>
	<%@ include file="/views/common/adminFooter.jsp"%>
</body>
</html>