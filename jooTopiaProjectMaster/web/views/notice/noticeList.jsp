<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.jooTopia.notice.model.vo.*"%>
    
<%
	ArrayList<Notice> list = (ArrayList<Notice>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="/jootopia/js/external/jquery-3.4.0.min.js">
<link rel="stylesheet" href="/jootopia/css/user/common.css">


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<style>
	.checkboxgroup{
		margin-left:10%;
		
	}

</style>

<title>JooTopia</title>
</head>
<body>
<%@ include file="/views/common/navigation.jsp" %>
	<section>
	<br>
		<h1 align="center">공지사항</h1>
		<br>
		
		<!-- noticeList.jsp -->

		<%-- <div class="container">
		        <table class="table table-hover">
		          
		            <tr>
		              <th>글번호</th>
		              <th>유형</th>
		              <th>제목</th>
		              <th>작성자</th>
		              <th>작성일</th>
		              <th>조회수</th>
		            </tr>
		         
		      
		            <%for(Notice n : list){ %>
		            <tr>
		              <td><%=n.getbNo() %></td>
		              <td><%=n.getbType() %></td>
		              <td><%=n.getbTitle() %></td>
		              <td><%=n.getbId() %></td>
		              <td><%=n.getModify_date() %></td>
		              <td><%=n.getbCount() %></td>
		            </tr>
		            <%} %>
		         
		        </table>
		      </div>
		       --%>
		   
		   <!-- ------------------------------------ -->
		    <br>
		      <h1 align="center">공지사항</h1>
		      
		      <br>
		      
		      <div class="container">
		        <table class="table table-hover">
		          <thead>
		            <tr>
		              <th>글번호</th>
		              <th>유형</th>
		              <th>제목</th>
		              <th>작성자</th>
		              <th>작성일</th>
		              <th>조회수</th>
		            </tr>
		          </thead>
		          
		          <tbody>
		      
		           <%--  <%for(Notice n : list){ %>
		            <tr>
		              <td><%=n.getbNo() %></td>
		              <td><%=n.getbType() %></td>
		              <td><%=n.getbTitle() %></td>
		              <td><%=n.getbId() %></td>
		              <td><%=n.getModify_date() %></td>
		              <td><%=n.getbCount() %></td>
		            </tr>
		            <%} %> --%>
		          </tbody>
		        </table>
		      </div> 
		<br>
		
		<div class="checkboxgroup">
		
		<input type="checkbox" name="chk_info" value="title" checked="checked">제목
		<input type="checkbox" name="chk_info" value="content">내용
		<input type="text">&nbsp;
		</div>
		
		<button onclick="location.href='<%=request.getContextPath()%>/views/notice/noticeList.jsp'">검색</button>
		
		
		<!-- &nbsp;<a href=""><button type="submit">검색</button></a> -->
	
		
		<div class ="paging button" align="center">
			<button type="submit"><<</button>&nbsp;
			<button type="submit"><</button>&nbsp;
			<button type="submit">1</button>&nbsp;
			<button type="submit">2</button>&nbsp;
			<button type="submit">3</button>&nbsp;
			<button type="submit">4</button>&nbsp;
			<button type="submit">5</button>&nbsp;
			<button type="submit">></button>&nbsp;
			<button type="submit">>></button>
		</div>
		
	</section>
	
	<br><br>
	
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>