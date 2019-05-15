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
<title>JooTopia</title>
<style>
	marquee{
		color:orangered;
	}
</style>
</head>
<body>
<%@ include file="/views/common/adminNavigation.jsp" %>
   <section class="row">
      <%@ include file="/views/common/adminSideMenu.jsp" %>
      <div id="adminSection" class="col-sm-10">
 
  
 
 	<h1><marquee behavior=alternate scrollAmount=30><b>어서와 창고 관리자 페이지야~</b></marquee></h1>
 	
 	
 	<h1><a href="buyWait.jsp">매입리스트</a></h1>
	<h1><a href="productreg.jsp">상품등록</a></h1>
	<h1><a href="heapWait.jsp">적치대기</a></h1>
	<h1><a href="heapRegist.jsp">적치등록</a></h1>
	<h1><a href="stockList.jsp">재고리스트</a></h1>
	<h1><a href="releaseWait.jsp">출고대기</a></h1>
	<h1><a href="releaseRegist.jsp">출고등록</a></h1>
	<h1><a href="releaseList.jsp">출고리스트</a></h1>	
	
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