<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.jooTopia.board.model.vo.*"%>
    
    <%
    Board b = (Board) request.getAttribute("b");
    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="jquery-3.4.0.min.js">
<link rel="stylesheet" href="/jootopia/css/common.css">
<title>JooTopia</title>
<style>
.outer{
      width:1200px;
      height:650px;
      background:white;
      color:black;
      margin-left:auto;
      margin-right:auto;
      margin-top:50px;
   }
  .detail td {
      text-align:center;
      width:1000px;
      border:1px solid #ddd;
   } 
   #titleImgArea {
      width:500px;
      height:300px;
      margin:0 auto;
   }
   #contentArea {
      height:30px;
   }
</style>
</head>
<body>
<%@ include file="/views/common/navigation.jsp" %>
	<section>
	
	<h1 align="center">FAQ TOTAL LIST</h1>
		<br>
		 <div class="outer" align="center">
		  
	      <table class="detail" align="center">
	     
	         <tr>
	         	<td style="display:none;" ><input type="hidden" value=<%= b.getbTitle() %> name="bid">제목</td>
	            <td colspan="10"><h3><%= b.getbTitle() %></h3></td>
	         </tr>
	         <tr>
	            <td style="display:none;"></td>
	            <td>조회수</td>
	            <td><label><%=b.getbCount() %></label></td>
	            <td>작성일</td>
	            <td><label><%=b.getModifyDate() %></label></td>
	         </tr>
	         <tr>
	            <td style="display:none;">내용</td>
	            <td colspan="5" height="400px"><label style="font-size:2em;"><%=b.getbContent() %></label></td>
	         </tr>
	         
	      </table>
	      
   </div>
			
			<div class ="newWriting" align="center">
         <button style="background-color:hsla(9, 100%, 64%, 0.6); color:#32435F; font-weight:bold; border:none;" type="button" class="btn btn-primary btn-lg" onclick="location.href='<%=request.getContextPath()%>/selectFaqTotalList.do'">목록</button> 
      </div>   
			
	<script>
	
	
	
	
	</script>
			
			
	</section>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>