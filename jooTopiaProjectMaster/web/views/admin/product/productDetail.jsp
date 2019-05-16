<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="com.kh.jooTopia.product.model.vo.*, com.kh.jooTopia.board.model.vo.* ,java.util.*, java.lang.*"%>
<%
	HashMap<String, Object> hmap = (HashMap<String, Object>) request.getAttribute("hmap");
	HashMap<String, Object> p = (HashMap<String, Object>) hmap.get("p");
	ArrayList<Attachment> imgList = (ArrayList<Attachment>) hmap.get("img");
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
		<h3 class="title">상품상세</h3>
		<hr>
		
		<div id="infoArea">
		<table id="pInfo1">
			<tr>
				<th>상품명</th>
				<td><%= p.get("pName") %></td>
			</tr>
			<tr>
				<th>상품코드</th>
				<td><%= p.get("pId") %></td>
			</tr>
			<tr>
				<th>상품상태</th>
				<td><%= p.get("status") %></td>
			</tr>
		</table>
		</div>
		
		<br><br>
	
		<div class="pInfo2Area">
		<table id="pInfo2">
			<tr><th colspan="2" height="40px"><%= "[ " + p.get("pId") + " ]" %>  <%= p.get("pName") %></th></tr>

			<tr>
				<th>상품카테고리</th>
				<td><%= p.get("cGroup") %> / <%= p.get("cName") %></td>
			</tr>
			<tr>
				<th>상품명</th>
				<td><%= p.get("pName") %></td>
			</tr>
			<tr>
				<th>상품코드</th>
				<td><%= p.get("pId") %></td>
			</tr>
			<tr>
				<th>상품 판매가</th>
				<td><%= p.get("pPrice") %> (원)</td>
			</tr>
			<tr>
				<th>할인가</th>
				<td><%= p.get("salePrice") %> (원) / <%= p.get("sale") %> (%)</td>
			</tr>
		</table>

		</div>
		
		<br><br>
		
		<div class="pInfo3Area">
		<table id="pInfo3">

			<tr>
				<th colspan="2">상세정보</th>
			</tr>
			<tr>
				<th>상품 상세설명</th>

				<td>
				<textarea name="" rows="30" cols="88em" style="resize: none" readonly><%= p.get("pContent") %></textarea>
				</td>
			</tr>
		</table>
		</div>
		
		<br><br>
		
		<div class="pInfo4Area">

		<table id="pInfo4" border="1">
			<tr>
				<th colspan="2">이미지 정보</th>
			</tr>
			<tr>
				<th>대표 이미지</th>
				<td>
				<img id="mainImg" src="/jootopia/images/product/<%= imgList.get(0).getChangeName() %>" width="50%">
				<input type="hidden" name="fId" value="<%= imgList.get(0).getfId() %>">
				</td>
			</tr>
			<tr>
				<th>상세 이미지</th>
				<td>
				<img id="mainImg" src="/jootopia/images/product/<%= imgList.get(1).getChangeName() %>" width="50%">
				<input type="hidden" name="fId" value="<%= imgList.get(1).getfId() %>">
				</td>
			</tr>
		</table>

		</div>
		
		<br>
		
		<div class="btnArea" align="center">
			<button onclick="location.href='/jootopia/updateDetailOneAdminProduct.do?num=<%= p.get("pId") %>'">수정</button>
			<button onclick="location.href='/jootopia/adminProductList.do'">목록</button>
		</div>
	
		</div>
	</section>
	<%@ include file="/views/common/adminFooter.jsp" %>
	
</body>
</html>