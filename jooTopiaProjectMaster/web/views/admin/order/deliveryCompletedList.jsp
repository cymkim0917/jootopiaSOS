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
		<% if(currentPage <= 1) { %>
		<li><a>이전</a></li>
		<% } else { %>
		<li><a href="<%=request.getContextPath()%>/selectAdminDelCompletedList.do?currentPage=<%= currentPage - 1 %>">이전</a></li>
		<% } %>
		
		<% for(int p = startPage; p < endPage; p++) { 
			if(p == currentPage) { %>
			<li><a><%= p %></a></li>
			<% 	}else { %>
			<li><a href="<%=request.getContextPath()%>/selectAdminDelCompletedList.do?currentPage=<%= p %>"><%= p %></a></li>	
			<% 	} 
		} %>
		
		<% if(currentPage >= maxPage) { %>
		<li><a>다음</a></li>
		<% }else { %>
		<li><a href="<%=request.getContextPath()%>/selectAdminDelCompletedList.do?currentPage=<%= currentPage + 1 %>">다음</a></li>
		<% } %>
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