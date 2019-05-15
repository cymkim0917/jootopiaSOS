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

</style>
</head>
<body>
<%@ include file="/views/common/adminNavigation.jsp" %>
   <section class="row">
      <%@ include file="/views/common/adminSideMenu.jsp" %>
      <div class="col-sm-10">
      <h3 class="title">글쓰기</h3>
	  <hr>
     
      	 	<div id="cateArea">
      	 		<table width="50%">
      	 			<tr>
      	 				<td><h3>분류</h3></td>
      	 				<td>
      	 					<input id="cate" type="radio" name="category" value="notice" checked="checked"> <label>공지사항</label>
      	 					<input id="cate" type="radio" name="category" value="event"> <label>이벤트</label>
      	 				</td>
      	 			</tr>
      	 		</table>
      	 	</div>
      	 <div id="insertArea" ailgn="center">
      	 	<form id="insertNoti" action="<%=request.getContextPath() %>/insertAdminNotice.do" method="post" encType="multipart/form-data">
      	 		<table id="insertNoticeTb" width="100%">
      	 			<tr>
      	 				<td><h3>제목</h3></td>
      	 				<td><input type="text" size="90%" name="title"></td>
      	 			</tr>
      	 			<tr>
      	 				<td><h3>파일첨부</h3></td>
      	 				<td>
      	 					<input id="file1" type="file" name="file1">
      	 					<input id="file1" type="file" name="file2">
      	 					<input id="file3" type="file" name="file3">
      	 				</td>
      	 			</tr>
      	 			<tr>
      	 				<td><br></td>
      	 			</tr>
      	 			<tr>
      	 				<td><h3>내용</h3></td>
      	 				<td><textarea cols="92%" rows="30" style="resize:none" name="content"></textarea></td>
      	 			</tr>
      	 		</table>
      	 		<br>
      	 			<div id="searchBtnArea" align="center">
      	 				<input type="submit" value="등록" >
		   				<input type="reset" value="취소" >
      	 			</div>
      	 	</form>
      	 		<form id="insertEvent" action="<%=request.getContextPath() %>/insertAdminEvent.do" method="post" encType="multipart/form-data" style="display:none;" >
      	 		<table id="insertEventTb" width="100%">
      	 			<tr>
      	 				<td><h3>제목</h3></td>
      	 				<td><input type="text" size="90%" name="title"></td>
      	 			</tr>
      	 			<tr>
      	 				<td><h3>이벤트 기간</h3></td>
      	 				<td>
	      	 				<input type="date" id="startDate" name="startDate" class="date" > ~ 
							<input type="date" id="endDate" name="endDate" class="date" >
						</td>
      	 			</tr>
      	 			<tr>
      	 				<td><h3>파일첨부</h3></td>
      	 				<td>
      	 					<input id="file1" type="file" name="file1">
      	 					<input id="file1" type="file" name="file2">
      	 					<input id="file3" type="file" name="file3">
      	 				</td>
      	 			</tr>
      	 			<tr>
      	 				<td><br></td>
      	 			</tr>
      	 			<tr>
      	 				<td><h3>내용</h3></td>
      	 				<td><textarea cols="92%" rows="30" style="resize:none" name="content"></textarea></td>
      	 			</tr>
      	 		</table>
      	 		<br>
      	 			<div id="searchBtnArea" align="center">
      	 				<input type="submit" value="등록" >
		   				<input type="reset" value="취소" >
      	 			</div>
      	 	</form>
      	 </div>
      </div>
   </section>
  <script>
  	$(document).ready(function(){
  		
	  $("input[name='category']:radio").change(function(){
	  		var category = this.value;
	  		if(category =='notice'){
	  			$("#insertNoti").show();
	  			$("#insertEvent").hide();
	  			
	  		}else if(category=='event'){
	  			$("#insertNoti").hide();
	  			$("#insertEvent").show();
	  			
	  		}
	  			
	  	
	  
	  });
  		
  	});		
  
  
  </script>
  
  
   
<%@ include file="/views/common/adminFooter.jsp" %>
</body>
</html>