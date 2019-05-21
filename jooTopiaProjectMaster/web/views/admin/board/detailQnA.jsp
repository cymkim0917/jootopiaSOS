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
	#replyTb{
		margin-left:5%;
	}
	#searchBtnArea{
		margin-right:8%;
		margin-top:1%;
	}

</style>
<title>JooTopia</title>
</head>
<body>
<%@ include file="/views/common/adminNavigation.jsp" %>
   <section class="row">
      <%@ include file="/views/common/adminSideMenu.jsp" %>
      <div class="col-sm-10">
      	<h3 class="title">1:1게시판</h3>
	  <hr>
	  		<div id="insertArea">
      	 	<form action="<%=request.getContextPath() %>/updateAdminNotice.do" method="post" encType="multipart/form-data">
      	 		<table id="insertTb">
      	 			<tr>
      	 				<td width="8%"><h3>제목</h3></td>
      	 				<td colspan="4"></td>
      	 			</tr>
      	 			<tr>
      	 				<td></td>
      	 				<td width="70px">작성일</td>
      	 				<td>fewwe</td>
      	 				<td width="70px">작성자</td>
      	 				<td>wefw</td>
      	 			</tr>
      	 			
      	 			<tr>
      	 				<td><h3>내용</h3></td>
      	 				<td colspan="4">
      	 					<textarea id="contentArea" name="content" cols="92%" rows="30" style="resize:none"></textarea>
      	 				</td>
      	 			</tr>
      	 		</table>
      	 		<br>
      	 		<div id="replyTb" >
      	 		  <table class="replyModalTable">
			    		<tr>
			    			<th colspan="3">답변</th>
			    		</tr>	    		
			    		<tr>
			    			<td><textarea cols="90%" rows="5" style="resize:none"></textarea></td>
			    		</tr>
	    			</table>
      	 		
      	 			<div id="searchBtnArea" align="center">
      	 				<input type="submit" value="답변">
		   				<input type="reset" value="취소" >
      	 		  </div>
      	 		</div>
      	 	</form>
      	 </div>
      </div>
   </section>
<%@ include file="/views/common/adminFooter.jsp" %>
</body>
</html>