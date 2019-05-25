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
</style>


</head>
<body>
<%@ include file="/views/common/navigation.jsp" %>
	<section>
	
	<h1 align="center">FAQ TOTAL LIST PLUS</h1>
		<br>
		<div class="containaer" align="center">
			<table class="listArea">
				<thead>
					
				</thead>
				
				<tbody>
					<tr>
						<th>제목</th>
						<td><%= b.getbTitle() %></td>
						<td><%=b.getModifyDate() %></td>
						<!-- <td><input type="text" placeholder="제목을 입력하세요" name="subject" style="width:900px;"></td> -->
					</tr>
					
					<tr>
						<th>내용</th>
						<td colspan="2" rowspan="2"><label for=""><%= b.getbContent() %></label></td>
						
						<!-- <td><textArea cols="10" placeholder="내용을 입력하세요" name="content" style="width:1000px; height:500px"></textArea></td> -->
						<!-- <td height="500px">내용입니다.</td> -->
					
					</tr>
					<tr>
					</tr>
				</tbody>
			
			</table>
			</div>
			
			<div class ="newWriting" align="center">
         <button onclick="location.href='<%=request.getContextPath()%>/selectFaqTotalList.do'">목록</button> 
      </div>   
			
	<script>
	
	
	
	
	</script>
			
			
	</section>
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>