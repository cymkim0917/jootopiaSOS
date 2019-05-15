<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.kh.jooTopia.buy.model.vo.*, java.util.*"%>
	
	<% ArrayList<BuyWaitAdmin> list = (ArrayList<BuyWaitAdmin>) request.getAttribute("list"); %>
	
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

			<h3 class="title">매입리스트</h3>
			<hr>

			<div class="searchArea">
				<table id="searchBox" border="1" align="center">
					<tr>
						<th colspan="3"
							style="background: rgb(224, 224, 224); height: 35px;"></th>
					</tr>
					
					<tr>
						<td>상품 카테고리</td>
						<td colspan="2">&nbsp;<select id="searchCategory"
							onchange="smallCategoty(this.value)">
								<option value="">- 대분류 -
								<option value="bedRoom">침실
								<option value="livingRoom">거실
								<option value="kitchen">주방
								<option value="study">서재
						</select> <select id="small">
								<option value="">- 중분류 -
								<option value="">침대
								<option value="">책상
								<option value="">의자
								<option value="">서랍장
						</select>
						</td>
					</tr>
				</table>

				<br>

				<div id="searchBtnArea" align="center">
					<input type="submit" value="검색" onclick=""> <input
						type="reset" value="초기화" onclick="">
				</div>
			</div>

			<br>
			<br>
			
			<br>
			<br>
			<br>
			<br>

			<div class="container">

				<table class="table table-hover" id="test1">
					<thead>
						<tr>
							<th>No.</th>
							<th>매입번호</th>
							<th>대분류</th>
							<th>중분류</th>							
						</tr>
					</thead>
					<% for(BuyWaitAdmin b : list){ %>
					<tbody>
						<tr>
							<td><%= b.getbId() %></td>
							<td><%= b.getnNo() %></td>
							<td><%= b.getbCate1() %></td>
							<td><%= b.getbCate2() %></td>							
						</tr>
						<% } %>						
					</tbody>
				</table>
			</div>




			<!-- db 생기면 적용 -->
			<%-- <script>
				$(function(){
					<% for(Product p : list){ %>
					
					var $tableBody = $("table tbody");
					
					var $tr = $("<tr>");
					var $idTd = $("<td>").text('<%= p.get상품코드()%>');
					var $phoneTd = $("<td>").text('<%= p.get대분류() %>');
					var $addressTd = $("<td>").text('<%= p.get중분류() %>');			
					var $nameTd = $("<td>").text('<%= p.get아이디()%>');				
					var $emailTd = $("<td>").text('<%= p.get주문자명() %>');					
					
					$tr.append($상품코드Td);
					$tr.append($대분류Td);
					$tr.append($중분류Td);
					$tr.append($아이디Td);
					$tr.append($주문자명Td);					
					
					$tableBody.append($tr);					
					
					<% } %>
				});
			</script> --%>


			<br />
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
				location.href="<%=request.getContextPath()%>/views/admin/storage/productreg.jsp?num=" + num;
			})
		})
	</script>

</body>
</html>