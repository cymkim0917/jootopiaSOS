<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jooTopia.board.model.vo.*, java.util.*"%>
<%
	Board board = (Board) request.getAttribute("board");
	ArrayList<Attachment> fileList = (ArrayList<Attachment>)request.getAttribute("fileList");
	
	Attachment img1 = fileList.get(0);
	Attachment img2 = fileList.get(1);
	
%>
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
      	<h3 class="title">수정하기</h3>
	  <hr>
     
      	 <div id="insertArea">
      	 	<form action="<%=request.getContextPath() %>/updateAdminEvent.do" method="post" encType="multipart/form-data">
      	 		<table id="insertTb" width="100%">
      	 			<tr>
      	 				<td><h3>분류</h3></td>
      	 				<td>
      	 					<input type="radio" name="category" value="notice" disabled> <label>공지사항</label>
      	 					<input type="radio" name="category" value="event" checked disabled> <label>이벤트</label>
      	 				</td>
      	 			</tr>
      	 			<tr>
      	 				<td><h3>제목</h3></td>
      	 				<td><input type="text" size="90%" name="title" value="<%=board.getbTitle() %>"></td>
      	 			</tr>
      	 			<tr>
      	 				<td><h3>이벤트 기간</h3></td>
      	 				<td>
	      	 				<input type="date" id="startDate" name="startDate" class="date" value="<%=board.getStartDate()%>"> ~ 
							<input type="date" id="endDate" name="endDate" class="date" value="<%=board.getFinishDate()%>">
						</td>
      	 			</tr>
      	 			<tr>
      	 				<td><h3>사진첨부</h3></td>
      	 				<td>
      	 					<div id="contentImgArea1" style="float:left; margin-right:1%;">
      	 						<img id="contentImg1" width="120" height="100" src="<%=request.getContextPath()%>/images/event/<%=img1.getChangeName()%>">
      	 						<input type="hidden" name = "img1Fid" value="<%=img1.getfId()%>">
      	 					</div>
      	 					
      	 					<div id="contentImgArea2" style="float:left">
      	 						<img id="contentImg2" width="120" height="100" src="<%=request.getContextPath()%>/images/event/<%=img2.getChangeName()%>">
      	 						<input type="hidden" name = "img2Fid" value="<%=img2.getfId()%>">
      	 					</div>
      	 				</td>
      	 			</tr>
      	 			<tr>
      	 				<td><h3>사진</h3></td>
      	 				<td>
      	 					<div>
      	 						<img width="60%" id = "detailImg1" class="detailImg" src="<%=request.getContextPath() %>/images/event/<%=img1.getChangeName() %>">
      	 						<img width="60%" id = "detailImg2" class="detailImg" src="<%=request.getContextPath() %>/images/event/<%=img2.getChangeName() %>">
      	 					</div>
      	 				</td>
      	 			</tr>
      	 			<tr>
      	 				<td><br></td>
      	 			</tr>
      	 			<tr>
      	 				<td><h3>내용</h3></td>
      	 				<td colspan="">
      	 					<textarea id="contentArea" name="content" cols="92%" rows="30" style="resize:none"><%=board.getbContent() %></textarea>
      	 				</td>
      	 			</tr>
      	 			<tr>
      	 				<td style="display:none">
      	 					<input type="text" name="bId" value="<%=board.getbId() %>">
      	 				</td>
      	 			</tr>
      	 		</table>
      	 		<br>
      	 			<div id="searchBtnArea" align="center">
      	 				<input type="submit" value="수정">
		   				<input type="reset" value="취소" >
      	 			</div>
      	 			<div id="fileArea">
      	 				<input id="file1" type="file" name="file1" onchange="loadImg(this,1)">
      	 				<input id="file2" type="file" name="file2" onchange="loadImg(this,2)">
      	 			</div>
      	 			
      	 	</form>
      	 </div>
      </div>
   </section>
   <script>
 
   $(function(){
		  $("#fileArea").hide();
		 	 $("#contentImgArea1").click(function(){
				$("#file1").click();   				
			 });
			$("#contentImgArea2").click(function(){
				$("#file2").click(); 
			 });
	  });
   	 function loadImg(value, num){
	  if(value.files && value.files[0]){
			var reader = new FileReader();
			reader.onload = function(e){
				switch(num){
				case 1 : $("#contentImg1").attr("src",e.target.result); 
						$("#detailImg1").attr("src",e.target.result); break;
				case 2 : $("#contentImg2").attr("src",e.target.result); 
						$("#detailImg2").attr("src",e.target.result);break;
				}
				
				
			}
		reader.readAsDataURL(value.files[0]);	
		}
  }
   </script>
<%@ include file="/views/common/adminFooter.jsp" %>
</body>
</html>