<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jooTopia.board.model.vo.*, com.kh.jooTopia.member.model.vo.*"%>
<%
	Board board = (Board)request.getAttribute("board");
	Member member = (Member)request.getAttribute("member");

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
      	 				<td colspan="4"><h3><%=board.getbTitle() %></h3></td>
      	 			</tr>
      	 			<tr>
      	 				<td></td>
      	 				<td width="70px">작성일</td>
      	 				<td><%=board.getbDate() %></td>
      	 				<td width="70px">작성자</td>
      	 				<td><%=member.getUserId() %></td>
      	 			</tr>
      	 			
      	 			<tr>
      	 				<td><h3>내용</h3></td>
      	 				<td colspan="4">
      	 					<textarea id="contentArea" name="content" cols="92%" rows="30" style="resize:none"><%=board.getbContent() %></textarea>
      	 				</td>
      	 			</tr>
      	 		</table>
      	 		<br>
      	 		<div id="replyTb" >
      	 		  <%if(board.getaStatus().equals("N")){ %>
      	 		  <table id="replySelectTable" class="replyModalTable" style="border:1px black">
			    		<tr>
			    			<th colspan="3">답변</th>
			    		</tr>	    		
			    		<tr>
			    			<td colspan="3"><textarea cols="90%" rows="5" style="resize:none" id="replyContent"></textarea></td>
			    		</tr>
	    			</table>
      	 		
      	 			<div id="searchBtnArea" align="center">
      	 				<input id="addReply" type="button" value="답변">
		   				<input type="reset" value="취소" >
      	 		  </div>
      	 		  <%}else{ %>
      	 		  	<table id="replySelectTable" class="replyModalTable" style="border:1px black">
			    		<tr>
			    			<th colspan="3">답변</th>
			    		</tr>	    		
			    		<tr>
			    			<td colspan="3"><textarea cols="90%" rows="5" style="resize:none" id="replyContent"><%=board.getaContent() %></textarea></td>
			    		</tr>
			    		<tr>
			    			<td>작성일</td>
			    			<td colspan="2"><%=board.getaDate() %></td>
			    		</tr>
	    			</table>
      	 		
      	 			<div id="searchBtnArea" align="center">
      	 				<input id="addReply" type="button" value="수정">
		   				<input type="button" onclick="gotoQnA();" value="취소" >
      	 		  </div>
      	 		  
      	 		  <%} %>
      	 		</div>
      	 		
      	 	</form>
      	 </div>
      </div>
   </section>
   
   <script>
   	   $(function(){
   		   
   		$("#addReply").click(function(){
   			var uno = 1;
   			var bid = <%=board.getbId()%>
   			var content = $("#replyContent").val();
   			
   			$.ajax({
   				url:"insertadminReply.do",
   				data:{
   					uno:uno,
   					content:content,
   					bid:bid
   				},
   				type:"post",
   				success:function(data){
   					/* var $replySelectTable = $("#replySelectTable");
					for(var key in data){
						var $tr = $("<tr>");
						var $titleTd = $("<td>").text("답변").css("width", "100px")
						var $contentTd = $("<td>").text(data[key].aContent).css("width","400px");
						var $dateTd = $("<td>").text(data[key].aDate).css("width","200px");
						
						$tr.append($titleTd);
						$tr.append($contentTd);
						$tr.append($dateTd);
						$replySelectTable.append($tr);
   					} */
   					window.location.reload();
   				},
   				error:function(){
   					console.log(data);
   				}
   			});
   		  });
   	   });
   	   
   	   function gotoQnA(){
   		location.href="<%= request.getContextPath() %>/selectAdminQnA.do";
   	   }
   	   
   
   </script>
   
   
   
   
   
<%@ include file="/views/common/adminFooter.jsp" %>
</body>
</html>











