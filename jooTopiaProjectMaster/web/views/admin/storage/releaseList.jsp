<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

			<h3 class="title">출고리스트</h3>
			<hr>

			<div class="searchArea">
				<table id="searchBox" border="1" align="center">
					<tr>
						<th colspan="3"
							style="background: rgb(224, 224, 224); height: 35px;"></th>
					</tr>
					<tr>
						<td>검색 분류</td>
						<td colspan="2">&nbsp;<select id="searchCondition">
								<option value="">주문번호
								<option value="">배송번호
								<option value="">출고번호
						</select> <input type="search" placeholder="검색 단어를 입력하세요." width="20px">
						</td>
					</tr>
					<tr>
						<td>출고일자</td>
						<td id="selectDate" colspan="2">&nbsp;
						<a href="#"	class="btnDate" period="0"><span>오늘</span></a>
						<a href="#"	class="btnDate" period="7"><span>7일</span></a>
						<a href="#"	class="btnDate" period="30"><span>1개월</span></a>
						<a href="#"	class="btnDate" period="90"><span>3개월</span></a>
						<a href="#"	class="btnDate" period="365"><span>1년</span></a>
						<a href="#"	class="btnDate" period="-1"><span>전체</span></a> &nbsp;&nbsp;
						<input type="date" id="startDate" name="startDate" class="date"<%-- value="<%= startDay %>" --%>>
							~ <input type="date" id="endDate" name="endDate" class="date"<%-- value="<%= endDay %>" --%>>
						</td>
					</tr>
				</table>

				<br>

				<div id="searchBtnArea" align="center">
					<input type="submit" value="검색" onclick="">
					<input	type="reset" value="초기화" onclick="">
				</div>
			</div>

			<br><br><br><br><br><br>

			<div class="container">

				<table class="table table-striped" id="test1">
					<thead>
					<tr>
						<th>No.</th>
						<th>주문번호</th>
						<th>배송번호</th>
						<th>출고번호</th>
						<th>출고일자</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>12345</td>
						<td>5678</td>
						<td>0927</td>
						<td>19/01/01</td>
					</tr>
					<tr>
						<td>2</td>
						<td>12345</td>
						<td>5678</td>
						<td>0927</td>
						<td>19/01/01</td>
					</tr>
					<tr>
						<td>3</td>
						<td>12345</td>
						<td>5678</td>
						<td>0927</td>
						<td>19/01/01</td>
					</tr>
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
</body>
</html>