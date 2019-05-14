<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.jooTopia.notice.model.vo.*"%>
    
<%

	ArrayList<Notice> list = (ArrayList<Notice>) request.getAttribute("list");
	
	
	/* PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int currentPage = pageInfo.getCurrentPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage(); */
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
	
	.container {
		border:1px solid black;
		text-align:center;
	}

</style>

<title>JooTopia</title>
</head>
<body>
<%@ include file="/views/common/navigation.jsp" %>
	<section>
	<br>
		
		
		
		<!-- noticeList.jsp -->

		<%--  <div class="container">
		        <table class="table table-hover">
		          
		            <tr>
		              <th>글번호</th>
		              <th>유형</th>
		              <th>제목</th>
		              <th>작성자</th>
		              <th>작성일</th>
		              <th>조회수</th>
		            </tr>
		            
		            <%
		           
		            %>
		         
		      
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
		      </div> --%>
		       
		   
		   <!-- ------------------------------------ -->
		    <br>
		    
		   
		      <h1 align="center">공지사항</h1>
		      
		      <br>
		      
		      <div class="container">
		      <form>
		        <table class="table table-hover">
		         
		            <tr>
		              <th>글번호</th>
		              <th>유형</th>
		              <th>제목</th>
		              <th>작성자</th>
		              <th>작성일</th>
		              <th>조회수</th>
		            </tr>
		            
		        <% for(Notice n:list){ %>
		            <tr>
		              <td><%=n.getbNo() %></td>
		              <td><%=n.getbTitle() %></td>
		              <td><%=n.getbId() %></td>
		              <td><%=n.getModifyDate() %></td>
		              <td><%=n.getbCount() %></td>
		              <td><%if(n.getbType()==1){ %>
		              	공지사항
		              	<%}else{ %>
		              	이벤트
		              	<%} %>
		              </td>
		            </tr>
		            <%} %>   
		         
		        </table>
		        </form>
		      </div> 
		<br>
		
		<div class="checkboxgroup">
		
		<input type="checkbox" name="chk_info" value="title" checked="checked">제목
		<input type="checkbox" name="chk_info" value="content">내용
		<input type="text">&nbsp;
		<button onclick="location.href='<%=request.getContextPath()%>/views/notice/noticeList.jsp'">검색</button>
		</div>
		
	<%-- 	
		<div class="paging" align="center">
		<ul class="pagination">
			<li><a href="<%=request.getContextPath()%>/selectList.do?currentPage=<%=currentPage-1%>">이전</a></li>
			<li><a href="<%=request.getContextPath()%>/selectList.do?currentPage=1">1</a></li>
			<li><a href="<%=request.getContextPath()%>/selectList.do?currentPage=2">2</a></li>
			<li><a href="<%=request.getContextPath()%>/selectList.do?currentPage=3">3</a></li>
			<li><a href="<%=request.getContextPath()%>/selectList.do?currentPage=4">4</a></li>
			<li><a href="<%=request.getContextPath()%>/selectList.do?currentPage=5">5</a></li>
			<li><a href="<%=request.getContextPath()%>/selectList.do?currentPage=<%=currentPage+1%>">다음</a></li>
		</ul>
		</div>
		 --%>
		
		
		
		<!-- &nbsp;<a href=""><button type="submit">검색</button></a> -->
	
		
		<!-- <div class ="paging button" align="center">
			<button type="submit"><<</button>&nbsp;
			<button type="submit"><</button>&nbsp;
			<button type="submit">1</button>&nbsp;
			<button type="submit">2</button>&nbsp;
			<button type="submit">3</button>&nbsp;
			<button type="submit">4</button>&nbsp;
			<button type="submit">5</button>&nbsp;
			<button type="submit">></button>&nbsp;
			<button type="submit">>></button>
		</div> -->
		
	</section>
	
	<br><br>
	
<%@ include file="/views/common/footer.jsp" %>
</body>
</html>