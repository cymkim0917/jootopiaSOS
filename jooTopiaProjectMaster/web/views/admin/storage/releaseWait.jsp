<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.jooTopia.release.model.vo.*, java.util.*"%>
	
<% ArrayList<ReleaseAdmin> list = (ArrayList<ReleaseAdmin>) request.getAttribute("list"); %>
	
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
						<th>No.</th>
						<th>주문번호</th>
						<th>배송번호</th>
						<th>적치번호</th>
						<th>위치바코드</th>
					</tr>
				</thead>
				<% int i = 0; for(ReleaseAdmin r : list){ i++;%>
				<tbody>
					<tr>
						<td><%= i %></td>
						<td><%= r.getPoId() %></td>
						<td><%= r.getdId() %></td>
						<td><%= r.gethId() %></td>
						<td><%= r.getlBarcode() %></td>
						
						
						
					</tr>
					<% } %>
					
				</tbody>
			</table>

			<!-- db 생기면 적용 -->
			<%-- <script>
				$(function(){
					<% for(Product p : list){ %>
					
					var $tableBody = $("table tbody");
					
					var $tr = $("<tr>");
					var $idTd = $("<td>").text('<%= p.get상품코드()%>');
					var $phoneTd = $("<td>").text('<%= p.get대분류() %>');
					var $addressTd = $("<td>").text('<%= p.get중분류() %>');			
										
					
					$tr.append($상품코드Td);
					$tr.append($대분류Td);
					$tr.append($중분류Td);
										
					
					$tableBody.append($tr);					
					
					<% } %>
				});
			</script> --%>

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
				<%-- location.href="<%=request.getContextPath()%>/insertAdminRelease.do"; --%>
				location.href="<%=request.getContextPath()%>/views/admin/storage/releaseRegist.jsp?num=" + num;
				/* location.href="views/admin/storage/releaseRegist.jsp"; */
			})
		})
	</script>
	
</body>
</html>