<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jooTopia.product.model.vo.*, java.util.*, java.lang.*"%>

<%	
	int count = 1;
	ArrayList<HashMap<String,Object>> list = 
	(ArrayList<HashMap<String,Object>>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="/jootopia/js/external/jquery-3.4.0.min.js">
<link rel="stylesheet" href="/jootopia/css/admin/adminCommon.css">

<title>JooTopia</title>
</head>
<body>

	<%@ include file="/views/common/adminNavigation.jsp" %>
	
	<section class="row">
		<%@ include file="/views/common/adminSideMenu.jsp" %>
		
		<div class="col-sm-10">
		<h3 class="title">상품등록 목록</h3>
		<hr>
		
		<div id="listArea">
			<% if(list != null) { %>
				전체 <a href="#"><%= list.size() %></a>건
			<% }else { %>
				전체 <a href="#">0</a>건
			<% } %>
		</div>
		<br>
		
		<div class="selectTopList">
		<span>미등록 상품</span><br>
		<span>[총 <a><% if(list != null) { %><%= list.size() %><% }else { %>0<% } %></a>개]</span>
		</div>
		
		<br>
		
		<div class="selectListArea">
			<table id="selectList" class="selectList" border="1">
				<tr>
					<th colspan="9" style="height: 45px; text-align: left;">
						<button class="selectBtn" onclick="pTypeChange('상품삭제')">상품삭제</button>
					</th>
				</tr>
				<tr>
					<th width="25px"><input type="checkbox" id="allCheck"></th>
					<th width="25px">No</th>
					<th width="100px">상품상태</th>
					<th width="100px">상품분류</th>
					<th width="150px">상품코드</th>
					<th width="110px">상품이미지</th>
					<th width="250px">상품명</th>
					<th width="100px">판매가(원)</th>
				</tr>
				<% for(int i = 0; i < list.size(); i++) { 
				HashMap<String,Object> hmap = list.get(i); %>
				<tr>
					<th><input type="checkbox"></th>
					<td><%= count++ %></td>
					<td><%= hmap.get("status") %></td>
					<td><%= hmap.get("cGroup") %> / <%= hmap.get("cName") %></td>
					<td><%= hmap.get("pId") %></td>
					<td><img src="/jootopia/images/product/<%= hmap.get("changeName") %>" width="60px" height="60px"></td>
					<td><%= hmap.get("pName") %></td>
					<td><%= hmap.get("pPrice") %></td>
				</tr>
				<% } %>
			</table>
	</div> <!-- selectListArea -->
	
	<br><br><br>
	<div class="paging" align="center">
		<ul class="pagination">
			<li><a href="#">Previous</a></li>
			<li><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>
			<li><a href="#">4</a></li>
			<li><a href="#">5</a></li>
			<li><a href="#">Previous</a></li>
		</ul>
	</div>
	
	</div> <!-- col-sm-10 -->
	</section>
	
<%@ include file="/views/common/adminFooter.jsp" %>

<script>

	$("#selectList td").mouseenter(function(){
		$(this).parent().css({"background":"rgb(61, 81, 113)", "color":"white", "cursor":"pointer"});
	}).mouseout(function(){
		$(this).parent().css({"background":"white", "color":"black"});
	}).click(function(){
		var num = $(this).parent().children().eq(4).text();
		location.href="<%=request.getContextPath()%>/adminAddProductOne.do?num=" + num;
	});
	
	function pTypeChange(text) {
		var answer = window.confirm("선택한 상품을 " + text + " 하시겠습니까?");
		
		if(answer) {
			alert("해당상품을 " + text + " 처리 하였습니다.");
		}
	}
	
	$("#allCheck").click(function() {
		
		if($("#allCheck").prop("checked")) {
			$("input[type=checkBox]").prop("checked", true);
		}else {
			$("input[type=checkBox]").prop("checked", false);
		}
	});
</script>
</body>
</html>