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
	border:2px solid orangered;
}


</style>
<title>JooTopia</title>
</head>
<body>
<%@ include file="/views/common/adminNavigation.jsp" %>
   <section class="row">
      <%@ include file="/views/common/adminSideMenu.jsp" %>
      <div id="adminSection" class="col-sm-10">
      <h3 class="title">적치완료_상세</h3>
	    	<hr>
      
      <br />
		<br />
		<br />


		
				<div class="col-sm-6 imgArea">	
				<div id="ImgArea1">
				
					<img src="/jootopia/images/b1.jpg" id="Img1">
							
			</div>			
		</div>



		<div class="right">
			<table class="separate" border="1">
			<tr><th colspan="3" style="background: rgb(224, 224, 224); height: 35px;">적치완료상품 상세</th></tr>
				<tr>
					<td width="120">상품코드</td>
					<td width="500">a123</td>
				</tr>
				<tr>
					<td width="120">적치바코드</td>
					<td width="500">A123</td>
				</tr>
				
				<tr>
					<td width="120">적치일자</td>
					<td width="500">19/01/01</td>
				</tr>
				<tr>
					<td width="120">종류</td>
					<td width="500">가구</td>
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
			
			</div>
      	
      </div>
   </section>
<%@ include file="/views/common/adminFooter.jsp" %>
</body>
</html>