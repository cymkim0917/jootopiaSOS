<%@page import="com.kh.jooTopia.order.model.vo.OrderCancle"%>
<%@page import="com.kh.jooTopia.order.model.vo.POrder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, java.lang.*, com.kh.jooTopia.board.model.vo.*"%>
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
		<h3 class="title">주문취소 관리</h3>
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
			</table>
			
			<br>
			
			<div id="searchBtnArea" align="center">
				<input type="submit" value="검색" onclick="">
				<input type="reset" value="초기화" onclick="">
			</div>
		</div>
		
		<br>
		
		<div class="selectTopList">
		<span>취소 목록</span><br>
		<span>[총 <a><% if(list != null) { %><%= list.size() %><% }else { %>0<% } %></a>개]</span>
		</div>
		
		<br>
		<div class="selectListArea">
				<table id="selectList" class="selectList" border="1">
					<tr>
						<th width="25px">No</th>
						<th width="100px">주문취소코드</th>
						<th width="150px">주문코드</th>
						<th width="150px">취소일자</th>
						<th width="250px">상품명</th>
						<th width="70px">주문자</th>
						<th width="100px">취소사유</th>
					</tr>
					<% for(int i = 0; i < list.size(); i++) { 
				HashMap<String,Object> hmap = list.get(i);
				POrder o = (POrder)hmap.get("o");
				OrderCancle oc = (OrderCancle) hmap.get("oc");
				int beforeOcId = 0;
				%>
				<% if(i > 0) { 
				OrderCancle beforeOc = (OrderCancle) list.get(i-1).get("oc");
				beforeOcId = beforeOc.getOcId();
				} %>
				<% if(i >= 0 && oc.getOcId() != beforeOcId) { 
				%>
				<tr>
					<td><%= count++ %></td>
					<td><%= oc.getOcId() %></td>
					<td><%= o.getPoId() %></td>
					<td><%= oc.getOcDate() %></td>
					<td><%= hmap.get("pName") %></td>
					<td><%= o.getName() %></td>
					<th>
					<div id="memo" class="memo">MEMO
					</div>
					<input type="hidden" id="dMsg" value="<%= oc.getReason() %>">
					</th>
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
		<li><a href="<%=request.getContextPath()%>/adminProductList.do?currentPage=<%= currentPage - 1 %>">이전</a></li>
		<% } %>
		
		<% for(int p = startPage; p < endPage; p++) { 
			if(p == currentPage) { %>
		<li><a><%= p %></a></li>
		<% 	}else { %>
		<li><a href="<%=request.getContextPath()%>/adminProductList.do?currentPage=<%= p %>"><%= p %></a></li>	
		<% 	} 
		} %>
		
		<% if(currentPage >= maxPage) { %>
		<li><a>다음</a></li>
		<% }else { %>
		<li><a href="<%=request.getContextPath()%>/adminProductList.do?currentPage=<%= currentPage + 1 %>">다음</a></li>
		<% } %>
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
    			<th>주문취소코드 : <span id="modalOcId">주문취소코드임시</span> / 주문코드 : <span id="modalPoId">주문코드임시</span><br>
    			주문취소일 : <span id="modalOcDate">주문일임시</span></th>
    		</tr>
    	</table>
    	<br>
    	<br>
        <table class="memoModalTable">
    		<tr>
    			<th>취소사유</th>
    		</tr>
    		<tr>
    			<td>
    			<span id="reason">(없음)</span>
    			</td>
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

	$(".btnDate").click(function() {
		
		$("#selectDate>a").removeClass();
		$("#selectDate>a").addClass("btnDate");
		$(this).toggleClass("selected");
		
	});
	
	$(".memo").click(function() {
		var poId = $(this).parent().parent().children().eq(2).text();
		var ocId = $(this).parent().parent().children().eq(1).text();
		var ocDate = $(this).parent().parent().children().eq(3).text();
		var reason = $(this).parent().children().eq(1).val();
		
		if(reason == "null") {
			reason = "";
		}
		
		$(function() {
			$("#modalPoId").text(poId);
			$("#modalOcId").text(ocId);
			$("#modalOcDate").text(ocDate);
			$("#reason").text(reason);
		});
		
		$("#memoModal").css("display", "block");
		
		$(".close").click(function() {
			$("#memoModal").css("display", "none");
		});
		
		$(".modalBtnArea>input[type=reset]").click(function() {
			$("#memoModal").css("display", "none");
		});
	});
    	
</script>
</body>
</html>