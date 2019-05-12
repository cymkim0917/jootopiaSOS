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
<title>JooTopia</title>
</head>
<body>
<%@ include file="/views/common/adminNavigation.jsp" %>
   <section class="row">
      <%@ include file="/views/common/adminSideMenu.jsp" %>
      <div id="adminSection" class="col-sm-10">
 
 
 	<h1><a href="buyWait3.jsp">매입대기</a></h1>
	<h1><a href="buyWaitDetail4.jsp">매입대기상세</a></h1>
	<h1><a href="buying5.jsp">매입진행</a></h1>
	<h1><a href="buyCheck6.jsp">검수 및 매입</a></h1>
	<h1><a href="buyEnd7.jsp">매입완료</a></h1>
	<h1><a href="product8.jsp">상품등록</a></h1>
	<h1><a href="heapWait9.jsp">상품적치 대기</a></h1>
	<h1><a href="heapBarcode10.jsp">적치바코드 등록</a></h1>
	<h1><a href="heapEnd11.jsp">상품적치완료</a></h1>
	<h1><a href="heapDetail12.jsp">적치완료상품 상세</a></h1>
	<h1><a href="stockList13.jsp">재고조회</a></h1>
	<h1><a href="releaseList14.jsp">상품출고리스트</a></h1>
 	
	
	
	<hr>
	<div align="center">
		<ul class="pagination">
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
		</ul>
	</div>
	</div>
      	
      	
     
   </section>
<%@ include file="/views/common/adminFooter.jsp" %>
</body>
</html>