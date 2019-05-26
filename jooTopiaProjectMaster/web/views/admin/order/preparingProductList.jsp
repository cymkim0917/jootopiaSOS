<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.jooTopia.product.model.vo.*, java.util.*, java.lang.*, com.kh.jooTopia.board.model.vo.*"%>
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
		<h3 class="title">상품준비중 관리</h3>
		<hr>
		<br>
		<div class="selectListArea">
			<table id="selectList" class="selectList" border="1">
				<tr>
					<th colspan="9" style="height: 45px; text-align: left;">
						<button class="selectBtn" onclick="deliveryInsert('배송준비중')">배송준비중</button>
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
					<th width="100px">입금액(원)</th>
					<th width="100px">배송메시지</th>
				</tr>
				<% for(int i = 0; i < list.size(); i++) {
					HashMap<String, Object> hmap = (HashMap<String, Object>) list.get(i);
					int beforePoId = 0;
					int poId = (int) hmap.get("poId");
				%>
				<% if(i > 0) { 
				beforePoId = (int) list.get(i-1).get("poId");
				} %>
				<% if(i >= 0 && poId != beforePoId) { 
				%>
				<tr>
					<th><input type="checkbox" class="check" value="<%= hmap.get("poId") %>"></th>
					<td><%= count++ %></td>
					<td><%= hmap.get("status") %></td>
					<td><%= hmap.get("poDate") %></td>
					<td><%= hmap.get("poId") %></td>
					<td><%= hmap.get("userName") %></td>
					<% if(hmap.get("count") != null && (int) hmap.get("count") > 1) { %>
					<td><%= hmap.get("pName") %> 외 <%= (int) hmap.get("count") -1 %>건</td>
					<% }else { %>
					<td><%= hmap.get("pName") %></td>
					<% } %>
					<td><%= hmap.get("totalPrice") %></td>
					<th>
					<div id="memo" class="memo">MEMO
					</div>
					<input type="hidden" id="dMsg" value="<%= hmap.get("dMessage") %>">
					
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
		<li><a href="<%=request.getContextPath()%>/selectAdminPreList.do?currentPage=<%= currentPage - 1 %>">이전</a></li>
		<% } %>
		
		<% for(int p = startPage; p <= endPage; p++) { 
			if(p == currentPage) { %>
		<li><a><%= p %></a></li>
		<% 	}else { %>
		<li><a href="<%=request.getContextPath()%>/selectAdminPreList.do?currentPage=<%= p %>"><%= p %></a></li>	
		<% 	} 
		} %>
		
		<% if(currentPage >= maxPage) { %>
		<li><a>다음</a></li>
		<% }else { %>
		<li><a href="<%=request.getContextPath()%>/selectAdminPreList.do?currentPage=<%= currentPage + 1 %>">다음</a></li>
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
    			<input type="text" id="oMemo" name="oMemo" placeholder="배송메시지를 입력하세요" value=" ">
    			</td>
    		</tr>
    	</table>
    	<br>
    	
    	<div class="modalBtnArea" align="center">
				<input type="submit" value="수정" onclick="changeMemo();">
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
	
	//배송메시지 모달용 펑션
	$(".memo").click(function() {
		var code = $(this).parent().parent().children().eq(0).children().eq(0).val();
		var date = $(this).parent().parent().children().eq(3).text();
		var message = $(this).parent().children().eq(1).val();
		
		console.log(message);
		
		if(message == "null") {
			message = "";
		}
		
		$(function() {
			$("#modalPoId").text(code);
			$("#modalPoDate").text(date);
			$("#oMemo").val(message);
		});
		
		$("#memoModal").css("display", "block");
		
		$(".close").click(function() {
			$("#memoModal").css("display", "none");
		});
		
		$(".modalBtnArea>input[type=reset]").click(function() {
			$("#memoModal").css("display", "none");
		});
	});
	
	//배송메시지 변경
	function changeMemo() {
		var poId = $("#modalPoId").text();
		var condition = 'DMESSAGE';
		var changeValue = $("#oMemo").val();
		
		console.log(poId);
		console.log(condition);
		console.log(changeValue);
		
		$.ajax({
			url : "changeConditionOne.do",
			type : "post",
			data : {poId : poId, condition : condition, changeValue : changeValue},
			success : function(data) {
				$("#oMemo").val(changeValue);
				console.log(changeValue);
				location.href='selectAdminPreList.do';
				alert(data);
			},
			error : function(data) {
				alert("에이젝스 접속실패");
			}
		});
	};
	
	//------체크된 주문 상태 변화 관련 펑션
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
					location.href='selectAdminPreList.do';
				},
				error : function(data) {
					alert("해당상품 " + text + " 처리 실패");
				}
			});
		}
	};
	
	function deliveryInsert(text) {
		var answer = window.confirm("선택한 상품을 " + text + " 처리 하시겠습니까?");
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
				url : "adminInsertDelivery.do",
				type : "post",
				data : {numArr : numArr},
				success : function(data) {
					alert(data);
					location.href='selectAdminPreList.do';
				},
				error : function(data) {
					alert("해당상품 " + text + " 처리 실패");
				}
			});
		}
	};
	
	//------해당 상품정보(게시물) 조회 펑션
	$("#selectList td").mouseenter(function(){
		$(this).parent().css({"background":"rgb(61, 81, 113)", "color":"white", "cursor":"pointer"});
	}).mouseout(function(){
		$(this).parent().css({"background":"white", "color":"black"});
	}).click(function(){
		var num = $(this).parent().children().eq(4).text();
		location.href="<%=request.getContextPath()%>/selectAdminPreOne.do?num=" + num;
	});
</script>
</body>
</html>