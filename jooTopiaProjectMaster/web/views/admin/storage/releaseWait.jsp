<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.jooTopia.release.model.vo.*, com.kh.jooTopia.heap.model.vo.*, java.util.*"%>
	
<% ArrayList<ReleaseAdmin> list = (ArrayList<ReleaseAdmin>) request.getAttribute("list"); 
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
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
<style>
.table th {
	text-align: left;
} 
</style>
</head>
<body>
	<%@ include file="/views/common/adminNavigation.jsp"%>
	<section class="row">
		<%@ include file="/views/common/adminSideMenu.jsp"%>
		<div id="adminSection" class="col-sm-10">

			<h3 class="title">출고대기</h3>
			<hr>
			<br><br>

			<div class="container">

				<table class="table table-hover" id="test1">
					<thead>
					<tr>
						<!-- <th>No.</th> -->
						<th>상태</th>
						<th>주문번호</th>
						<th>배송번호</th>
						<th>상품번호</th>
						<th>적치번호</th>
						<th>위치바코드</th>
					</tr>
				</thead>
				<% for(ReleaseAdmin r : list){ %>
				<tbody>
					<tr>
						<td><%= r.getStatus() %></td>						
						<td><%= r.getPoId() %></td>
						<td><%= r.getdId() %></td>
						<td><%= r.getpId() %></td>
						<td><%= r.gethId() %></td>
						<td><%= r.getlBarcode() %></td>						
					</tr>
					<% } %>
					
				</tbody>
			</table>

			
			<!-- <hr>
			<div align="center">
				<ul class="pagination">
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
				</ul>
			</div> -->
		</div>
		
		<div class="pagingArea" align="center">
         <button
            onclick="location.href='<%= request.getContextPath() %>/selectAdminRelease.do?currentPage=1'"><<
            </button>
         <% if(currentPage <= 1) { %>
         <button disabled><</button>
         <% }else { %>
         <button
            onclick="location.href='<%= request.getContextPath() %>/selectAdminRelease.do?currentPage=<%= currentPage - 1 %>'"><
            </button>
         <% } %>
         
         <% for(int p = startPage; p <= endPage; p++){
            if(p == currentPage){%>
         <button disabled><%=p %></button>

         <%}else{%>
         <button
            onclick="location.href='<%=request.getContextPath()%>/selectAdminRelease.do?currentPage=<%=p%>'"><%=p %></button>
         <% }%>
         <% } %>


         <% if(currentPage >= maxPage) { %>
         <button disabled>></button>
         <% }else { %>
         <button
            onclick="location.href='<%= request.getContextPath() %>/selectAdminRelease.do?currentPage=<%= currentPage + 1 %>'">
            ></button>
         <% } %>
         <button
            onclick="location.href='<%= request.getContextPath() %>/selectAdminRelease.do?currentPage=<%= maxPage %>'">
            >></button>
      </div>
		
		</div>
		
	</section>
	
	<%@ include file="/views/common/adminFooter.jsp"%>
	
	<script>
		$(function(){
			$("#test1 td").mouseenter(function(){
				$(this).parent();
			}).mouseout(function(){
				$(this).parent();
			}).click(function(){
				var num = $(this).parent().children().eq(2).text();				
				console.log(num);
				<%-- location.href="<%=request.getContextPath()%>/selectOne.bo?num=" + num; --%>
				<%-- location.href="<%=request.getContextPath()%>/insertAdminRelease.do"; --%>
				location.href="<%=request.getContextPath()%>/selectOneAdminRelease.do?num=" + num;
				/* location.href="views/admin/storage/releaseRegist.jsp"; */
			})
		})
	</script>
	
</body>
</html>