<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.jooTopia.heap.model.vo.* , java.util.*"%>	
	 
<% ArrayList<HeapAdmin> list = (ArrayList<HeapAdmin>) request.getAttribute("list");   
    
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
.listArea{
	padding-left: 5%;
	width: 100%;
}
#tableArea th{
	width: 10%;
	text-align: center;
}
#tableArea td{
	width: 10%;
	text-align: center;
}
</style>
</head>
<body>
	<%@ include file="/views/common/adminNavigation.jsp"%>
	<section class="row">
		<%@ include file="/views/common/adminSideMenu.jsp"%>
		<div id="adminSection" class="col-sm-10">

			<h3 class="title">적치대기</h3>
			<hr>
			<br>
			<div class="listArea">
				<table class="table table-hover" id="tableArea">
					<thead>
						<tr>
							<!-- <th>No.</th> -->							
							<th>상품번호</th>
							<th>상품명</th>
							<th>대분류</th>
							<th>중분류</th>						
						</tr>
					</thead>
					<tbody>
					<% for(HeapAdmin h : list){%>
						<tr>
							<td><%= h.getpId() %></td>
							<td><%= h.getpName() %></td>
							<td><%= h.getcGroup() %></td>
							<td><%= h.getName() %></td>
						</tr>
						<% } %>
					</tbody>
				</table>
			</div>		
			
			<div class="paging" align="center">
		<ul class="pagination">
			<li><a href="<%=request.getContextPath()%>/selectAdminHeap.do?currentPage=<%=currentPage-1%>">이전</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminHeap.do?currentPage=1">1</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminHeap.do?currentPage=2">2</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminHeap.do?currentPage=3">3</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminHeap.do?currentPage=4">4</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminHeap.do?currentPage=5">5</a></li>
			<li><a href="<%=request.getContextPath()%>/selectAdminHeap.do?currentPage=<%=currentPage+1%>">다음</a></li>
		</ul>
		</div>
		<%-- <div class="pagingArea" align="center">
         <button
            onclick="location.href='<%= request.getContextPath() %>/selectAdminHeap.do?currentPage=1'"><<
            </button>
         <% if(currentPage <= 1) { %>
         <button disabled><</button>
         <% }else { %>
         <button
            onclick="location.href='<%= request.getContextPath() %>/selectAdminHeap.do?currentPage=<%= currentPage - 1 %>'"><
            </button>
         <% } %>
         
         <% for(int p = startPage; p <= endPage; p++){
            if(p == currentPage){%>
         <button disabled><%=p %></button>

         <%}else{%>
         <button
            onclick="location.href='<%=request.getContextPath()%>/selectAdminHeap.do?currentPage=<%=p%>'"><%=p %></button>
         <% }%>
         <% } %>


         <% if(currentPage >= maxPage) { %>
         <button disabled>></button>
         <% }else { %>
         <button
            onclick="location.href='<%= request.getContextPath() %>/selectAdminHeap.do?currentPage=<%= currentPage + 1 %>'">
            ></button>
         <% } %>
         <button
            onclick="location.href='<%= request.getContextPath() %>/selectAdminHeap.do?currentPage=<%= maxPage %>'">
            >></button>
      </div> --%>
	</div> <!-- adminSection -->
	</section>
	<%@ include file="/views/common/adminFooter.jsp"%>
	<script>
		$(function(){
			$("#tableArea td").mouseenter(function(){
				$(this).parent();
			}).mouseout(function(){
				$(this).parent();
			}).click(function(){
				var num = $(this).parent().children().eq(0).text();		
				console.log(num);
				location.href="<%=request.getContextPath()%>/selectOneAdminHeap.do?num=" + num;
				//location.href="heapRegist.jsp";
			})
		})
	</script>
	
</body>
</html>