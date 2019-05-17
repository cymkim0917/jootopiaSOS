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
<link rel="stylesheet" href="/jootopia/css/admin/adminCommon.css">
 
<link rel="stylesheet" href="/jootopia/js/external/jquery-3.4.0.min.js">

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
		<h3 class="title">입금전 관리</h3>
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
		<span>주문 목록</span><br>
		<span>[총 <a><% if(list != null) { %><%= list.size() %><% }else { %>0<% } %></a>개]</span>
		</div>

		<br>

		<div class="selectListArea">
			<table id="selectList" class="selectList" border="1">
				<tr>
					<th colspan="9" style="height: 45px; text-align: left;">
						<button class="selectBtn" onclick="oTypeChange('입금완료')">입금 완료</button>
						<button class="selectBtn" onclick="oTypeChange('주문취소')">주문 취소</button>
					</th>
				</tr>
				<tr>
					<th width="25px"><input type="checkbox" id="allCheck"></th>
					<th width="25px">No</th>
					<th width="100px">주문상태</th>
					<th width="90px">주문일</th>
					<th width="150px">주문코드</th>
					<th width="70px">주문자</th>
					<th width="250px">상품명</th>
					<th width="100px">배송메시지</th>
				</tr>
				<% for(int i = 0; i < list.size(); i++) { 
				HashMap<String,Object> hmap = list.get(i);
				POrder o = (POrder)hmap.get("o");
				%>
				<tr>
					<th><input type="checkbox" class="check" value="<%= o.getPoId() %>"></th>
					<td><%= count++ %></td>
					<td><%= o.getStatus() %></td>
					<td><%= o.getPoDate() %></td>
					<td><%= o.getPoId() %></td>
					<td><%= hmap.get("userName") %></td>
					<td><%= hmap.get("pName") %></td>
					<td>
					<div id="memo" class="memo">MEMO
					</div>
					<input type="hidden" id="dMsg" value=<%= o.getdMessage() %>>
					</td>
				</tr>
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

		<% for(int p = startPage; p <= endPage; p++) { 
			if(p == currentPage) { %>
		<li><a><%= p %></a></li>
		<% 	}else { %>
		<li><a href="<%=request.getContextPath()%>/adminProductList.do.do?currentPage=<%= p %>"><%= p %></a></li>	
		<% 	} 
		} %>

		<% if(currentPage >= maxPage) { %>
		<li><a>다음</a></li>
		<% }else { %>
		<li><a href="<%=request.getContextPath()%>/adminProductList.do.do?currentPage=<%= currentPage + 1 %>">다음</a></li>
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
    			<th>주문코드 : <span id="modalPoId">주문코드임시</span><br>
    			주문일 : <span id="modalPoDate">주문일임시</span></th>
    		</tr>
    	</table>
    	<br>
        <table class="memoModalTable">
    		<tr>
    			<th>배송메시지</th>
    		</tr>
    		<tr>
				<td>
    			<input type="text" id="oMemo" name="oMemo" placeholder="배송메시지를 입력하세요">
    			</td>
       		</tr>
    	</table>
    	<br>
    	
    	<div class="modalBtnArea" align="center">
				<input type="submit" value="수정" onclick="">
				<input type="reset" value="닫기">
		</div>
    </div>
    </div>
</div>

<script>
	$("#allCheck").click(function() {
		
		if($("#allCheck").prop("checked")) {
			$("input[type=checkBox]").prop("checked", true);
		}else {
			$("input[type=checkBox]").prop("checked", false);
		}
	});
	
	$(".memo").click(function() {
		var code = $(this).parent().parent().children().eq(0).children().eq(0).val();
		var date = $(this).parent().parent().children().eq(3).text();
		var message = $(this).parent().children().eq(1).val();
		
		if(message = null) {
			message = "";
		}
		
		$(function() {
			$("#modalPoId").text(code);
			$("#modalPoDate").text(date);
			$("#oMemo").val(message);
		});
		
		console.log(message);
		
		$("#memoModal").css("display", "block");
		
		$(".close").click(function() {
			$("#memoModal").css("display", "none");
		});
		
		$(".modalBtnArea>input[type=reset]").click(function() {
			$("#memoModal").css("display", "none");
		});
		$("#allCheck").click(function() {
			
			if($("#allCheck").prop("checked")) {
				$("input[type=checkBox]").prop("checked", true);
			}else {
				$("input[type=checkBox]").prop("checked", false);
			}
		});
		
		function oTypeChange(text) {
			var answer = window.confirm("선택한 상품을 " + text + " 하시겠습니까?");
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
					url : "adminChangeStatusOrder.do",
					type : "post",
					data : {numArr : numArr, text : text},
					success : function(data) {
						alert(data);
						location.href='selectAdminPaymentList.do';
					},
					error : function(data) {
						alert("해당상품 " + text + " 처리 실패");
					}
				});
			}
		};

	
</script>
</body>
</html>