<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
     
<%-- import="com.kh.jooTopia.product.model.vo.*, java.util.*, java.lang.*" --%>    
<%--
	int count = 1;
	
	/* Product productList = (Product) session.getAttribute("productList");
	java.util.Date date = new java.util.Date();
	java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd");
	String startDay = dateFormat.format(date);
	String endDay = dateFormat.format(date);
	
	ArrayList<Product> list = new ArrayList<Product>();
	list.add(new Product()); */
--%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<link rel="stylesheet" href="/jootopia/css/admin/adminCommon.css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<title>JooTopia</title>
</head>
<body>
<body>

	<%@ include file="/views/common/adminNavigation.jsp" %>
	
	<section class="row">
		<%@ include file="/views/common/adminSideMenu.jsp" %>
		
		<div class="col-sm-10">
		<h3 class="title">상품등록 목록</h3>
		<hr>
		
		<div id="listArea">
			전체 <a href="/jootopia/views/admin/product/productList.jsp">10</a>건
		</div>
		<br>
		
		<div class="selectTopList">
		<span>미등록 상품</span><br>
		<span>[총 <a><%= 1 %></a>개]</span>
		</div>
		
		<br>
		
		<div class="selectListArea">
			<table id="selectList" class="selectList" border="1">
				<tr>
					<th colspan="9" style="height: 45px; text-align: left;">
						<button class="selectBtn" onclick="pTypeChange('상품 등록')">상품 등록</button>
						<button class="selectBtn" onclick="pTypeChange('상품 삭제')">상품 삭제</button>
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
					<th width="100px">할인가(%)</th>
				</tr>
				<tr>
					<td><input type="checkbox" id="allCheck"></td>
					<td>1</td>
					<td>판매안함</td>
					<td>침실 / 침대</td>
					<td><a href="/jootopia/views/admin/product/productInsertForm.jsp">P20190510_01</a></td>
					<td><a href="/jootopia/views/admin/product/productInsertForm.jsp"><img src="/jootopia/images/logo2.png" width="60px" height="60px"></a></td>
					<td><a href="/jootopia/views/admin/product/productInsertForm.jsp">침대침대</a></td>
					<td>200000</td>
					<td>20000 (10%)</td>
				</tr>
				<%-- <% for(Product p : list) { %>
				<tr>
					<td ><input type="checkbox"></td>
					<td><%= count++ %></td>
					<td >상태임시</td>
					<td>분류/임시</td>
					<td><a href="../product/productInsertForm.jsp">상품코드 임시</a></td>
					<td><img src="/jootopia/images/logo.png" width="60px" height="60px"></td>
					<td><a href="#">상품명 임시</a></td>
					<td>판매가 임시</td>
					<td>할인가 임시</td>
				</tr>
				<% } %> --%>
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