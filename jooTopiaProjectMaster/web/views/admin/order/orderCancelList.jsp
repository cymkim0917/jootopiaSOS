<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- import="com.kh.jooTopia.product.model.vo.*, java.util.*, java.lang.*" -->
<%
	int count = 1;
	String memo = "배송메시지 임시";
	/* Product productList = (Product) session.getAttribute("productList");
	java.util.Date date = new java.util.Date();
	java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd");
	String startDay = dateFormat.format(date);
	String endDay = dateFormat.format(date);
	
	
	
	ArrayList<Product> list = new ArrayList<Product>();
	list.add(new Product()); */
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="/jootopia/images/favicon.ico">
<!-- <link rel="stylesheet" href="/jootopia/js/external/jquery-3.4.0.min.js"> -->
<link rel="stylesheet" href="/jootopia/css/admin/adminCommon.css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>

<title>JooTopia</title>
<style>
br 
{mso-data-placement:same-cell;} 
</style>
</head>
<body>
<body>

	<%@ include file="/views/common/adminNavigation.jsp" %>
	
	<section class="row">
		<%@ include file="/views/common/adminSideMenu.jsp" %>
		
		<div class="col-sm-10">
		<h3 class="title">주문취소 관리</h3>
		<hr>
		
		<div id="listArea">
			전체 <a href="#">10</a>건
		</div>
		<br>
		
		<div class="searchArea">
			<table id="searchBox"  border="1" align="center">
				<tr><th colspan="3" style="height: 35px;">　</th></tr>
				<tr>
					<td>검색 분류</td>
					<td colspan="2">
						<select id="searchCondition">
							<option value="pName">상품명
							<option value="pCode">상품코드
							<option value="oCode">주문코드
							<option value="userName">주문자명
							<option value="userId">주문자 아이디
							<option value="phone">주문자 전화번호
						</select>
						<input type="search" placeholder="검색 단어를 입력하세요." width="20px">
					</td>
				</tr>
				<tr>
					<td>주문일</td>
					<td id="selectDate" colspan="2">
						<a href="#" class="btnDate" period="0"><span>오늘</span></a>
						<a href="#" class="btnDate" period="7"><span>7일</span></a>
						<a href="#" class="btnDate" period="30"><span>1개월</span></a>
						<a href="#" class="btnDate" period="90"><span>3개월</span></a>
						<a href="#" class="btnDate" period="365"><span>1년</span></a>
						<a href="#" class="btnDate" period="-1"><span>전체</span></a>
						<input type="date" id="startDate" name="startDate" class="date" value=""> ~ 
						<input type="date" id="endDate" name="endDate" class="date" value="">
					</td>
				</tr>
				<tr>
					<td>배송일</td>
					<td id="selectDate" colspan="2">
						<a href="#" class="btnDate" period="0"><span>오늘</span></a>
						<a href="#" class="btnDate" period="7"><span>7일</span></a>
						<a href="#" class="btnDate" period="30"><span>1개월</span></a>
						<a href="#" class="btnDate" period="90"><span>3개월</span></a>
						<a href="#" class="btnDate" period="365"><span>1년</span></a>
						<a href="#" class="btnDate" period="-1"><span>전체</span></a>
						<input type="date" id="startDate" name="startDate" class="date" value=""> ~ 
						<input type="date" id="endDate" name="endDate" class="date" value="">
					</td>
				</tr>
			</table>
			
			<br>
			
			<div id="searchBtnArea" align="center">
				<input type="submit" value="검색" onclick="">
				<input type="reset" value="초기화" onclick="">
			</div>
		</div>
		
		<br>
		
		<div class="selectTopList">
		<span>주문 목록</span><br>
		<span>[총 <a><%= 1 %></a>개]</span>
		</div>
		
		<br>
		
		<div class="selectListArea">
			<form action="" method="post">
				<table id="selectList" class="selectList" border="1">
					<tr>
						<th colspan="9" style="height: 45px; text-align: left;">
							<button class="selectBtn" onclick="oTypeChange('환불')">환불</button>
						</th>
					</tr>
					<tr>
						<th width="25px"><input type="checkbox" id="allCheck"></th>
						<th width="25px">No</th>
						<th width="100px">주문상태</th>
						<th width="150px">주문일/주문코드</th>
						<th width="150px">결제일/결제코드</th>
						<th width="70px">주문자</th>
						<th width="250px">상품명</th>
						<th width="100px">취소금액</th>
						<th width="100px">취소사유</th>
					</tr>
					<tr>
						<td><input type="checkbox"></td>
						<td>1</td>
						<td>주문취소</td>
						<td>2019-05-10 /<br>O20190510_01</td>
						<td>2019-05-10 /<br>P20190510_01</td>
						<td>주문자</td>
						<td>상품명</td>
						<td>취소금액</td>
						<td><div id="memo" class="memo">MEMO</div></td>
					</tr>
					<%-- <% for(Product p : list) { %>
					<tr>
						<td ><input type="checkbox"></td>
						<td><%= count++ %></td>
						<td >주문상태</td>
						<td>주문일<br>/주문코드</td>
						<td>결제일<br>/결제코드</td>
						<td>주문자</td>
						<td>상품명</td>
						<td>취소금액</td>
						<td><div id="memo" class="memo">MEMO</div></td>
					</tr>
					<% } %> --%>
				</table>
			</form>
		
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


