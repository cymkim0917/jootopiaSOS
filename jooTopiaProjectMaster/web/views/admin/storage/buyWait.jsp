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

</head>
<body>
	<%@ include file="/views/common/adminNavigation.jsp"%>
	<section class="row">
		<%@ include file="/views/common/adminSideMenu.jsp"%>
		<div id="adminSection" class="col-sm-10">

			<h3 class="title">매입리스트</h3>
			<hr>

			<!-- <div class="searchArea">
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
			</div> -->

			<!-- <br>
			<br>
			
			<br>
			<br>
			<br>
			<br> -->
			<br>

			<div class="container">

				<table class="table table-hover" id="listArea">
					<thead>
						<tr>
							<!-- <th>No.</th> -->
							<th>매입번호</th>
							<th>대분류</th>
							<th>중분류</th>
							<th>상태</th>						
						</tr>
					</thead>
					<% /* int i = 0;  */for(BuyWaitAdmin b : list){ /* i++; */%>
					<tbody>
						<tr>
							<%-- <td><%= i %></td> --%>
							<td><%= b.getPcdId() %></td>
							<td><%= b.getcGroup() %></td>
							<td><%= b.getName() %></td>
							<td><%= b.getStatus() %></td>						
						</tr>
						<% } %>						
					</tbody>
				</table>
			</div>

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
			$("#listArea td").mouseenter(function(){
				$(this).parent();
			}).mouseout(function(){
				$(this).parent();
			}).click(function(){
				var num = $(this).parent().children().eq(0).text();
				console.log(num);				
				location.href="<%=request.getContextPath()%>/selectOneAdminProductr.do?num=" + num;
			})
		})
	</script>

</body>
</html>