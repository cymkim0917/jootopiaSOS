<%@page import="com.kh.jooTopia.delivery.model.vo.Delivery"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jooTopia.board.model.vo.*, com.kh.jooTopia.order.model.vo.* ,java.util.*, java.lang.*"%>
<%
	int count = 1;
	ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) request.getAttribute("list");
	
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int currentPage = pageInfo.getCurrentPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
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
		<h3 class="title">배송완료 관리</h3>
		<hr>
		
		<div id="listArea">
		<% if(list != null) { %>
		전체 <a href="#"><%= list.size() %></a>건	
		<% }else { %>
		전체 <a href="#">0</a>건	
		<% } %>
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
		<span>[총 <a><% if(list != null) { %><%= list.size() %><% }else { %>0<% } %></a>개]</span>
		</div>
		
		<br>
		
		<div class="selectListArea">
			<table id="selectList" class="selectList" border="1">
				<tr>
					<th width="25px"><input type="checkbox" id="allCheck"></th>
					<th width="25px">No</th>
					<th width="100px">배송상태</th>
					<th width="90px">배송코드</th>
					<th width="150px">배송완료일</th>
					<th width="150px">주문일/주문코드</th>
					<th width="90px">주문자</th>
					<th width="250px">상품명</th>
				</tr>
				<% for(int i = 0; i < list.size(); i++) { 
					HashMap<String,Object> hmap = list.get(i);
					POrder o = (POrder)hmap.get("o");
					Delivery d = (Delivery)hmap.get("d");
					int beforeDId = 0;
					System.out.println("list : " + list);
				%>
				<% if(i > 0) { 
				Delivery beforeD = (Delivery) list.get(i-1).get("d");
				beforeDId = beforeD.getdId();
				} %>
				<% if(i >= 0 && d.getdId() != beforeDId) { 
				%>
				<tr>
					<th><input type="checkbox" class="check" value="<%= o.getPoId() %>"></th>
					<td><%= count++ %></td>
					<td><%= d.getStatus() %></td>
					<td><%= d.getdId() %></td>
					<td><%= d.getArriveDate() %></td>
					<td><%= o.getPoDate() %> / <%= o.getPoId() %></td>
					<td><%= o.getName() %></td>
					<td><%= hmap.get("pName") %></td>
				</tr>
				<% } %>
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
	//------검색테이블 날짜 관련 펑션
	$(function() {
		var today = new Date().toISOString().substr(0, 10);
		
		$("#startDate").attr("disabled", true).val(today);
		$("#endDate").attr("disabled", true).val(today);
	});
	
	$(".btnDate").click(function() {
		
		$("#selectDate>a").removeClass();
		$("#selectDate>a").addClass("btnDate");
		$(this).toggleClass("selected");
		
	});
	
	$(".btnDate").click(function() {
		var date = $(this).attr("period");
		console.log( date );
		
		if(date != -1) {
			$(".dateBox").attr("disabled", false);
			$.ajax({
				url : "searchDate.do",
				data : {date : date},
				success : function(data) {
					console.log("에이잭스 성공");
					console.log(data);
					
					var change = new Date(data).toISOString().substr(0, 10);
					
					console.log(change);
					$("#startDate").val(change);
				},
				error : function(data) {
					console.log("전송실패");
				}
			});
		}else {
			$(".dateBox").attr("disabled", true);
		}
	});
	
	$(".dateBox").click(function() {
		$("#selectDate>a").removeClass();
		$("#selectDate>a").addClass("btnDate");
	});

	$("#allCheck").click(function() {
		
		if($("#allCheck").prop("checked")) {
			$("input[type=checkBox]").prop("checked", true);
		}else {
			$("input[type=checkBox]").prop("checked", false);
		}
	});
	
	//------체크된 주문 상태 변화 관련 펑션
	$("#allCheck").click(function() {
		
		if($("#allCheck").prop("checked")) {
			$("input[type=checkBox]").prop("checked", true);
		}else {
			$("input[type=checkBox]").prop("checked", false);
		}
	});
	
	//------주문취소 펑션
	function paymentCancle() {
		var answer = window.confirm("선택한 주문을 결제취소 하시겠습니까?");
		if(answer) {
			var numArr = [];
			$(".check").each(function() {
				if($(this).is(":checked"))
					if($(this) !== $("#allCheck")) {
						numArr += $(this).val() + "|";
					}
			});
			
			console.log( numArr );
			
			$.ajax({
				url : "changeDeliveryStatus.do",
				type : "post",
				data : {numArr : numArr, text : text},
				success : function(data) {
					alert(data);
					location.href='selectAdminDeliveryList.do';
				},
				error : function(data) {
					alert("해당상품 주문취소 처리 실패");
				}
			});
		}
	};
	
	//------해당 배송정보(게시물) 조회 펑션
	$("#selectList td").mouseenter(function(){
		$(this).parent().css({"background":"rgb(61, 81, 113)", "color":"white", "cursor":"pointer"});
	}).mouseout(function(){
		$(this).parent().css({"background":"white", "color":"black"});
	}).click(function(){
		var num = $(this).parent().children().eq(3).text();
		location.href="<%=request.getContextPath()%>/selectAdminDelComOne.do?num=" + num;
	});
</script>
</body>
</html>