<!-- The Modal -->
<div id="memoModal" class="memoModal">
	<div class="memoModalContent">
	<div class="memoModalHeader">
	<button type="button" class="close" data-dismiss="modal">&times;</button>
	<h4>구매자 배송메시지</h4>
	<hr>
	</div>
	
	<!-- Modal content -->
    <div class="memoModalBody">
    	<table class="memoModalTable">
    		<tr>
    			<th>주문코드 : <%= "주문코드 임시" %><br />
    			주문일 : <%= "주문일 임시" %></th>
    		</tr>
    	</table>
    	<br>
    	<table class="memoModalTable">
    		<tr>
    			<th>결제코드 : <%= "결제코드 임시" %><br />
    			결제일 : <%= "결제일 임시" %></th>
    		</tr>
    	</table>
    	<br>
        <table class="memoModalTable">
    		<tr>
    			<th>취소사유</th>
    		</tr>
    		<tr>
    			<td><input type="text" name="oMemo" value="<%= "취소사유 임시" %>" readonly></td>
    		</tr>
    	</table>
    	<br>
    	
    	<div class="modalBtnArea" align="center">
				<input type="reset" value="닫기">
		</div>
    </div>
    </div>
</div>

<script>

	$(document).ready(function() {
		if(true) {
			$("#memo").css("background","rgb(52, 152, 219)");
		}
	});

	$(".btnDate").click(function() {
		
		$("#selectDate>a").removeClass();
		$("#selectDate>a").addClass("btnDate");
		$(this).toggleClass("selected");
		
	});
	
	function oTypeChange(text) {
		var answer = window.confirm("선택한 주문을 " + text + " 하시겠습니까?");
		
		if(answer) {
			alert("해당주문을 " + text + " 처리 하였습니다.");
		}
	};
	
	$("#allCheck").click(function() {
		
		if($("#allCheck").prop("checked")) {
			$("input[type=checkBox]").prop("checked", true);
		}else {
			$("input[type=checkBox]").prop("checked", false);
		}
	});
	
	$("#memo").click(function() {
		$("#memoModal").css("display", "block");
		
		$(".close").click(function() {
			$("#memoModal").css("display", "none");
		});
		
		$(".modalBtnArea>input[type=reset]").click(function() {
			$("#memoModal").css("display", "none");
		});
		
	})
	
    	
</script>
</body>
</html>