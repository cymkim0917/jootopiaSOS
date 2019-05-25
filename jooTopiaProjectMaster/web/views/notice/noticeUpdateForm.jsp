<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.jooTopia.board.model.vo.*"%>
    
<%
	Notice n = (Notice) request.getAttribute("n");

%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="/jootopia/js/external/jquery-3.4.0.min.js">
<link rel="stylesheet" href="/jootopia/css/user/common.css">
<title>JooTopia</title>

<!-- <style>



.containaer{
	margin-left:15%;
	margin-right:150px;
	margin-top:50px;
	width:1000px;
	height:800px;
	border:1px solid black;
	text-align:center;
}

.table-bordered tr th{
	 background-color:lightgray;
	 width:80px;
}
</style> -->

<style>
   <!--게시판 형식 -->
   /* .containaer{
   margin-left:250px;
   margin-right:150px;

   width:1000px;
   height:800px;
   }

   .table-bordered tr th{
    background-color:lightgray;
    width:80px;
   
   } */
   <!--게시판 형식 -->
   .outer{
      width:1000px;
      height:650px;
      background:black;
      color:black;
      margin-left:auto;
      margin-right:auto;
      margin-top:50px;
   }
  .detail td {
      text-align:center;
      width:1000px;
      border:1px solid black;
   } 
   #titleImgArea {
      width:500px;
      height:300px;
      margin:0 auto;
   }
   #contentArea {
      height:30px;
   }
   .detailImgArea {
      width:250px;
      height:210px;
      margin:0 auto;
   }
   #titleImg {
      width:500px;
      height:300px;
   }
   .detailImg {
      width:250px;
      height:180px;
   }
   
</style>


</head>
<body>
<%@ include file="/views/common/navigation.jsp" %>
	<section>
		<h1 align="center">공지사항/이벤트</h1>
		<br>
		<%-- <div class="containaer" align="center">
			<table class="listArea">
				<tbody>
					<tr>
						<th>제목</th>
						<td><%= n.getbTitle() %></td>
						<td><%=n.getModifyDate() %></td>
						<!-- <td><input type="text" placeholder="제목을 입력하세요" name="subject" style="width:900px;"></td> -->
					</tr>
					<tr>
						<th>내용</th>
						<ht><%=n.getbContent() %></ht>
						<!-- <td><textArea cols="10" placeholder="내용을 입력하세요" name="content" style="width:1000px; height:500px"></textArea></td> -->
						<!-- <td height="500px">내용입니다.</td> -->
						<td></td>
					</tr>
				</tbody>
			</table>
			</div>
		<div class ="newWriting" align="center">
			<button onclick="location.href='<%=request.getContextPath()%>/selectList.do'">목록</button> 
		</div>	
		/////////////////////////////////
		(신테이블) --%>
		
		  <div class="outer">
		  
		  <form action="" id="noticeForm">
	      <table class="detail" align="center">
	     
	         <tr>
	         	<td><input type="hidden" value=<%= n.getbId() %> name="bid" /></td>
	            <td width="50">제목</td>
	            <td colspan="5"><input type="text" name="title" value="<%= n.getbTitle() %>"/></td>	            
	         </tr>
	         <tr>
	            
	            <td>조회수</td>
	            <td><input type="text" value="<%=n.getbCount() %>" /></td>	            
	            <td>작성일</td>
	            <td><label><%=n.getModifyDate() %></label></td>
	         </tr>
	         <tr>
	            <td>내용</td>
	            <td><textarea name="content" id="" cols="30" rows="10">
	            <%=n.getbContent() %>
	            </textarea></td>
	         </tr>
	         
	      </table>
	      </form>
   </div>
   <br><br><br>
       <div class="notice" align="center">
	         <button onclick="location.href='<%=request.getContextPath()%>/selectReviewTotalList.do'">목록</button>
	         <button onclick="updateNotice();">수정</button>
	         <button onclick="review_delete();">삭제</button>
			      <script>
			      function review_delete(){
			    	  <% if(loginUser== null){ %>
			    	  	alert('로그인 후 이용가능한 서비스입니다');
			    	  	return false;
			    	  <% }else{%>
			    	  
			    	  var uno = <%=loginUser.getUno()%>		
			    	  
			    	  if(uno==1){
			    	  
			         alert("게시물을 삭제하시겠습니까?");
			         $("#noticeForm").attr("action","<%= request.getContextPath() %>/deleteNotice.do").submit();
			    		  
			    	  }else{
			    		  alert('권한이 없습니다.');
			    	  }
			         
			         <% } %>
			      }
			      
			      function updateNotice(){
			    	  <% if(loginUser== null){ %>
			    	  	alert('로그인 후 이용가능한 서비스입니다');
			    	  	return false;
			    	  <% }else{%>
			    	  
			    	  var uno = <%=loginUser.getUno()%>		
			    	  
			    	  if(uno==1){
			    	  
			         alert("게시물을 수정하시겠습니까?");
			         $("#noticeForm").attr("action","<%= request.getContextPath() %>/updateNotice.do").submit();
			    		  
			    	  }else{
			    		  alert('권한이 없습니다.');
			    	  }
			         
			         <% } %>  
			      }
			      </script>
         </div>
		
				
			
	</section>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>