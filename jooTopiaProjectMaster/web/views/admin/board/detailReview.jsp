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
</head>
<body>
<%@ include file="/views/common/adminNavigation.jsp" %>
   <section class="row">
      <%@ include file="/views/common/adminSideMenu.jsp" %>
      <div class="col-sm-10">
      		<h3 class="title">후기게시판</h3>
	  <hr>
	  		<div id="insertArea">
      	 	<form action="<%=request.getContextPath() %>/updateAdminNotice.do" method="post" encType="multipart/form-data">
      	 		<table id="insertTb">
      	 			<tr>
      	 				<td>작성자</td>
      	 				<td>ddddddd</td>
      	 				<td>작성일</td>
      	 				<td>ddddddddd</td>
      	 				<td>카테고리</td>
      	 				<td>dddddddd</td>
      	 			</tr>
      	 			<tr>
      	 				<td><h3>제목</h3></td>
      	 				<td colspan="5"></td>
      	 			</tr>
      	 			<tr>
      	 				<td><h3>사진</h3></td>
      	 				<td colspan="5">
      	 					<div>
      	 						<img width="60%" id = "detailImg1" class="detailImg" src="">
      	 						<img width="60%" id = "detailImg2" class="detailImg" src="">
      	 					</div>
      	 				</td>
      	 			</tr>
      	 			<tr>
      	 				<td><h3>내용</h3></td>
      	 				<td colspan="5">
      	 					<textarea id="contentArea" name="content" cols="92%" rows="30" style="resize:none" readonly></textarea>
      	 				</td>
      	 			</tr>
      	 		</table>
      	 	</form>
      </div>
      </div>
   </section>
<%@ include file="/views/common/adminFooter.jsp" %>
</body>
</html>