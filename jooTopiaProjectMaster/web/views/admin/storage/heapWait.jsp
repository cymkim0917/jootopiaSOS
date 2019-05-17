<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.jooTopia.heap.model.vo.*, java.util.*"%>
	
	<% ArrayList<HeapAdmin> list = (ArrayList<HeapAdmin>) request.getAttribute("list"); %>
	 
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

			<h3 class="title">적치대기</h3>
			<hr>
			<br><br>
			
			<div class="container">

				<table class="table table-hover" id="test1">
					<thead>
						<tr>
							<th>No.</th>							
							<th>상품번호</th>
							<th>상품명</th>
							<th>대분류</th>
							<th>중분류</th>						
						</tr>
					</thead>
					<% int i = 0; for(HeapAdmin h : list){ i++;%>
					<tbody>
						<tr>
							<td><%= i %></td>							
							<td><%= h.getpId() %></td>
							<td><%= h.getpName() %></td>
							<td><%= h.getcGroup() %></td>
							<td><%= h.getName() %></td>
													
						</tr>
						<% } %>
					</tbody>
				</table>
			</div>		

			<hr>
			<div align="center">
				<ul class="pagination">
					<li><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
				</ul>
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
				var num = $(this).parent().children().eq(0).text();				
				console.log(num);
				<%-- location.href="<%=request.getContextPath()%>/selectOne.bo?num=" + num; --%>
				location.href="<%=request.getContextPath()%>/selectOneAdminHeap.do?num=" + num;
				//location.href="heapRegist.jsp";
			})
		})
	</script>
	
</body>
</html>